import 'dart:io';
import 'dart:math';

void main() {
  compareFunc();
}

binarySearch() {
  int min = 1;
  int max = 100;
  int mid = (min + max) ~/ 2;

  String userAnsver = '';
  int counter = 0;

  while (userAnsver != 'yes') {
    print('Ваше число $mid ? ');
    userAnsver = stdin.readLineSync()!;
    counter++;

    if (userAnsver == '+') {
      min = mid;
      mid = (min + max) ~/ 2;
    } else if (userAnsver == '-') {
      max = mid;
      mid = (min + max) ~/ 2;
    }
  }

  print('Компьютер угадал ваше число');
  print('Количетсво шагов = $counter');
}

randomSearch() {
  int min = 1;
  int max = 100;
  int mid = min + Random().nextInt(max - min);

  String userAnsver = '';
  int counter = 0;

  while (userAnsver != 'yes') {
    print('Ваше число $mid ? ');
    userAnsver = stdin.readLineSync()!;
    counter++;

    if (userAnsver == '+') {
      min = mid;
      mid = min + Random().nextInt(max - min);
    } else if (userAnsver == '-') {
      max = mid;
      mid = min + Random().nextInt(max - min);
    }
  }

  print('Компьютер угадал ваше число');
  print('Количетсво шагов = $counter');
}

int randomCompSearch(int randomNum) {
  int min = 1;
  int max = 100;
  int mid = min + Random().nextInt(max - min);

  // int randomNum = min + Random().nextInt(max - min);

  int counter = 1;

  // print('test test $randomNum');

  while (mid != randomNum) {
    counter++;

    if (mid < randomNum) {
      min = mid;
      mid = min + Random().nextInt(max - min);
    } else if (mid > randomNum) {
      max = mid;
      mid = min + Random().nextInt(max - min);
    }
  }

  // print('Компьютер угадал ваше число. $randomNum');
  // print('Количетсво шагов = $counter');
  return counter;
}

int binaryCompSearch(int randomNum) {
  int min = 1;
  int max = 100;
  int mid = (min + max) ~/ 2;

  // int randomNum = min + Random().nextInt(max - min);

  int counter = 1;

  // print('test test $randomNum');

  while (mid != randomNum) {
    // print('Ваше число $mid ? ');

    counter++;

    if (mid < randomNum) {
      // print('+');
      min = mid;
      mid = (min + max) ~/ 2;
      ;
    } else if (mid > randomNum) {
      // print('-');
      max = mid;
      mid = (min + max) ~/ 2;
    }
  }

  // print('Компьютер угадал ваше число. $randomNum');
  // print('Количетсво шагов = $counter');
  return counter;
}

compareFunc() {
  List<int> numbersList = [];

  int min = 1;
  int max = 100;

  for (int i = 0; i < 1; i++) {
    numbersList.add(min + Random().nextInt(max - min));
  }

  print(numbersList);

  int randomTotal = 0;
  int binaryTotal = 0;

  for (int i = 0; i < numbersList.length; i++) {
    binaryTotal += binaryCompSearch(numbersList[i]);
    randomTotal += randomCompSearch(numbersList[i]);
  }

  print(binaryTotal);
  print(randomTotal);

  double binaryAverage = binaryTotal / numbersList.length;
  double randomAverage = randomTotal / numbersList.length;

  print(binaryAverage);
  print(randomAverage);

  if (binaryAverage < randomAverage) {
    print("бинанрный пизже");
  } else if (randomAverage < binaryAverage) {
    print('Рандомный пизже');
  } else {
    print('Они равны');
  }
}
