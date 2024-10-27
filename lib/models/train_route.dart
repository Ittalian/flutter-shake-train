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
      'depart_station': departStation,
      'arrival_station': arrivalStation,
    };
  }
}
