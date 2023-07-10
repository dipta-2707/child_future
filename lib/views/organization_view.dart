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
            child: ListView.separated(
                itemBuilder: (context, index) => _organizationTile(name: 'name', email: 'email'),
                separatorBuilder: (context, index) => SizedBox(height: 8.0,),
                itemCount: 15),
          )
        ],
      ),
    );
  }
  
  Widget _organizationTile({required String name, required String email}){
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.blueGrey
        )
      ),
      child: ListTile(

        leading: Image.network('https://www.w3schools.com/w3images/avatar6.png',fit: BoxFit.fill,),
        title: Text(name),
        subtitle: Text(email),
        trailing: Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
