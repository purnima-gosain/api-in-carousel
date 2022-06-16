import 'package:api_carousel/api-service/api_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/model.dart';

class ProductProvider extends ChangeNotifier {
  Laptop? _laptopModel;

  Laptop? get laptopMod {
    return _laptopModel;
  }

  set laptop(Laptop? laptopModel) {
    _laptopModel = laptopModel;
  }

  getData() async {
    _laptopModel = await fetchData();
    notifyListeners();
  }
}
