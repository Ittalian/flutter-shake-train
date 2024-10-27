import 'package:flutter/material.dart';
import 'package:shake_train/views/edit/edit.dart';
import 'package:shake_train/views/home/index.dart';

class Routes {
  static const String home = '/';
  static const String edit = 'edit/';
  static const String add = 'add/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Index());
      case edit:
        final editOptions = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => Edit(
            trainRouteId: editOptions['train_route_id'] as String,
            departStation: editOptions['depart_station'] as String,
            arrivalStation: editOptions['arrival_station'] as String,
          ),
        );
      case add:
        return MaterialPageRoute(
          builder: (_) => const Edit(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                '${settings.name}は存在しません',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
    }
  }
}
