part of job.mapper;

class JobMapper extends Mapper<Job, JobCollection> {
  String? table = e.Job.$table;
  dynamic pkey = e.$Job.job_id;

  /// By default the pkey is <table>_id if it's different you should specify;
  /// dynamic pkey = 'job_id';

  JobMapper(m) : super(m);

  CollectionBuilder<Job, JobCollection> findAllByBuilder() =>
      collectionBuilder()
        ..filterRule = (new FilterRule()
          ..eq = [e.$Job.job_id]
          ..llike = [e.$Job.title, e.$Job.description]
          ..map = {e.Job.$person: e.$Job.person_id});
}

class Job extends e.Job with Entity {
  // We can use manager.app.person.find but it's better
  // if we have the [Job] entity to easy write job.loadPerson()
  Future<person_server.Person?> loadPerson() async =>
      person = await manager!.app.person.find(person_id);
}

class JobCollection extends e.JobCollection<Job> {}
