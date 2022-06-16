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
              return Column(
                children: [
                  Text(productModel[index].title ?? ""),
                  Text(productModel[index].description ?? ""),
                  Text(productModel[index].title ?? ""),
                  Text("Price: \$ ${productModel[index].price.toString()}"),
                ],
              );
            });
      }),
    );
  }
}
