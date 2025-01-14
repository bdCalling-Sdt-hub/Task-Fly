import 'package:flutter/material.dart';
import 'package:task_fly/helpers/prefs_helper.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/view/screen/common_screen/message/widget/bottom_add.dart';
import '../../../../../extension/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/common_controller/message/message_controller.dart';
import '../../../../models/chat_message_model.dart';
import '../../../../utils/app_string.dart';
import '../../../component/back.dart';
import '../../../component/image/common_image.dart';
import '../../../component/text/common_text.dart';
import '../../../component/text_field/common_text_field.dart';
import 'widget/chat_bubble_message.dart';
import 'widget/offer_card.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String chatId = Get.parameters["chatId"] ?? "";
  String name = Get.parameters["name"] ?? "";
  String image = Get.parameters["image"] ?? "";
  String title = Get.parameters["title"] ?? "";

  @override
  void initState() {
    MessageController.instance.name = name;
    MessageController.instance.chatId = chatId;
    MessageController.instance.getMessageRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  backButton(),
                  CircleAvatar(
                    radius: 30.sp,
                    backgroundColor: Colors.grey,
                    child: ClipOval(
                      child: CommonImage(
                        imageSrc: image,
                        imageType: ImageType.network,
                        defaultImage: AppImages.profile,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  12.width,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: name,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                      CommonText(
                        text: title,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            leadingWidth: Get.width,
          ),
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    OfferCard(
                      isShow: controller.showCard,
                    ),
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: controller.scrollController,
                          itemCount: controller.isMoreLoading
                              ? controller.messages.length + 1
                              : controller.messages.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < controller.messages.length) {
                              ChatMessageModel message =
                                  controller.messages[index];
                              return ChatBubbleMessage(
                                index: index,
                                image: message.image,
                                isCall: message.isCall,
                                isNotice: message.isNotice,
                                time: message.time,
                                text: message.text,
                                isMe: message.isMe,
                                onTap: () {},
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    ),
                  ],
                ),
          bottomNavigationBar: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 24.h),
              child: Row(
                children: [
                  if (PrefsHelper.myRole == "tasker")
                    GestureDetector(
                      onTap: bottomAdd,
                      child: Container(
                        height: 42,
                        width: 42,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.textIcon_500)),
                        child: const Icon(
                          Icons.add,
                          size: 36,
                        ),
                      ),
                    ),
                  Expanded(
                    child: CommonTextField(
                      hintText: AppString.messageHere,
                      suffixIcon: GestureDetector(
                        onTap: controller.addNewMessage,
                        child: Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: const Icon(Icons.send),
                        ),
                      ),
                      borderColor: AppColors.textIcon_500,
                      borderRadius: 8,
                      controller: controller.messageController,
                      onSubmitted: (p0) => controller.addNewMessage(),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
