import 'package:cartapp/Modals/Product.dart';
import 'package:cartapp/Providers/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ProductItmes extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
   final scaffold=Scaffold.of(context);
    final productitem=Provider.of<Product>(context,listen: false);
    final cartprdt=Provider.of<Products>(context,listen: false);
    // TODO: implement build
  //print("rebuid");
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child:GridTile(
        child:GestureDetector(
          onTap: (){
          },
          child:Image.network(productitem.imageUrl,fit: BoxFit.cover,) ,) ,

        footer:GridTileBar(title:Text(productitem.title,textAlign: TextAlign.center,),
            backgroundColor: Colors.black87,
            leading:Consumer<Products>//use consumer to rebuilt only particular widget of builder method
              (builder: (ctx,product,child)=>IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: (){},
              color: Theme.of(context).accentColor,),

            ) ,
            trailing: IconButton(icon: Icon(Icons.shopping_cart),
                onPressed: (){

                   cartprdt.addCartItem(productitem,"true");
                 // cartprdt.upDateToData(productitem.id, "true");

                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("added to cart"),
                        duration:Duration(seconds: 2) ,
                      )
                  );
                },  color:Theme.of(context).accentColor)

        ),

      ),

      ) ;
  }
}