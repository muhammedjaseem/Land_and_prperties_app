import 'dart:convert';
import 'package:http/http.dart'as http;


getProperty()async{
  try{
    var url="http://194.233.75.55:5023/api/Interview/GetPropertyList";
    var reponse =await http.post(Uri.parse(url));
    if(reponse.statusCode ==200){
      List<dynamic> data =jsonDecode(reponse.body);
      return data;
    }
  }
  catch(e){
    print("get Property Error "+ e.toString());
  }
}


search(SearchData)async{
  try{
    var url=Uri.parse('http://194.233.75.55:5023/api/Interview/GetPropertyFilterByLocation/${SearchData}');
    var reponse =await http.post(url);
    if(reponse.statusCode ==200){
      print(reponse.body);
      List<dynamic> data =jsonDecode(reponse.body);
      return data;
    }
  }
  catch(e){
    print("Search Error "+ e.toString());
  }
}
