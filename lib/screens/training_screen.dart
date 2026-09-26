import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/models/fit_model.dart';
import 'package:fitjournal/providers/home_provider.dart';
import 'package:fitjournal/providers/training_screen_provider.dart';
import 'package:fitjournal/widgets/custom_training.dart';
import 'package:fitjournal/widgets/custom_training_type.dart';
import 'package:fitjournal/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final TextEditingController _notecontroller = TextEditingController();
  final TextEditingController _weightController = TextEditingController(
    text: '0',
  );
  final TextEditingController _weightController2 = TextEditingController(
    text: '0',
  );

  @override
  void initState() {
    super.initState();
    // Загружаем список тренировок при открытии экрана
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().loadFits();
    });
  }

  @override
  void dispose() {
    _notecontroller.dispose();
    _weightController.dispose();
    _weightController2.dispose();
    super.dispose();
  }

  void _openAddSheet(BuildContext outerContext) {
    showModalBottomSheet(
      context: outerContext,
      isScrollControlled: true,
      builder: (sheetContext) {
        return GestureDetector(
          onTap: () => FocusScope.of(sheetContext).unfocus(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Appcolors.scaffoldBodyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.sizeOf(outerContext).height * 0.5,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  height: 6,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Appcolors.whiteOpacity10,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SizedBox(height: 30),
                TextFormFeild(
                  hintText: 'Тип тренировки',
                  notecontroller: _notecontroller,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CustomTrainingType(
                      type: 'ВЕС (КГ)',
                      weightController: _weightController,
                    ),
                    SizedBox(width: 10),
                    CustomTrainingType(
                      type: 'ПОВТОРЕНИЯ',
                      weightController: _weightController2,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                LiquidGlassButton(
                  onPressed: () {
                    final trainingProvider = outerContext
                        .read<TrainingScreenProvider>();
                    final homeProvider = outerContext.read<HomeProvider>();

                    trainingProvider.journal(
                      fit: FitModel(
                        id: 0,
                        value: double.tryParse(_weightController2.text) ?? 0.0,
                        kg: int.tryParse(_weightController.text) ?? 0,
                        note: _notecontroller.text,
                      ),
                      onError: () {
                        ScaffoldMessenger.of(outerContext).showSnackBar(
                          SnackBar(
                            content: Text('Error'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                      onSuccess: () {
                        homeProvider.loadFits();
                        _notecontroller.clear();
                        _weightController.text = '0';
                        _weightController2.text = '0';
                        Navigator.pop(sheetContext);
                      },
                    );
                  },
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
                  child: Text(
                    'Сохранить',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _addButton() {
    return GestureDetector(
      onTap: () => _openAddSheet(context),
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
              'Добавить тренировку',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(Icons.add, color: Colors.white, size: 25),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тренировки',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Appcolors.scaffoldBodyColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: homeProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : homeProvider.fits.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                      _addButton(),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.5,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
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
                              label:
                                  '${fit.kg} кг × ${fit.value.toInt()}',
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      _addButton(),
                      SizedBox(height: 15),
                    ],
                  ),
      ),
      backgroundColor: Appcolors.scaffoldBodyColor,
    );
  }
}