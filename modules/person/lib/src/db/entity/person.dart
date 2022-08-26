part of person.entity;

@MSerializable()
class Person {
  static const String $person = 'person';
  static String get $table => $person;

  int? person_id;
  String? name;
  String? phone;
  int age = 18;
  String? mail;
  String? comment;
  DateTime? birth;
  num? salary;

  Person();

  void init(Map data) {
    data[$Person.age] ??= 18;
    _$PersonFromMap(this, data);
  }

  Map<String, dynamic> toJson() => _$PersonToMap(this, true);

  Map<String, dynamic> toMap() => _$PersonToMap(this);

}

class PersonCollection<E extends Person> extends Collection<E> {
  List<Map<String, dynamic>> pair() =>
      map((person) => {'k': person.person_id, 'v': person.name})
          .toList();
}
