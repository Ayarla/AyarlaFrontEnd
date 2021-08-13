import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/virtual_data_base/manager_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';

class ManagerInformationMessagePage extends StatefulWidget {
  static const String id = "ManagerInformationMessagePage";

  @override
  _ManagerNotesPageState createState() => _ManagerNotesPageState();
}

class _ManagerNotesPageState extends State<ManagerInformationMessagePage> {
  String messageContent = "";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
        centerTitle: true,
        showIconButton: false,
        color: Colors.grey,
        childrenColor: Colors.white,
        title: Text(
          'Bilgilendirme Mesajı',
          textAlign: TextAlign.center,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
        // showIconButton: false,
      ).build(context),
      body: AyarlaPage(
        child: Column(
          children: <Widget>[
            (Provider.of<ManagerData>(context, listen: false).managerInformationMessage != null)
                ? Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Bilgilendirme Mesajınız:",
                                    style: kSmallTextStyle.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    Provider.of<ManagerData>(context, listen: false)
                                        .managerInformationMessage,
                                    style: kSmallTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Button(
                          size: size,
                          buttonContent: "Sil",
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              Provider.of<ManagerData>(context, listen: false)
                                  .managerInformationMessage = null;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Kuaförüm sayfasında göstermek istediğiniz bir bilgilendirme mesajı giriniz',
                      style: kSmallTextStyle,
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    maxLength: 260,
                    style: kSmallTextStyle,
                    initialValue: Provider.of<ManagerData>(context, listen: false)
                            .managerInformationMessage ??
                        messageContent,
                    onChanged: (value) {
                      setState(() {
                        messageContent = value;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    autofocus: true,
                    maxLines: 7,
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
                      hintText: "Bilgilendirme Mesajınızı Yazınız...",
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(height: 10),

                  /// if string is empty, or null, or contains only whitespace
                  /// bool blank = s?.trim()?.isEmpty ?? true; this format
                  /// bool blank = s == null || s.trim() == ''; same
                  (messageContent?.trim()?.isNotEmpty ?? false)
                      ? Button(
                          size: size,
                          buttonContent: "Kaydet",
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              Provider.of<ManagerData>(context, listen: false)
                                      .managerInformationMessage =

                                  /// in order to remove whitespace in the text
                                  messageContent.trimLeft();
                            });
                          },
                        )
                      : SizedBox(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.color,
    @required this.buttonContent,
    @required this.onPressed,
    @required this.size,
  }) : super(key: key);

  final Size size;
  final String buttonContent;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      width: size.width < 650 ? size.width / 3 : 200,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              buttonContent,
              style: kTextStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
