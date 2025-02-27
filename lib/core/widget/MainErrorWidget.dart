import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  String? message;
  VoidCallback? onTryAgain;

  MainErrorWidget({this.message, this.onTryAgain, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            message ?? "Loading...",
            style: TextStyle(color: ColorManager.textColor),
          ),
          const SizedBox(height: 10),
          onTryAgain != null
              ? ElevatedButton(onPressed: onTryAgain, child: Text("Try Again"))
              : Container()
        ],
      ),
    );
  }
}
