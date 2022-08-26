// GENERATED CODE - DO NOT MODIFY BY HAND

part of job.entity;

// **************************************************************************
// EntitySerializableGenerator
// **************************************************************************

abstract class $Job {
  static const String job_id = 'job_id',
      title = 'title',
      person_id = 'person_id',
      description = 'description';
}

void _$JobFromMap(Job obj, Map data) => obj
  ..job_id = data[$Job.job_id]
  ..title = data[$Job.title]
  ..person_id = data[$Job.person_id]
  ..description = data[$Job.description];

Map<String, dynamic> _$JobToMap(Job obj, [asJson = false]) => <String, dynamic>{
      $Job.job_id: obj.job_id,
      $Job.title: obj.title,
      $Job.person_id: obj.person_id,
      $Job.description: obj.description
    };
