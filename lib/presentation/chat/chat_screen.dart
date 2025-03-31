import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/chat/controller/chat_controller.dart';
import 'package:rms/presentation/chat/models/bubble.dart';
import 'package:rms/presentation/chat/models/chat.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: AppbarTitle(text: 'Chat'),
            centerTitle: true,
            automaticallyImplyLeading: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.focusNode.value.unfocus();
                  },
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        padding: const EdgeInsets.only(top: 12, bottom: 20) +
                            const EdgeInsets.symmetric(horizontal: 12),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 12,
                        ),
                        controller: controller.scrollController.value,
                        itemCount: controller.chatList.reversed.length,
                        itemBuilder: (context, index) {
                          return Bubble(chat: controller.chatList.reversed.toList()[index]);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(
                bottom: true,
                child: Container(
                  constraints: const BoxConstraints(minHeight: 48),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFE5E5EA),
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      TextField(
                        focusNode: controller.focusNode.value,
                        onChanged: controller.onFieldChanged,
                        controller: controller.textEditingController.value,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                            right: 42,
                            left: 16,
                            top: 18,
                          ),
                          hintText: 'message',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      // custom suffix btn
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/send.svg",
                            colorFilter: ColorFilter.mode(
                              controller.isTextFieldEnable.value
                                  ? const Color(0xFF007AFF)
                                  : const Color(0xFFBDBDC2),
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: controller.onFieldSubmitted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => controller.isLoading
              ? const Center(
                  child:CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}