import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/business_info_page.dart';
import 'package:ayarla/virtual_data_base/manager_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';

class ManagerSendMessage extends StatefulWidget {
  @override
  _ManagerSendMessageState createState() => _ManagerSendMessageState();
}

class _ManagerSendMessageState extends State<ManagerSendMessage> {
  final messageTextController = TextEditingController();
  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        showIconButton: false,
        color: Colors.grey,
        childrenColor: Colors.white,
        title: Text(
          'Mesaj Yolla',
          style: kTitleStyle.copyWith(color: Colors.white),
        ),
        // showIconButton: false,
      ).build(context),
      body: Unfocuser(
        child: AyarlaPage(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ListView(
                  reverse: true,
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),

                  /// reverse
                  children:
                      Provider.of<ManagerData>(context, listen: false).messages.reversed.toList(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          message = value;
                        },
                        style: kSmallTextStyle,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          hintText: 'Mesajınızı yazınız...',
                          hintStyle: kSmallTextStyle,
                          border: InputBorder.none,
                          fillColor: Colors.grey.shade200,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        messageTextController.clear();
                        setState(() {
                          Provider.of<ManagerData>(context, listen: false).messages.add(
                                MessageBubble(text: message),
                              );
                        });
                      },
                      child: Text('Yolla', style: kSmallTextStyle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  MessageBubble({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
                style: kSmallTextStyle.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
