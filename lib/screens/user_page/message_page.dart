import 'package:flutter/material.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';

class UserMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        showIconButton: false,
        color: Colors.grey,
        title: Text(
          'Mesajlarım',
          style: kTitleStyle.copyWith(color: Colors.white),
        ),
      ).build(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: <Widget>[
              /// TODO listeden cagirabiliriz
              MessageCard(
                message: "30 TL indirim kuponu",
                backgroundColor: Colors.lightBlueAccent.shade400,
                sender: "Ayarla Ekibi",
                fromAyarla: true,
              ),
              MessageCard(
                message: "indirim kuponu",
                backgroundColor: Colors.deepOrangeAccent,
                sender: "Ahmet Kuafor",
                fromAyarla: false,
              ),
              MessageCard(
                message: "indirim kuponu",
                backgroundColor: Colors.lightBlueAccent.shade400,
                sender: "Ayarla Ekibi",
                fromAyarla: true,
              ),
              MessageCard(
                message: "30 TL indirim kuponu",
                backgroundColor: Colors.lightBlueAccent.shade400,
                sender: "Ayarla Ekibi",
                fromAyarla: true,
              ),
              MessageCard(
                message: "indirim kuponu",
                backgroundColor: Colors.deepOrangeAccent,
                sender: "Ahmet Kuafor",
                fromAyarla: false,
              ),
              MessageCard(
                message: "indirim kuponu",
                backgroundColor: Colors.lightBlueAccent.shade400,
                sender: "Ayarla Ekibi",
                fromAyarla: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final String sender;
  final bool fromAyarla;

  MessageCard(
      {this.fromAyarla, this.message, this.backgroundColor, this.sender});
  @override
  Widget build(BuildContext context) {
    /// TODO yazilan mesaji yollama kismi yapilacak
    String typedMessage;
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        typedMessage = UserMessagePopUp().userMessagePopUp(
            context: context, message: message, fromAyarla: fromAyarla);
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: size.width,
          height: size.width / 3.6,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 15,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gönderen $sender",
                      style: kTextStyle.copyWith(fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        message,
                        style: kSmallTextStyle,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserMessagePopUp {
  String userMessagePopUp(
      {BuildContext context, String message, bool fromAyarla}) {
    String _typedMessage;
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 20),
          actionsPadding: EdgeInsets.only(right: 10),
          backgroundColor: Color(0xFFE5EBEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          title: Center(
            child: Text(
              'Mesaj',
              style: kSmallTitleStyle,
            ),
          ),
          content: fromAyarla
              ? Text(
                  message,
                  style: kSmallTextStyle,
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        message,
                        style: kSmallTextStyle,
                      ),
                      SizedBox(height: 15),
                      TextField(
                        style: kSmallTextStyle,
                        onChanged: (value) {
                          _typedMessage = value;
                        },
                        keyboardType: TextInputType.multiline,
                        autofocus: true,
                        maxLines: 8,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: kSmallTextStyle,
                          hintText: "Mesajınızı yazınız...",
                          fillColor: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
          actions: <Widget>[
            fromAyarla
                ? TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Tamam",
                      style: kSmallTextStyle.copyWith(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                : Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Geri Dön",
                          style: kSmallTextStyle.copyWith(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          /// TODO mesaj gonderme yapilacak
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Gönder",
                          style: kSmallTextStyle.copyWith(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
          ],
        );
      },
    );
    return _typedMessage;
  }
}
