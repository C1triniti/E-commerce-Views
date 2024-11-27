import 'package:flutter/material.dart';

class SearchFieldViewModel extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  String searchText = '';

  void onSearchTextChanged(String text) {
    searchText = text;
    notifyListeners();
  }

  void clearSearchText() {
    searchController.clear();
    searchText = '';
    notifyListeners();
  }

  void onSearchPressed() {
    print("Ativar função");
  }
}
