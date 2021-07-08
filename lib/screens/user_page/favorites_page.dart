import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/screens/coiffure_detail_page/coiffure_detail_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/smallCoiffureCard.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class FavoritesPage extends StatefulWidget {
  static const id = 'FavoritesPage';

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with SingleTickerProviderStateMixin {
  Functions functions = Functions();
  List localList = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void removeFavorite(int index, CoiffureModel coiffureModel) {
    localList.removeAt(index);
    _listKey.currentState.removeItem(
      index,
      (BuildContext context, Animation<double> animation) {
        return FadeTransition(
          opacity:
              CurvedAnimation(parent: animation, curve: Interval(0.5, 1.0)),
          child: SizeTransition(
            sizeFactor:
                CurvedAnimation(parent: animation, curve: Interval(0.2, 1.0)),
            axisAlignment: 0.0,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: CardInfo(coiffureModel: coiffureModel),
            ),
          ),
        );
      },
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void initState() {
    localList = Provider.of<AppointmentData>(context, listen: false).favorites;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
        title: UI.AppBarTitleFavorites(),
        gradient: functions.decideColor(context),
        showIconButton: false,
        centerTitle: true,
      ).build(context),
      body: AyarlaPage(
        child: OverScroll(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: localList.length,
            padding: const EdgeInsets.all(10.0),
            itemBuilder:
                (BuildContext buildContext, int index, Animation animation) {
              return FadeTransition(
                opacity: animation,
                child: size.width < 700
                    ? Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: GestureDetector(
                          onTap: () {
                            Routers.router.navigateTo(
                              context,
                              "/Isletme/:name",
                              routeSettings: RouteSettings(
                                name:
                                    "/Isletme/${createURL(localList[index].name.toString())}",
                                arguments: CoiffureDetailPage(
                                    coiffureModel: localList[index]),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: CardInfo(coiffureModel: localList[index]),
                          ),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: CircularParent(
                              radius: 20,
                              direction: Directions.all,
                              color: Colors.red,
                              child: IconSlideAction(
                                  caption: 'Kaldır',
                                  color: Colors.transparent,
                                  icon: Icons.delete,
                                  onTap: () {
                                    if (Provider.of<AppointmentData>(context,
                                            listen: false)
                                        .myState
                                        .mounted) {
                                      Provider.of<AppointmentData>(context,
                                              listen: false)
                                          .myState
                                          .setState(() {});
                                    }
                                    setState(() {
                                      removeFavorite(index, localList[index]);
                                    });
                                    FirebaseAnalytics().logEvent(name: 'favorites_button',
                                        parameters:{'coiffeur': localList[index].name, 'state': 'deleted'});
                                  }),
                            ),
                          ),
                        ],
                        secondaryActions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: CircularParent(
                              radius: 20,
                              direction: Directions.all,
                              color: Colors.indigo,
                              child: IconSlideAction(
                                caption: 'Paylaş',
                                color: Colors.transparent,
                                icon: Icons.share,
                                // onTap: () => _showSnackBar('More'),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: SizedBox(
                          width: size.width > 900 ? size.width / 1.3 : size.width,
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    Routers.router.navigateTo(
                                      context,
                                      "/Isletme/:name",
                                      routeSettings: RouteSettings(
                                        name:
                                            "/Isletme/${createURL(localList[index].name.toString())}",
                                        arguments: CoiffureDetailPage(
                                            coiffureModel: localList[index],
                                      ),
                                    ),);
                                  },
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    child:
                                        CardInfo(coiffureModel: localList[index]),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircularParent(
                                    radius: 20,
                                    direction: Directions.all,
                                    color: Colors.red,
                                    child: IconSlideAction(
                                        caption: 'Kaldır',
                                        color: Colors.transparent,
                                        icon: Icons.delete,
                                        onTap: () {
                                          if (Provider.of<AppointmentData>(
                                                  context,
                                                  listen: false)
                                              .myState
                                              .mounted) {
                                            Provider.of<AppointmentData>(context,
                                                    listen: false)
                                                .myState
                                                .setState(() {});
                                          }
                                          setState(() {
                                            removeFavorite(
                                                index, localList[index]);
                                          });
                                        }),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CircularParent(
                                    radius: 20,
                                    direction: Directions.all,
                                    color: Colors.indigo,
                                    child: IconSlideAction(
                                      caption: 'Paylaş',
                                      color: Colors.transparent,
                                      icon: Icons.share,
                                      // onTap: () => _showSnackBar('More'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
