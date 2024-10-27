import 'package:flutter/material.dart';
import 'package:shake_train/config/router/routes.dart';
import 'package:shake_train/models/train_route.dart';
import 'package:shake_train/view_models/train_route_view_model.dart';
import 'package:shake_train/widgets/home/route_tile_row.dart';

class TrainRouteTile extends StatelessWidget {
  final TrainRouteViewModel trainRouteViewModel;
  final TrainRoute trainRoute;

  const TrainRouteTile({
    super.key,
    required this.trainRouteViewModel,
    required this.trainRoute,
  });

  void editTrainRoute(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.edit,
      arguments: {
        'train_route_id': trainRoute.trainRouteId,
        'depart_station': trainRoute.departStation,
        'arrival_station': trainRoute.arrivalStation,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => editTrainRoute(context),
      child: Container(
        color: Colors.white.withOpacity(0.5),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: RouteTileRow(
          trainRouteViewModel: trainRouteViewModel,
          trainRoute: trainRoute,
        ),
      ),
    );
  }
}
