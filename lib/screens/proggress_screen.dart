import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/progress_provider.dart';
import 'package:fitjournal/widgets/proggres_container.dart';
import 'package:fitjournal/widgets/proggres_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProggressScreen extends StatefulWidget {
  const ProggressScreen({super.key});

  @override
  State<ProggressScreen> createState() => _ProggressScreenState();
}

class _ProggressScreenState extends State<ProggressScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProggressProvider()..loadSavedPhotos(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Прогресс',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),

                ProggresContainer(),

                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'До',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.primary,
                        ),
                      ),
                      Text(
                        'После',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

               ProggresImageWidget(),

                Spacer(),
                SizedBox(height: 1),
              ],
            ),
          ),
        ),
        backgroundColor: Appcolors.scaffoldBodyColor,
      ),
    );
  }
}