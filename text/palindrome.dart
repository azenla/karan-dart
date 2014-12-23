bool isPalindrome(String input) => new String.fromCharCodes(input.codeUnits.reversed) == input;

void main(List<String> args) {
  if (args.isEmpty) {
    print("usage: palindrome <word>");
    return;
  }
  
  if (isPalindrome(args[0])) {
    print("${args[0]} is a palindrome");
  } else {
    print("${args[0]} is not a palindrome");
  }
}