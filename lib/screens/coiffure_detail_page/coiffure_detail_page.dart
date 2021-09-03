import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/components/map/flutterMap.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/pop-up.dart';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/screens/coiffure_detail_page/AboutSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/CommentsSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/ContactSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/IconsRow.dart';
import 'package:ayarla/screens/coiffure_detail_page/ImageSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/ServicesSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/EmployeeRow.dart';
import 'package:ayarla/virtual_data_base/manager_data.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:toast/toast.dart';

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
    serviceList.clear();
    employeeList.clear();
    Provider.of<AppointmentService>(context, listen: false).serviceList.clear();
    Provider.of<AppointmentService>(context, listen: false).employeeList.clear();
    Provider.of<AppointmentService>(context, listen: false).currentAppointment =
        Appointment(appointmentDetails: []);
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
    total = Provider.of<AppointmentService>(context, listen: true).currentAppointment.totalPrice;
    if (Provider.of<ManagerData>(context).managerInformationMessage?.isNotEmpty ?? false) {
      Future.delayed(
        Duration.zero,
        () => PopUp().managerInformationMessagePopUp(
            context: context,
            message: Provider.of<ManagerData>(context, listen: false).managerInformationMessage),
      );
    }
    return widget.coiffureModel == null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitDoubleBounce(itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                    decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index.isEven ? Colors.grey : Colors.blueGrey,
                ));
              }),
              Text('İstediğiniz Sayfayı Hazırlıyoruz!', style: kTextStyle),
            ],
          )
        : Scaffold(
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
                        AboutSection(coiffureModel: widget.coiffureModel),
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
                              onPressed: () => Navigator.pushNamed(
                                context,
                                '/Isletme/${fixTurkishCharacters(createURL(coiffureList[0].name))}/Yorumlar',
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        CommentsSection(),
                        ContactSection(coiffureModel: widget.coiffureModel),
                        SizedBox(height: 5),
                        FlutterMapCoiffure(),

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
                            Provider.of<AppointmentService>(context, listen: false)
                                .currentAppointment
                                .coiffureName = widget.coiffureModel.name;

                            ///
                            if (employeeList.length != serviceList.length ||
                                employeeList.contains(null)) {
                              Toast.show(
                                "Lütfen Çalışan Seçiniz",
                                context,
                                duration: 2,
                                backgroundColor: Colors.red[200],
                              );
                            } else if (employeeList.length == serviceList.length &&
                                !employeeList.contains(null)) {
                              Provider.of<AppointmentService>(context, listen: false).employeeList =
                                  employeeList;
                              Provider.of<AppointmentService>(context, listen: false)
                                  .appointmentAddHandler();
                              Navigator.pushNamed(context, '/SaatSecimi');
                            }
                          },
                        ),
                      ],
                    ),
                  )
                : null,
          );
  }
}
