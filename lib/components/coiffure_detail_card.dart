import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/comment.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/components/rating_row.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/screens/comments_page.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:ayarla/virtual_data_base/dynamic_links_service.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'map.dart';
import 'package:ayarla/screens/gallery_page.dart';
import '../constants/constants.dart';
import 'imageListItem.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:share/share.dart';

import 'overScroll.dart';

class CoiffureDetailCard extends StatefulWidget {
  final Function onPressed;
  final CoiffureModel coiffureModel;

  CoiffureDetailCard({this.onPressed, this.coiffureModel});

  @override
  _CoiffureDetailCardState createState() => _CoiffureDetailCardState();
}

class _CoiffureDetailCardState extends State<CoiffureDetailCard> {
  bool pressed = false;
  int _currentPage = 0;
  int autoChangeSeconds = 6;
  String firstHalf;
  String secondHalf;
  bool flag = true;
  bool leftArrow = false;
  String text;

  final ScrollController _scrollControllerEmployee = ScrollController();

  final ScrollController _photoController = ScrollController();

  final DynamicLinkService _dynamicLinkService = DynamicLinkService();

  @override
  initState() {
    super.initState();

    /// Getting the coiffure name for appbar.
    Provider.of<AppointmentData>(context, listen: false)
        .setName(widget.coiffureModel.name);
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
  }

  final List<ImageListItem> _pages = pages;

  bool isClicked = false;

  /// returns the index of the service
  int findIndex(ServiceModel x) {
    return Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices
        .indexOf(x);
  }

  @override
  Widget build(BuildContext context) {
    int total = Provider.of<AppointmentData>(context, listen: true).total;

    return Container(
      child: ListView(
        controller: _photoController,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                bottom: 16.0, left: 10.0, right: 10.0, top: 16.0),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: kCardShadow,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CarouselSlider(
                            items: _pages,
                            options: CarouselOptions(
                                viewportFraction: 1,
                                autoPlayInterval:
                                    Duration(seconds: autoChangeSeconds),
                                autoPlay: true,
                                enableInfiniteScroll: false,
                                aspectRatio: 1.6,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                }),
                          ),
                        ),
                      ),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GalleryPage(index: _currentPage),
                          ),
                        );
                      },

                      ///stops passing the pages automatically
                      onLongPress: () {
                        setState(() {
                          pressed = true;
                        });
                      },
                      onLongPressUp: () {
                        setState(() {
                          pressed = false;
                        });
                      },
                    ),

                    /// dot indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _pages.map((url) {
                        int index = _pages.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 0.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                /// Icon row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 40,
                          icon: Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            launch("tel://${widget.coiffureModel.telephone}");
                          },
                        ),
                        Text(
                          "Ara",
                          style: kSmallTextStyle.copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 40,
                          icon: Icon(
                            Provider.of<AppointmentData>(context, listen: false)
                                    .favorites
                                    .contains(widget.coiffureModel)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              if( Provider.of<AppointmentData>(context,
                                  listen: false)
                                  .myState != null) {
                                Provider.of<AppointmentData>(context,
                                    listen: false)
                                    .myState
                                    .setState(() {});
                              }
                              Provider.of<AppointmentData>(context,
                                      listen: false)
                                  .setOrChangeFav(widget.coiffureModel);
                            });
                          },
                        ),
                        Text(
                          "Favori",
                          style: kSmallTextStyle.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FutureBuilder<Uri>(
                            future: _dynamicLinkService.createDynamicLink(
                                widget.coiffureModel.uniqueId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Uri uri = snapshot.data;
                                return IconButton(
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.ios_share,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    Share.share(
                                      uri.toString(),

                                      /// subject for email
                                      subject: widget.coiffureModel.name,
                                    );
                                  },
                                );
                              } else {
                                return Container();
                              }
                            }),
                        Text(
                          "Paylaş",
                          style: kSmallTextStyle.copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),

                /// Ratings
                Text(
                  "Hakkında",
                  style: kTitleStyle,
                ),
                // RatingRow(
                //   number: widget.coiffureModel.star,
                //   comment: widget.coiffureModel.comments,
                // ),

                /// Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      size: 12,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${widget.coiffureModel.city}, ${widget.coiffureModel.district}',
                      style: kSmallTextStyle.copyWith(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),

                /// Working hours
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.access_time,
                        color: Colors.grey.withOpacity(0.8), size: 20),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        widget.coiffureModel.time,
                        style: kSmallTextStyle.copyWith(
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),

                /// About text
                Container(
                  child: secondHalf.isEmpty
                      ? Text(
                          firstHalf,
                          style: kSmallTextStyle,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              flag
                                  ? (firstHalf + "...")
                                  : (firstHalf + secondHalf),
                              style: kSmallTextStyle,
                            ),
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    flag ? "daha fazla" : "daha az",
                                    style: kSmallTextStyle.copyWith(
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                            ),
                          ],
                        ),
                ),

                ///Hizmetler
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hizmetler', style: kTitleStyle),
                    for (ServiceModel x
                        in Provider.of<AppointmentData>(context, listen: false)
                            .fullTimeServices)
                      Card(
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: x.name.length >= 17
                                        ? FittedBox(
                                            fit: BoxFit.cover,
                                            child: Text(x.name,
                                                style: kTextStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          )
                                        : Text(x.name,
                                            style: kTextStyle.copyWith(
                                                fontWeight: FontWeight.normal)),
                                  ),
                                  Spacer(),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: "${x.price} TL".length >= 9
                                        ? FittedBox(
                                            fit: BoxFit.cover,
                                            child: Text(
                                              "${x.price} TL",
                                              style: kTextStyle.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        : Text(
                                            "${x.price} TL",
                                            style: kTextStyle.copyWith(
                                                fontWeight: FontWeight.normal),
                                            textAlign: TextAlign.end,
                                          ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.width / 7,
                                    child: IconButton(
                                      icon: Icon(Icons.exposure_minus_1),
                                      color: Colors.black,
                                      onPressed: () {
                                        /// Add or subtract Service and calculate
                                        /// price
                                        setState(() {
                                          Provider.of<AppointmentData>(context,
                                                  listen: false)
                                              .changeSelectedService(
                                                  findIndex(x));
                                        });
                                        Provider.of<AppointmentData>(context,
                                                listen: false)
                                            .calculateTotalPrice();
                                      },
                                      // child: Icon(
                                      //   Provider.of<AppointmentData>(context,
                                      //               listen: true)
                                      //           .fullTimeServices[findIndex(x)]
                                      //           .selected
                                      //       ? Icons.remove
                                      //       : Icons.add,
                                      //   size: 25,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),

                              /// opens the employee row if service selected
                              if (x.selected)
                                Stack(children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.width / 5.3,
                                    child: ListView.builder(
                                        itemCount: Provider.of<AppointmentData>(
                                                context,
                                                listen: true)
                                            .fullTimeServices[findIndex(x)]
                                            .employees
                                            .length,
                                        scrollDirection: Axis.horizontal,

                                        ///controller hizmete özel olmalı !!!
                                        ///controller: _scrollControllerServices,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return FlatButton(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: Provider.of<
                                                                AppointmentData>(
                                                            context,
                                                            listen: true)
                                                        .fullTimeServices[
                                                            findIndex(x)]
                                                        .employees[index]
                                                        .selected
                                                    ? Provider.of<AppointmentData>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .fullTimeServices[
                                                                    findIndex(
                                                                        x)]
                                                                .employees[
                                                                    index]
                                                                .gender ==
                                                            "female"
                                                        ? LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [
                                                              Color(0xFFffa7ca),
                                                              Color(0xFFca7799)
                                                            ],
                                                          )
                                                        : LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [
                                                              Color(0xFF40ace1),
                                                              Color(0xFF3f6eb6)
                                                            ],
                                                          )
                                                    : null,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 4.0),
                                                child: Container(
                                                  width: 90,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              20,
                                                          image: AssetImage(
                                                            Provider.of<AppointmentData>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .fullTimeServices[
                                                                    findIndex(
                                                                        x)]
                                                                .employees[
                                                                    index]
                                                                .image,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      FittedBox(
                                                          child: Text(
                                                            Provider.of<AppointmentData>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .fullTimeServices[
                                                                    findIndex(
                                                                        x)]
                                                                .employees[
                                                                    index]
                                                                .name,
                                                            style:
                                                                kSmallTextStyle
                                                                    .copyWith(
                                                              color: Provider.of<
                                                                              AppointmentData>(
                                                                          context,
                                                                          listen:
                                                                              true)
                                                                      .fullTimeServices[
                                                                          findIndex(
                                                                              x)]
                                                                      .employees[
                                                                          index]
                                                                      .selected
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                          fit: BoxFit.cover)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Provider.of<AppointmentData>(
                                                      context,
                                                      listen: false)
                                                  .changeSelectedEmployee(
                                                      findIndex(x), index);
                                            },
                                          );
                                        }),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 10,
                                    child: Icon(!leftArrow
                                        ? Icons.keyboard_arrow_right
                                        : Icons.keyboard_arrow_left),
                                  )
                                ]),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),

                ///EmployeeList row
                Text('Personeller', style: kTextStyle),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.width / 5.5,
                        child: OverScroll(
                          child: ListView.builder(
                              itemCount: Provider.of<AppointmentData>(context,
                                      listen: true)
                                  .employeesList
                                  .length,
                              scrollDirection: Axis.horizontal,
                              controller: _scrollControllerEmployee,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    width: 90,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20,
                                            image: AssetImage(
                                              Provider.of<AppointmentData>(
                                                      context,
                                                      listen: true)
                                                  .employeesList[index]
                                                  .image,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        FittedBox(
                                          fit: BoxFit.cover,
                                          child: Text(
                                            Provider.of<AppointmentData>(
                                                    context,
                                                    listen: true)
                                                .employeesList[index]
                                                .name,
                                            style: kSmallTextStyle.copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )),
                    Positioned(
                      right: 0,
                      top: 10,
                      child: Icon(!leftArrow
                          ? Icons.keyboard_arrow_right
                          : Icons.keyboard_arrow_left),
                    ),
                  ],
                ),

                /// Yorumlar
                Row(
                  children: [
                    Text(
                      'Yorumlar',
                      style: kTextStyle,
                    ),
                    Spacer(),
                    TextButton(
                      child: Text('Tümünü Gör',
                          style: kTextStyle.copyWith(
                              fontSize: 12, color: Colors.blue)),
                      onPressed: () {
                        Navigator.pushNamed(context, CommentsPage.id);
                      },
                    )
                  ],
                ),

                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    // autoPlay: true,
                  ),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Comment(
                              name: 'Fatih Özkan',
                              rating: 2,
                              comment: 'Harika!!',
                              image: 'assets/worker_1.png',
                              date: '21.10.2018',
                              like: 5,
                              dislike: 0,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Comment(
                              name: 'Nixu',
                              rating: 2,
                              comment:
                                  'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
                                  'Uzun uzun anlatayım bir şeylerrrr.'
                                  'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
                                  'Uzun uzun anlatayım bir şeylerrrr.'
                                  'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
                                  'Uzun uzun anlatayım bir şeylerrrr.',
                              image: 'assets/worker_1.png',
                              date: '21.10.2020',
                              like: 9,
                              dislike: 4,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Comment(
                              name: 'Bahadır İren',
                              rating: 3,
                              comment:
                                  'Daha iyilerini görmüştüm ama idare eder. '
                                  'Ben de uzun bir yorum yazmak istiyorum.'
                                  'Ben de uzun bir yorum yazmak istiyorum.'
                                  'Ben de uzun bir yorum yazmak istiyorum.'
                                  'Ben de uzun bir yorum yazmak istiyorum.'
                                  'Ben de uzun bir yorum yazmak istiyorum.'
                                  'Ben de uzun bir yorum yazmak istiyorum.',
                              image: 'assets/worker_2.jpg',
                              date: '21.02.2021',
                              like: 13,
                              dislike: 1,
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),

                ///İletişim
                Wrap(
                  runSpacing: 10,
                  children: [
                    Text(
                      'İletişim',
                      style: kTextStyle,
                    ),
                    Text(
                      widget.coiffureModel.address,
                      style: kSmallTextStyle,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Telefon: ',
                          style: kSmallTextStyle,
                        ),
                        Icon(Icons.call, size: 20, color: Colors.green),
                        TextButton(
                          child: Text(
                            widget.coiffureModel.telephone,
                            style: kSmallTextStyle.copyWith(color: Colors.blue),
                          ),
                          onPressed: () {
                            launch("tel://${widget.coiffureModel.telephone}");
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                /// Map
                // Container(
                //   height: 320,
                //   child: MapSample(
                //     clickable: false,
                //   ),
                // ),
              ],
            ),
          ),

          /// create enough space for map
          total != 0
              ? SizedBox(height: MediaQuery.of(context).size.width / 7)
              : SizedBox(height: 0),
        ],
      ),
    );
  }
}
