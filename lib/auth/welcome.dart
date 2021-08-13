import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnc/auth/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME TO TNC"),
        backgroundColor: Colors.grey[800],
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.grey[800],
        child: Text("THE NATIVE CHILD'S BRAND",
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                fontSize: 30,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, ///
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 6),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      ),
    );
  }
}
