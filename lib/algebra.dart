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

extension Pow on num {
  num pow(num other) {
    double number = toDouble();
    int root = other.toInt();

    double eps = 0.00001;
    double x = number;
    double pw;
    double xprev = 0;

    try {
      while ((xprev - x).abs() > eps) {
        xprev = x; pw = 1;
        for (int i = 0; i < root - 1; i++) { pw /= xprev; }
        x = xprev * (root - 1) / root + number * pw / root;
      }
    } on Exception catch(e) {
      print('Error: ${e.toString()}');
    }
    return x;
  }
}

class RiemannIntegral {
  num integral(double Function(double) function, num x1, num x2, num n) {
    double sum = 0;
    try {
      double width = (x2 - x1) / n;
      for (int i = 1; i <= n; i++) {
        double x = x1 + width * i;
        double y = function(x).abs();
        double area = y * width;
        sum += area;
      }
    } on Exception catch(e) {
      print('Error: ${e.toString()}');
    }
    return sum;
  }
}

class User {
  String email = "";
  User(this.email);
}

mixin SystemUser {
  String getMailSystem(String email) {
    return email.contains("@") ? email.substring(email.indexOf("@") + 1, email.length) : "";
  }
}

class AdminUser extends User with SystemUser {
  AdminUser(super.email);
  String getMail() => getMailSystem(email);
}

class GeneralUser extends User with SystemUser {
  GeneralUser(super.email);
}

class UserManager<T extends User> {
  final _userList = [];

  void addUser(User user) {
    _userList.add(user);
  }

  void removeUser(User user) {
    _userList.remove(user);
  }

  String showUsers() {
    var result = "";
    for (User user in _userList) {
      result += "${((user is AdminUser) ? user.getMail() : user.email)}\n";
    }
    return result;
  }

}