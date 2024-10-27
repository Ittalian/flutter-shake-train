import 'package:flutter/material.dart';
import 'package:shake_train/models/train_route.dart';
import 'package:shake_train/view_models/train_route_view_model.dart';
import 'package:shake_train/widgets/base/base_text_button.dart';

class RouteTileRow extends StatelessWidget {
  final TrainRouteViewModel trainRouteViewModel;
  final TrainRoute trainRoute;

  const RouteTileRow({
    super.key,
    required this.trainRouteViewModel,
    required this.trainRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${trainRoute.departStation} ～ ${trainRoute.arrivalStation}',
          style: const TextStyle(fontSize: 20),
        ),
        BaseTextButton(
          label: '削除',
          onPressed: () async {
            trainRouteViewModel.deleteTrainRoute(trainRoute.trainRouteId!);
          },
        ),
      ],
    );
  }
}
