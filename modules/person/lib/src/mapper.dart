library person.mapper;

import 'dart:async';
import 'package:mapper/mapper.dart';

import 'entity.dart' as e;

part 'db/mapper/person.dart';

extension AppExt on App {
  PersonMapper get person => PersonMapper(m)
    ..notifier = entityPerson
    ..entity = (() => Person())
    ..collection = () => PersonCollection();
}

/// If we want to listen for update, insert, delete events for this entity
final EntityNotifier<Person> entityPerson = EntityNotifier<Person>();
