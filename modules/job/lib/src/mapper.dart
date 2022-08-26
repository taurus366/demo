library job.mapper;

import 'dart:async';
import 'package:mapper/mapper.dart';
import 'package:person/server.dart' as person_server;
import 'entity.dart' as e;

part 'db/mapper/job.dart';

extension AppExt on App {
  JobMapper get job => JobMapper(m)
    ..notifier = entityJob
    ..entity = (() => Job())
    ..collection = () => JobCollection();
}

/// If we want to listen for update, insert, delete events for this entity
final EntityNotifier<Job> entityJob = EntityNotifier<Job>();
