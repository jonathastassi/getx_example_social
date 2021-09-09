import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentListWidget extends StatelessWidget {
  final int postId;

  const CommentListWidget({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: BoxConstraints(
        maxHeight: Get.size.height * 0.8,
        minHeight: Get.size.height * 0.2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: Text('eita'),
                      subtitle: Text('eita'),
                    ),
                    ListTile(
                      title: Text('Comment'),
                    ),
                  ],
                ),
              );
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
