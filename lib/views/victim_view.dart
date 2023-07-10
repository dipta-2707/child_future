import 'package:flutter/material.dart';

import '../Api.dart';

class VictimView extends StatelessWidget {
  const VictimView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SearchBar(
            hintText: 'Search by name...',
          ),
          SizedBox(height: 12.0,),
          Expanded(
            child: StreamBuilder(
                stream: AppApi.getVictims(),
                builder:(context, snapshot){
                  if(snapshot.hasData){
                    return ListView.separated(
                        itemBuilder: (context, index) => _victimTile(name: snapshot.data!.docs[index].data()['name'], image: snapshot.data!.docs[index].data()['image']),
                        separatorBuilder: (context, index) => SizedBox(height: 8.0,),
                        itemCount: snapshot.data!.size);
                  }
                  else{
                    return const Center(child: CircularProgressIndicator());
                  }
                }

            ),
          )

        ],
      ),
    );
  }
  Widget _victimTile({required String name,required String image}){
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: Colors.blueGrey
          )
      ),
      child: ListTile(

        leading: Image.network(image,fit: BoxFit.fill,),
        title: Text(name),
        trailing: Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
