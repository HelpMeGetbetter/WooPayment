import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/product_details.dart';
import 'package:http/http.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:woocommerce/woocommerce.dart';



class BestSellingProducts extends StatefulWidget {

  @override
  _BestSellingProductsState createState() => _BestSellingProductsState();
}

class _BestSellingProductsState extends State<BestSellingProducts> {


  Future<List<WooProduct>> _productsFuture;
  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];
  WooCommerce wooCommerce = WooCommerce(
    baseUrl: baseUrl,
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
    isDebug: true,
  );

  Future<List<WooProduct>> getProducts() async {
    return await wooCommerce.getProducts();
  }

  Future<List<WooProduct>> getFavProd() async {
   return  featuredProducts = await wooCommerce.getProducts(featured: true);
  }

  @override
  void initState() {
    super.initState();
    //You would want to use a feature builder instead.
    _productsFuture = getFavProd();
  }
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _productsFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final fav = snapshot.data[index];
                return Card(
                    child: Material(
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, ProductDetails.routeName,
                            arguments: ProductDetailsArguments(wooProduct: fav)),
                        child: GridTile(
                            footer: Container(
                                color: Colors.white70,
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          fav.name,
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
                                              "\$${fav.price}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 18.0),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Text(
                                            "\$${fav.price}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w800,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ],
                                )),
                            child: Image(
                              fit: BoxFit.cover,
                              image: fav.images.isEmpty
                                  ? AssetImage(
                                "images/products/shoe1.jpg",
                              )
                                  : NetworkImage(
                                fav.images[0].src,
                              ),
                            )),
                      ),
                    ));
              });
        });
  }
}
String baseUrl = "http://www.test.hisandhergroup.com";
String consumerKey = "ck_292c53e9de1b6585e379b765c9beb41f011e6814";
String consumerSecret = "cs_19bcb78bf379e5548daf79316297d6980d9190c7";
