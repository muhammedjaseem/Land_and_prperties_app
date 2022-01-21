import 'package:flutter/material.dart';
import 'package:property_list/apis/home_apis.dart';
import 'package:property_list/models/property_list_model.dart';

class ProviderHome with ChangeNotifier{

  List<dynamic>?PropertyData;
  bool ispropertyLoading=true;

  List<dynamic>? searchDatas;
  bool isSearching=true;

  Future<void>getPropertyDatas()async {

    try{
      ispropertyLoading =false;
      PropertyData =await getProperty();

    }
    catch(e){
      ispropertyLoading =true;
      print(e.toString());
    }
    notifyListeners();
  }

Future<void>SearchData(saerchData)async{
    try{
      print("eee");
      isSearching =false;
      searchDatas =await search(saerchData);
    }
    catch(e){
      isSearching=true;
      print("search Error"+e.toString());
    }
    notifyListeners();
}



}