import 'package:ayarla/screens/manager_screens/manager_send_message_page.dart';
import 'package:flutter/cupertino.dart';

class ManagerData extends ChangeNotifier {
  String managerInformationMessage;
  List<MessageBubble> messages = [];
}
