
import 'package:cartapp/Providers/Products.dart';
import 'package:cartapp/Widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductGrid extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   final productpObj=Provider.of<Products>(context);
    final productlist=productpObj.item;
    // TODO: implement build
    return GridView.builder(

      padding: const EdgeInsets.all(10.0),
      itemBuilder: (cxt,index){
        return ChangeNotifierProvider.value(
          value:productlist[index],
        child:ProductItmes(


        ),
        );
      },
      itemCount: productlist.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,

      ),

    );
  }


}