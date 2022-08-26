import 'dart:io';
import 'package:intl/intl.dart';

void main() {
  print('A=');
  final as = stdin.readLineSync() ?? '';
  print('A=$as');

  ///Parse string to integer
  final a = int.tryParse(as);
  if (a != null) print ('A*2 = ${a*2}');

  ///Date format
  final now = DateTime.now();
  print ('NOW IS:${DateFormat('hh:mm:ss dd.MM.yyyy').format(now)}г.');

  ///Standard datetime format YYYY-MM-DD HH:MM:SS
  final now2 = DateTime.parse(now.toString());
  print('$now2');

  ///Parsed from custom format
  final date = DateFormat('hh:mm:ss dd.MM.yyyy').parse('12:25:12 12.04.2022');
  print('PARSED:$date');

  ///Other parsings
  // num.tryParse(xxxx);
  // double.tryParse(xxxxxx);
}
