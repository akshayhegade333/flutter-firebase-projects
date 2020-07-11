import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<http.Response> _response;
  var responseBody;
  Future<String> fetchStringFromServer() async {
      final _response = await http.get('https://us-central1-myflutterapp-238c8.cloudfunctions.net/helloWorld');


      this.setState(() {
        responseBody = _response.body;
        print(responseBody);
      });
      return "Success";


//      if (_response.statusCode == 200) {
//        // If the server did return a 200 OK response,
//        // then parse the JSON.
//        responseBody = _response.body;
//        print(responseBody);
//        return responseBody;
//      } else {
//        // If the server did not return a 200 OK response,
//        // then throw an exception.
//        throw Exception('Failed to get greet string');
//      }
    }


  void initState() {
    super.initState();
    fetchStringFromServer();
  }

  Widget getData() {
    if (responseBody == null || responseBody == "") {
      return CircularProgressIndicator();
//      return Text(
//          'Loading please wait...',
//          style: Theme
//              .of(context)
//              .textTheme
//              .headline4
//      );
    }


    return Text(
        responseBody,
        style: Theme
            .of(context)
            .textTheme
            .headline4
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: getData()


      ),
    );
  }
}
