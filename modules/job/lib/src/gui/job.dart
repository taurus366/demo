part of job.gui;

class Job extends ItemBuilder {
  UrlPattern? contr_get = RoutesJob.itemGet;
  UrlPattern? contr_save = RoutesJob.itemSave;
  UrlPattern? contr_del = RoutesJob.itemDelete;

  cl_app.WinMeta meta = cl_app.WinMeta()
    ..title = intl.job_title
    ..width = 600
    ..height = 500
    ..icon = Icon.Job;

  Job(ap, [id]) : super(ap, id);

  Future<void> setDefaults() async {
    form.getElement(e.$Job.title)?.focus();
  }

  void setUI() {
    final t1 = cl_gui.FormElement(form);
    final t = createTab(null, t1);
    layout!.contInner.activeTab(t);
    t1
      ..addRow('Title', [
        cl_form.Input()
          ..setName(e.$Job.title)
          ..setRequired(true)
      ])
      ..addRow('Person', [
        person.InputPerson(ap)
          ..setName(e.$Job.person_id)
          ..setRequired(true)
      ])
      ..addRow(
          'Description', [cl_form.TextArea()..setName(e.$Job.description)]);
  }
}
