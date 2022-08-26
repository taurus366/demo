part of job.ctrl;

class CJob extends base.Collection<Job, int> {
  final String group = Group.Job;
  final String scope = Scope.Job;

  CJob(req) : super(req);

  Future<CollectionBuilder> doGet(Map filter, Map order, Map paginator) {
    final cb = manager!.app.job.findAllByBuilder()
      ..filter = filter
      ..order(order[base.$BaseConsts.field], order[base.$BaseConsts.way])
      ..page = paginator[base.$BaseConsts.page]
      ..limit = paginator[base.$BaseConsts.limit];
    return cb.process(paginator[base.$BaseConsts.count]);
  }

  Future<Map> lister(Job o) async {
    final m = o.toJson();
    await o.loadPerson();
    m[e.Job.$person] = o.person?.name;
    return m;
  }

  Future<bool> doDelete(List ids) =>
      Future.wait(ids.map(manager!.app.job.deleteById)).then((_) => true);
}
