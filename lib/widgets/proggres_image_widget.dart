import 'dart:io';

import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/providers/progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:provider/provider.dart';

class ProggresImageWidget extends StatelessWidget {
  const ProggresImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final proggressProvider = context.watch<ProggressProvider>();

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(40),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ImageCompareSlider(
              itemOne: proggressProvider.photoBeforePath != null
                  ? Image.file(
                      File(proggressProvider.photoBeforePath!),
                      fit: BoxFit.cover,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    )
                  : Assets.images.logo.image(
                      fit: BoxFit.cover,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
              itemTwo: proggressProvider.photoAfterPath != null
                  ? Image.file(
                      File(proggressProvider.photoAfterPath!),
                      fit: BoxFit.cover,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    )
                  : Assets.images.logo.image(
                      fit: BoxFit.cover,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
            );
          },
        ),
      ),
    );
  }
}