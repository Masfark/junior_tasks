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

  static List<int> minusExapmle(int range) {
    var random = Random();
    int val1, val2, answer;

    do {
      val1 = random.nextInt(range);
      val2 = random.nextInt(range);
      answer = val1 - val2;
    } while (answer < 0);

    return [val1, val2, answer];
  }
}
