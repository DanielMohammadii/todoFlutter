class TodoModel {
  String descrioption;
  String title;
  DateTime createdTime;
  int id;
  bool isDone;
  TodoModel({
    this.descrioption = '',
    required this.title,
    required this.createdTime,
    required this.id,
    this.isDone = false,
  });

  static List<TodoModel> todomodel = [
    TodoModel(
        title: "First Todo",
        createdTime: DateTime.now(),
        id: 1,
        descrioption: "Dex1 red box"),
    TodoModel(
        title: "Second Todo",
        createdTime: DateTime.now(),
        id: 2,
        descrioption: ''' -Buy one
         -Buy Two
         -Buy Three
         -Buy Four
        '''),
    TodoModel(
        title: "Second Todo",
        createdTime: DateTime.now(),
        id: 2,
        descrioption: "Dex1 red box"),
    TodoModel(
        title: "Second Todo",
        createdTime: DateTime.now(),
        id: 2,
        descrioption: '''  
         -Buy Two
         -Buy Three
         -Buy Four
        '''),
    TodoModel(
        title: "Second Todo",
        createdTime: DateTime.now(),
        id: 2,
        descrioption: '''  
         -Buy Two
         -Buy Three
         -Buy Four
        '''),
    TodoModel(
        title: "Second Todo",
        createdTime: DateTime.now(),
        id: 2,
        descrioption: "Dex1 red box"),
  ];
}
