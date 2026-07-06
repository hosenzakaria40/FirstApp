class Calculate {
  double num1;
  double num2;
  String operation;

  Calculate({
    required this.num1,
    required this.num2,
    required this.operation,
  });

  double calculate() {
    switch (operation) {
      case '+':
        return num1 + num2;

      case '-':
        return num1 - num2;

      case '*':
        return num1 * num2;

      case '/':
        if (num2 == 0) {
          throw Exception("Cannot divide by zero");
        }
        return num1 / num2;

      default:
        throw Exception("Invalid Operation");
    }
  }
}