import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  //TextField
  String? onSubmited;
  String? onChanged;
  bool obscureText = true;
  TextEditingController textController = TextEditingController();

  //Checkbox
  Map <String, bool> listeCourse = {
    "Carottes" : false,
    "Bananes" : false,
    "Yaourt" : false,
    "Pain" : false,
  };

  //RadioBox
  Transport choixRadio = Transport.Avion;

  @override
  void initState() {
    textController.addListener(afficherValeurChamp);
    super.initState();
  }


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
            textInputAction: TextInputAction.next,
          ),
          Divider(),
          Text("onChanged = ${onChanged}"),
          Text("onSubmited = ${onSubmited}"),
          Row(
            children: [
              Expanded(
                  child: TextField(obscureText: obscureText,),
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: (obscureText == true) ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
              ),
            ],
          ),
          TextField(
            controller: textController,
          ),
          Container(
            child: Column(
              children: afficheListeCourse(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Radio(
                    value: Transport.Voiture,
                    onChanged: (Transport? value){
                      setState(() {
                        choixRadio = value!;
                      });
                    },
                    groupValue: choixRadio,
                  ),
                  Text("Voiture"),
                ],
              ),
              Column(
                children: [
                  Radio(
                    value: Transport.Avion,
                    onChanged: (Transport? value){
                      setState(() {
                        choixRadio = value!;
                      });
                    },
                    groupValue: choixRadio,
                  ),
                  Text("Avion"),
                ],
              ),
              Column(
                children: [
                  Radio(
                    value: Transport.Bateau,
                    onChanged: (Transport? value){
                      setState(() {
                        choixRadio = value!;
                      });
                    },
                    groupValue: choixRadio,
                  ),
                  Text("Bateau"),
                ],
              ),

            ],
          )
        ],
      ),
    );
  }

  void afficherValeurChamp(){
    setState(() {
      onChanged = textController.text;
    });
  }

  List<Widget> afficheListeCourse(){
    List<Widget> l = [];

    listeCourse.forEach((String ingredient, bool possede) {
      Row row = Row(
        children: [
          Text(ingredient,
          style: TextStyle(decoration: (possede) ? TextDecoration.lineThrough : null),
          ),
          Checkbox(
              value: possede,
              onChanged: (bool? b){
                setState(() {
                  listeCourse[ingredient] = b!;
                  print(listeCourse);
                });
              }
          )
        ],
      );

      l.add(row);
    });

    return l;
  }

}


enum Transport {
  Voiture,
  Avion,
  Bateau,
}
