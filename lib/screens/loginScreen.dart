import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool agree = false; // check for terms agreement

  void _agreementcheck() { // check for terms agreement
  agree = true;
  }

  @override
  Widget build(BuildContext context) {

    final String frameSvg = 'assets/svgfiles/frame.svg';
    final String littleFrameSvg = 'assets/svgfiles/little_frame.svg';
    final String turkey = 'assets/svgfiles/turkey.svg';
    final String frame2Svg = 'assets/svgfiles/frame2.svg';
    final String checkBoxSvg = 'assets/svgfiles/checkbox.svg';
    final Widget frame = SvgPicture.asset(frameSvg);
    final Widget littleFrame = SvgPicture.asset(littleFrameSvg);
    final Widget turkeySvg = SvgPicture.asset(turkey);
    final Widget frame2 = SvgPicture.asset(frame2Svg);
    final Widget checkBox = SvgPicture.asset(checkBoxSvg);


    return Stack(
      children: <Widget>[
        Image.asset(
            "assets/jpgfiles/background.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        Container(
          color: const Color(0x141C2D).withOpacity(0.75),
        ),
        Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0),
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height/4,
            centerTitle: true,
            title: Wrap(
              spacing: 20,
                children: [
                  Image.asset(
              "assets/pngfiles/sanaLiraLogo.png",
              height: 70,
              width: 70,
            ),
                  Image.asset(
                    "assets/pngfiles/sanaLira.png",
                    height: 70,
                    width: 70,
                  ),
                ]
            ),
          ),
          body: Container(
          clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: const Color(0x252D3D).withOpacity(0.7)
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(),
                      children: <TextSpan>[
                        TextSpan(text: "SanaLira'ya ", style: TextStyle(color: Colors.green, fontSize: 16)),
                        TextSpan(text: "Yeni Üyelik", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  )
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Text("Bilgilerinizi girip sözleşmeyi onaylayın.",
                  style: GoogleFonts.inter(color: Color.fromRGBO(207, 212, 222, 1),fontSize: 12),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Ad",
                    style: GoogleFonts.inter(color: Color.fromRGBO(207, 212, 222, 1),fontSize: 10),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        child: frame,
                      padding: const EdgeInsets.only(left: 20, top: 6),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 27,),
                      child: Card(
                        color: Colors.white.withOpacity(0),
                        elevation: 0,
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Eşref IBAN",
                                hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 12,)
                            )
                        ),
                      ),
                    ),

                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Soyad",
                    style: GoogleFonts.inter(color: Color.fromRGBO(207, 212, 222, 1),fontSize: 10),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      child: frame,
                      padding: const EdgeInsets.only(left: 20, top: 6),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Card(
                        color: Colors.white.withOpacity(0),
                        elevation: 0,
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Yaşa",
                                hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 12,)
                            )
                        ),
                      ),
                    ),

                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("E-posta",
                    style: GoogleFonts.inter(color: Color.fromRGBO(207, 212, 222, 1),fontSize: 10),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      child: frame,
                      padding: const EdgeInsets.only(left: 20, top: 6),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Card(
                        color: Colors.white.withOpacity(0),
                        elevation: 0,
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "esrefyasa@monegon.com",
                                hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 12,)
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Cep Telefonu Numaranız",
                    style: GoogleFonts.inter(color: Color.fromRGBO(207, 212, 222, 1),fontSize: 10),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          child: littleFrame,
                          padding: const EdgeInsets.only(left: 20, top: 6),
                        ),
                        Container(
                          child: turkeySvg,
                          padding: const EdgeInsets.only(left: 27, top: 17),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 50),
                          width: MediaQuery.of(context).size.width/4,
                          child: Card(
                            color: Colors.white.withOpacity(0),
                            elevation: 0,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "+90",
                                    hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 13,)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          child: frame2,
                          padding: const EdgeInsets.only(left: 5, top: 6),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          width: MediaQuery.of(context).size.width/3,
                          child: Card(
                            color: Colors.white.withOpacity(0),
                            elevation: 0,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "(___) ___ __ __ ",
                                    hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 13,)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          ),
                            activeColor: const Color.fromRGBO(102, 204, 120, 1),
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            },
                          ),
                        ),
                Container(
                  width: MediaQuery.of(context).size.width-70,
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(),
                      children: const <TextSpan>[
                        TextSpan(text: "Hesabınızı oluştururken ", style: TextStyle(color: Colors.white, fontSize: 12)),
                        TextSpan(text: "sözleşme ve koşulları ", style: TextStyle(color: Colors.green, fontSize: 12)),
                        TextSpan(text: "kabul etmeniz gerekir.", style: TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  )
                ),
              ],
            ),
                Container(
                  height: 47,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(22))
                  ),
                  child: TextButton(
                    child: const Text("Giriş Yap"),
                    onPressed: agree ? _agreementcheck : null,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(102, 204, 120, 1),
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
            ),
              ]
            )
          ),
        ),
      ],
    );
  }
}