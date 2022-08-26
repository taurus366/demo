part of person.mapper;

class PersonMapper extends Mapper<Person, PersonCollection> {
  String? table = e.Person.$table;
  dynamic pkey = e.$Person.person_id;

  /// By default the pkey is <table>_id if it's different you should specify;
  /// dynamic pkey = 'person_id';

  PersonMapper(m) : super(m);

  //eq, llike, like, rlike, date, ts
  CollectionBuilder<Person, PersonCollection> findAllByBuilder() =>
      collectionBuilder()
        ..filterRule = (new FilterRule()
          ..eq = [pkey]
          ..like = [e.$Person.name, e.$Person.mail, e.$Person.phone, e.$Person.salary]
          ..date = [e.$Person.birth]);

  Future<PersonCollection> findBySuggestion(String sug, [int limit = 10]) =>
      loadC(selectBuilder()
        ..where('${e.$Person.name} ILIKE @sug')
        ..setParameter('sug', '%$sug%')
        ..limit(limit));
}

class Person extends e.Person with Entity {}

class PersonCollection extends e.PersonCollection<Person> {}
