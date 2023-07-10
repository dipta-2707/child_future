import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportChildPage extends StatelessWidget {
  const ReportChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report A Child'),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height*0.2,
                width: Get.width,
                child: Icon(Icons.upload),
              ),
              SizedBox(height: 10.0,),
              Text('Child Name'),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter child name'
                ),
              ),

              SizedBox(height: 10.0,),
              Text('Address'),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter address'
                ),
              ),
              SizedBox(height: 10.0,),
              Text('Your Added Child'),
            ],
          ),
      ),
    );
  }
}
