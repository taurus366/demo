import 'package:cl_base/server.dart' as base;
// import 'package:mapper/mapper.dart';

import 'src/ctrl.dart';
import 'src/mapper.dart';

export 'src/mapper.dart';

/// Bootstrap function - server part
void init() {
  // Register Person's routes to the application
  base.routes.add(routesPerson);

  // List for person insert
  entityPerson.onCreate.listen((cont) {
    print('Person created: ${cont.entity.name}');
  });

  // // Test db query
  // base.dbWrap<void>((manager) async {
  //   var c = await manager.app.person.findAll();
  //   for (final ent in c) {
  //     print(ent.toMap());
  //   }
  //   print('From Person - Person - findAll: $c');
  // });
}

// testMapper(Manager m) async {
//   var c = await m.app.person.findAll();
//   print('Cross package manager - Person - findAll: $c');
// }
