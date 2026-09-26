import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier {
  final _box = GetStorage();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String? avatarPath;
  bool isDarkMode = true;

  final List<String> levels = ['Новичок', 'Базовый', 'Продвинутый'];
  int selectedLevel = 2;

  void loadProfile() {
    nameController.text = _box.read('profile_name') ?? 'Александр Романов';
    ageController.text = (_box.read('profile_age') ?? 0).toString();
    weightController.text = (_box.read('profile_weight') ?? 0).toString();
    heightController.text = (_box.read('profile_height') ?? 0).toString();
    avatarPath = _box.read('profile_avatar_path');
    selectedLevel = _box.read('profile_level_index') ?? 2;
    isDarkMode = _box.read('is_dark_mode') ?? true;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked != null) {
      avatarPath = picked.path;
      _box.write('profile_avatar_path', picked.path);
      notifyListeners();
    }
  }

  void toggleTheme(bool value) {
    isDarkMode = value;
    _box.write('is_dark_mode', value);
    notifyListeners();
  }

  void selectLevel(int index) {
    selectedLevel = index;
    notifyListeners();
  }

  void saveProfile(VoidCallback onSuccess) {
    _box.write('profile_name', nameController.text);
    _box.write('profile_age', int.tryParse(ageController.text) ?? 0);
    _box.write(
      'profile_weight',
      double.tryParse(weightController.text) ?? 0.0,
    );
    _box.write('profile_height', int.tryParse(heightController.text) ?? 0);
    _box.write('profile_level_index', selectedLevel);
    if (avatarPath != null) {
      _box.write('profile_avatar_path', avatarPath);
    }
    onSuccess();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }
}