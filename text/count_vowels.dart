import "dart:io";

const List<String> VOWELS = const ["a", "e", "i", "o", "u"];

void main(List<String> args) {
  if (args.isEmpty) {
    print("usage: count_vowels <file>");
    return;
  }
  
  var file = new File(args[0]);
  if (!file.existsSync()) {
    print("ERROR: file does not exist.");
    return;
  }
  
  var contents = file.readAsStringSync();
  var chars = new List<String>.generate(contents.length, (i) => contents[i]);
  
  var vowels = chars.where((it) => VOWELS.contains(it.toLowerCase())).length;
  var counts = VOWELS.map((vowel) => [vowel, chars.where((it) => it.toLowerCase() == vowel).length]);
  print("Total Vowels: ${vowels}");
  counts.forEach((it) => print("${it[0]}: ${it[1]}"));
}