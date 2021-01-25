
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/cart_model.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:flutter_auth/src/Widgets/size_config.dart';
import 'package:flutter_auth/src/Widgets/sizee_configg.dart';
import 'package:provider/provider.dart';

class CartProducts extends StatefulWidget {
  final sum;
  const CartProducts({Key key,  this.sum}) : super(key: key);
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  Widget build(BuildContext context) {

    final cartModels = Provider.of<CartModels>(context);
    final productList=cartModels.items;
    if (productList.isEmpty){
      return Center(child: Text("Cart is Empty"));
    } else
    return
      new ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index){
        String key = productList.keys.elementAt(index);
        return SingleCartProduct(
            cartModel: CartModel(name: productList[key].name,
              id: productList[key].id,
              picture: productList[key].picture,
              salePrice: productList[key].salePrice,
              price: productList[key].price, quantity: productList[key].quantity,)
        );
      });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartModel;


  SingleCartProduct({
this.cartModel});


  @override
  Widget build(BuildContext context) {
    final cartModels = Provider.of<CartModels>(context);
   /* return Card(
      child: ListTile(
        leading:  new Image.asset(cartModel.picture), //cartModel.things
        title: new Text(cartModel.name,),
        subtitle: new Column(
          children: <Widget>[
           // Row inside column
            new Row(
              children: <Widget>[
                // this section is for the size of the product
                Expanded(child: new Text("",),),
               Padding(
                   padding: const EdgeInsets.all(6.0),
               child: new Text("",style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 17,)),
               ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Text('l', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 24.0), ),
                ),
          ],
        ),
            new Container(child: new Text(""),
            ),
            //
            new Container(
              alignment: Alignment.topLeft,
              child:  new Text("\$${cartModel.price}", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15, color: Colors.red),),
            ),
            new Container(
              alignment: Alignment.topLeft,
              child:  new Text("\$${cartModel.oldPrice}", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15, color: Colors.black38,decoration: TextDecoration.lineThrough),),
            ),

    ],
      ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.clear), onPressed: (){
             cartModels.removeItem(cartModel.id);
            }),
          ],
        ),
      ),
   );
   */
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cartModel.picture),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartModel.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cartModel.salePrice}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.red),
                children: [
                  TextSpan(
                      text: "     ${cartModel.price.toString()}     ",
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800,),
                  )],
              ),
            )
          ],
        )
      ],
    );
  }
}
