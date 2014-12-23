import "dart:io";

void main(List<String> args) {
  if (args.isEmpty) {
    print("usage: count_words <file>");
    return;
  }
  
  var file = new File(args[0]);
  if (!file.existsSync()) {
    print("ERROR: file does not exist.");
    return;
  }
  
  var contents = file.readAsStringSync();

  print("Total Words: ${contents.split(" ").length}");
}