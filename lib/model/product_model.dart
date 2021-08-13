class ProductModel {
  final String? prdImg;
  final String? name;
  final String? amount;
  final String? prAmt;
  // final void Funtion() press;

  ProductModel({this.prAmt, this.amount, this.name, this.prdImg});
}

List<ProductModel> productItems = [
  ProductModel(
    amount: '15',
    name: 'Hat test',
    prdImg: 'assets/hat.jpg',
    prAmt: '3000',
  ),
  ProductModel(
      amount: '20', name: 'Socks', prdImg: 'assets/socks.jpg', prAmt: '300'),
  ProductModel(
      amount: '30', name: 'Hoodies', prdImg: 'assets/hoodie.jpg', prAmt: '300'),
  ProductModel(
      amount: '30',
      name: 'Bag packs',
      prdImg: 'assets/lebag.jpg',
      prAmt: '300'),
  ProductModel(
      amount: '15',
      name: 'Pouches',
      prdImg: 'assets/crossbag.jpg',
      prAmt: '300'),
  ProductModel(
      amount: '13', name: 'Boxers', prdImg: 'assets/boxers.jpg', prAmt: '300'),
  ProductModel(
      amount: '400',
      name: 'T-shirt',
      prdImg: 'assets/boxers.jpg',
      prAmt: '300'),
  ProductModel(
      amount: '400',
      name: 'T-shirt',
      prdImg: 'assets/boxers.jpg',
      prAmt: '300'),
  ProductModel(
      amount: '400',
      name: 'T-shirt',
      prdImg: 'assets/boxers.jpg',
      prAmt: '300'),
  ProductModel(
      amount: '400',
      name: 'T-shirt',
      prdImg: 'assets/boxers.jpg',
      prAmt: '300'),
  ProductModel(
      amount: '400',
      name: 'T-shirt',
      prdImg: 'assets/boxers.jpg',
      prAmt: '300'),
];
