enum KeyType {
  digit,
  operator,
  helper,
}

class CalculatorKeys {
  static Map<String, KeyType> keys = {
    "AC": KeyType.helper,
    "C": KeyType.helper,
    "%": KeyType.operator,
    "÷": KeyType.operator,
    "7": KeyType.digit,
    "8": KeyType.digit,
    "9": KeyType.digit,
    "x": KeyType.operator,
    "4": KeyType.digit,
    "5": KeyType.digit,
    "6": KeyType.digit,
    "-": KeyType.operator,
    "1": KeyType.digit,
    "2": KeyType.digit,
    "3": KeyType.digit,
    "+": KeyType.operator,
    "0": KeyType.digit,
    ".": KeyType.digit,
    "=": KeyType.operator,
  };
}
