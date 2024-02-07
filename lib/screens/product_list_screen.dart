
import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:bloc_sample/blocs/product_bloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: ()=>Navigator.pushNamed(context, "/cart")),
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(stream: productBloc.getStream, builder: (context,snapshot){
      return snapshot.data.length>0?buildProductListItems(snapshot):Center(child: Text("No Data"),);
    },initialData: productBloc.getAll(),);
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(itemBuilder: (BuildContext context,index){
      var list=snapshot.data;
      return ListTile(
        title: Text(list[index].name),
        subtitle: Text(list[index].price.toString()),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed:(){ cartBloc.addToCart(Cart(list[index],1));},
        ),
      );
    },itemCount: snapshot.data.length,);
  }
  
}