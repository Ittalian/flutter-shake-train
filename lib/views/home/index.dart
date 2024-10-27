import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:shake_train/config/router/routes.dart';
import 'package:shake_train/view_models/train_route_view_model.dart';
import 'package:shake_train/widgets/base/base_image_container.dart';
import 'package:shake_train/widgets/home/train_route_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => IndexState();
}

class IndexState extends State<Index> {
  int shakeCount = 0;
  Timer? shakeResetTimer;

  @override
  void initState() {
    super.initState();
    initShakeDetector();
  }

  @override
  void dispose() {
    shakeResetTimer?.cancel();
    super.dispose();
  }

  void initShakeDetector() {
    ShakeDetector.autoStart(
      onPhoneShake: calculateCount,
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeThresholdGravity: 1.5,
    );
  }

  void calculateCount() {
    setState(() {
      shakeCount++;
    });
    shakeResetTimer?.cancel();
    shakeResetTimer = Timer(const Duration(seconds: 1), () {
      if (shakeCount != 0) {
        renderTrainRoute();
      }
      setState(() {
        shakeCount = 0;
      });
    });
  }

  Future<void> renderTrainRoute() async {
    final trainRouteViewModel = context.read<TrainRouteViewModel>();
    if (shakeCount <= trainRouteViewModel.routes.length) {
      final targetRoute = trainRouteViewModel.routes[shakeCount - 1];
      final url = Uri.parse(
          'https://transit.yahoo.co.jp/search/result?from=${targetRoute.departStation}&to=${targetRoute.arrivalStation}');
      await launchUrl(url);
    }
  }

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
        body: Stack(
          children: [
            Center(
              child: Text(
                shakeCount == 0 ? '' : shakeCount.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var trainRoute in trainRouteViewModel.routes)
                    TrainRouteTile(
                      trainRouteViewModel: trainRouteViewModel,
                      trainRoute: trainRoute,
                    ),
                ],
              ),
            ),
          ],
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
