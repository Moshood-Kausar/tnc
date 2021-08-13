import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
      child: Text('MAKE PAYMENT TO:',
      style: GoogleFonts.tinos(
                fontSize: 25,),
      )
      
      

      
    ),
            ],),),);
    
  }
}
