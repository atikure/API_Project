import 'package:flutter/material.dart';
import '../service/product_list.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List myProduct = [];

  getProduct() async {
    var a = await ProductService().getProductList();
    // myProduct.clear();
    // await Future.delayed(Duration(seconds: 3));
    // myProduct.addAll(MyData.data);
    setState(() {
      myProduct = a;});
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Product List"),
        centerTitle: true,
      ),
      body: myProduct.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: myProduct.length,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${myProduct[index]["image"]}"),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${myProduct[index]["title"]}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Category : ${myProduct[index]["category"]}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Price : ${myProduct[index]["price"]}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Rating : ${myProduct[index]["rating"]["rate"]}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Review : ${myProduct[index]["rating"]["count"]}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}