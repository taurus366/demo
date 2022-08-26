void main() {
  int a = 5;
  int b = 10;
  ///Subtitution
  print('A+B:${a+b} A*B:${a*b}');

  ///IF
  if (a < b) print('A<B');
   else print('A>B');

  ///SWITCH
  switch(a) {
    case 1: print('A=1');
     break;
    case 2: print('A=2');
     break;
    //.... (РАЗБИРА СЕ ТОТАЛНО НЕЕФЕКТИВНО)
  }

  ///WHILE CYCLE
  int i = 0;
  while (i < 10) {
    print('I=$i');
    i++;
  }

  ///DO -> WHILE CYCLE
  i = 0;
  do {
    print('I=$i');
    i++;
  } while (i < 10);

  ///FOR CYCLE
  for (int i = 0; i < 10; i++) {
    print('I=$i');
  }

  ///FOR -> IN CYCLE
  for (final c in [10, 20, 30, 40, 50]) {
    print('C=$c');
  }


}
