import 'package:flutter/material.dart';
import 'package:my_expense/model/Transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transaction = [
    Transaction(
        id: 'aa',
        title: 'books',
        amount:200,
        dateTime: DateTime.now()


    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expence'),
      ),
      body: ListView.builder(
        itemCount: transaction.length,
          itemBuilder: (BuildContext context,int index){
            //return Text(transaction[index].toString());
            return Column(
                children: [
                Text("${transaction[index].id}"),
            Text("${transaction[index].title}"),
            Text("${transaction[index].amount}"),
            Text("${transaction[index].dateTime}"),
                ],
            );
          }
      ),
    );
  }
}

