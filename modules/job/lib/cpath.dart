library cpath;

import 'package:cl/utils.dart' as cl_util;

class Path {
  static const String $base = 'jmod';

  static final cl_util.ClientPath job =
  cl_util.ClientPath('${$base}/job/:int');
}
