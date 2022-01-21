import 'package:flutter/material.dart';
import 'package:property_list/providers/provider_home.dart';
import 'package:provider/provider.dart';
class PropertyDetails extends StatelessWidget {
  int SelectedProperty;
   PropertyDetails({Key? key,required this.SelectedProperty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("Details"),
      centerTitle: true,),
      body: Consumer<ProviderHome>(
        builder: (context,data,child){
          return ListView.builder(
            itemCount: data.PropertyData?.length,
            itemBuilder: (context,index) {
              return data.PropertyData?[index]['PropertyId']== SelectedProperty?Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Property Name: ',style: const TextStyle(fontSize: 17),),
                        Expanded(child: Text('${data.PropertyData?[index]['PropertName']}',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),overflow: TextOverflow.ellipsis,)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('UnitsCount:  ',style: const TextStyle(fontSize: 17),),
                          Text('${data.PropertyData?[index]['UnitsCount']}',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('PropertyUseType:  ',style: const TextStyle(fontSize: 17),),
                        Text('${data.PropertyData?[index]['PropertyUseType']}',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Location:  ',style: const TextStyle(fontSize: 17),),
                          Text('${data.PropertyData?[index]['Location']}',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                        ],
                      ),
                    ),
                    ],
                ),
              ):const SizedBox();
            }
          );
        },
      ),
    );
  }
}
