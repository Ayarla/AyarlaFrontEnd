import 'package:ayarla/components/UI/genericRow.dart';
import 'package:ayarla/components/floatingButton.dart';
import 'package:ayarla/components/imageListItem.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/screens/coiffure_detail_page/AboutSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/CommentsSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/ContactSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/IconsRow.dart';
import 'package:ayarla/screens/coiffure_detail_page/ImageSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/RatingRow.dart';
import 'package:ayarla/screens/coiffure_detail_page/SmallLocationSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/WorkingHoursSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/EmployeeRow.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class CoiffureDetailPage extends StatefulWidget {
  final CoiffureModel coiffureModel;
  final String name;
  CoiffureDetailPage({this.coiffureModel, this.name});

  @override
  _CoiffureDetailPageState createState() => _CoiffureDetailPageState();
}

class _CoiffureDetailPageState extends State<CoiffureDetailPage> {
  int _currentPage = 0;
  String firstHalf;
  String secondHalf;
  bool flag = true;
  bool leftArrow = false;
  String text;

  final List<ImageListItem> _pages = images;
  final ScrollController _scrollControllerEmployee = ScrollController();
  final ScrollController _photoController = ScrollController();

  /// returns the index of the service
  int findIndex(ServiceModel x) {
    return Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices
        .indexOf(x);
  }

  @override
  void initState() {
    text = '${widget.coiffureModel.text}';

    if (text.length > 90) {
      firstHalf = text.substring(0, 90);
      secondHalf = text.substring(90, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }

    /// checking whether the arrow of the employee row of employee section
    /// reaches the max scroll extent.
    _scrollControllerEmployee.addListener(() {
      if (_scrollControllerEmployee.position.pixels ==
          _scrollControllerEmployee.position.maxScrollExtent) {
        setState(() {
          leftArrow = true;
        });
      } else if (_scrollControllerEmployee.position.pixels ==
          _scrollControllerEmployee.position.minScrollExtent) {
        setState(() {
          leftArrow = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int total = Provider.of<AppointmentData>(context, listen: true).total;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        gradient: Functions().decideColor(context),
        title: TextOverFlowHandler(
            child: Text(widget.coiffureModel.name,
                style: kTitleStyle.copyWith(color: Colors.white))),
      ).build(context),
      body: OverScroll(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: 16.0,
              left: size.width / 30,
              right: size.width / 30,
              top: 16.0),
          child: OverScroll(
            child: ListView(
              shrinkWrap: true,
              controller: _photoController,
              children: <Widget>[
                ImageSection(pages: _pages, currentPage: _currentPage),

                /// TODO - rework
                IconsRow(coiffureModel: widget.coiffureModel),

                Text("Hakkında", style: kTitleStyle),
                Column(
                  children: [
                    RatingRow(
                        rating: widget.coiffureModel.star.toInt(),
                        commentNumber:
                            widget.coiffureModel.comments.toString()),
                    SizedBox(height: 10),
                    SmallLocationSection(coiffureModel: widget.coiffureModel),
                    SizedBox(height: 10),
                    WorkingHoursSection(coiffureModel: widget.coiffureModel),
                    SizedBox(height: 10),
                    AboutSection(firstHalf: firstHalf, secondHalf: secondHalf),
                  ],
                ),

                ///Hizmetler
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hizmetler', style: kTitleStyle),
                    for (ServiceModel x
                        in Provider.of<AppointmentData>(context, listen: false)
                            .fullTimeServices)
                      GenericRow(
                        leading: Text(x.name,
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.normal)),
                        useFirstSpacer: true,
                        body: Row(
                          children: [
                            Text(x.price.toString(),
                                style: kTextStyle.copyWith(
                                    fontWeight: FontWeight.normal)),
                            Text(" ₺", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        spaceBetween: 20,
                        trailing: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            /// Add or subtract Service and calculate
                            /// price
                            setState(() {
                              Provider.of<AppointmentData>(context,
                                      listen: false)
                                  .changeSelectedService(findIndex(x));
                            });
                            Provider.of<AppointmentData>(context, listen: false)
                                .calculateTotalPrice();
                          },
                          icon: Icon(
                            Provider.of<AppointmentData>(context, listen: true)
                                    .fullTimeServices[findIndex(x)]
                                    .selected
                                ? Icons.remove
                                : Icons.add,
                            size: 25,
                          ),
                        ),
                      ),
                  ],
                ),
                // x.selected ?
                //   Stack(children: [
                //     Container(
                //       height:
                //           MediaQuery.of(context).size.width / 5.3,
                //       child: ListView.builder(
                //           itemCount: Provider.of<AppointmentData>(
                //                   context,
                //                   listen: true)
                //               .fullTimeServices[findIndex(x)]
                //               .employees
                //               .length,
                //           scrollDirection: Axis.horizontal,
                //
                //           ///controller hizmete özel olmalı !!!
                //           ///controller: _scrollControllerServices,
                //           itemBuilder:
                //               (BuildContext context, int index) {
                //             return FlatButton(
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                   gradient: Provider.of<
                //                                   AppointmentData>(
                //                               context,
                //                               listen: true)
                //                           .fullTimeServices[
                //                               findIndex(x)]
                //                           .employees[index]
                //                           .selected
                //                       ? Provider.of<AppointmentData>(
                //                                       context,
                //                                       listen: true)
                //                                   .fullTimeServices[
                //                                       findIndex(x)]
                //                                   .employees[index]
                //                                   .gender ==
                //                               "female"
                //                           ? LinearGradient(
                //                               begin: Alignment
                //                                   .centerLeft,
                //                               end: Alignment
                //                                   .centerRight,
                //                               colors: [
                //                                 Color(0xFFffa7ca),
                //                                 Color(0xFFca7799)
                //                               ],
                //                             )
                //                           : LinearGradient(
                //                               begin: Alignment
                //                                   .centerLeft,
                //                               end: Alignment
                //                                   .centerRight,
                //                               colors: [
                //                                 Color(0xFF40ace1),
                //                                 Color(0xFF3f6eb6)
                //                               ],
                //                             )
                //                       : null,
                //                   borderRadius:
                //                       BorderRadius.circular(10),
                //                 ),
                //                 child: Padding(
                //                   padding:
                //                       const EdgeInsets.symmetric(
                //                           horizontal: 8.0,
                //                           vertical: 4.0),
                //                   child: Container(
                //                     width: 90,
                //                     child: Column(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                       children: [
                //                         ClipRRect(
                //                           borderRadius:
                //                               BorderRadius.circular(
                //                                   10),
                //                           child: Image(
                //                             height: MediaQuery.of(
                //                                         context)
                //                                     .size
                //                                     .height /
                //                                 20,
                //                             image: AssetImage(
                //                               Provider.of<AppointmentData>(
                //                                       context,
                //                                       listen: true)
                //                                   .fullTimeServices[
                //                                       findIndex(x)]
                //                                   .employees[index]
                //                                   .image,
                //                             ),
                //                           ),
                //                         ),
                //                         Spacer(),
                //                         FittedBox(
                //                             child: Text(
                //                               Provider.of<AppointmentData>(
                //                                       context,
                //                                       listen: true)
                //                                   .fullTimeServices[
                //                                       findIndex(x)]
                //                                   .employees[index]
                //                                   .name,
                //                               style: kSmallTextStyle
                //                                   .copyWith(
                //                                 color: Provider.of<
                //                                                 AppointmentData>(
                //                                             context,
                //                                             listen:
                //                                                 true)
                //                                         .fullTimeServices[
                //                                             findIndex(
                //                                                 x)]
                //                                         .employees[
                //                                             index]
                //                                         .selected
                //                                     ? Colors.white
                //                                     : Colors.black,
                //                               ),
                //                             ),
                //                             fit: BoxFit.cover)
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               onPressed: () {
                //                 Provider.of<AppointmentData>(
                //                         context,
                //                         listen: false)
                //                     .changeSelectedEmployee(
                //                         findIndex(x), index);
                //               },
                //             );
                //           }),
                //     ),
                //     Positioned(
                //       right: 0,
                //       top: 10,
                //       child: Icon(!leftArrow
                //           ? Icons.keyboard_arrow_right
                //           : Icons.keyboard_arrow_left),
                //     )
                //   ])
                //     : null

                Text('Personeller', style: kTextStyle),
                SizedBox(height: 10),
                EmployeeRow(size: size, leftArrow: leftArrow),

                /// Yorumlar
                Row(
                  children: [
                    Text('Yorumlar', style: kTextStyle),
                    Spacer(),
                    TextButton(
                      child: Text('Tümünü Gör',
                          style: kTextStyle.copyWith(
                              fontSize: 12, color: Colors.blue)),
                      onPressed: () {
                        Routers.router
                            .navigateTo(context, "Isletme/:name/Yorumlar");
                      },
                    )
                  ],
                ),

                CommentsSection(),

                ///İletişim
                ContactSection(coiffureModel: widget.coiffureModel),

                /// Map
                // Container(
                //   height: 320,
                //   child: MapSample(
                //     clickable: false,
                //   ),
                // ),
                /// create enough space for map
                total != 0
                    ? SizedBox(height: MediaQuery.of(context).size.width / 7)
                    : SizedBox(height: 0),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: total != 0
          ? Row(
              children: [
                FloatingButton(
                  gradient: Functions().decideColor(context),
                  text: "Toplam = $total",
                ),
                Spacer(),
                FloatingButton(
                  text: "Saati Belirle",
                  gradient: Functions().decideColor(context),
                ),
              ],
            )
          : null,
    );
  }
}
