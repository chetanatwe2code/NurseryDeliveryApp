import 'package:flutter/material.dart';
import 'package:nursery_driver/theme/app_colors.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final scrollController = ScrollController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    scrollController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      bottomSheet: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.darkPrimary,
        ),
      ),
      body: ListView(
        controller: scrollController,
        padding: EdgeInsets.all(16.0),
        children: [
          for (int i = 0; i < 20; i++)
            TextField(
              decoration: InputDecoration(
                hintText: "DATA",
              ),
            ),
          TextField(
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: "DATA_END",
            ),
          ),
        ],
      ),
    );
  }
}
