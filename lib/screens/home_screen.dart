import 'package:flutter/material.dart';
import 'package:property_list/providers/provider_home.dart';
import 'package:property_list/screens/property_details_screen.dart';
import 'package:property_list/screens/search_screen.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderHome>(context,listen: false).getPropertyDatas();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text("Property List",style: TextStyle(color: Colors.black),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10),
            child: SizedBox(
                height: 30,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
                    },
                    child: const Text("Search",style: TextStyle(color: Colors.black)))),
          )
        ],
        elevation: 0.0,
      ),
      body: Consumer<ProviderHome>(
        builder: (context,data,child) {
          return data.ispropertyLoading ==false?
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.PropertyData?.length,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                child: SizedBox(
                  height: 100,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyDetails(SelectedProperty:data.PropertyData?[index]['PropertyId'],)));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(' Property Name: ${data.PropertyData?[index]['PropertName']}',style: TextStyle(color: Colors.grey.shade600),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,),
                            ),Expanded(
                              child: Text('Units Count: ${data.PropertyData?[index]['UnitsCount']}',style: TextStyle(color: Colors.grey.shade600),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ),
              );
            }
          ):const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 30,
                  width: 30,
                  child: CircularProgressIndicator()),
            ),
          );
        }
      ),
    );
  }
}
