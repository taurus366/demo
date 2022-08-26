part of person.gui;

/// InputLoaders are elements which has a visible value
/// the person's name and a "true" value - the person's id
/// In the DB we only save the id
/// InputLoader's has two options for setting the value:
/// ```
/// person.setValue(id) // auto retrieve's the visible value
/// person.setValue([id, 'Ivan Ivanov']); // we provide the visible value
/// ```                                   // and omit the server call
///
class InputPerson extends cl_form.InputLoader {
  InputPerson(cl_app.Application ap) : super() {
    execute = () async {
      final sug = getSuggestion(); //Maybe get needle not suggestion?
      Map<String, dynamic> param;
      if (sug.isNotEmpty) {
        // If we are here it means that we wrote something in the field
        // and we send only the suggestion value
        param = {'suggestion': sug};
      } else {
        // This is a special case - we've set the Id to the field
        // [InputPerson.setValue(id)] and
        // we make a call to the server to extract the "visible" data
        param = {'id': getValue()};
      }

      final res = await ap.serverCall<List>(
          RoutesPerson.collectionSuggest.reverse([]), param, this);

      return (res ?? []).cast<Map>();
    };

    // Action for listing all persons using Listing UI
    addLink((ev) => ap.run(Path.person.renderPath([getValue()])));
    domAction.addAction((_) => PersonListChoose(
        (obj) => setValue(obj[e.$Person.person_id]), ap));
  }
}
