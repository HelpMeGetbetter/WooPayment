import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/cart_model.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:flutter_auth/Widgets/navi/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter_auth/Widgets/navi/sidebar/sidebar.dart';
import 'package:flutter_auth/Widgets/navi/sidebar/sidebar_layout.dart';
import 'package:flutter_auth/components/BestSellingProds.dart';
import 'package:flutter_auth/components/horizontal_listview.dart';
import 'package:flutter_auth/components/product_item.dart';
import 'package:flutter_auth/components/recommended_products.dart';
import 'package:flutter_auth/login_Signup/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/to_test/body.dart';
import 'package:flutter_auth/to_test/cart_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomePage extends StatelessWidget with NavigationStates {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 300.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 500),
        indicatorBgPadding: 6.0,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: Text('Home',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 22.0,
                fontWeight: FontWeight.bold)),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new CartScreen()));
              })
        ],
      ),
      drawer: new Drawer(
         child: new ListView(
                children: <Widget>[
//            header
                  new UserAccountsDrawerHeader(accountName: Text('test123'), accountEmail: Text('testing123@gmail.com'),
                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(EvilIcons.user, color: Colors.white, size: 40.0 ,),
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Colors.grey
                    ),
                  ),

//          body

                  InkWell(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );},
                    child: ListTile(
                      title: Text('Logout',
                        style: TextStyle(fontFamily: 'Raleway',fontSize: 18.0, fontWeight: FontWeight.bold),),
                      leading: Icon(EvilIcons.arrow_left, color: Colors.grey, size: 35.0,),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('MyCart',
                        style: TextStyle(fontFamily: 'Raleway',fontSize: 18.0, fontWeight: FontWeight.bold),),
                      leading: Icon(EvilIcons.cart, color: Colors.grey, size: 35.0,),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> new CartPage()));
                    },
                    child: ListTile(
                      title: Text('Favourites',
                        style: TextStyle(fontFamily: 'Raleway',fontSize: 18.0, fontWeight: FontWeight.bold),),
                      leading: Icon(EvilIcons.star, color: Colors.grey, size: 35.0,),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title:Text('Checkout',
                        style: TextStyle(fontFamily: 'Raleway',fontSize: 18.0, fontWeight: FontWeight.bold),),
                      leading: Icon(EvilIcons.credit_card, color: Colors.grey, size: 35.0,),
                    ),
                  ),

                  Divider(),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                        title: Text('Help & Support',
                          style: TextStyle(fontFamily: 'Raleway',fontSize: 18.0, fontWeight: FontWeight.bold),),
                      leading: Icon(EvilIcons.exclamation, color: Colors.grey, size: 35.0,),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('About',
                        style: TextStyle(fontFamily: 'Raleway',fontSize: 18.0, fontWeight: FontWeight.bold),),
                      leading: Icon(EvilIcons.question, color: Colors.grey, size: 35.0,),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title:Text('Settings',
                        style: TextStyle(fontFamily: 'Raleway',fontSize: 18.0, fontWeight: FontWeight.bold),),
                      leading: Icon(EvilIcons.gear, color: Colors.grey, size: 35.0,),
                    ),
                  )

                ],
             ),

      ),
      body: new ListView(
        children: <Widget>[
          //image carousel begins here
          imageCarousel,
          //Padding widget
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'Categories',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Horizontal list view begins here
          HorizontalList(),
          //Padding widget
          new Padding(
            padding: const EdgeInsets.all(17.0),
            child: new Text(
              'Recent products',
              style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 25,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),

//grid view
          Container(
            height: 285.0,
            child: ProductsPage(),
          ),
          SizedBox(
            height: 2.0,
          ),
          Container(
            height: 50.0,
            child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(EvilIcons.star , size: 30,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Recommended For You",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ]),
          ),
          Container(
            height: 320,
            child: RecommendedProducts(),
          ),
          Container(
            height: 50.0,
            child: Column(

              children: [
                Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(EvilIcons.tag , size: 30,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Our Best Sellers",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ]
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            child: BestSellingProducts(),
          )
        ],
      ),
    );
  }
}
