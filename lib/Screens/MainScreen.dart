

import 'package:cartapp/Providers/Products.dart';
import 'package:cartapp/Widgets/Product_gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';


class ProductOverView extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateProductOverView();
  }

}

class StateProductOverView extends State<ProductOverView>
{
  var isLoading=false;



  @override
  Widget build(BuildContext context) {
    Provider.of<Products>(context,listen: false).getDatabaseData();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Cart"),
        actions: <Widget>[

          IconButton(icon: Icon(Icons.shopping_cart),
                onPressed: (){
                 Navigator.of(context).pushNamed(
                      ShowCart.routeName
                 );

                }),

        ],
      ),

      body: ProductGrid(),
      floatingActionButton: FlatButton.icon(
        icon: Icon(Icons.save),
        label: Text("save to Data base"),
        onPressed: () async{
             await Provider.of<Products>(context,listen:false ).addProductUser();
             setState(() {

             });
        },

      ),
    );

  }

}