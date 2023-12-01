import 'package:azkary/Features/Azkar/presentation/view/Azar_view.dart/widgets/azkar_view_body.dart';
import 'package:flutter/material.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AzkarCategoriesViewBody(),
    );
  }
}
