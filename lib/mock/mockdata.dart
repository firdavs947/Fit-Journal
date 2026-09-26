import 'package:fitjournal/utils/library_videos.dart';

class Mockdata {
  static final List<Courses> listCourses1 = [
    Courses(
      name: 'Жим гантелей под 30° урок',
      url: '6ab284d8002cd55ebabb'.getFileLink(),
    ),
    Courses(
      name: 'Махи гантелями в стороны',
      url: '6ab3d26800143011b61c'.getFileLink(),
    ),
    Courses(
      name: 'Отжимания на брусьях',
      url: '6ab3d5b300366ff9a7d0'.getFileLink(),
    ),
  ];
  static final List<Courses> listCourses2 = [
    Courses(name: 'Тяга верхнего блока к груди', url: '6ab3d8d80000af671b08'.getFileLink()),
    Courses(name: 'Тяга гантели в наклоне одной рукой', url: '6ab3d95300117c7584f5'.getFileLink()),
    Courses(name: 'Подтягивания широким хватом', url: '6ab3d9c5003dfd41d861'.getFileLink()),
  ];
  static final List<Courses> listCourses3 = [
    Courses(name: 'Румынская тяга с гантелями', url: '6ab3da5e002062fd7bb9'.getFileLink()),
    Courses(name: 'Приседания со штангой на спине', url: '6ab3dab6002b116fa7a9'.getFileLink()),
    Courses(name: 'Болгарские выпады', url: '6ab3db07001d1adce548'.getFileLink()),
  ];
  static final List<Courses> listCourses4 = [
    Courses(name: 'Сгибания рук с гантелями на бицепс', url: '6ab3db760032e0da2871'.getFileLink()),
    Courses(name: 'Разгибания на трицепс на верхнем блоке', url: '6ab3dbd7001990056133'.getFileLink()),
    Courses(name: 'Планка с акцентом на глубокие мышцы', url: '6ab3dc31000bca123dc3'.getFileLink()),
  ];
}

class Courses {
  final String name;
  final String url;

  Courses({required this.name, required this.url});
}
