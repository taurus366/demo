// GENERATED CODE - DO NOT MODIFY BY HAND

part of person.entity;

// **************************************************************************
// EntitySerializableGenerator
// **************************************************************************

abstract class $Person {
  static const String person_id = 'person_id',
      name = 'name',
      phone = 'phone',
      age = 'age',
      mail = 'mail',
      comment = 'comment',
      birth = 'birth',
      salary = 'salary';
}

void _$PersonFromMap(Person obj, Map data) => obj
  ..person_id = data[$Person.person_id]
  ..name = data[$Person.name]
  ..phone = data[$Person.phone]
  ..age = data[$Person.age]
  ..mail = data[$Person.mail]
  ..comment = data[$Person.comment]
  ..birth = data[$Person.birth] is String
      ? DateTime.parse(data[$Person.birth])
      : data[$Person.birth]
    ..salary = data[$Person.salary];

Map<String, dynamic> _$PersonToMap(Person obj, [asJson = false]) =>
    <String, dynamic>{
      $Person.person_id: obj.person_id,
      $Person.name: obj.name,
      $Person.phone: obj.phone,
      $Person.age: obj.age,
      $Person.mail: obj.mail,
      $Person.comment: obj.comment,
      $Person.birth: asJson ? obj.birth?.toIso8601String() : obj.birth,
      $Person.salary: obj.salary
    };
