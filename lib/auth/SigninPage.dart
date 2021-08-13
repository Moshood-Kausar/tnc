import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnc/auth/loginPage.dart';
import 'package:tnc/widget/buttons.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _firstname,
      _lastname,
      _country,
      _address,
      _username,
      _number,
      _email,
      _password,
      _cpassword;
  FocusNode? pass;
  String? email;
  bool _hideShow = true;
  bool _hideshoww = true;

  @override
  void initState() {
    super.initState();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _country = TextEditingController();
    _address = TextEditingController();
    _username = TextEditingController();
    _number = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _cpassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF5F5F5).withOpacity(0.1),
      appBar: AppBar(
        title: Text('T N C',
            style: GoogleFonts.openSans(
                fontSize: 30,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700)),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/logo.png', fit: BoxFit.cover),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.white.withOpacity(0.1),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        textForm(
                          controller: _firstname,
                          label: 'First Name',
                          icon: Icon(Icons.account_circle_outlined),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            // else if (value.length < 6)
                            //   return 'email cannot be less than 6 characters';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        textForm(
                          controller: _lastname,
                          label: 'Last Name',
                          icon: Icon(Icons.account_circle_outlined),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        textForm(
                          controller: _username,
                          label: 'Username',
                          icon: Icon(Icons.account_circle_outlined),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        textForm(
                          controller: _country,
                          label: 'Country',
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        textForm(
                          controller: _number,
                          label: 'Phone No',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else if (value.length < 11)
                              return 'number cannot be less than 11 characters';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        textForm(
                          controller: _email,
                          label: 'Email',
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else if (value.length < 6)
                              return 'email cannot be less than 6 characters';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        textForm(
                          controller: _address,
                          label: 'Address',
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else if (value.length < 20)
                              return 'Address cannot be less than 20 characters';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        textForm(
                          controller: _password,
                          secure: _hideShow,
                          label: 'Password',
                          // icon: Icon(Icons.visibility_off),
                          icon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hideShow = !_hideShow;
                              });
                            },
                            icon: Icon(_hideShow
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else if (value.length < 6)
                              return 'password cannot be less than 6 characters';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        textForm(
                          controller: _cpassword,
                          secure: _hideshoww,
                          label: 'Confirm password',
                          icon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hideshoww = !_hideshoww;
                              });
                            },
                            icon: Icon(_hideshoww
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else if (value.length < 6)
                              return 'password cannot be less than 6 characters';
                            else if (value != _password!.text) {
                              return ' password doesnt match';
                            } else
                              return null;
                          },
                        ),
                        MyAppButton(
                          txt: 'SIGN UP',
                          // onPressed: () => print('dss'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginPage(),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// @override
// void dispose() {
//   _email!.dispose();
//   _password!.dispose();
//   super.dispose();
// }

Widget textForm(
    {TextEditingController? controller,
    String? Function(String?)? validator,
    Widget? icon,
    bool? secure = false,
    TextInputType? keyboardType,
    label}) {
  return TextFormField(
    cursorColor: Colors.black,
    cursorHeight: 25,
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    obscureText: secure!,
    decoration: InputDecoration(
      fillColor: Colors.grey[350],
      filled: true,
      isDense: true,
      prefix: icon,
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.black,
      ),
      // suffixIcon: Icon(Icons.email, color: Colors.green),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}
