import 'package:dio/dio.dart';

import '../model/model.dart';

List<Products>? productModel;

Future<Laptop> fetchData() async {
  final Dio dio = Dio();
  final response =
      await dio.get("https://dummyjson.com/products/search?q=Laptop");
  if (response.statusCode == 200) {
    var value = Laptop.fromJson(response.data);
    productModel = value.product;
    return value;
  } else {
    throw Exception("Unable to fetch data");
  }
}
