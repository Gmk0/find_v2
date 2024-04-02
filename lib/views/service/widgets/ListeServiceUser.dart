import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/views/service/widgets/ServiceCardRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListeServiceUser extends StatelessWidget {
  ListeServiceUser({super.key});
  final ServiceController serviceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: serviceController.serviceAll.length,
        padding: const EdgeInsets.only(top: 8),
        itemBuilder: (BuildContext context, int index) {
          // final int count = serviceController.serviceAll.length;
          final ServiceModel service = serviceController.serviceAll[index];
          return ServiceCardRow(
            service: service,
          );
        },
      ),
    );
  }
}
