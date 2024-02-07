import 'package:bloc_sample/models/product.dart';

class ProductService{
  static List<Product> products=[];

  static ProductService _singleton=ProductService._internal();

  factory ProductService(){
    return _singleton;
  }

  ProductService._internal();


  static List<Product> getAll(){
    products.add(Product(1, "acer laptop", 6000));
    products.add(Product(2, "asus laptop", 8000));

    products.add(Product(3, "lenovo laptop", 9000));

    return products;
  }
}