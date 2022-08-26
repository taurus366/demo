part of person.ctrl;

class IPerson extends base.Item<Person, int> {
  final String group = Group.Person;
  final String scope = Scope.Person;

  IPerson(req) : super(req);

  Future<Map> doGet(int id) async {
    final person = await manager!.app.person.find(id);
    if (person == null) throw base.ResourceNotFoundException();
    return person.toJson();
  }

  Future<int> doSave(int? id, Map<String, dynamic> data) async {
    final person = await manager!.app.person.prepare(id, data);
    await manager!.commit();
    return person?.person_id ?? -1;
  }

  Future<bool> doDelete(int id) => manager!.app.person.deleteById(id);
}
