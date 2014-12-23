import "dart:io";

class InvertedIndex {
  final Map<String, Map<String, int>> index = {}; 
  final Map<String, String> contents = {};
  
  void loadDocument(String name, String content) {
    contents[name] = content;
    index[name] = {};
    var allWords = content.replaceAll("\n", "").split(" ").map((word) => word.trim()).toList();
    allWords.removeWhere((it) => it.trim().isEmpty);
    var uniques = allWords.toSet();
    
    for (var word in uniques) {
      index[name][word] = allWords.where((it) => it == word).length;
    }
  }
  
  int occurrences(String word, {String document}) {
    if (document != null) {
      var docIndex = index[document];
      return docIndex.containsKey(word) ? docIndex[word] : 0;
    } else {
      var count = 0;
      for (var doc in contents.keys) {
        var m = index[doc];
        if (m.containsKey(word)) {
          count += m[word];
        }
      }
      return count;
    }
  }
  
  List<String> containing(String word) {
    return index.keys.where((doc) {
      return index[doc].containsKey(word);
    }).toList();
  }
  
  List<int> findLocations(String document, String word) {
    var content = contents[document];
    var indexes = [];
    var lastIndex = 0;
    while (true) {
      var index = content.indexOf(word, lastIndex + word.length);
      if (index == -1) {
        break;
      }
      indexes.add(index);
      lastIndex = index;
    }
    return indexes;
  }
  
  void dump() {
    for (var doc in index.keys) {
      print("${doc}:");
      for (var word in index[doc].keys) {
        print("  ${word}: ${index[doc][word]}");
      }
    }
  }
}

void main() {
  var index = new InvertedIndex();
  
  var file = new File("data_structures/RandJ.txt");
  
  index.loadDocument("Romeo and Juliet", file.readAsStringSync());
  
  var word = "hell";
  print("Searching for '${word}'");
  var locations = index.findLocations("Romeo and Juliet", word);
  print(locations);
}