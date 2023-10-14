import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('azkar')), body: Container());
    //  ListView.builder(
    //     itemCount: azkarDataList.length,
    //     itemBuilder: (context, index) => Container(
    //           child: Text(azkarDataList[index]!),
    //         )));
  }
}
