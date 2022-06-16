import 'package:api_carousel/api-service/api_service.dart';
import 'package:api_carousel/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Laptops"),
      ),
      body: Consumer<ProductProvider>(builder: (context, child, value) {
        return ListView.builder(
            itemCount: productModel.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GestureDetector(
                  child: cardWidget(index),
                  onTap: () {
                    int? newId;
                    String? newTitle;
                    String? newDescriptin;
                    List<dynamic>? newImage;
                    int? newPrice;
                    num? newDiscount;
                    num? newRatings;

                    setState(() {
                      newId = productModel[index].id;
                      newTitle = productModel[index].title;
                      newDescriptin = productModel[index].description;
                      newImage = productModel[index].images;
                      newPrice = productModel[index].price;
                      newDiscount = productModel[index].discountPercent;
                      newRatings = productModel[index].rating;
                    });
                  },
                ),
              );
            });
      }),
    );
  }

  Card cardWidget(int index) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: const Color.fromARGB(255, 240, 240, 240),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(productModel[index].thumbNail ?? "")),
            const SizedBox(height: 10),
            Text(
              productModel[index].title ?? "",
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text("\$ ${productModel[index].price.toString()}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.indigo)),
          ],
        ),
      ),
    );
  }
}

// Text(productModel[index].description ?? "",
//                             textAlign: TextAlign.justify),
//                         Text(productModel[index].category ?? "",
//                             textAlign: TextAlign.left),