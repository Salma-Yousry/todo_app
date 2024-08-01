class Task {
  static const String collectionName = 'tasks';

  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  Task(
      {this.id = '', required this.title, required this.description, required this.dateTime, this.isDone = false});

  ///json => object
  Task.fromFireStore(Map<String,dynamic> data):this(
    /// as String بنحدد ان نوعه string مش dynamic ولو متعملش عادي مش هتفرق

    id: data['id'] as String,
    title: data['title'] as String,
    description: data['description'] as String,
    ///fromMillisecondsSinceEpoch عشن نرجعه integer عشن مخزنينه integer
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']) ,
    isDone: data['isDone'] as bool
  );
  ///object => json
  Map <String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      ///millisecondsSinceEpoch نخزنه integer
      'dataTime': dateTime.millisecondsSinceEpoch,
      'isDone': isDone
    };
  }


  }

///احنا بنفهم object
///object => json
///firebase بيفهم json
///json => object