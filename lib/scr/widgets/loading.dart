import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hunter/scr/helpers/style.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        child: SpinKitWave(
          color: black,
          size: 30,
        )
    );
  }
}
