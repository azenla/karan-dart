import "dart:async";
import "dart:io";

void main(List<String> args) {
  if (args.length != 3) {
    print("usage: port_scanner <host> <lower port bound> <upper port bound>");
    return;
  }
  
  var host = args[0];
  var lowerBound = int.parse(args[1]);
  var upperBound = int.parse(args[2]);
  var open = [];
  var future = new Future.value();
  
  for (var port in range(lowerBound, upperBound)) {
    future = future.then((_) {
      return Socket.connect(host, port);
    }).then((socket) {
      open.add(port);
      return socket.close();
    }).catchError((e) {
      if (e.toString().contains("Connection refused,")) {
        return;
      } else {
        print("port(${port}): " + e.toString());
      }
    });
  }
  
  future.then((_) {
    print("${open.length} ports are open.");
    for (var port in open) {
      print("${port} is open");
    }
    exit(0);
  });
}

List<int> range(int start, int end) {
  var range = [];
  var minus = false;
  if (end < start) {
    minus = true;
  }
  for (int i = start; minus ? i >= end : i <= end; minus ? i-- : i++) {
    range.add(i);
  }
  return range;
}