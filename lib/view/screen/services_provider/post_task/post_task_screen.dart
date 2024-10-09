import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/provider/post_task_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/services_provider/post_task/widgets/post_item.dart';

import '../home/widgets/category_item.dart';

class PostTaskScreen extends StatelessWidget {
  const PostTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.postTask,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: GetBuilder<PostTaskController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CommonText(
                text: AppString.selectYourCategory,
                fontSize: 18,
                bottom: 20,
              ).start,
              GridView.builder(
                  itemCount: controller.category.length - 1,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 80,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          controller.selectCategory(controller.category[index]),
                      child: PostItem(
                        item: controller.category[index],
                      ),
                    );
                  }),
              12.height,
              SizedBox(
                height: 80,
                child: PostItem(
                  item: controller.category[9],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
