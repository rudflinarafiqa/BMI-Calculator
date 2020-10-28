import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
 @override
 _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  
    final TextEditingController _height = TextEditingController();
    final TextEditingController _weight = TextEditingController();

     double a=0, b=0;
     double h=0, w=0, result=0.0, bf=0.0, jf=0.0, hf=0.0, pf=0.0;
     String bmi;
     String radioButtonItem = 'First';
     int _radioValueG = 1;
     int _radioValueA = 1;

     String height = '';
     String weight = '';
 
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Material App',
    home: Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
         title: Text('BMI Calculator (Lean Body Mass)'),
         brightness: Brightness.light,
         backgroundColor: Colors.purple[700],
         
      ),
      

         body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
          
          
          new Padding(
                      padding: new EdgeInsets.all(8.0),
                    ),
                    new Divider(height: 5.0, color: Colors.black),
                    new Padding(
                      padding: new EdgeInsets.all(8.0),
                    ),
                    new Text(
                      'Gender :',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
            Radio(
              value: 1,
              groupValue: _radioValueG,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'First';
                  _radioValueG = 1;
                });
              },
            ),
            Text(
              'Male',
               style: new TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: 2,
              groupValue: _radioValueG,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Second';
                  _radioValueG = 2;
                });
              },
            ),
            Text(
              'Female',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ),
                    new Padding(
                      padding: new EdgeInsets.all(8.0),
                    ),
                    new Divider(height: 5.0, color: Colors.black),
                    new Padding(
                      padding: new EdgeInsets.all(8.0),
                    ),
                    new Text(
                      'Age 14 or younger? :',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _radioValueA,
                          onChanged: (val) {
                           setState(() {
                           radioButtonItem = 'First';
                            _radioValueA = 1;
                            });
                          },
                        ),
                        Text(
              'Yes',
               style: new TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: 2,
              groupValue: _radioValueA,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Second';
                  _radioValueA = 2;
                });
              },
            ),
                       Text(
              'No',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),
                        
                      ],
                    ),
                  
         Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: _height,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Height (cm)',
                  ),
                  onChanged: (text) {
                    setState(() {
                      height = text;
                    });
                  },
                )),
            
 Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: _weight,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Weight (kg)',
                  ),
                  onChanged: (text) {
                    setState(() {
                      weight = text;
                    });
                  },
                )),
            
 Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Padding(
            padding: EdgeInsets.all(5),
            child: RaisedButton(
            child: Text("Calculate", style: new TextStyle(
                        fontWeight: FontWeight.bold),),
            color: Colors.purple[300],
            onPressed: _onPress,
           ),
         ),
         Padding(
            padding: EdgeInsets.all(5),
            child: RaisedButton(
            child: Text("Clear" , style: new TextStyle(
                        fontWeight: FontWeight.bold),),
            color: Colors.purple[300],
            onPressed: _clear,
           ),
         ),
          ],
       ),
 Text("BMI: $bmi"),
 
  Container(
        color: Colors.white,
        padding: EdgeInsets.all(30),
        
        child: Table(
          border: TableBorder.all(color: Colors.purple),
          children: [
            TableRow(children: [
              Text('FORMULA' , style: new TextStyle(
                        fontWeight: FontWeight.bold),),
              Text('LEAN BODY MASS' , style: new TextStyle(
                        fontWeight: FontWeight.bold),),
            ]),
            
            TableRow(children: [
              Text('Boer1' , style: new TextStyle(
                        fontWeight: FontWeight.bold),),
              Text('$bf kg'),
            ]),

            TableRow(children: [
              Text('James2' , style: new TextStyle(
                        fontWeight: FontWeight.bold),),
              Text('$jf kg'),
            ]),

            TableRow(children: [
              Text('Hume3' , style: new TextStyle(
                        fontWeight: FontWeight.bold),),
              Text('$hf kg'),
            ]),

            TableRow(children: [
              Text('Peter Formula' , style: new TextStyle(
                        fontWeight: FontWeight.bold),),
              Text('$pf kg'),
            ])
            
          ],
        ),
      )
 ],
 ),
 ),
 );
 }

 void _onPress() {
    setState(() { 
      
      if (_radioValueG == 1 && _radioValueA == 2) {
        h = double.parse(_height.text);
        w = double.parse(_weight.text);

        bf = (0.407 * w) + (0.267 * h) - 19.2;
        jf = (1.1 * w) - (128 * (w / h * w / h));
        hf = (0.32810 * w) + (0.33929 * h) - 29.5336;
        pf = 0.00;
      } else {
        if (_radioValueG == 2 && _radioValueA == 2) {
          h = double.parse(_height.text);
          w = double.parse(_weight.text);

          bf = (0.252 * w) + (0.473 * h) - 48.3;
          jf = (1.07 * w) - (148 * (w / h * w / h));
          hf = (0.29569 * w) + (0.41813 * h) - 43.2933;
          pf = 0.00;
        } else {
          if (_radioValueG == 1 || _radioValueG == 2 && _radioValueA == 1) {
            h = double.parse(_height.text);
            w = double.parse(_weight.text);
            double x = pow(w, 0.6469);
            double y = pow(h, 0.7236);
            double ecv = 0.0215 * x * y;
            bf = 0.0;
            jf = 0.0;
            hf = 0.0;
            pf = 3.8 * ecv;
          }
        }
      }

     a = double.parse(_height.text);
     b = double.parse(_weight.text);

     result = (b * b) / a;
     bmi = format(result);

     
  }
);
}


void _clear(){
  _height.clear();
  _weight.clear();
}

 String format(double n) {
 return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
 }
 
}