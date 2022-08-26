library job.gui;

import 'dart:async';

import 'package:cl/action.dart' as cl_action;
import 'package:cl/app.dart' as cl_app;
import 'package:cl/base.dart' as cl;
import 'package:cl/forms.dart' as cl_form;
import 'package:cl/gui.dart' as cl_gui;
import 'package:cl_base/client.dart';
import 'package:communicator/client.dart';
import 'package:person/client.dart' as person;

import '../intl/client.dart' as intl;
import 'entity.dart' as e;
import 'path.dart';
import '../cpath.dart';

part 'gui/job.dart';
part 'gui/job_list.dart';

abstract class Icon {
  static const String Job = cl.Icon.schedule;
  static const String JobList = cl.Icon.assignment;
}

abstract class Routes {
  static cl_app.Route job =
      cl_app.Route(Path.job.path, (ap, p) => Job(ap, p[0]));
  static cl_app.Route jobList =
      cl_app.Route(Path.job.list, (ap, p) => JobList(ap));
}
