import "dart:math";

final Random random = new Random();

bool flipCoin() {
  return random.nextBool();
}

String coinSide(bool value) => value ? "Heads" : "Tails";

void main() {
  print(coinSide(flipCoin()));
  print(coinSide(flipCoin()));
  print(coinSide(flipCoin()));
  print(coinSide(flipCoin()));
}