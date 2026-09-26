import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/mock/mockdata.dart';
import 'package:fitjournal/providers/library_provider.dart';
import 'package:fitjournal/widgets/library_listview_builder.dart';
import 'package:fitjournal/widgets/list_view_library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryProvider(),
      child: Builder(
        builder: (context) {
          final categoryIndex = context.watch<LibraryProvider>().categoryIndex;

          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Appcolors.scaffoldBodyColor,
              title: const Text(
                'Библиотека',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Appcolors.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListViewLibrary()
                  ),
                  const SizedBox(height: 20),
                  if (categoryIndex == 0)
                    LibraryListviewBuilder(
                      key: ValueKey('cat_0'),
                      courses: Mockdata.listCourses2,
                    )
                  else if (categoryIndex == 1)
                    LibraryListviewBuilder(
                      key: ValueKey('cat_1'),
                      courses: Mockdata.listCourses1,
                    )
                  else if (categoryIndex == 2)
                    LibraryListviewBuilder(
                      key: ValueKey('cat_2'),
                      courses: Mockdata.listCourses3,
                    )
                  else if (categoryIndex == 3)
                    LibraryListviewBuilder(
                      key: ValueKey('cat_3'),
                      courses: Mockdata.listCourses4,
                    
                    )
                  else
                     SizedBox(),
                     SizedBox(height: 120,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}