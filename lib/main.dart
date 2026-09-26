import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fitjournal/providers/home_provider.dart';
import 'package:fitjournal/providers/library_provider.dart';
import 'package:fitjournal/providers/login_provider.dart';
import 'package:fitjournal/providers/onboardiing_provider.dart';
import 'package:fitjournal/providers/training_screen_provider.dart';
import 'package:fitjournal/screens/splash_Screen.dart';
import 'package:fitjournal/service/database_service.dart';
import 'package:fitjournal/widgets/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorkey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DatabaseService.init('fit.db');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => LibraryProvider()),
        ChangeNotifierProvider(create: (_) => OnboardiingProvider()),
        ChangeNotifierProvider(create: (_) => TrainingScreenProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});



  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
    bool isSheetOpen = false;

 @override
  void initState() {
    Connectivity().onConnectivityChanged.listen((status) {
      print('Connectivity status $status');
      if (status.contains(ConnectivityResult.none)) {
        WidgetsBinding.instance.addPostFrameCallback((v) {
          NoInterner.widgetnikorsatish();
          isSheetOpen = true;
        });
      } else if (status.contains(ConnectivityResult.wifi) ||
          status.contains(ConnectivityResult.mobile) ||
          status.contains(ConnectivityResult.ethernet)) {
        WidgetsBinding.instance.addPostFrameCallback((v) {
          if (isSheetOpen == true) {
            Navigator.pop(navigatorkey.currentState!.context);
          }
        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      title: 'Fit Journal',
      home: SplashScreen(),
    );
  }
}