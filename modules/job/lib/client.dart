import 'package:cl/app.dart' as cl_app;

import 'intl/client.dart' as intl;
import 'src/gui.dart';
import 'src/permission.dart';

export 'src/gui.dart';

abstract class MenuItem {
  static final cl_app.MenuElement Job = cl_app.MenuElement()
    ..title = intl.Job()
    ..icon = Icon.Job;

  static final cl_app.MenuElement JobNew = cl_app.MenuElement()
    ..title = intl.Job_new()
    ..icon = Icon.Job
    ..scope = '${Group.Job}:${Scope.Job}:read'
    ..action = (ap) => ap.run(Routes.job.reverse([0]));

  static final cl_app.MenuElement JobList = cl_app.MenuElement()
    ..title = intl.Job_list()
    ..icon = Icon.JobList
    ..scope = '${Group.Job}:${Scope.Job}:read'
    ..action = (ap) => ap.run(Routes.jobList.reverse());
}

/// Bootstrap function - client part
void init(cl_app.Application ap) {
  [
    Routes.job,
    Routes.jobList,
  ].forEach(ap.addRoute);
}
