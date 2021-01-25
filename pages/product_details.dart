import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/cart_model.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:flutter_auth/Widgets/navi/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter_auth/pages/cart_page.dart';
import 'package:flutter_auth/pages/home_page.dart';
import 'package:flutter_auth/to_test/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce/models/products.dart';
import 'package:woocommerce/woocommerce.dart';

class ProductDetailsArguments {
  final WooProduct wooProduct;

  ProductDetailsArguments({
    @required this.wooProduct,
  });
}

class ProductDetails extends StatelessWidget with NavigationStates {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args =
        ModalRoute.of(context).settings.arguments;
    final cartModels = Provider.of<CartModels>(context);
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: (InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text(
              'AppStore',
            ))),
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
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          )
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(args.wooProduct.images[0].src),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    args.wooProduct.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "\$${args.wooProduct.price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "\$${args.wooProduct.price}",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

//      ========= The first button ==========

          Row(
            children: <Widget>[
//       ========= the size button =======
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("Choose the size"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size")),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              //       ========= the size button =======
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Colors"),
                            content: new Text("Choose a Color",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                )),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color")),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              //       ========= the size button =======
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose the Quantity"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qty")),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

//      ========= The Second button ==========

          Row(
            children: <Widget>[
//       ========= the size button =======
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    cartModels.addItem(CartModel(
                      name: args.wooProduct.name,
                      id: args.wooProduct.id.toString(),
                      picture: args.wooProduct.images[0].src,
                      price: double.parse(args.wooProduct.price),
                      salePrice: double.parse(args.wooProduct.regularPrice),
                    ));
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Add to Cart"),
                ),
              ),

              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.red,
                  onPressed: () {}),

              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product details",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                )),
            subtitle: new Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(args.wooProduct.name),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    )),
              ),
              // product brand
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),
              )
            ],
          ),

// ----PRODUCT CONDITION------
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("NEW"),
              )
            ],
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text(
              "Similar products",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Similar product section
          Container(
            height: 360.0,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

String baseUrl = "http://www.test.hisandhergroup.com";
String consumerKey = "ck_292c53e9de1b6585e379b765c9beb41f011e6814";
String consumerSecret = "cs_19bcb78bf379e5548daf79316297d6980d9190c7";

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];
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

  @override
  void initState() {
    super.initState();
    //You would want to use a feature builder instead.
    getProducts();
  }

  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final productList = productData.similarItems;
    return GridView.builder(
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
                    arguments: ProductDetailsArguments(wooProduct: product)),
                child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        product.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      title: Text(
                        "\$${product.salePrice}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$${product.price}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ),
                  child: Image(
                      fit: BoxFit.cover,
                      image: product.images.isEmpty
                          ? AssetImage(
                              "images/products/shoe1.jpg",
                            )
                          : NetworkImage(
                              product.images[0].src,
                            )),
                ),
              )),
            ),
          );
          /*itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProd(
                product: Product(name:productList[index].name,
                id: productList[index].id,
                picture: productList[index].picture,
                price: productList[index].price,
                salePrice: productList[index].salePrice,)
          );
        }

         */
        });
  }
}

class SimilarSingleProd extends StatelessWidget {
  final product;

  SimilarSingleProd({this.product});
  @override
  Widget build(BuildContext context) {}
}
