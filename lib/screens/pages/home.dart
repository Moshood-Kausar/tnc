import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:tnc/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnc/screens/orderScreen.dart';
// import 'package:tnc/screens/product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List dsm = [1, 23];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: new BoxDecoration(
              //     color: Color(0xFFF5F5F5).withOpacity(0.9),
              //   ),
              // ),
              SizedBox(height: 12),
              buildCategory(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

Widget buildCategory() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 0.7,
    ),
    shrinkWrap: true,
    itemCount: productItems.length,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      return GestureDetector(
        // onTap: () {
        //   Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(builder: (_) => SalesPage()),
        //   );
        // },
        child: Container(
          child: Column(
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage('${productItems[index].prdImg}'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: '${productItems[index].name}: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    children: [
                      TextSpan(
                        text: '€${productItems[index].amount}',
                        style: GoogleFonts.alef(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text('${productItems[index].name}: '),
              //     Text('€${productItems[index].amount}'),
              //   ],
              // ),
              SizedBox(height: 8),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderScreen(),
                    ),
                  );
                },
                child: Text('Order Now'),
                color: Colors.grey,
              )
            ],
          ),
        ),
      );
    },
  );
}
