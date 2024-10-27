import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake_train/config/router/routes.dart';
import 'package:shake_train/view_models/train_route_view_model.dart';
import 'package:shake_train/widgets/base/base_image_container.dart';
import 'package:shake_train/widgets/home/train_route_tile.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => IndexState();
}

class IndexState extends State<Index> {
  Future<void> handleAddTrainRoute(BuildContext context) async {
    Navigator.pushNamed(context, Routes.add);
  }

  @override
  Widget build(BuildContext context) {
    final trainRouteViewModel = context.watch<TrainRouteViewModel>();
    return BaseImageContainer(
      imagePath: 'images/home.jpg',
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var trainRoute in trainRouteViewModel.routes)
                TrainRouteTile(trainRoute: trainRoute),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await handleAddTrainRoute(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
