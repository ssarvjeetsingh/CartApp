
import 'package:cartapp/Screens/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/Products.dart';
import 'Screens/cart_screen.dart';

void main(){

  runApp(
    MyApp()
  );
}



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return  MultiProvider(providers: [




    ChangeNotifierProvider(
    create:(ctx)=>Products() ,
    ),

    ],
        child:MaterialApp(

          debugShowCheckedModeBanner: false,
          home: ProductOverView(),


    routes: {
      ShowCart.routeName:(ctx)=>ShowCart(),
    },
    )
    );
  }

}