



import 'package:cartapp/Modals/Db_helper.dart';
import 'package:cartapp/Modals/Product.dart';
import 'package:flutter/cupertino.dart';



class Products with ChangeNotifier{


  List<Product> _items=[];
  List<Product> _iitems=[
   Product(
    id: 'p1',
    title: 'Red Shirt',
    price: "29.99",
    imageUrl:
    'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  ),
    Product(
      id: 'p2',
      title: 'Trousers',
      price: "59.99",
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      price: "19.99",
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      price: "49.99",
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    )
  ];



  void  addProductUser()
      {


    try {
       _iitems.forEach((test)async{
         String id=DateTime.now().toString();
          var wait= await DbHelper.insert(
              "carto",
              {
                "id":id,
                "title":test.title,
                "price":test.price.toString(),
                "image":test.imageUrl,
                "cart":test.isCart.toString(),

              }
          );
        });



    }catch(error){

      print(error+"hrllo");
      throw error;
    }
  }





  Future<void> getDatabaseData()async
  {
    final data=await DbHelper.getData("carto");
    print('fuyure build');

    _items=data.map((test){
      return Product(
        id: test["id"],
        title: test["title"],
        price: test["price"],
        imageUrl: test["image"],
        isCart: test["cart"]
      );
    }).toList();


    notifyListeners();
  }

  int Itemcount=0;
  double totalamount=0;
  List<Product> cartItem(){
     Itemcount=0;
     totalamount=0;
    List<Product> item=[];
    _items.forEach((test) {

      if(test.isCart=="true"){
        item.add(test);
        ++Itemcount;
        totalamount+=double.parse(test.price);
      }

    });


    return item;
  }


  Future<void> addCartItem(Product dd,String type)async {
    final itemId = _items.indexWhere((test) {
      return test.id == dd.id;
    });
    _items[itemId] = Product(
        id: dd.id,
        price: dd.price,
        title: dd.title,
        imageUrl: dd.imageUrl,
        isCart: type

    );


    notifyListeners();
    await DbHelper.updateStatus("carto", dd.id, type);
  }


  void removeCartItem(String dd,String type)async {

    final data=_items.firstWhere((test){
      return test.id==dd;
    });

    final itemId = _items.indexWhere((test) {
      return test.id == dd;
    });
    _items[itemId] = Product(
        id: data.id,
        price: data.price,
        title: data.title,
        imageUrl: data.imageUrl,
        isCart: type

    );


    notifyListeners();
    await DbHelper.updateStatus("carto", data.id, type);
  }


  int get itemCount{
   //notifyListeners();
    return Itemcount;
  }
  double get totalAmt{

    return totalamount;
  }

  List<Product> get item
  {
    print(1);
    return [..._items];/////rtuening the copy of items not address of _items
  }


}