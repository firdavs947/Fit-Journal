import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/providers/home_provider.dart';
import 'package:fitjournal/screens/profile_screren.dart';
import 'package:fitjournal/widgets/custom_training.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.scaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: Appcolors.scaffoldBodyColor,
        title: Column(
          children: [
            Text(
              'С возвращением ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            Text(
              'Александр',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actionsPadding: EdgeInsetsGeometry.only(right: 20, top: 10),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreren()),
            ),
            child: LiquidGlassButton(
              height: 70,
              width: 70,
              style: LiquidGlassStyle(
                adaptivity: LiquidGlassAdaptivity(
                  glassColorOnDark: Appcolors.containerColor2,
                  glassColorOnLight: Appcolors.containerColor2,
                  continuousGlassColor: true,
                ),
                liteGlass: LiquidGlassLitePickup.blend,
              ),
              touch: LiquidGlassTouch(flex: LiquidGlassFlex()),

              child: Center(
                child: Text(
                  'АВ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: Builder(
          builder: (context) {
            return Column(
              spacing: 15,
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: LiquidGlassButton(
                    padding: EdgeInsetsGeometry.all(20),
                    // height: MediaQuery.sizeOf(context).height * 0.18,
                    height: 174,
                    touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                    style: LiquidGlassStyle(
                      adaptivity: LiquidGlassAdaptivity(
                        glassColorOnDark: Appcolors.whiteOpacity10,
                        glassColorOnLight: Appcolors.whiteOpacity10,
                        continuousGlassColor: true,
                      ),
                      liteGlass: LiquidGlassLitePickup.blend,
                    ),
                    child: Row(
                      children: [
                        SleekCircularSlider(
                          initialValue: 78,
                          max: 100,
                          appearance: CircularSliderAppearance(
                            size: 130,
                            startAngle: 270,
                            angleRange: 360,
                            customWidths: CustomSliderWidths(
                              progressBarWidth: 15,
                              trackWidth: 15,
                              handlerSize: 0,
                            ),
                            customColors: CustomSliderColors(
                              trackColor: Appcolors.whiteOpacity10,
                              progressBarColor: Appcolors.primary,
                              hideShadow: true,
                            ),
                          ),
                          innerWidget: (double value) {
                            final percentage = value.toInt();
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '$percentage',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        height: 1.0,
                                      ),
                                    ),
                                    Text(
                                      '%',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Appcolors.primary,
                                        height: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'ПЛАН',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            );
                          },
                          onChange: null,
                        ),
                        SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '4 из 5 тренировок',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Appcolors.primary,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Отличный темп недели',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Осталось закрыть сессию ног для 100% плана.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: LiquidGlassButton(
                    padding: EdgeInsetsGeometry.all(20),
                    // height: MediaQuery.sizeOf(context).height * 0.22,
                    height: 194,
                    touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                    style: LiquidGlassStyle(
                      shape: LiquidGlassShape(cornerRadius: 50.0),
                      adaptivity: LiquidGlassAdaptivity(
                        glassColorOnDark: Appcolors.whiteOpacity10,
                        glassColorOnLight: Appcolors.whiteOpacity10,
                        continuousGlassColor: true,
                      ),
                      liteGlass: LiquidGlassLitePickup.blend,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(
                              'СЕГОДНЯ · ДЕНЬ 3',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Appcolors.primary,
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset(Assets.icons.timer),
                            SizedBox(width: 5),
                            Text(
                              '~ 50 мин',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Грудь и дельты',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2),

                        Text(
                          '4 упражнения · 14 рабочих подходов',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 14),
                        LiquidGlassButton(
                          touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                          style: LiquidGlassStyle(
                            shape: LiquidGlassShape(cornerRadius: 50.0),

                            adaptivity: LiquidGlassAdaptivity(
                              glassColorOnDark: Appcolors.greenAccent4,
                              glassColorOnLight: Appcolors.greenAccent4,
                              continuousGlassColor: true,
                            ),
                            liteGlass: LiquidGlassLitePickup.blend,
                          ),
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              'Начать тренировку',
                              style: TextStyle(
                                fontSize: 18,
                                color: Appcolors.darkBlack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // spacing: 6,
                    children: [
                      LiquidGlassButton(
                        padding: EdgeInsetsGeometry.all(10),
                        width: MediaQuery.sizeOf(context).width * 0.27,
                        // height: MediaQuery.sizeOf(context).height * 0.08,
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
                          // crossAxisAlignment: CrossAxisAlignment.start,
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

                        // height: MediaQuery.sizeOf(context).height * 0.08,
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
                          // crossAxisAlignment: CrossAxisAlignment.start,
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

                        // height: MediaQuery.sizeOf(context).height * 0.08,
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
                          // crossAxisAlignment: CrossAxisAlignment.start,
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
                // SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: LiquidGlassButton(
                    padding: EdgeInsetsGeometry.all(15),
                    // width: MediaQuery.sizeOf(context).width*0.3,

                    // height: MediaQuery.sizeOf(context).height * 0.08,
                    height: 210,
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
                      // spacing: 10,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Недавние тренировки',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Appcolors.whiteOpacity80,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Все',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Appcolors.primary,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: Appcolors.primary,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomTraining(
                          id: '1',
                          title: 'Жим и трицепс',
                          time: 'Вчера, 18:30',
                          label: '8.4 т',
                        ),
                        SizedBox(height: 10,),
                        CustomTraining(
                          id: '2',
                          title: 'Ноги и пресс',
                          time: '22 Октября, 19:15',
                          label: '11.2 т',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
