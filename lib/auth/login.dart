import 'package:flutter/material.dart';
import 'package:tnc/auth/SigninPage.dart';
import 'package:tnc/auth/loginPage.dart';
import 'package:tnc/widget/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              MyAppButton(
                txt: 'SIGN IN',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginPage(),
                    ),
                  );
                },
              ),
              MyAppButton(
                txt: 'SIGN UP',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SigninPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// String int bool null double dynamic
  Widget customButton({String? txt, void Function()? onPressed}) {
    return SizedBox(
      width: 150,
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Text(
          '$txt',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

// final _formKey = GlobalKey<FormState>();
// FocusNode _passFocus = FocusNode();
//  onFieldSubmit: (_) {
//         FocusScope.of(context).requestFocus(_passFocus);
//       },
// if (_formKey.currentState.validate()) {
//           login(pass: _pass.text, mail: _email.text);
//         }
// inputFormatters: [FilteringTextInputFormatter.digitsOnly],