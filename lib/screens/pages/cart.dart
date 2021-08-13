import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnc/auth/SalesPage.dart';
import 'package:tnc/model/product_model.dart';
import 'package:tnc/screens/pages/menu.dart';
import 'package:tnc/widgets/switch.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            TextFormField(
              readOnly: true,
              onTap: () {},
              decoration: InputDecoration(
                hintText: 'Type something here',
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFD1C9C9),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 6.0),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFDFD9D9),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'All Categories',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              height: 95,
                              width: MediaQuery.of(context).size.width,
                              child: categories(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Set Menu',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text('View All'),
                                ],
                              ),
                            ),
                            Container(
                              height: 230,
                              width: MediaQuery.of(context).size.width,
                              child: setmenu(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Banner',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: banner(),
                            ),
                            // banner(),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Popular Item',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      items(),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  items() {
    return ListView.builder(
      itemCount: productItems.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                // isScrollControlled: true,
                builder: (_) {
                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage('assets/hat.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    child: Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          index > 2
                                              ? Icons.star_border_outlined
                                              : Icons.star,
                                          size: 20,
                                          color: index > 2
                                              ? Colors.grey
                                              : Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 300),
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFF000000),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SalesPage()));
                                },
                                child: Center(
                                  child: Text("- 1 +",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                            ),
                            Text(
                              'Size',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                NewButton(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SalesPage()));
                                  },
                                  color: Color(0xFF8F0303),
                                  text: 'MEDIUM',
                                ),
                                SizedBox(width: 20),
                                NewButton(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SalesPage()));
                                  },
                                  color: Color(0xFF000000),
                                  text: 'LARGE',
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Description',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                                'Enjoy your weekend with Classic Zinger Burger, Large Popcorn & Large Fries',
                                style: TextStyle(color: Colors.black)),
                            SizedBox(height: 20),
                            Text(
                              'Addons',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 12),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF080808),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SalesPage()));
                                    },
                                    child: Center(
                                      child: Text("Coke \$20.00",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.openSans(
                                              fontSize: 12,
                                              color: Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF000000),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SalesPage()));
                                    },
                                    child: Center(
                                      child: Text("Water \$15.00",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.openSans(
                                              fontSize: 12,
                                              color: Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Total Amount:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '\$30,00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.orange),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SalesPage()));
                              },
                              child: Container(
                                margin: EdgeInsets.all(12),
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFF8F0303),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    "Add to Cart",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  );
                });
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/hat.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hattty'),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index > 2 ? Icons.star_border_outlined : Icons.star,
                            size: 12,
                            color: index > 2 ? Colors.grey : Colors.orange,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ 12.00'),
                          Icon(Icons.add),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  banner() {
    return ListView.builder(
      itemCount: productItems.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          height: 90,
          width: 280,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage('${productItems[i].prdImg}'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget categories() {
    return ListView.builder(
      itemCount: 17,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        // var count = index + 1;
        return Container(
          padding: EdgeInsets.only(left: 12),
          child: Column(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundImage: AssetImage('assets/top.jpg'),
              ),
              SizedBox(height: 8),
              Text('Burger '),
            ],
          ),
        );
      },
    );
  }

  Widget setmenu() {
    return ListView.builder(
      itemCount: productItems.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 12),
          height: 190,
          width: 190,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                image: DecorationImage(
                    image: AssetImage('${productItems[index].prdImg}'),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${productItems[index].name}"),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index > 2 ? Icons.star_border_outlined : Icons.star,
                      color: index > 2 ? Colors.grey : Colors.orange,
                    ),
                  ),
                ),
                Text("€${productItems[index].prAmt}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${productItems[index].amount}",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MenuPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.add)),
                  ],
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
