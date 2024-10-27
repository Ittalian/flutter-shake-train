class TrainRoute {
  final String? trainRouteId;
  final String departStation;
  final String arrivalStation;

  TrainRoute({
    this.trainRouteId,
    required this.departStation,
    required this.arrivalStation,
  });

  factory TrainRoute.fromMap(Map<String, dynamic> map, String documentId) {
    return TrainRoute(
      trainRouteId: documentId,
      departStation: map['depart_station'],
      arrivalStation: map['arrival_station'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'train_route_id': trainRouteId,
      'depart_station_id': departStation,
      'arrival_station_id': arrivalStation,
    };
  }
}
