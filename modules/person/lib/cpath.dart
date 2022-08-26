library cpath;

import 'package:cl/utils.dart' as cl_util;

class Path {
  static const String $base = 'pmod';

  static final cl_util.ClientPath person =
  cl_util.ClientPath('${$base}/person/:int');
}
