import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class bankAccountWidget extends StatelessWidget {
  var bankName, bankIban, bankAccountName, descriptionNo;
  bankAccountWidget(
      {
        this.bankName, this.bankIban, this.bankAccountName, this.descriptionNo
      }
      );

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;

    return Stack(
        children: <Widget>[
      SizedBox(
        height: height/8,
        width: width,
        child: IconButton(
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15, top: 5),
        height: height/8,
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(bankName,
                  style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
                  Text("Havale / EFT ile para gönderin.",
                  style: GoogleFonts.inter(
                    color: const Color.fromRGBO(207, 212, 222, 1),
                    fontSize: 14,
                  ),
                  )
          ]
        ),
          ],
        ),
      ),
      onPressed: () {
        showModalBottomSheet(context: context,
            builder: (context) => ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 10,top: 20),
                  child: Text("Hesap Adı",
                  style: GoogleFonts.inter(
                    color: const Color.fromRGBO(207, 212, 222, 1),
                    fontSize: 13
                  ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: MediaQuery.of(context).size.width-10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(243, 244, 246, 1),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Text(bankName,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),
                  ),
                   Container(
                     alignment: Alignment.centerRight,
                     child: IconButton(
                       onPressed: () {
                         FlutterClipboard.copy(bankName).then(( value ) => SnackBar(content: Text("Panoya kopyalandı!")));
                           },
                            icon: Image.asset("assets/pngfiles/copy.png"),
                        ),
                ),
                  ]
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10,top: 20),
                  child: Text("IBAN",
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(207, 212, 222, 1),
                        fontSize: 13
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: MediaQuery.of(context).size.width-10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(243, 244, 246, 1),

                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(bankIban,
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              FlutterClipboard.copy(bankIban).then(( value ) => SnackBar(content: Text("Panoya kopyalandı!")));
                            },
                            icon: Image.asset("assets/pngfiles/copy.png"),
                          ),
                        ),
                      ]
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10,top: 20),
                  child: Text("Açıklama",
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(207, 212, 222, 1),
                        fontSize: 13
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: MediaQuery.of(context).size.width-10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(243, 244, 246, 1),

                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(descriptionNo,
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              FlutterClipboard.copy(descriptionNo).then(( value ) => SnackBar(content: Text("Panoya kopyalandı!")));
                            },
                            icon: Image.asset("assets/pngfiles/copy.png"),
                          ),
                        ),
                      ]
                  ),
                ),
        const SizedBox(
          height: 10,
        ),
        Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width-10,
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(243, 244, 246, 1),
            ),
          child: Text("Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.",
          style: GoogleFonts.inter(
            fontSize: 10,
            color: const Color.fromRGBO(188, 194, 206, 1)
          ),
          ),
        ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width-10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(243, 244, 246, 1),
                  ),
                  child: Center(
                    child: Text("Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.",
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          color: const Color.fromRGBO(246, 73, 73, 1)
                         ),
                        ),
                      ),
                    ),
                 ],
               )
             );
            },
          ),
        ),
      ]
    );
  }
}