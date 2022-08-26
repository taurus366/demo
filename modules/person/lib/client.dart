import 'package:cl/app.dart' as cl_app;

import 'intl/client.dart' as intl;
import 'src/gui.dart';
import 'src/permission.dart';

export 'src/gui.dart';

abstract class MenuItem {
  static final cl_app.MenuElement Person = cl_app.MenuElement()
    ..title = intl.Person()
    ..icon = Icon.Person;

  static final cl_app.MenuElement PersonNew = cl_app.MenuElement()
    ..title = intl.Person_new()
    ..icon = Icon.Person
    ..scope = '${Group.Person}:${Scope.Person}:read'
    ..action = (ap) => ap.run(Routes.person.reverse([0]));

  static final cl_app.MenuElement PersonList = cl_app.MenuElement()
    ..title = intl.Person_list()
    ..icon = Icon.PersonList
    ..scope = '${Group.Person}:${Scope.Person}:read'
    ..action = (ap) => ap.run(Routes.personList.reverse());
}

/// Bootstrap function - client part
void init(cl_app.Application ap) {
  [
    Routes.person,
    Routes.personList,
  ].forEach(ap.addRoute);
}
