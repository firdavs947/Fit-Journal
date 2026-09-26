import 'package:fitjournal/models/fit_model.dart';
import 'package:fitjournal/service/database_service.dart';
import 'package:flutter/material.dart';

class TrainingScreenProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> journal({
    required FitModel fit,
    required Function onError,
    required Function onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      await DatabaseService.addFitToDb(
        FitModel(
          id: 0,
          value: fit.value,
          kg: fit.kg,
          note: fit.note,
        ),
      );
      print('УСПЕШНО СОХРАНЕНО');
      onSuccess();
    } catch (e) {
      print('Error on save $e');
      onError();
    } finally {
      isLoading = false;
    }
  }
}
