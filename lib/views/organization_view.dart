import 'package:child_future/Api.dart';
import 'package:flutter/material.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({super.key});

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
              stream: AppApi.getOrganizations(),
              builder:(context, snapshot){

                if(snapshot.hasData){
                  return  ListView.separated(
                      itemBuilder: (context, index) {
                        print(snapshot.data!.docs[index].data()['name']);
                        return _organizationTile(
                            image: snapshot.data!.docs[index].data()['image'],
                            name: snapshot.data!.docs[index].data()['name'], email: snapshot.data!.docs[index].data()['email']);
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8.0,),
                      itemCount: snapshot.data!.size);
                }
                else{
                  return Center(child: CircularProgressIndicator());
                }
              }

            ),
          )
        ],
      ),
    );
  }
  
  Widget _organizationTile({required String image, required String name, required String email}){
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
        subtitle: Text(email),
        trailing: Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
