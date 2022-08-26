part of job.entity;

@MSerializable()
class Job {
  static const String $job = 'job';
  static String get $table => $job;
  static const String $person = 'person';

  int? job_id;
  String? title;
  int? person_id;
  String? description;

  person_shared.Person? person;

  Job();

  void init(Map data) => _$JobFromMap(this, data);

  Map<String, dynamic> toJson() => _$JobToMap(this);

  Map<String, dynamic> toMap() => _$JobToMap(this);

  // We don't implement client side loading of Person
  Future loadPerson() async => null;

}

class JobCollection<E extends Job> extends Collection<E> {}
