part of person.gui;

class Person extends ItemBuilder {
  UrlPattern? contr_get = RoutesPerson.itemGet;
  UrlPattern? contr_save = RoutesPerson.itemSave;
  UrlPattern? contr_del = RoutesPerson.itemDelete;

  cl_app.WinMeta meta = cl_app.WinMeta()
    ..title = intl.person_title
    ..width = 600
    ..height = 500
    ..icon = Icon.Person;

  Person(ap, [id]) : super(ap, id);

  Future<void> setDefaults() async {
    form.getElement(e.$Person.name)?.focus();
  }

  void setUI() {
    final t1 = cl_gui.FormElement(form);
    final t = createTab(null, t1);
    layout!.contInner.activeTab(t);
    t1
      ..addRow(intl.Name(), [
        cl_form.Input()
          ..setName(e.$Person.name)
          ..setRequired(true)
      ])
      ..addRow(intl.Age(), [
        cl_form.Input(new cl_form.InputTypeInt(range: [0, 30]))
          ..setName(e.$Person.age)
          ..setRequired(true)
      ])
      ..addRow(intl.Phone(), [
        cl_form.Input()
          ..setName(e.$Person.phone)
          ..setRequired(true)
      ])
      ..addRow(intl.Mail(), [
        cl_form.Input()
          ..setName(e.$Person.mail)
          ..setRequired(true)
      ])
      ..addRow(
          intl.Comment(), [new cl_form.TextArea()..setName(e.$Person.comment)])
      ..addRow(intl.Birth(), [
        cl_form.InputDate()
          ..setName(e.$Person.birth)
          ..setRequired(false)
          ..addValidationOnValue((v) {
            DateTime? dt;
            if (v == null) return true;
            if (v is DateTime) dt = v;
            if (v is String) dt = DateTime.parse(v);
            if (dt?.isBefore(DateTime.now()) ?? false) return true;
            return false;
          })
      ])
    //  Added new field
    ..addRow(intl.Salary(), [
      cl_form.Input(new cl_form.InputTypeDouble(range: [500,700]))
      ..setName(e.$Person.salary)
    ..setRequired(false)
    ]);
  }
//  new cl_form.InputTypeInt(range: [0, 30])
}
