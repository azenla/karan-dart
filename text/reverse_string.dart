void main(List<String> args) {
  if (args.isEmpty) {
    print("usage: reverse_string <input>");
    return;
  }
  
  var input = args.join(" ");
  
  print(new String.fromCharCodes(input.codeUnits.reversed));
}