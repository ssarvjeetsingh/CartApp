
import 'package:cartapp/Providers/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cartapp/widgets/Cart_Irem.dart';

class ShowCart extends StatelessWidget{

  static const routeName="/CartScreen";
  @override
  Widget build(BuildContext context) {

    final cartprdt=Provider.of<Products>(context,listen: false).cartItem();
    final amount=Provider.of<Products>(context,listen: false).totalAmt;

    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Your Cart"),

      ),

      body: Column(
        children: <Widget>[
          Card(
            elevation: 4,
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Total",style: TextStyle(fontSize: 20),),
                  Spacer(),
                  Chip(
                      label: Text(amount.toString()),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),


                ],
              ) ,
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
              child:ListView.builder(itemBuilder:(ctx,index){
              return ItemCart(Id: cartprdt[index].id,
                title: cartprdt[index].title,
                price: double.parse(cartprdt[index].price),

              );
              },
                itemCount: cartprdt.length,
              )
          )
        ],
      ),
    );
  }

}
