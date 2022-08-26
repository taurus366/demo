part of person.gui;

class PersonListChoose extends PersonList {
  String? mode = Listing.MODE_CHOOSE;

  cl_app.WinMeta meta = cl_app.WinMeta()
    ..title = 'Choose Person'
    ..width = 1100
    ..height = 850
    ..icon = Icon.PersonList;

  void Function(Map) call;

  PersonListChoose(this.call, ap, {bool autoload = true})
      : super(ap, autoload: autoload);

  void onClick(TableRowElement row) {
    call(gridList!.grid.rowToMap(row));
    wapi.close();
  }
}
