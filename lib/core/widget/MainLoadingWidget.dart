import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class MainLoadingWidget extends StatelessWidget {
  final String? message;

  const MainLoadingWidget({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(
            color: ColorManager.primary,
          ),
          const SizedBox(height: 10),
          Text(
            message ?? "Loading...",
            style: const TextStyle(color: ColorManager.textColor),
          ),
        ],
      ),
    );
  }
}
