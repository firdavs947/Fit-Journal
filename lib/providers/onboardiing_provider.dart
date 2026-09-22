import 'package:fitjournal/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class OnboardiingProvider extends ChangeNotifier {
  List<Map> info = [
    {
      "title": "Добро пожаловать в Fit Journal",
      "description":
          "Умный спутник для осознанных тренировок, гипертрофии и учета микропериодизации.",
    },
    {
      "title": "Ваша главная цель?",
      "description": "Алгоритм подстроит расчет объема",
    },
    {"title": "Опыт тренировок", "description": "Выберите ваш стаж в зале"},
  ];

  List steps = ['Пропустить', 'Назад', 'Финиш'];

  List steps2 = ['Продолжить', 'Далее', 'Начать тренировки'];

  List experience = ['Новичок', 'Средний уровень', 'Продвинутый атлет'];

  List experience2 = [
    'Менее 1 года',
    'От 1 до 3 лет',
    'Более 3 лет регулярного тренинга',
  ];

  List goal = [
    'Набор мышечной массы',
    'Похудение и рельеф',
    'Сила и мощь',
    'Выносливость',
  ];

  void onCheckboxChanged(int index, bool? value) {
    checkbox[index] = value ?? false;
    notifyListeners();
  }

  List<bool> checkbox = List.generate(3, (i) => false);

  
  int selectedTraining = -1;
  void onTraininChanged(int index) {
    selectedTraining = index;
    notifyListeners();
  }

  int selectedGoal = -1;
  void onGoalChanged(int index) {
    selectedGoal = index;
    notifyListeners();
  }

  List icons = [
    Assets.icons.gym,
    Assets.icons.fire,
    Assets.icons.energy2,
    Assets.icons.timer,
  ];

  int currentPage = 0;

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }
}
