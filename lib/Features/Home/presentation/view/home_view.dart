import 'package:azkary/Features/Home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
    //  ListView.builder(
    //     itemCount: azkarDataList.length,
    //     itemBuilder: (context, index) => Container(
    //           child: Text(azkarDataList[index]!),
    //         )));
  }
}
