import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake_train/models/train_route.dart';
import 'package:shake_train/view_models/train_route_view_model.dart';
import 'package:shake_train/widgets/base/base_button.dart';
import 'package:shake_train/widgets/base/base_image_container.dart';
import 'package:shake_train/widgets/base/base_textform_field.dart';

class Edit extends StatefulWidget {
  final String? trainRouteId;
  final String? departStation;
  final String? arrivalStation;

  const Edit({
    super.key,
    this.trainRouteId,
    this.departStation,
    this.arrivalStation,
  });

  @override
  State<Edit> createState() => EditState();
}

class EditState extends State<Edit> {
  String inputDepartStation = '';
  String inputArrivalStation = '';

  @override
  void initState() {
    super.initState();
    if (widget.trainRouteId != null) {
      setState(() {
        inputDepartStation = widget.departStation!;
        inputArrivalStation = widget.arrivalStation!;
      });
    }
  }

  void setDepartStation(String value) {
    setState(() {
      inputDepartStation = value;
    });
  }

  void setArrivalStation(String value) {
    setState(() {
      inputArrivalStation = value;
    });
  }

  Future<void> handleSaveTrainRoute(
      TrainRouteViewModel trainRouteViewModel) async {
    if (widget.trainRouteId == null) {
      trainRouteViewModel.addTrainRoute(
        TrainRoute(
          departStation: inputDepartStation,
          arrivalStation: inputArrivalStation,
        ),
      );
    } else {
      trainRouteViewModel.editTrainRoute(
        widget.trainRouteId!,
        inputDepartStation,
        inputArrivalStation,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final trainRouteViewModel = context.watch<TrainRouteViewModel>();
    return BaseImageContainer(
      imagePath: 'images/edit.jpg',
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseTextformField(
              label: '出発駅',
              initText: widget.departStation,
              setValue: (value) => setDepartStation(value),
            ),
            BaseTextformField(
              label: '到着駅',
              initText: widget.arrivalStation,
              setValue: (value) => setArrivalStation(value),
            ),
            BaseButton(
                label: '保存',
                onPressed: () async {
                  await handleSaveTrainRoute(trainRouteViewModel);
                }),
          ],
        ),
      ),
    );
  }
}
