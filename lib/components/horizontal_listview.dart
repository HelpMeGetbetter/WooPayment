import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState(
  );
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Cateogory(
            press: (){showDialog(context: context,
                builder: (_) => AlertDialog(
                  content: Row(children: <Widget>[
                    FlatButton(onPressed: (){},
                        child: Text("Personal Care", style: TextStyle(fontSize: 16.0, color: Colors.black),)),
                    FlatButton(onPressed: (){},
                        child: Text("Under Garments", style: TextStyle(fontSize: 16.0),)),
                  ],),
                ));},
            image_location: 'cats/tshirt.png',
            image_caption: 'Men',
          ),
          Cateogory(
            press: (){showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Cosmetics",
                            style: TextStyle(fontSize: 16.0, ),
                          )),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Lingeries",
                            style: TextStyle(fontSize: 16.0),
                          )),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Personal Care",
                            style: TextStyle(fontSize: 16.0),
                          )),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );},
            //press: (){showDialog(context: context,
           // builder: (_) =>
    // AlertDialog(
              //content: //Row(children: <Widget>[
                //FlatButton(onPressed: (){},
                 //   highlightColor: Colors.black,
                //    child: Text("Cosmetics", style: TextStyle(fontSize: 16.0, color: Color(0xFF9E9B24)),)),
              //  FlatButton(onPressed: (){},
                //    child: Text("Lingeries", style: TextStyle(fontSize: 16.0),)),
               //  Wrap(children: <Widget>[FlatButton(onPressed: (){},
               //    child: Text("Personal Care", style: TextStyle(fontSize: 16.0),),),],)

           //   ],),
             // )
              //  );
   // },

            image_location: 'cats/dress.png',
            image_caption: 'Women',
          ),

          Cateogory(
            press: (){showDialog(context: context,
                builder: (_) => AlertDialog(
                  content: Row(children: <Widget>[
                    FlatButton(onPressed: (){},
                        child: Text("Personal Care", style: TextStyle(fontSize: 16.0, color: Color(0xFF9E9B24)),)),
                    FlatButton(onPressed: (){},
                        child: Text("Under Garments", style: TextStyle(fontSize: 16.0),)),
                  ],),
                ));},
            image_location: 'cats/jeans.png',
            image_caption: 'Pants',
          ),

          Cateogory(
            press: (){showDialog(context: context,
                builder: (_) => AlertDialog(
                  content: Row(children: <Widget>[
                    FlatButton(onPressed: (){},
                        child: Text("Personal Care", style: TextStyle(fontSize: 16.0, color: Color(0xFF9E9B24)),)),
                    FlatButton(onPressed: (){},
                        child: Text("Under Garments", style: TextStyle(fontSize: 16.0),)),
                  ],),
                ));},
            image_location: 'cats/formal.png',
            image_caption: 'Formal',
          ),

      Cateogory(
        press: (){showDialog(context: context,
            builder: (_) => AlertDialog(
              content: Row(children: <Widget>[
                FlatButton(onPressed: (){},
                    child: Text("Personal Care", style: TextStyle(fontSize: 16.0, color: Color(0xFF9E9B24)),)),
                FlatButton(onPressed: (){},
                    child: Text("Under Garments", style: TextStyle(fontSize: 16.0),)),
              ],),
            ));},
        image_location: 'cats/informal.png',
        image_caption: 'Informal',
      ),
        ],
      ),
    );
  }
}

class Cateogory extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final  press;

  Cateogory({
    this.image_location,
    this.image_caption, this.press
});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(onTap: press,
       child: Container(
          width: 100.0,
          child: ListTile(
            onTap: press,
        title: Image.asset(image_location,
        width: 100.0,
        height: 80.0,
        ),
        subtitle: Container(
          alignment: Alignment.topCenter,
          child: Text(image_caption, style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 14,)),
          ),
       ),
      ),
      ),
    );
 }
}

