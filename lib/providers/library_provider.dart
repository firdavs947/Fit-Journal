import 'package:flutter/material.dart';

class LibraryProvider extends ChangeNotifier {
  List<String> libraryCategory = ['Спина', 'Грудь', 'Ноги', 'Плечи'];
  int categoryIndex = 0;

  void onCategoryChanged(int i) {
    categoryIndex = i;
    notifyListeners();
  }
}
