import 'package:flutter/foundation.dart';
import 'package:shake_train/models/train_route.dart';
import 'package:shake_train/services/train_route_service.dart';

class TrainRouteViewModel extends ChangeNotifier {
  final TrainRouteService trainRouteService;

  List<TrainRoute> _routes = [];
  List<TrainRoute> get routes => _routes;

  TrainRouteViewModel(this.trainRouteService) {
    fetchTrainRoutes();
  }

  void fetchTrainRoutes() {
    trainRouteService.getTrainRoutes().listen((routeList) {
      _routes = routeList;
      notifyListeners();
    });
  }

  Future<void> addTrainRoute(TrainRoute trainRoute) async {
    await trainRouteService.addTrainRoute(trainRoute);
  }

  Future<void> editTrainRoute(
      String trainRouteId, String departStation, String arrivalStation) async {
    await trainRouteService.editTrainRoute(
        trainRouteId, departStation, arrivalStation);
  }

  Future<void> deleteTrainRoute(String trainRouteId) async {
    await trainRouteService.deleteTrainRoute(trainRouteId);
  }
}
