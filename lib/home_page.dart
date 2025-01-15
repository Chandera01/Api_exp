import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as myClient;

class Homepage extends StatefulWidget{

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Map<String,dynamic> mQuotes = {};
  // https://dummyjson.com/quotes

  @override
  void initState() {
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Home"),
    ),
      body: mQuotes["quotes"]!=null? ListView.builder(
          itemCount: mQuotes["quotes"].length,
          itemBuilder: (_,index){
        return ListTile(
          title: Text(mQuotes["quotes"][index]["quote"]),
          subtitle: Text(mQuotes["quotes"][index]["author"]),
        );
      }):Container(),
    );
  }

  void getQuotes()async{
    String url = "https://dummyjson.com/quotes";

    myClient.Response res = await myClient.get(Uri.parse(url));

    if(res.statusCode==200){
      print(res.body);
      mQuotes = jsonDecode(res.body);
      setState(() {

      });
      print(mQuotes["quotes"][1]["quote"]);
    }


    // print(res.body);
  }
}