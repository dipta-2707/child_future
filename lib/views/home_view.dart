import 'package:child_future/config/route_config.dart';
import 'package:child_future/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeView extends StatelessWidget {
  const homeView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Text('Become a hero:'),
          SizedBox(height: 8.0,),
          // report child
          InkWell(
            onTap: (){
              Get.toNamed(AppRouteConfig.reportChildRoute);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: [
                  Image.asset('assets/child00.jpg',width: Get.width,
                    height: Get.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 3.0),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Row(
                        children: [
                          const Text('Report a street child', style: TextStyle(color: Colors.white),),
                          Icon(Icons.arrow_forward_outlined,color: Colors.white,size: 16,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height:12.0,),
          const Text('Statistics:'),
          SizedBox(height: 8.0,),
          Row(
            children: [
              Expanded(child: _statWidget(title: 'Total Victim',value: '2')),
              SizedBox(width: 10.0,),
              Expanded(child: _statWidget(title: 'Total Organization', value: '2'))

            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            children: [
              Expanded(child: _statWidget(title: 'Total Free Seat',value: '500')),
              SizedBox(width: 10.0,),
              Expanded(child: _statWidget(title: 'Total Seat', value: '1.5K'))

            ],
          )
        ],
      ),
    );
  }

  Widget _statWidget({required String title, required String value}){
    return Container(
      padding: EdgeInsets.all(10.0),
      height: Get.height*0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.blueGrey
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 8.0,),
          Text(value, style: Get.textTheme.displaySmall,),
        ],
      ),
    );
  }
}
