import 'package:cl_base/server.dart' as base;
import 'src/ctrl.dart';
import 'src/mapper.dart';
export 'src/mapper.dart';

/// Bootstrap function - server part
Future<void> init() async {
  // Register Job's routes to the application
  base.routes.add(routesJob);

  // List for job insert
  entityJob.onCreate.listen((cont) {
    print('Job created: ${cont.entity.title}');
  });
}
