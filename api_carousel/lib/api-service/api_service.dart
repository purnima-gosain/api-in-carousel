import 'package:dio/dio.dart';

import '../model/model.dart';

List<Products> productModel = [];

Future<Laptop> fetchData() async {
  final Dio dio = Dio();
  final response =
      await dio.get("https://dummyjson.com/products/search?q=Laptop");
  if (response.statusCode == 200) {
    var values;
    values = Laptop.fromJson(response.data);
    productModel = values.product;
    return values;
  } else {
    throw Exception("Unable to fetch data");
  }
}
