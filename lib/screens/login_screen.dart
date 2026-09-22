import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/providers/login_provider.dart';
import 'package:fitjournal/screens/home_screen.dart';
import 'package:fitjournal/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Appcolors.scaffoldBodyColor,
        body: ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: Builder(
            builder: (context) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Appcolors.primary,
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: Appcolors.primaryGreenLogo,
                      ),
                      child: Assets.images.logo.image(),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Fit Journal',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Text(
                      'Осознанный трекинг трансформации',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Appcolors.lightGrey90,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
                      child: LiquidGlassButton(
                        height: context.watch<LoginProvider>().loginnRegister == 0? 320 :565,
                        touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                        style: LiquidGlassStyle(
                          shape: LiquidGlassShape(cornerRadius: 40.0),
                          adaptivity: LiquidGlassAdaptivity(
                            glassColorOnDark: Appcolors.whiteOpacity10,
                            glassColorOnLight: Appcolors.whiteOpacity10,
                            continuousGlassColor: true,
                          ),
                          liteGlass: LiquidGlassLitePickup.blend,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsGeometry.symmetric(
                            // horizontal: 18,
                            vertical: 18,
                          ),
                          child: Column(
                            children: [
                              Row(
                                spacing: 6,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<LoginProvider>()
                                          .onLoginChanged(0);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 0),
                                      decoration: BoxDecoration(
                                        border:
                                            context
                                                    .watch<LoginProvider>()
                                                    .loginnRegister ==
                                                1
                                            ? Border(
                                                top: BorderSide(
                                                  color:
                                                      Appcolors.whiteOpacity65,
                                                ),
                                                bottom: BorderSide(
                                                  color:
                                                      Appcolors.whiteOpacity65,
                                                ),
                                              )
                                            : Border.all(
                                                color: Appcolors.primary,
                                              ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Appcolors.whiteOpacity20,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            context
                                                    .watch<LoginProvider>()
                                                    .loginnRegister ==
                                                0
                                            ? Appcolors.containerColor2
                                            : Appcolors.containerColor,
                                      ),
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                          0.04,
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.38,
                                      child: Center(
                                        child: Text(
                                          'Вход',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                context
                                                        .watch<LoginProvider>()
                                                        .loginnRegister ==
                                                    0
                                                ? Appcolors.lightWhite
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<LoginProvider>()
                                          .onLoginChanged(1);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 0),
                                      decoration: BoxDecoration(
                                        border:
                                            context
                                                    .watch<LoginProvider>()
                                                    .loginnRegister ==
                                                0
                                            ? Border(
                                                top: BorderSide(
                                                  color:
                                                      Appcolors.whiteOpacity65,
                                                ),
                                                bottom: BorderSide(
                                                  color:
                                                      Appcolors.whiteOpacity65,
                                                ),
                                              )
                                            : Border.all(
                                                color: Appcolors.primary,
                                              ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Appcolors.whiteOpacity20,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            context
                                                    .watch<LoginProvider>()
                                                    .loginnRegister ==
                                                1
                                            ? Appcolors.containerColor2
                                            : Appcolors.containerColor,
                                      ),
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                          0.04,
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.38,
                                      child: Center(
                                        child: Text(
                                          'Регистрация',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                context
                                                        .watch<LoginProvider>()
                                                        .loginnRegister ==
                                                    1
                                                ? Appcolors.lightWhite
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              context.watch<LoginProvider>().loginnRegister == 0
                                  ? TextFormFeild(hintText: 'Электронная почта')
                                  : TextFormFeild(hintText: 'Имя'),
                              SizedBox(height: 15),
                              context.watch<LoginProvider>().loginnRegister == 0
                                  ? TextFormFeild(hintText: 'Пароль')
                                  : TextFormFeild(hintText: 'Фамилия'),
                              context.watch<LoginProvider>().loginnRegister == 0
                                  ? SizedBox()
                                  : SizedBox(height: 15),
                      
                              context.watch<LoginProvider>().loginnRegister == 0
                                  ? SizedBox()
                                  : TextFormFeild(hintText: 'Электронная почта'),
                              context.watch<LoginProvider>().loginnRegister == 0
                                  ? SizedBox()
                                  : SizedBox(height: 15),
                      
                              context.watch<LoginProvider>().loginnRegister == 0
                                  ? SizedBox()
                                  : TextFormFeild(hintText: 'Пароль'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsetsGeometry.symmetric(horizontal: 25),
                      child: LiquidGlassButton(
                        touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                        style: LiquidGlassStyle(
                          adaptivity: LiquidGlassAdaptivity(
                            glassColorOnDark: Appcolors.whiteOpacity10,
                            glassColorOnLight: Appcolors.whiteOpacity10,
                            continuousGlassColor: true,
                          ),
                          liteGlass: LiquidGlassLitePickup.blend,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Продолжить',
                            style: TextStyle(
                              fontSize: 18,
                              color: Appcolors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
