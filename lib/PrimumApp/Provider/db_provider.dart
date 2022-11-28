import 'package:flutter/material.dart';

import '../DB/category_repository.dart';
import '../DB/client_repository.dart';
import '../DB/elqest_pay_repository.dart';
import '../DB/elqest_repository.dart';
import '../DB/image_product_repository.dart';
import '../DB/product_repository.dart';
import '../Models/category_model.dart';
import '../Models/client_model.dart';
import '../Models/elqest_model.dart';
import '../Models/elqest_pay.dart';
import '../Models/image_model.dart';
import '../Models/product_model.dart';

class DBProvider with ChangeNotifier {
  final clientRepository = ClientRepository();
  final categoryRepository = CategoryRepository();
  final productRepository = ProductRepository();
  final imageRepository = ImageProductRepository();
  final qestRepository = ElQestRepository();
  final qestPayRepository = ElQestPayRepository();

  ProductModel? productQest;
  ElqestModel? elqestModel;

  int length = 0;
  String image = '';

  List<String> colors = [];
  String? color;

  List<ClientModel> clientsList = [];
  ClientModel? clientDetail;

  List<CategoryModel> categoryList = [];

  List<ProductModel> productList = [];
  List<ProductModel> productListCategory = [];
  List<ProductModel> productListByProductId = [];
  ProductModel? productModel;

  List<ImageProductModel> imageProductList = [];

  List<ElqestModel> elqestList = [];

  List<ProductModel> elqestProductsList = [];

  List<ElQestPayModel> elqestPayModelList=[];

  getClientData() async {
    clientsList = await clientRepository.getClient();
    notifyListeners();
  }

  List<ClientModel> searchClients(String txt) {
    List<ClientModel> clientsListSearch = [];
    if (clientsList.isNotEmpty) {
      for (var element in clientsList) {
        if (element.nid.contains(txt) || element.name.contains(txt)) {
          clientsListSearch.add(element);
        }
      }
    }
    clientsList = clientsListSearch;
    notifyListeners();
    return clientsList;
  }

  Future getClientDataByClientId(int id) async {
    clientDetail = clientsList.firstWhere((element) => element.id == id);
  }

  void getCategory() async {
    categoryList = await categoryRepository.getCategories();
    notifyListeners();
  }

  List<CategoryModel> searchCategory(String txt) {
    List<CategoryModel> categoryListSearch = [];
    if (categoryList.isNotEmpty) {
      categoryList.forEach((element) {
        if (element.name.contains(txt)) {
          categoryListSearch.add(element);
        }
      });
    }
    categoryList = categoryListSearch;
    notifyListeners();
    return categoryList;
  }

  void insertImage(List<String> images, int id) {
    List<ImageProductModel> insertImageModel = [];
    for (var imageComp in images) {
      insertImageModel.add(ImageProductModel(image: imageComp, productId: id));
    }
    imageRepository.batch(insertImageModel);
    notifyListeners();
  }

  void getProducts() async {
    productList = await productRepository.retrieve();
    notifyListeners();
  }

  void getImagesProduct(int productId) async {
    imageProductList = await imageRepository.retrieveByProduct(productId);
    notifyListeners();
  }

  void getProductByCategoryId(int id) async {
    length = 0;
    productListCategory = await productRepository.retrieveByCategoryId(id);
    for (var element in productListCategory) {
      length += element.quantity;
    }
    notifyListeners();
  }

  void getProductByProductId(int productId) {
    index = 0;
    productModel=productList.firstWhere((element) => element.id == productId);
    getImagesProduct(productId);
    image = productModel!.defaultImage;
    notifyListeners();
  }

  int index = 0;

  void indexIndicator(int x) {
    index = x;
    image = imageProductList[index].image;
    notifyListeners();
  }

  List<ProductModel> searchProducts(String txt) {
    List<ProductModel> productsListSearch = [];
    if (clientsList.isNotEmpty) {
      productList.forEach((element) {
        if (element.name.contains(txt)) {
          productsListSearch.add(element);
        }
      });
    }
    productList = productsListSearch;
    notifyListeners();
    return productList;
  }

  Future productQestSelected(String name) async {
    productQest =
        productListCategory.firstWhere((element) => element.name == name);
    colors = productQest!.color.split(' ');
    notifyListeners();
  }

  void changeColor(val) {
    color = val;
    notifyListeners();
  }

  void resetColor() {
    color = null;
    notifyListeners();
  }

  Future getElqestClients(int clientId) async {
    elqestList = await qestRepository.retrieveClientId(clientId);
    notifyListeners();
  }

  void resetImages() {
    imageProductList = [];
  }

  getElqestProductsList(){
    elqestProductsList=[];
    for(var item in elqestList){
      elqestProductsList.add(productList.firstWhere((element) => element.id==item.productId));
    }
    notifyListeners();

  }

  void resetElQestProducts(){
    elqestList=[];
    notifyListeners();
  }

  Future getElqestModel(int id)async{
    elqestModel=elqestList.firstWhere((element) => element.id==id);
    notifyListeners();
  }

  getElQestPay({required int clientId,required int productId,required int elqestId})async{
    elqestPayModelList=await qestPayRepository.retrieve(clientId: clientId, productId: productId, elqestId: elqestId);
    notifyListeners();
  }
  double x=0;
  double payed(){
    x=0;
    for(var element in elqestPayModelList)
      {
        x+=element.price;
      }

    return x+double.parse(elqestModel!.firstPayed);
  }

  double remained(){
    x=0;
    for(var element in elqestPayModelList)
    {
      x+=element.price;
    }
    return elqestModel!.price-double.parse(elqestModel!.firstPayed)-x;
  }

  Future deleteClient({required int clientId,required int index})async{
    qestPayRepository.deleteByClientId(clientId);
    qestRepository.deleteByClientId(clientId);
    clientRepository.delete(clientId).then((value) {
      clientsList.removeAt(index);
      notifyListeners();
    });
  }

  Future deleteElQestProduct({required int elqestId,required int index})async{
    qestPayRepository.deleteByElQestId(elqestId);
    qestRepository.delete(elqestId).then((value) {
      elqestList.removeAt(index);
      notifyListeners();
    });
  }


  // Future deleteQestByClient({})async{
  //   qestPayRepository.delete(id)
  // }
}
