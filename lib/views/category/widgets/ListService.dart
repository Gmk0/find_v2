import 'package:find_v2/components/buildServiceCard.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:flutter/material.dart';

class ListService extends StatelessWidget {
  const ListService({super.key, required this.services});

  final List<ServiceModel> services;
  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text("Aucun service disponible"),
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final service = services[index];
            return BuildServiceCard(service: service);
          },
          childCount: services.length,
        ),
      );
    }
  }
}
