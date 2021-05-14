import 'dart:math';

class MathExample {
  static List<int> plusExapmle(int range) {
    var random = Random();
    int val1, val2, answer;

    val1 = random.nextInt(range);
    val2 = random.nextInt(range);

    answer = val1 + val2;

    return [val1, val2, answer];
  }
}
