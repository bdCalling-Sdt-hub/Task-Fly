import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';

import '../../../../../controllers/provider/provider_home_controller.dart';


sendReview() {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: Get.context!,
    builder: (context) {
      return const Filter();
    },
  );
}

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderHomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(CupertinoIcons.clear).end,
              const CommonText(
                text: AppString.sendReviewDetails,
                fontSize: 18,
                maxLines: 3,
                left: 20,
                right: 20,
              ),
              24.height,
              RatingBar.builder(
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  if (kDebugMode) {
                    print(rating);
                  }
                },
              ),
              24.height,
              CommonButton(
                titleText: AppString.thankYou,
                onTap: () => Get.back(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
