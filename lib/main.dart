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

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  _addTransaction(String title,double amount)
  {
      print(title);
      print(amount);
      var newTr = Transaction(
          id: '1',
          title: title,
          amount: amount,
          dateTime: DateTime.now(),
      );
      setState(() {
        transaction.add(newTr);
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expence'),
      ),
      body: Column(

        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                TextField(
                  controller:titleController,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                TextField(
                  controller:amountController,
                  decoration: InputDecoration(hintText: "Amount"),
                ),
                ElevatedButton(onPressed: (){
                  print(titleController.text);
                  print(amountController.text);

                  _addTransaction(titleController.text,double.parse(amountController.text));

                }, child: Text('Submit')
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transaction.length,
                itemBuilder: (BuildContext context,int index){
                  //return Text(transaction[index].toString());
                  //
                  return ListTile(
                    leading: Text('${transaction[index].id}'),
                    title: Text('${transaction[index].title}'),
                    subtitle: Text('${transaction[index].dateTime}'),
                    trailing: Text('${transaction[index].amount}'),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}

