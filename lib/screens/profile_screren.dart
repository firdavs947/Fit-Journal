import 'dart:io';

import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider()..loadProfile(),
      child: Builder(
        builder: (context) {
          final profileProvider = context.watch<ProfileProvider>();

          return Scaffold(
            backgroundColor: Appcolors.scaffoldBodyColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Appcolors.scaffoldBodyColor,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: Text(
                    'Отмена',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              ),
              leadingWidth: 90,
              title: Text(
                'Редактировать',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    profileProvider.saveProfile(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Center(
                      child: Text(
                        'Готово',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Appcolors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: profileProvider.pickImage,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Appcolors.whiteOpacity10,
                        image: profileProvider.avatarPath != null
                            ? DecorationImage(
                                image: FileImage(
                                  File(profileProvider.avatarPath!),
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: profileProvider.avatarPath == null
                          ? Icon(Icons.person, size: 45, color: Colors.grey)
                          : null,
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: profileProvider.pickImage,
                    child: Text(
                      'Изменить фото',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Appcolors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  _fieldContainer(
                    label: 'Имя',
                    controller: profileProvider.nameController,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 12),

                  _fieldContainer(
                    label: 'Возраст',
                    controller: profileProvider.ageController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 12),

                  _fieldContainer(
                    label: 'Текущий вес (кг)',
                    controller: profileProvider.weightController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    valueColor: Appcolors.primary,
                  ),
                  SizedBox(height: 12),

                  _fieldContainer(
                    label: 'Рост (см)',
                    controller: profileProvider.heightController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 25),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'НАСТРОЙКИ ПРИЛОЖЕНИЯ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Appcolors.whiteOpacity30),
                        right: BorderSide(color: Appcolors.whiteOpacity30),
                      ),
                      color: Appcolors.whiteOpacity10,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Тёмная тема',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Switch(
                          value: profileProvider.isDarkMode,
                          onChanged: profileProvider.toggleTheme,
                          activeThumbColor: Appcolors.primary,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Appcolors.whiteOpacity10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'УРОВЕНЬ ПОДГОТОВКИ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(profileProvider.levels.length, (i) {
                      final selected = i == profileProvider.selectedLevel;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => profileProvider.selectLevel(i),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: selected
                                  ? Appcolors.primary
                                  : Appcolors.whiteOpacity10,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                profileProvider.levels[i],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: selected ? Colors.black : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 30),

                  LiquidGlassButton(
                    onPressed: () {
                      profileProvider.saveProfile(() {
                        Navigator.pop(context);
                      });
                    },
                    touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                    style: LiquidGlassStyle(
                      shape: LiquidGlassShape(cornerRadius: 30.0),
                      adaptivity: LiquidGlassAdaptivity(
                        glassColorOnDark: Appcolors.primary,
                        glassColorOnLight: Appcolors.primary,
                        continuousGlassColor: true,
                      ),
                      liteGlass: LiquidGlassLitePickup.blend,
                    ),
                    child: Center(
                      child: Text(
                        'Сохранить изменения',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _fieldContainer({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    Color valueColor = Colors.white,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Appcolors.whiteOpacity30),
          right: BorderSide(color: Appcolors.whiteOpacity30),
        ),
        color: Appcolors.whiteOpacity10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontSize: 15, color: Colors.grey)),
          Spacer(),
          SizedBox(
            width: 150,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: valueColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}