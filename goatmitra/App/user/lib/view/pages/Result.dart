import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String res;
  const Result({Key? key,required this.res}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Health Prediction: ${res}"),
          ],
        ),
      ),
    );
  }
}