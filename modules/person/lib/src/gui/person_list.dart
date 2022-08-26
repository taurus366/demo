part of person.gui;

class PersonList extends Listing {
  UrlPattern? contr_get = RoutesPerson.collectionGet;
  UrlPattern? contr_del = RoutesPerson.collectionDelete;

  String? mode = Listing.MODE_LIST;
  String? key = e.$Person.person_id;

  cl_app.WinMeta meta = cl_app.WinMeta()
    ..title = intl.Persons()
    ..width = 1000
    ..height = 800
    ..icon = Icon.PersonList;

  // add new person btn
  PersonList(ap, {autoload = true}) : super(ap, autoload: autoload) {
    menu.add(new cl_action.Button()
      ..setStyle({'margin-left': 'auto'})
      ..setTitle(intl.Add_person())
      ..setIcon(cl.Icon.add)
      ..addClass('important')
      ..addAction((e) => onEdit(0)));
  }

  List<String> initOrder() => [e.$Person.name, 'ASC'];

//  customRow(row, obj) {
//    obj['birth'] = obj['birth'].toString()+"dasdsaa";
//  }

  List<cl_form.GridColumn> initHeader() => [
        cl_form.GridColumn(e.$Person.name)
          ..title = intl.Name()
          ..filter = (cl_form.Input()..setName(e.$Person.name))
          ..sortable = true,
        cl_form.GridColumn(e.$Person.phone)..title = intl.Phone(),
        cl_form.GridColumn(e.$Person.mail)..title = intl.Mail(),
        cl_form.GridColumn(e.$Person.comment)..title = intl.Comment(),
        cl_form.GridColumn(e.$Person.birth)
          ..title = intl.Birth()
          ..filter = (cl_form.InputDateRange()..setName(e.$Person.birth))
          ..sortable = true
          ..type =
              (grid, row, cell, object) => DateCell(grid, row, cell, object),
      cl_form.GridColumn(e.$Person.salary)
        ..title = intl.Salary()
        ..filter = (cl_form.Input()..setName(e.$Person.salary))
        ..sortable = true
      ];

  void onEdit(dynamic id) => ap
          .run<Person>(Routes.person.reverse([id]))!
          .addHook(ItemBase.change_after, (_) {
        getData();
        return true;
      });
}
