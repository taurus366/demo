library person.gui;

import 'dart:async';
import 'dart:html';

import 'package:cl/action.dart' as cl_action;
import 'package:cl/app.dart' as cl_app;
import 'package:cl/base.dart' as cl;
import 'package:cl/forms.dart' as cl_form;
import 'package:cl/gui.dart' as cl_gui;
import 'package:cl_base/client.dart';
import 'package:communicator/client.dart';
import 'package:intl/intl.dart';

import '../intl/client.dart' as intl;
import '../cpath.dart';
import 'entity.dart' as e;
import 'path.dart';

part 'gui/element/form_date.dart';
part 'gui/element/input_person.dart';
part 'gui/person.dart';
part 'gui/person_list.dart';
part 'gui/person_list_choose.dart';

abstract class Icon {
  static const String Person = cl.Icon.person;
  static const String PersonList = cl.Icon.assignment;
}

abstract class Routes {
  static cl_app.Route person =
      cl_app.Route(Path.person.path, (ap, p) => Person(ap, p[0]));
  static cl_app.Route personList =
      cl_app.Route(Path.person.list, (ap, p) => PersonList(ap));
}
