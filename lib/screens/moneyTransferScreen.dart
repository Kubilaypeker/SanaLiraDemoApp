import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sanalira/authenticationService.dart';
import 'package:sanalira/main.dart';


class moneyTransferScreen extends StatelessWidget {
  const moneyTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;

    final String leftArrow = 'assets/svgfiles/left-arrow.svg';
    final Widget leftArrowSvg = SvgPicture.asset(leftArrow);
    final String signOut = 'assets/svgfiles/signOutSvg.svg';
    final Widget signOutSvg = SvgPicture.asset(signOut);


    return Scaffold(
      backgroundColor: const  Color.fromRGBO(243, 244, 246, 1),
      appBar: AppBar(
        backgroundColor: const  Color.fromRGBO(243, 244, 246, 1),
        elevation: 0,
        title:
            Row(
                children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0),
                  borderRadius: BorderRadius.circular(10)
                ),
              child: IconButton(
                icon: leftArrowSvg,
                onPressed: () {},
              ),
            ),
              Container(
                alignment: Alignment.centerRight,
                height: 50,
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
              )
            ]
            )
      ),
    );
  }
}
