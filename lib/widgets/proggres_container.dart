import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProggresContainer extends StatelessWidget {
  const ProggresContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final proggressProvider = context.watch<ProggressProvider>();

    return Column(
      children: [
        GestureDetector(
          onTap: () => proggressProvider.pickPhoto(isBefore: true),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Appcolors.whiteOpacity30),
                right: BorderSide(color: Appcolors.whiteOpacity30),
              ),
              color: Appcolors.whiteOpacity10,
              borderRadius: BorderRadius.circular(100),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                'Добавить фото до',
                    
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(
                   Icons.add,
                  color: Appcolors.primary,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),

        GestureDetector(
          onTap: () => proggressProvider.pickPhoto(isBefore: false),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Appcolors.whiteOpacity30),
                right: BorderSide(color: Appcolors.whiteOpacity30),
              ),
              color: Appcolors.whiteOpacity10,
              borderRadius: BorderRadius.circular(100),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 'Добавить фото после',
                     
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.add,
                  color: 
                       Appcolors.primary,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}