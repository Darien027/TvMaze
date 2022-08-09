import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:flutter/services.dart';

import '../VistasIn/Inicial.dart';

class PIN extends StatelessWidget {
  final String numberpin = "12345";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pin code',
        home: Scaffold(
            body: Center(
                child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Introduzca el pin",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              PinCodeTextField(
                  appContext: context,
                  mainAxisAlignment: MainAxisAlignment.center,
                  length: 5,
                  onChanged: (value) {},
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: Colors.purple,
                    activeColor: Colors.orange,
                    selectedColor: Colors.brown,
                  ),
                  onCompleted: (value) {
                    if (value == numberpin) {
                      print("Valid pin");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Vista1()));
                    } else {
                      print("invalid pin");
                    }
                  })
            ],
          ),
        ))));
  }
}
