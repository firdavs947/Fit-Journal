import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProggressProvider extends ChangeNotifier {
  final _box = GetStorage();

  String? photoBeforePath;
  String? photoAfterPath;

  Future<void> loadSavedPhotos() async {
    final before = _box.read('progress_photo_before');
    final after = _box.read('progress_photo_after');

    if (before != null && await File(before).exists()) {
      photoBeforePath = before;
    }
    if (after != null && await File(after).exists()) {
      photoAfterPath = after;
    }
    notifyListeners();
  }

  Future<void> pickPhoto({required bool isBefore}) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (picked == null) return;

    final permanentPath = await _saveImagePermanently(picked, isBefore);

    if (isBefore) {
      photoBeforePath = permanentPath;
    } else {
      photoAfterPath = permanentPath;
    }

    _box.write(
      isBefore ? 'progress_photo_before' : 'progress_photo_after',
      permanentPath,
    );

    notifyListeners();
  }

  Future<String> _saveImagePermanently(XFile picked, bool isBefore) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = isBefore ? 'progress_before.jpg' : 'progress_after.jpg';
    final newPath = '${appDir.path}/$fileName';

    final newFile = await File(picked.path).copy(newPath);
    return newFile.path;
  }
}