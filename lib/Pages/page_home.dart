import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  String? onSubmited;
  String? onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets Interactifs"),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType:TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Entrez votre mail",
              hintText: "test@test.com"
            ),
            onChanged: (String value){
              setState(() {
                onChanged = value;
              });
            },
            onSubmitted: (String value){
              setState(() {
                onSubmited = value;
              });
            },
          ),
          Divider(),
          Text("onChanged = ${onChanged}"),
          Text("onSubmited = ${onSubmited}"),
        ],
      ),
    );
  }
}
