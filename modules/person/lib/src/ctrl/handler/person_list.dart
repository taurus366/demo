part of person.ctrl;

class CPerson extends base.Collection<Person, int> {
  final String group = Group.Person;

  final String scope = Scope.Person;

  CPerson(req) : super(req);

  Future<CollectionBuilder> doGet(Map filter, Map order, Map paginator) {
    final cb = manager!.app.person.findAllByBuilder()
      ..filter = filter
      ..order(order[base.$BaseConsts.field], order[base.$BaseConsts.way])
      ..page = paginator[base.$BaseConsts.page]
      ..limit = paginator[base.$BaseConsts.limit];
    return cb.process(paginator[base.$BaseConsts.count]);
  }

  Future<bool> doDelete(List ids) =>
      Future.wait(ids.map(manager!.app.person.deleteById)).then((_) => true);

  Future<void> suggest() => run(group, scope, base.$RunRights.read, () async {
        final params = await getData();
        manager = await Database().init();
        var col = PersonCollection();
        if (params[base.$BaseConsts.suggestion] != null) {
          col = await manager!.app.person
              .findBySuggestion(params[base.$BaseConsts.suggestion]);
        } else {
          final person = await manager!.app.person.find(params['id']);
          if (person != null) col.add(person);
        }
        return response(col.pair());
      });
}
