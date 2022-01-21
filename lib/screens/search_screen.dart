import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_list/providers/provider_home.dart';
import 'package:property_list/screens/property_details_screen.dart';
import 'package:provider/provider.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController searchController=TextEditingController();
    return  SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                  height: double.infinity,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back_ios),)),
              Expanded(
                child: SizedBox(
                  child: TextField(
                    controller: searchController,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Search"
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                  child: IconButton(onPressed: (){
                    Provider.of<ProviderHome>(context,listen: false).SearchData(searchController.text);
                  }, icon: const Icon(Icons.search),))
            ],
          ),
        ),
        body: Consumer<ProviderHome>(
          builder: (context,data,child){
            var item=data.searchDatas;
            return data.isSearching ==false?ListView.builder(
              itemCount: item?.length ?? 0,
                itemBuilder: (context,index){
                 return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                    child: SizedBox(
                      height: 100,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyDetails(SelectedProperty:item?[index]['PropertyId'],)));
                        },
                        child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(' Property Name: ${item?[index]['PropertName']}',style: TextStyle(color: Colors.grey.shade600),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,),
                                  ),Expanded(
                                    child: Text('Units Count: ${item?[index]['UnitsCount']}',style: TextStyle(color: Colors.grey.shade600),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  );
            }):const SizedBox();
          },
        ),
      ),
    );
  }
}
