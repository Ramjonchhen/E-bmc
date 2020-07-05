import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repass = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController otp = TextEditingController();

  TextField buildText({String labelTxt, TextEditingController textEdtCntrl}) {
    return TextField(
      controller: textEdtCntrl,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelTxt,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              child: Text("logo of EBMC"),
              margin: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height / 20, 0, 0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                buildText(labelTxt: "Username", textEdtCntrl: username),
                buildText(labelTxt: "Email", textEdtCntrl: email),
                buildText(labelTxt: "Password", textEdtCntrl: password),
                buildText(labelTxt: "Confirm Password", textEdtCntrl: repass),
                Align(
                  alignment: Alignment(1, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            child: SimpleDialog(
                              contentPadding: EdgeInsets.all(20),
                              titlePadding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text("Enter your OTP"),
                              children: <Widget>[
                                TextField(
                                  controller: otp,
                                  maxLength: 6,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Your OTP",
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      child: Text(
                                        "Submit",
                                        style:
                                            TextStyle(color: Colors.lightBlue),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.of(context)
                                            .pushNamed('loginpage');
                                      },
                                    ),
                                    SimpleDialogOption(
                                      child: Text(
                                        "Resend",
                                        style:
                                            TextStyle(color: Colors.lightBlue),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ));
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Create account"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
