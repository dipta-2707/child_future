import 'package:child_future/Api.dart';
import 'package:child_future/config/route_config.dart';
import 'package:child_future/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeView extends StatelessWidget {
  const homeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Text('Become a hero:'),
          const SizedBox(
            height: 8.0,
          ),
          // report child
          InkWell(
            onTap: () {
              Get.toNamed(AppRouteConfig.reportChildRoute);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/child00.jpg',
                    width: Get.width,
                    height: Get.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(
                        children: [
                          const Text(
                            'Report a street child',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text('Statistics:'),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Expanded(
                  child: StreamBuilder(
                stream: AppApi.getVictims(),
                builder: (context, snapshot) {
                  return _statWidget(
                      title: 'Total Victim',
                      value: snapshot.data?.size.toString() ?? '0');
                },
              )),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: StreamBuilder(
                stream: AppApi.getOrganizations(),
                builder: (context, snapshot) {
                  return _statWidget(
                      title: 'Total Organization',
                      value: snapshot.data?.size.toString() ?? '0');
                },
              ))
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                  child: StreamBuilder(
                stream: AppApi.getOrganizations(),
                builder: (context, snapshot) {
                  int freeSeat = 0;
                  for (var element in snapshot.data?.docs ?? []) {
                    freeSeat +=
                        int.parse(element.data()['free_seat'].toString());
                  }
                  return _statWidget(
                      title: 'Total Free Seat', value: freeSeat.toString());
                },
              )),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: StreamBuilder(
                stream: AppApi.getOrganizations(),
                builder: (context, snapshot) {
                  int totalSeat = 0;
                  for (var element in snapshot.data?.docs ?? []) {
                    totalSeat +=
                        int.parse(element.data()['total_seat'].toString());
                  }
                  return _statWidget(
                      title: 'Total Seat', value: totalSeat.toString());
                },
              ))
            ],
          ),
          TextButton(onPressed: (){
            Get.toNamed(AppRouteConfig.adoptFormView);
          },
              child: const Text('Submit adopt form'))
        ],
      ),
    );
  }

  Widget _statWidget({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: Get.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blueGrey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            value,
            style: Get.textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
