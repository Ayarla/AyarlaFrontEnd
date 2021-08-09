import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/components/map/flutterMap.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/pop-up.dart';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/screens/calender_page.dart';
import 'package:ayarla/screens/coiffure_detail_page/AboutSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/CommentsSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/ContactSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/IconsRow.dart';
import 'package:ayarla/screens/coiffure_detail_page/ImageSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/ServicesSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/EmployeeRow.dart';
import 'package:ayarla/screens/comments_page.dart';
import 'package:ayarla/screens/manager_screens/manager_info_message_page.dart';
import 'package:ayarla/virtual_data_base/manager_data.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class CoiffureDetailPage extends StatefulWidget {
  final CoiffureModel coiffureModel;
  CoiffureDetailPage({this.coiffureModel});
  @override
  _CoiffureDetailPageState createState() => _CoiffureDetailPageState();
}

class _CoiffureDetailPageState extends State<CoiffureDetailPage> {
  List<ImageListItem> _pages = images;
  ScrollController _listViewController = ScrollController();
  int total = 0;

  @override
  void initState() {
    Provider.of<AppointmentData>(context, listen: false).currentAppointment = Appointment(
      coiffureName: '',
      totalPrice: 0,
      isConfirmedByUser: false,
      isConfirmedByCoiffure: false,
      date: '',
      hour: '',
      appointmentDetails: [],
    );
    super.initState();
  }

  @override
  void dispose() {
    _listViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TextStyle _titleStyle = kTitleStyle.copyWith(fontSize: width <= 400 ? width / 20 : 20);
    TextStyle _textStyle = kTextStyle.copyWith(fontSize: width <= 400 ? width / 20 : 20);
    total = Provider.of<AppointmentData>(context, listen: true).currentAppointment.totalPrice;

    /// if manager sent an information message it will be shown directly once the coiffure page opens
    if (Provider.of<ManagerData>(context).managerInformationMessage?.isNotEmpty ?? false) {
      Future.delayed(
        Duration.zero,
        () => PopUp().managerInformationMessagePopUp(
            context: context,
            message: Provider.of<ManagerData>(context, listen: false).managerInformationMessage),
      );
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        gradient: Functions().decideColor(context),
        title: Center(
          child: TextOverFlowHandler(
              child: Text(widget.coiffureModel.name,
                  style: kTitleStyle.copyWith(color: Colors.white))),
        ),
      ).build(context),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        children: [
          AyarlaPage(
            child: OverScroll(
              child: ListView(
                shrinkWrap: true,
                controller: _listViewController,
                children: <Widget>[
                  ImageSection(pages: _pages),
                  SizedBox(height: 10),
                  IconsRow(coiffureModel: widget.coiffureModel),
                  Text("Hakkında", style: _titleStyle),
                  AboutSection(widget.coiffureModel, controller: _listViewController),
                  SizedBox(height: 5),
                  ServicesSection(),
                  SizedBox(height: 10),
                  Text('Personeller', style: _textStyle),
                  SizedBox(height: 10),
                  EmployeeRow(),
                  Row(
                    children: [
                      Text('Yorumlar', style: _textStyle),
                      Spacer(),
                      TextButton(
                        child: Text('Tümünü Gör',
                            style: kTextStyle.copyWith(fontSize: 12, color: Colors.blue)),
                        onPressed: () {
                          Routers.router.navigateTo(
                            context,
                            "/Isletme/:name/Yorumlar",
                            routeSettings: RouteSettings(
                              name:
                                  "/Isletme/${createURL(fixTurkishCharacters(widget.coiffureModel.name))}/Yorumlar",
                              arguments: CommentsPage(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  CommentsSection(),
                  ContactSection(coiffureModel: widget.coiffureModel),
                  SizedBox(height: 5),

                  /// Map
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(height: 320, width: 300, child: FlutterMapCoiffure()),
                  ),

                  /// create enough space for map
                  total != 0
                      ? SizedBox(height: MediaQuery.of(context).size.width / 7)
                      : SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: total != 0
          ? AyarlaPageNoC(
              child: Row(
                children: [
                  FloatingTextButton(text: "Toplam = $total TL"),
                  Spacer(),
                  FloatingTextButton(
                    text: "Saati Belirle",
                    onPressed: () async {
                      Provider.of<AppointmentData>(context, listen: false)
                          .currentAppointment
                          .coiffureName = widget.coiffureModel.name;
                      Provider.of<AppointmentData>(context, listen: false).appointmentAddHandler();
                      Routers.router.navigateTo(context, 'SaatSayfasi');
                    },
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
