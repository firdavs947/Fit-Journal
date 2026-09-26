import 'package:fitjournal/models/fit_model.dart';
import 'package:fitjournal/service/database_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final List<String> selectedIds = [];
  List<FitModel> fits = [];
  bool isLoading = false;

  Future<void> loadFits() async {
    isLoading = true;
    notifyListeners();
    fits = await DatabaseService.getAllfits();
    isLoading = false;
    notifyListeners();
  }

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