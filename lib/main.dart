import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:flutterdemo0/component/Image_task.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
    //  home:ImageTask(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    //变量
    var userName = 'Jack';
    userName = 'Rose';
    print(userName);

//    var height; //如果变量没有赋值，则默认是null
//    print(height);

//    var height = 12;
//    height = 'Jack';

    //如果变量的类型是不定的
    Object info = 'Lucy';
    info = 12;

    dynamic information = '张三';
    information = 20;

    int age = 20;
    String name = 'Rose';

    //常量
    final userSex = 'male';
//    userSex = 'female';
    const PI = 3.14;

    //函数的使用
    var infomation = getUserInfomation1(12, 'Rose');
    print(infomation);

    infomation = getUserInfomation2(12, 'Rose', 180);
    print(infomation);

    infomation = getUserInfomation3(12, 'Rose');
    print(infomation);

    // classFunction();

     httpFunction1();

    // httpFunction2();
  }

  String getUserInfomation1(int age, String name) {
    return 'getUserInfomation~age:$age name:$name';
  }

  //带可选参数height
  String getUserInfomation2(int age, String name, [int height]) {
    if(height == null) {
      return 'getUserInfomation~age:$age name:$name';
    }else {
      return 'getUserInfomation~age:$age name:$name height:$height';
    }

  }

  //带可选参数height,有默认值
  String getUserInfomation3(int age, String name, [int height = 170]) {
    return 'getUserInfomation~age:$age name:$name height:$height';
  }
  //网络加载  https://randomuser.me/api/?results=30
  httpFunction1() {
    var url = 'https://randomuser.me/api/?results=30';
    http.get(url).then( (response) {
      print(response);
    });
  }

  httpFunction2() async{
    var url = 'https://randomuser.me/api/?results=30';
    var httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    var jsonString = await response.transform(utf8.decoder).join();
    var json = jsonDecode(jsonString);
    print(json);

    httpClient.close();

  }
  classFunction() {
//    var person = Person('Jack', 180);
//    person.run();
//
////    var rectangle = Rectangle(12, 20, 10, 30);
//    var rectangle = Rectangle(width: 12, left:10, top: 30, height: 20);
//    print(rectangle.right);
//
    var stu = Student('liLei', 165, 1001);
    stu.run();

    var worker = Worker('张三', 189, 80);
    worker.run();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//创建类
class Person {
  //类成员
  String userName;
  int height;

//  final String sex = 'male';
//  final String sex;
  //构造方法
//  Person(this.userName, this.height, this.sex);

  Person(this.userName, this.height);
  //方法
  void run() {
    print('${this.userName} run');
  }

}

class Rectangle {
  num width;
  num height;
  num left;
  num top;

  //构造方法
//  Rectangle(this.width, this.height, this.left, this.top);
  Rectangle({this.width, this.height, this.left, this.top});

  num get right => left+width;
  set right(num value) => left = value - width;
}

class Student extends Person {
  int studyID;

  Student(String userName, int height, this.studyID): super(userName, height);

  @override
  void run() {
    print('Student ${this.userName} run');
  }
}

//抽象类
abstract class Animal {
  sleep();
  eat();
}

class Worker extends Person with Animal {
  int weight;
  Worker(String userName, int height, this.weight): super(userName, height);

  @override
  void run() {
    print('Worker Run');
    super.run();
  }

  @override
  sleep() {
    print('Worker sleep');
  }

  @override
  eat() {
    print('Worker eat');
  }
}


