import 'package:cartapp/Modals/Product.dart';
import 'package:cartapp/Providers/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ItemCart extends StatelessWidget
{

  final String Id;
  final String title;
  final double price;
   final Product pp;

  const ItemCart({ this.Id, this.title, this.price,this.pp});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dismissible(key:ValueKey(Id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete,color: Theme.of(context).accentColor,size: 40,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4) ,
      ),
      direction: DismissDirection.endToStart,
        confirmDismiss:(direction){
     return showDialog(context: context,
          builder: (ctx)=>AlertDialog(
            title:Text("Are you Sure?"),
        content: Text("Do youu want to remove this item from cart"),
            actions: <Widget>[
              FlatButton(onPressed: (){Navigator.of(context).pop(false);}, child: Text("No",style: TextStyle(color:Theme.of(context).accentColor),)),
              FlatButton(onPressed: (){Navigator.of(context).pop(true);}, child: Text("Yes",style: TextStyle(color:Theme.of(context).accentColor)))
            ],
          )
     );

        },
        onDismissed: (direction){
          Provider.of<Products>(context,listen: false).removeCartItem(Id, "false");
        },
      child: Card(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child:ListTile(
          leading: CircleAvatar(child:Padding(padding: EdgeInsets.all(5),child:FittedBox(child: Text('\$$price',) ,) ,),backgroundColor: Theme.of(context).accentColor,),
          title: Text(title),
          subtitle: Text("Total \$ ${price}"),

        ) ,

      ),

    ),
    );
  }

}