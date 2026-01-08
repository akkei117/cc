class CurrencyConverter {
  // Base currency: USD

  static const Map<String, double> toDollarRate = {
    "INR": 0.012,
    "USD": 1.0,
    "RUB": 0.011,
    "CNY": 0.14,
  };

  static const Map<String, double> fromDollarRate = {
    "INR": 83.0,
    "USD": 1.0,
    "RUB": 90.0,
    "CNY": 7.2,
  };

  static double convert({
    required String from,
    required String to,
    required double amount,
  }) {
    if (!toDollarRate.containsKey(from) ||
        !fromDollarRate.containsKey(to)) {
      throw Exception("Unsupported currency");
    }

    final double inDollar = amount * toDollarRate[from]!;
    final double result = inDollar * fromDollarRate[to]!;

    return result;
  }
}
