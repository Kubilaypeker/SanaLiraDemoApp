import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sanalira/authenticationService.dart';
import 'package:sanalira/main.dart';
import 'package:sanalira/widgets/bankWidget.dart';


class moneyTransferScreen extends StatefulWidget {

  const moneyTransferScreen({Key? key }) : super(key: key);

  @override
  moneyTransferState createState() => moneyTransferState();
}
class moneyTransferState extends State<moneyTransferScreen> {

  final Widget arrowBackSvg = SvgPicture.asset("assets/svgfiles/arrowback.svg");
  final Widget settingsSvg = SvgPicture.asset("assets/svgfiles/settings.svg");
  var response;



  Future<List<dynamic>> getData() async {
    var result = await http.get(Uri.parse("https://api.sanalira.com/assignment"));
    return jsonDecode(result.body)['data'];
  }

  @override
  void initState() {
    response = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final String leftArrow = 'assets/svgfiles/left-arrow.svg';
    final Widget leftArrowSvg = SvgPicture.asset(leftArrow);
    final String signOut = 'assets/svgfiles/signOutSvg.svg';
    final Widget signOutSvg = SvgPicture.asset(signOut);
    final String bell = 'assets/svgfiles/bell.svg';
    final Widget bellSvg = SvgPicture.asset(bell);
    final String settings = 'assets/svgfiles/settings.svg';
    final Widget settingsSvg = SvgPicture.asset(settings);
    final String turkey = 'assets/svgfiles/turkey.svg';
    final Widget turkeySvg = SvgPicture.asset(turkey);


    return Scaffold(
      backgroundColor: const  Color.fromRGBO(243, 244, 246, 1),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height/4,
        automaticallyImplyLeading: false,
        backgroundColor: const  Color.fromRGBO(243, 244, 246, 1),
        elevation: 0,
        leadingWidth: MediaQuery.of(context).size.width/5,
        leading: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: IconButton(
              icon: leftArrowSvg,
            onPressed: () {
            },
          ),
        ),
        ),
        actions: [
          Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        icon: bellSvg,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        icon: settingsSvg,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 10),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        icon: signOutSvg,
                        onPressed: () {
                          context.read<AuthenticationService>().signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AuthenticationWrapper(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ]
            )
        ],
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child:  Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width-20,
              height: MediaQuery.of(context).size.height/10,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        children: [ Container(
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: turkeySvg
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Türk Lirası",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Text("TL",
                          style: GoogleFonts.inter(
                            color: const Color.fromRGBO(207, 212, 222, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ),
                        ]
                ),
                    Text("234 ₺",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
            future: response,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length, // to get enough bankAccount Widget for data length
                  itemBuilder: (BuildContext context, int index) {
                    return bankAccountWidget(
                      bankName: snapshot.data[index]['bankName'],
                      bankAccountName: snapshot.data[index]['bankAccountName'],
                      bankIban: snapshot.data[index]['bankIban'],
                      descriptionNo: snapshot.data[index]['descriptionNo'],
                    );
                  },
                );
              }
              else {
                return Center(
                  child: CircularProgressIndicator(color: Colors.green),
                );
              }
            },
          ),
    );
  }
}
