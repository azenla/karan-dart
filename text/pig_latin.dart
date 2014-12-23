String toPigLatin(String input) {
  var words = input.split(" ");
  return words.map((word) {
    var consonant = firstConsonant(word);
    return word.replaceFirst(consonant, "") + consonant + "ay";
  }).toList().join(" ").toLowerCase();
}

String firstConsonant(String word) => new List.generate(word.length, (i) {
  return word[i];
}, growable: true).firstWhere((String it) => !VOWELS.contains(it.toLowerCase()), orElse: () => null);

const List<String> VOWELS = const ["a", "e", "i", "o", "u"];

void main() {
  print(toPigLatin("Logan loves to program in C Sharp"));
}