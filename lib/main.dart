import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/pages/cart_page.dart';
import 'package:flutter_auth/pages/home_page.dart';
import 'package:flutter_auth/pages/product_details.dart';
import 'package:flutter_auth/src/Widgets/size_config.dart';
import 'package:flutter_auth/src/Widgets/sizee_configg.dart';
import 'package:flutter_auth/to_test/cart_screen.dart';
import 'package:provider/provider.dart';

import 'Model/cart_model.dart';
import 'Model/products.dart';


void main(){
  runApp(
      MyApp());
}




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>.value(value:Products()),
        ChangeNotifierProvider<CartModels>.value(value:CartModels()),
       // ChangeNotifierProvider<Product>.value(value:Product()),
       // ChangeNotifierProvider<CartModel>.value(value:CartModel()),
      ],
      child: new MaterialApp(
        builder: (context, child) {
          initSizeConfig(context);
          return child;
        },
          home: new HomePage(),

        routes: {
        ProductDetails.routeName: (ctx) => ProductDetails(),
        CartScreen.routeName: (ctx) => CartScreen(),
      },),
    );
  }
}
