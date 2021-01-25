import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:flutter_auth/pages/product_details.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce/models/payment_gateway.dart';
import 'package:woocommerce/woocommerce.dart';


String euro = "\u20ac";
String baseUrl = "http://www.test.hisandhergroup.com";
String consumerKey = "ck_292c53e9de1b6585e379b765c9beb41f011e6814";
String consumerSecret = "cs_19bcb78bf379e5548daf79316297d6980d9190c7";

class ProductsPage extends StatefulWidget {
  final product;

  const ProductsPage({Key key, this.product}) : super(key: key);
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];
  List<WooPaymentGateway> gateways = [];
  WooCommerce wooCommerce = WooCommerce(
    baseUrl: baseUrl,
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
    isDebug: true,
  );

  getProducts() async {
    products = await wooCommerce.getProducts();
    setState(() {});
    print(products.toString());
  }
  getPaymentGateways() async {
    gateways = await wooCommerce.getPaymentGateways();
    setState(() {
      print(gateways.toString());
    });
  }
  @override
  void initState() {
    super.initState();
    //You would want to use a feature builder instead.
    getProducts();
    getPaymentGateways();
  }

  @override
  Widget build(BuildContext context) {
    //final productData = Provider.of<Products>(context);
    //final productList = productData.items;
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      return LazyLoadScrollView(
        onEndOfPage: () => getProducts(),
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return Card(
                  child: Hero(
                tag: product.name,
                child: Material(
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ProductDetails.routeName,
                        arguments:
                            ProductDetailsArguments(wooProduct: product)),
                    child: GridTile(
                        footer: Container(
                            color: Colors.white70,
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          euro+product.price,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                  //    Text(
                                    //    "\$${product.price}",
                                      //  style: TextStyle(
                                       //   color: Colors.black54,
                                        //  fontSize: 18.0,
                                         // fontWeight: FontWeight.w800,
                                          //decoration:
                                           //   TextDecoration.lineThrough,
                                       // ),
                                     // ),
                                    ]),
                                  ],
                                ),
                              ],
                            )
                            /*ListTile(
                              leading: Text(product.name, style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w900,
                                fontSize: 15,),
                              ),
                              title: Text("\$${product.price}", style: TextStyle(
                                  color: Colors.red, ),
                              ),
                            ),
                            */
                            ),
                        child: Image(
                          fit: BoxFit.cover,
                          image: product.images.isEmpty
                              ? AssetImage(
                                  "images/products/shoe1.jpg",
                                )
                              : NetworkImage(
                                  product.images[0].src,
                                ),
                        )),
                  ),
                ),
              ));
            }),
      );
    });
    /*return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
              product: Product(name: productList[index].name,
                id: productList[index].id,
                picture: productList[index].picture,
                oldPrice: productList[index].oldPrice,
                price: productList[index].price,)
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final product;
  SingleProd({
    this.product
  });
  @override
  Widget build(BuildContext context){

    return Card(
      child: Hero(tag: product.name, child: Material(
        child: InkWell(onTap: ()=> Navigator.pushNamed(
          context,
          ProductDetails.routeName,
          arguments: ProductDetailsArguments(product: product)
        ),
          child: GridTile(
              footer: Container(color: Colors.white70,
                child: ListTile(
                  leading: Text(product.name, style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 15,),
                  ),
                  title: Text("\$${product.price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle:  Text("\$${product.oldPrice}", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, decoration:TextDecoration.lineThrough,
                  ),
                  ),
                ),
              ),
              child: Image.asset(product.picture,
              fit: BoxFit.cover,
    ),
    ),
        ),
      )
      ),
    );
  }

     */
  }
}
