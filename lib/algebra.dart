import 'dart:math';

class DelimetersCalculator {
  int nod(int a, int b) {
    if (a % b == 0) { return b; }
    if (b % a == 0) { return a; }
    if (a > b) { return nod(a % b, b); }
    return nod(a, b % a);
  }

  int nok(int a, int b) { return (a * b) ~/ nod(a, b); }
}

class BinaryCalculator {
  String decimalToBinary(int d) { return d.toRadixString(2); }
  int binaryToDecimal(String s) { return int.parse(s, radix: 2); }
}

class StringCalculator {
  List<double?> stringToNumArray(String s) {
    var list = s.split(" ").map((e) => double.tryParse(e)).toList();
    list.removeWhere((element) => element == null);

    return list;
  }

  Map<String, int> stringToMap(String s) {
    var map = { for (var item in s.split(" ")) item : item.allMatches(s).length };
    return map;
  }

  Set<int?> stringToDigit(String s, String sep) {
    var digits = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
    var set = s.split(sep).map((e) => digits.contains(e) ? digits.indexOf(e) : int.tryParse(e)).toSet();
    set.removeWhere((element) => element == null || element < 0 || element >= 10);
    return set;
  }
}

class Point {
  final double x;
  final double y;
  final double z;
  Point(this.x, this.y, this.z);

  double distanceTo(Point another) {
    double x1 = x - another.x;
    double y1 = y - another.y;
    double z1 = z - another.z;
    return sqrt(x1 * x1 + y1 * y1 + z1 * z1);
  }

  factory Point.begin() {
    return Point(0, 0, 0);
  }

  double areaOfATriangle(Point p2, Point p3) {
    var a = distanceTo(p2);
    var b = distanceTo(p3);
    var c = p2.distanceTo(p3);
    if (a + b <= c || a + c <= b || a + c <= b) { return 0.0; } else {
      double p = (a + b + c) / 2.0;
      double square = sqrt(p * (p - a) * (p - b) * (p - c));
      return square;
    }
  }
}