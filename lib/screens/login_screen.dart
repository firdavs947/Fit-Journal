import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/providers/login_provider.dart';
import 'package:fitjournal/screens/main_screen.dart';
import 'package:fitjournal/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _box = GetStorage();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    GetStorage().write('opened', true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Appcolors.scaffoldBodyColor,
        body: SingleChildScrollView(
          child: ChangeNotifierProvider(
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
                      LoginWidget(formKey: _formKey, lastnamecontroller: _lastnamecontroller, namecontroller: _namecontroller)
                    ,  SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
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
                            if (_formKey.currentState!.validate()) {
                              if (context.read<LoginProvider>().loginnRegister == 1) {
                                final fullName =
                                    '${_namecontroller.text} ${_lastnamecontroller.text}'.trim();
                                if (fullName.isNotEmpty) {
                                  _box.write('profile_name', fullName);
                                }
                              }

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => MainScreen()),
                              );
                            }
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
                      SizedBox(height: 100),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}