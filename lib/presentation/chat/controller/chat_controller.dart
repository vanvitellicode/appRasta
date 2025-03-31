import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/chat/models/chat.dart';
import 'package:xmpp_plugin/ennums/xmpp_connection_state.dart';
import 'package:xmpp_plugin/error_response_event.dart';
import 'package:xmpp_plugin/models/chat_state_model.dart';
import 'package:xmpp_plugin/models/connection_event.dart';
import 'package:xmpp_plugin/models/message_model.dart';
import 'package:xmpp_plugin/models/present_mode.dart';
import 'package:xmpp_plugin/success_response_event.dart';
import 'package:xmpp_plugin/xmpp_plugin.dart';

class ChatController extends GetxController {
  RxList<Chat> chatList = <Chat>[].obs;
  Rx<bool> _isLoading = true.obs;

  late XmppConnection xmppConnection;
  String senderJid = "dariodario@anonym.im";
  @override
  void onInit() {
    _isLoading.value = true;
    super.onInit();
    connect().then((x) => request_mam()).then((_) => _isLoading.value = false);
    update();
    //request_mam();
  }


  void request_mam() async {
    await Future.delayed(Duration(seconds: 4));
    await xmppConnection.requestMamMessages("testdario2@anonym.im", DateTime.now().subtract(Duration(days: 1)).millisecondsSinceEpoch.toString(), DateTime.now().millisecondsSinceEpoch.toString(), '10000');
  }

  bool get isLoading => _isLoading.value;

  Future connect() async {
      final param = {
        "user_jid":"dariodario@anonym.im",
        "password": "123456",
        "host": "anonym.im",
        "port": "5222",
        "nativeLogFilePath": "filepath",
        "requireSSLConnection": true,
        "autoDeliveryReceipt": true,
        "useStreamManagement": false,
        "automaticReconnection": true,
      };

      xmppConnection = XmppConnection(param);

      await xmppConnection.start(_onError);
      await xmppConnection.login();
      XmppConnection.addListener(testClass());
      print("problemi di sincronismo $xmppConnection");

    }
    void _onError(Object error) {
      // TODO : Handle the Error event
      print("Error: ${error.toString()}");
    }

  final scrollController = ScrollController().obs;
  final textEditingController = TextEditingController().obs;
  final focusNode = FocusNode().obs;
  RxBool isTextFieldEnable = false.obs;

  void onFieldSubmitted() async {
    if (!isTextFieldEnable.value) { 
    return;}
    chatList.add(Chat.sent(message: textEditingController.value.text));
    print("chatList: ${chatList.length}");
    scrollController.value.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  	await xmppConnection.sendMessageWithType("testdario2@anonym.im", textEditingController.value.text, "MSGID", DateTime.now().millisecondsSinceEpoch);


    textEditingController.value.clear();
    update();
  }

  void messageArrived(String text, String sender)  {
    if(!sender.contains(senderJid)){
      chatList.add(Chat.received(message: text));
    }
    else{
      chatList.add(Chat.sent(message: text));
    }
    print("chatList: ${chatList.length}");
    print("i am arrived");
    scrollController.value.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    update();
  }


  void onFieldChanged(String term) {
    isTextFieldEnable.value = textEditingController.value.text.isNotEmpty;
    update();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    xmppConnection.logout();

    super.onClose();
  }



}

class testClass  with WidgetsBindingObserver implements DataChangeEvents {

  var controller = Get.find<ChatController>();

  @override
  void onChatMessage(MessageChat messageChat){
    if(messageChat.toEventData()['body'] != '' && messageChat.toEventData()['senderJid'] != ''){
        controller.messageArrived(messageChat.toEventData()['body'], messageChat.toEventData()['senderJid']);
    }
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA: ${messageChat.toEventData()['body']} ${messageChat.toEventData()['senderJid']}");
    print("onChatMessage: ${messageChat.toEventData()['body']}");
  }

  @override
  void onGroupMessage(MessageChat messageChat){
    print('onGroupMessage: ${messageChat.toEventData()}');
  }
  
  @override
  void onNormalMessage(MessageChat messageChat){
    if(messageChat.toEventData()['body'] != ''){
        controller.messageArrived(messageChat.toEventData()['body'], messageChat.toEventData()['senderJid']);
    }
    print('onNormalMessage: ${messageChat.toEventData()}');
  }

  @override
  void onPresenceChange(PresentModel presentModel){
    print('onPresenceChange ~~>>${presentModel.toJson()}');
  }

  @override
  void onChatStateChange(ChatState chatState) {
    print('onChatStateChange ~~>>$chatState');
  }

  @override
  void onConnectionEvents(ConnectionEvent connectionEvent) {
    print('onConnectionEvents ~~>>${connectionEvent.toJson()}');
  }


  @override
  void onSuccessEvent(SuccessResponseEvent successResponseEvent) {
    print(
        'receiveEvent successEventReceive: ${successResponseEvent.toSuccessResponseData().toString()}');
  }

  @override
  void onXmppError(ErrorResponseEvent errorResponseEvent) {
    print(
        'receiveEvent onXmppError: ${errorResponseEvent.toErrorResponseData().toString()}');
  }


}
