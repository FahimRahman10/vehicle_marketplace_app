import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_list.dart';

class FavouriteProvider extends ChangeNotifier{
  final List<Product> _favourites = [];
  List<Product> get favourites => _favourites;

  void toggleFavourite(Product product){
    if(_favourites.contains(product)){
      _favourites.remove(product);
    }else{
      _favourites.add(product);
    }

    notifyListeners();
  }

  bool isExist(Product product){
    final isExist = _favourites.contains(product);
    return isExist;
  }

  void removeAt(int index) {
    if (index >= 0 && index < _favourites.length) {
      _favourites.removeAt(index);
      notifyListeners();
    }
  }

  static FavouriteProvider of(
      BuildContext context,{bool listen = true}
      ) {
    return Provider.of<FavouriteProvider>(context, listen: listen);
  }
}