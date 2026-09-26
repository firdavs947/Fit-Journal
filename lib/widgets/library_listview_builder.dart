import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/screens/full_Video_Screen.dart';
import 'package:fitjournal/widgets/video_priview.dart';
import 'package:flutter/material.dart';

class LibraryListviewBuilder extends StatefulWidget {
  const LibraryListviewBuilder({super.key, required this.courses});
  final List courses;

  @override
  State<LibraryListviewBuilder> createState() => _LibraryListviewBuilderState();
}

class _LibraryListviewBuilderState extends State<LibraryListviewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.courses.length,
        itemBuilder: (context, i) {
          final course = widget.courses[i];

          final String videoId = '${course.url}_$i';

          return Container(
            key: ValueKey(videoId),
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Appcolors.whiteOpacity30),
                right: BorderSide(color: Appcolors.whiteOpacity30),
              ),
              color: Appcolors.liquidglassColor,
              borderRadius: BorderRadius.circular(30),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoPreview(
                  key: ValueKey('preview_$videoId'),
                  herotag: videoId,
                  videoFile: course.url,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return FullViveoScreen(
                            videoFile: course.url,
                            heroTag: videoId,
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  course.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    
  }
}
