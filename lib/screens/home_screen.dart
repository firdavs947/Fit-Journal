import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/providers/home_provider.dart';
import 'package:fitjournal/service/permission_service.dart';
import 'package:fitjournal/widgets/custom_appbar.dart';
import 'package:fitjournal/widgets/custom_training.dart';
import 'package:fitjournal/widgets/percent_widget.dart';
import 'package:fitjournal/widgets/training_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  Future<void> _requestPermissions() async {
    await PermissionService.requestCameraPermission();
    await PermissionService.requestGalleryPermission();
  }

@override
  void initState() {
    _requestPermissions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      backgroundColor: Appcolors.scaffoldBodyColor,
      appBar:CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            SizedBox(height: 15),
            PercentWidget(),
           TrainingWidget(),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LiquidGlassButton(
                    padding: EdgeInsetsGeometry.all(10),
                    width: MediaQuery.sizeOf(context).width * 0.27,
                    height: 70,
                    touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                    style: LiquidGlassStyle(
                      shape: LiquidGlassShape(cornerRadius: 25.0),
                      adaptivity: LiquidGlassAdaptivity(
                        glassColorOnDark: Appcolors.whiteOpacity10,
                        glassColorOnLight: Appcolors.whiteOpacity10,
                        continuousGlassColor: true,
                      ),
                      liteGlass: LiquidGlassLitePickup.blend,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Серия',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 5),
                            SvgPicture.asset(Assets.icons.fire),
                          ],
                        ),
                        Text(
                          '12 дней',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  LiquidGlassButton(
                    padding: EdgeInsetsGeometry.all(10),
                    width: MediaQuery.sizeOf(context).width * 0.27,
                    height: 70,
                    touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                    style: LiquidGlassStyle(
                      shape: LiquidGlassShape(cornerRadius: 25.0),
                      adaptivity: LiquidGlassAdaptivity(
                        glassColorOnDark: Appcolors.whiteOpacity10,
                        glassColorOnLight: Appcolors.whiteOpacity10,
                        continuousGlassColor: true,
                      ),
                      liteGlass: LiquidGlassLitePickup.blend,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'В месяце',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 5),
                            SvgPicture.asset(Assets.icons.energy),
                          ],
                        ),
                        Text(
                          '18 сессий',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  LiquidGlassButton(
                    padding: EdgeInsetsGeometry.all(10),
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: 70,
                    touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                    style: LiquidGlassStyle(
                      shape: LiquidGlassShape(cornerRadius: 25.0),
                      adaptivity: LiquidGlassAdaptivity(
                        glassColorOnDark: Appcolors.whiteOpacity10,
                        glassColorOnLight: Appcolors.whiteOpacity10,
                        continuousGlassColor: true,
                      ),
                      liteGlass: LiquidGlassLitePickup.blend,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Неделя',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 5),
                            SvgPicture.asset(Assets.icons.cup),
                          ],
                        ),
                        Text(
                          '3850 ккал',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Appcolors.whiteOpacity30),
                    right: BorderSide(color: Appcolors.whiteOpacity30),
                  ),
                  color: Appcolors.liquidglassColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 400,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Недавние тренировки',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Appcolors.whiteOpacity80,
                      ),
                    ),
                    SizedBox(height: 10),
                    if (homeProvider.isLoading)
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator(),
                      )
                    else if (homeProvider.fits.isEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Пока нет тренировок',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      )
                    else
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: homeProvider.fits.length,
                          separatorBuilder: (_, _) => SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final fit = homeProvider.fits[index];
                            return CustomTraining(
                              id: fit.id.toString(),
                              title: fit.note?.isNotEmpty == true
                                  ? fit.note!
                                  : 'Тренировка',
                              time: '',
                              label: '${fit.kg} кг × ${fit.value.toInt()}',
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}