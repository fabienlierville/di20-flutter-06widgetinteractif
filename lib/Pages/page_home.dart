import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetsinteractifs/Utils/global_vars.dart';

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

  //Switch
  bool jour = false;

  //Slider
  double kilometres = 0;

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
                  Text("Voiture", textScaleFactor: (choixRadio == Transport.Voiture) ? 1.5 : 1,),
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
                  Text("Avion", textScaleFactor: (choixRadio == Transport.Avion) ? 1.5 : 1,),
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
                  Text("Bateau", textScaleFactor: (choixRadio == Transport.Bateau) ? 1.5 : 1,),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Switch(
                  value: jour,
                  onChanged: (bool b){
                    setState(() {
                      kilometres +=10;
                      jour = b;
                    });
                  },
                inactiveTrackColor: Colors.red,
                activeColor: Colors.green,
              ),
              Text((jour)?"Jour":"Nuit"),
              CupertinoSwitch(
                value: jour,
                onChanged: (bool b){
                  setState(() {
                    jour = b;
                  });
                },
              ),
            ],
          ),
          Slider(
              value: kilometres,
              onChanged: (double value){
                setState(() {
                  kilometres = value;
                });
              },
            min: 0,
            max: 150,
            divisions: 15,
            inactiveColor: Colors.black87,
            activeColor: Colors.pink,
            label: "${kilometres}",

          ),
          Text("Slider = ${kilometres}")
        ],
      ),
    );
  }

  void afficherValeurChamp(){
    Global.prenom = textController.text;
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


