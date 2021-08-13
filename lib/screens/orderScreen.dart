import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnc/screens/payment.dart';
import 'package:tnc/widget/buttons.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: new Container(
                decoration: new BoxDecoration(
                    color: Color(0xFFF5F5F5).withOpacity(0.9)),
                child: Center(
                  child: MyAppButton(
                    txt: 'CONFIRM ORDER',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Payment(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
