import 'package:firebase_functions_interop/firebase_functions_interop.dart';

void main() {
  functions['helloWorld'] = functions.https.onRequest(helloWorld);
}

void helloWorld(ExpressHttpRequest request) {

  request.response.writeln('Hello from firebase function');
  request.response.headers.add("Access-Control-Allow-Origin", "*");
  request.response.close();
}