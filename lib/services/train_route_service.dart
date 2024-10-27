import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shake_train/models/train_route.dart';

class TrainRouteService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<TrainRoute>> getTrainRoutes() {
    return db.collection('TrainRoute').snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => TrainRoute.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<void> addTrainRoute(TrainRoute trainRoute) {
    return db.collection('TrainRoute').add(trainRoute.toMap());
  }

  Future<void> editTrainRoute(
      String trainRouteId, String departStation, String arrivalStation) {
    return db.collection('TrainRoute').doc(trainRouteId).set({
      'depart_station': departStation,
      'arrival_station': arrivalStation,
    });
  }

  Future<void> deleteTrainRoute(String trainRouteId) {
    return db.collection('TrainRoute').doc(trainRouteId).delete();
  }
}
