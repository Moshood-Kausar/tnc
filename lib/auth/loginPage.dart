import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnc/auth/SigninPage.dart';
//import 'package:tnc/screens/pages/home.dart';
import 'package:tnc/screens/product_details.dart';

import 'package:tnc/widget/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _email, _password;
  FocusNode? pass;
  String? email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      textForm(
                        controller: _email,
                        secure: false,
                        label: 'Username',
                        icon: Icon(Icons.account_circle_outlined),
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Empty field detected';
                          else if (value.length < 6)
                            return 'email cannot be less than 6 characters';
                          else
                            return null;
                        },
                      ),
                      SizedBox(height: 9),
                      textForm(
                        controller: _password,
                        secure: true,
                        label: 'Enter password',
                        icon: Icon(Icons.visibility_off),
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Empty field detected';
                          else if (value.length < 6)
                            return 'password cannot be less than 6 characters';
                          else
                            return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              MyAppButton(
                txt: 'SIGN IN',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetails(),
                      ),
                    );
                  }
                },
              ),
              Text(
                "Forgot password?",
                style: GoogleFonts.pacifico(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.grey[800],
        
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SigninPage()));
          },
          child: Text("New user? SIGN UP HERE",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  fontSize: 20,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email!.dispose();
    _password!.dispose();
    super.dispose();
  }

  Widget textForm(
      {TextEditingController? controller,
      String? Function(String?)? validator,
      Widget? icon,
      bool? secure,
      label}) {
    return TextFormField(
      cursorColor: Colors.black,
      cursorHeight: 25,
      controller: controller,
      validator: validator,
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
}
