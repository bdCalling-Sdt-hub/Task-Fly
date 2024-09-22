import 'package:flutter/material.dart';
import 'package:task_fly/controllers/common_controller/message/message_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/common_screen/message/widget/adjust_offer.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, this.isShow = false});

  final bool isShow;

  @override
  Widget build(BuildContext context) {
    return isShow
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF90CAF9),
                  Color(0xFFE3F2FD),
                ],
                begin: Alignment(0.90, -1.90),
                end: Alignment(0.30, -0.10),
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonText(
                        text: 'Task: Car wash',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        bottom: 8,
                      ),
                      // Task description
                      const CommonText(
                        text:
                            'Task Details: Deep clean service refreshes your car\'s entire interior.',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        bottom: 8,
                      ),
                      const CommonText(
                        text: 'Due date',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textIcon_200,
                        textAlign: TextAlign.start,
                        bottom: 4,
                      ).center,

                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: AppColors.textIcon_200,
                          ),
                          CommonText(
                            text: 'Wed, 6 Feb 2022',
                            fontSize: 14,
                            left: 4,
                            color: AppColors.textIcon_200,
                          ),
                        ],
                      ),
                      12.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              width: 80,
                              child: CommonButton(
                                titleText: AppString.adjust,
                                buttonHeight: 38,
                                borderColor: AppColors.transparent,
                                buttonColor: AppColors.p_500,
                                titleColor: AppColors.white,
                                onTap: adjustOffer         ,
                              )),
                          20.width,
                          const SizedBox(
                              width: 80,
                              child: CommonButton(
                                titleText: AppString.accept,
                                buttonHeight: 38,
                                borderColor: AppColors.transparent,
                                buttonColor: AppColors.p_300,
                                titleColor: AppColors.white,
                              )),
                        ],
                      ),

                      12.height,

                      CommonButton(
                        titleText: AppString.cancel,
                        buttonColor: AppColors.gray,
                        borderColor: AppColors.transparent,
                        buttonWidth: 100,
                        buttonHeight: 40,
                        buttonRadius: 25,
                        onTap: MessageController.instance.changeShowCard,
                      ).center
                    ],
                  ),
                )
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF90CAF9),
                  Color(0xFFE3F2FD),
                ],
                begin: Alignment(1.90, -1.90),
                end: Alignment(.30, -.10),
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonText(
                  text: 'Car wash',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  bottom: 8,
                ),
                IconButton(
                    onPressed: MessageController.instance.changeShowCard,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined))
              ],
            ),
          );
  }
}
