import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final List<String> selectedIds = [];

  bool isSelected(String id) {
    return selectedIds.contains(id);
  }

  void toggleSelection(String id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }
}
