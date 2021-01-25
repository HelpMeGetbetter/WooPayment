import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:flutter_auth/pages/product_details.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce/woocommerce.dart';

String baseUrl = "http://www.test.hisandhergroup.com";
String consumerKey = "ck_292c53e9de1b6585e379b765c9beb41f011e6814";
String consumerSecret = "cs_19bcb78bf379e5548daf79316297d6980d9190c7";

class RecommendedProducts extends StatefulWidget {
  final product;

  const RecommendedProducts({Key key, this.product}) : super(key: key);
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<RecommendedProducts> {
  int currentLength = 0;

  final int increment = 10;
  bool isLoading = false;

  Future _loadMore() async {
    setState(() {
      isLoading = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 2));
    for (var i = currentLength; i <= currentLength + increment; i++) {
      if (i >= products.length) break; // this might be wrong

      shownProducts.add(products[i]);
    }
    setState(() {
      isLoading = false;
      currentLength = shownProducts.length;
    });
  }

  List<WooProduct> shownProducts = [];
  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];
  WooCommerce wooCommerce = WooCommerce(
    baseUrl: baseUrl,
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
    isDebug: true,
  );

  getProducts() async {
    products = await wooCommerce.getProducts(perPage: 53);
    setState(() {
       // get the first (increment) products
    });
    print(products.toString());
  }

  @override
  void initState() {
    super.initState();
    //You would want to use a feature builder instead.
    getProducts();
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return Card(
                child: Material(
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                    context, ProductDetails.routeName,
                    arguments: ProductDetailsArguments(wooProduct: product)),
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
                                      "\$${product.price}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  // Text(
                                  //  "\$${product.price}",
                                  //  style: TextStyle(
                                  //   color: Colors.black54,
                                  //  fontSize: 18.0,
                                  // fontWeight: FontWeight.w800,
                                  // decoration: TextDecoration.lineThrough,
                                  //),
                                  // ),
                                ]),
                              ],
                            ),
                          ],
                        )),
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
            ));
          });
    });
  }
}
