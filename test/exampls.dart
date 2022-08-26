import 'dart:async';

Future<int> calc(int i, {bool sync = true }) =>
    Future.delayed(Duration(seconds: sync ? 1: i)).then((_) => i+1);

Future<void> main() async {

  // for (int i = 0; i < 10; i++) print('R=${await calc(i, sync:  false)}');

  // for (int i = 0; i < 10; i++) {
  //   calc(i, sync: false).then((r) => print('R=$r'));
  //   print('I=$i');
  // }

  //
  // final l = [
  //   Future.delayed(const Duration(seconds: 1)),
  //   Future.delayed(const Duration(seconds: 3))
  // ];
  // await Future.wait(l);
  //
  // int a = 5;
  // String b = '123';
  // print('$b gefgsdfgsd $a gsdfgsd.');
  // print((int.tryParse(b) ?? 0) + a);
  //
  // int? c = int.tryParse(b);
  // c ??= 0;
  //
  // var z = {
  //   'asdas': [1,2,3],
  //   'dsadas': [4,5,6]
  // };
  // z['adsdsa']?.add(5);

}
