part of job.gui;

class JobList extends Listing {
  UrlPattern? contr_get = RoutesJob.collectionGet;
  UrlPattern? contr_del = RoutesJob.collectionDelete;

  String? mode = Listing.MODE_LIST;
  String? key = e.$Job.job_id;

  cl_app.WinMeta meta = cl_app.WinMeta()
    ..title = intl.Jobs()
    ..width = 1000
    ..height = 800
    ..icon = Icon.JobList;

  JobList(ap) : super(ap) {
    menu.add(new cl_action.Button()
      ..setStyle({'margin-left': 'auto'})
      ..setTitle(intl.Add_job())
      ..setIcon(cl.Icon.add)
      ..addClass('important')
      ..addAction((e) => onEdit(0)));
  }

  List<String> initOrder() => [e.$Job.title, 'ASC'];

  List<cl_form.GridColumn> initHeader() => [
        cl_form.GridColumn(e.$Job.title)
          ..title = intl.Title()
          ..filter = (cl_form.Input()..setName(e.$Job.title))
          ..sortable = true,
        cl_form.GridColumn('person')..title = 'Person',
        cl_form.GridColumn(e.$Job.description)..title = 'Description'
      ];

  void onEdit(dynamic id) => ap
          .run<Job>(Path.job.renderPath([id]))!
          .addHook(ItemBase.change_after, (_) {
        getData();
        return true;
      });
}
