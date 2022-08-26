part of job.ctrl;

class IJob extends base.Item<Job, int> {
  final String group = Group.Job;
  final String scope = Scope.Job;

  IJob(req) : super(req);

  Future<Map> doGet(int id) async {
    final job = await manager!.app.job.find(id);
    if (job == null) throw base.ResourceNotFoundException();
    return job.toJson();
  }

  Future<int> doSave(int? id, Map<String, dynamic> data) async {
    final job = await manager!.app.job.prepare(id, data);
    await manager!.commit();
    return job?.job_id ?? -1;
  }

  Future<bool> doDelete(int id) => manager!.app.job.deleteById(id);
}
