import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sanalira/authenticationService.dart';
import 'package:sanalira/main.dart';
import 'package:sanalira/authenticationService.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart'; // for password validation

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController countryCode = TextEditingController(text: "+90"); // +90 is for Turkey as a default
  final TextEditingController phoneNumber = TextEditingController();

  bool agree = false; // check for terms agreement

  void agreementCheck() { // check for terms agreement to get available sign in button
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
            toolbarHeight: MediaQuery.of(context).size.height/6,
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
                        TextSpan(text: "Yeni ??yelik", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  )
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Text("Bilgilerinizi girip s??zle??meyi onaylay??n.",
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
                          style: GoogleFonts.inter(fontSize: 12, color: Colors.white),
                          controller: name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                                hintText: "E??ref IBAN",
                                hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 12,)
                            ),
                          validator: Validators.compose( // to get valid name
                              [
                                Validators.minLength(3  , "En az 3 karakter giriniz."),
                                Validators.maxLength(50, "En fazla 50 karakter giriniz.")
                              ]
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Soyad",
                    style: GoogleFonts.inter(color: const Color.fromRGBO(207, 212, 222, 1),fontSize: 10),
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
                            style: GoogleFonts.inter(fontSize: 12, color: Colors.white),
                            controller: surname,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ya??a",
                                hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 12,)
                            ),
                          validator: Validators.compose( // to get valid surname
                              [
                                Validators.minLength(3  , "En az 3 karakter giriniz."),
                                Validators.maxLength(50, "En fazla 50 karakter giriniz.")
                              ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("E-posta",
                    style: GoogleFonts.inter(color: const Color.fromRGBO(207, 212, 222, 1),fontSize: 10),
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
                            style: GoogleFonts.inter(fontSize: 12, color: Colors.white),
                            controller: email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "esrefyasa@monegon.com",
                                hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 12,)
                            ),
                          validator: Validators.compose( // to get valid e-mail
                              [
                                Validators.required('E-mail giriniz.'),
                                Validators.email("L??tfen ge??erli bir E-posta adresi giriniz."),
                              ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("??ifre",
                    style: GoogleFonts.inter(color: const Color.fromRGBO(207, 212, 222, 1),fontSize: 10),
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

                          obscureText: true,
                            style: GoogleFonts.inter(fontSize: 12, color: Colors.white),
                            controller: password,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "??ifre",
                                hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 12,)
                            ),
                          validator: Validators.compose( // to get valid password
                              [
                            Validators.required('Password is required'),
                            Validators.patternString(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$', 'Invalid Password'),
                            Validators.minLength(6  , "En az 6 karakter giriniz."),
                            Validators.maxLength(20, "En fazla 20 karakter giriniz.")
                          ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Cep Telefonu Numaran??z",
                    style: GoogleFonts.inter(color: const Color.fromRGBO(207, 212, 222, 1),fontSize: 10),
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
                                style: GoogleFonts.inter(fontSize: 12, color: Colors.white),
                                keyboardType: TextInputType.number,
                                controller: countryCode,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "+90",
                                    hintStyle: GoogleFonts.inter(color: Colors.white,fontSize: 13,),
                                ),
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: GoogleFonts.inter(fontSize: 13, color: Colors.white),
                              controller: phoneNumber,
                              keyboardType: TextInputType.number,
                              validator: Validators.compose( // to get valid phone number
                                  [
                                    Validators.required('L??tfen telefon numaras?? giriniz.'),
                                    Validators.minLength(10  , "L??tfen ge??erli bir telefon numaras?? giriniz."),
                                    Validators.maxLength(10, "L??tfen ge??erli bir telefon numaras?? giriniz.")
                                  ]
                              ),
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
                              }
                              );
                            },
                          ),
                        ),
                Container(
                  width: MediaQuery.of(context).size.width-70,
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(),
                      children: const <TextSpan>[
                        TextSpan(text: "Hesab??n??z?? olu??tururken ", style: TextStyle(color: Colors.white, fontSize: 12)),
                        TextSpan(text: "s??zle??me ve ko??ullar?? ", style: TextStyle(color: Colors.green, fontSize: 12)),
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
                    child: const Text("Giri?? Yap"),
                    onPressed: agree ? () { // checking out the agreement of terms.
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: email.text).then((value) {print("Hesab??n??z Olu??turuldu!");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AuthenticationWrapper()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}"
                        );
                      }
                      );
                    }
                    :null, // to make button disabled unless agree with terms and conditions.
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