import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/services/service_user.dart';
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

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with SingleTickerProviderStateMixin {
  Functions functions = Functions();
  List localList = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  // var url = window.location.href;
  // var s = window.location.pathname;
  // print(url);
  // print(s);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Provider.of<UserService>(context, listen: false).redirect(context);
    localList = Provider.of<UserService>(context, listen: true).favorites;
    return Scaffold(
      appBar: DefaultAppBar(
        title: UI.AppBarTitleFavorites(),
        gradient: functions.decideColor(context),
        showIconButton: false,
        centerTitle: true,
      ).build(context),
      body: AyarlaPage(
        child: OverScroll(
          child: localList.isEmpty
              ? Center(child: Text('Henüz bir favoriniz yok', style: kTextStyle))
              : AnimatedList(
                  key: _listKey,
                  initialItemCount: localList.length,
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: (BuildContext buildContext, int index, Animation animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: size.width < 700
                          ? Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              child: GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, "/Isletme/${createURL(localList[index].name.toString())}",
                                    arguments: {localList[index]}),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                                          setState(() {
                                            removeFavorite(index, localList[index]);
                                            Provider.of<UserService>(context, listen: false).setOrChangeFav(localList[index]);
                                          });
                                          FirebaseAnalytics().logEvent(
                                              name: 'favorites_button',
                                              parameters: {'coiffeur': localList[index].name, 'state': 'deleted'});
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
                                    child: IconSlideAction(caption: 'Paylaş', color: Colors.transparent, icon: Icons.share),
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
                                        onTap: () => Navigator.pushNamed(
                                            context, "/Isletme/${createURL(localList[index].name.toString())}",
                                            arguments: {localList[index]}),
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          child: CardInfo(coiffureModel: localList[index]),
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
                                                setState(() {
                                                  removeFavorite(index, localList[index]);
                                                  Provider.of<UserService>(context, listen: false)
                                                      .setOrChangeFav(localList[index]);
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: CircularParent(
                                          radius: 20,
                                          direction: Directions.all,
                                          color: Colors.indigo,
                                          child: IconSlideAction(caption: 'Paylaş', color: Colors.transparent, icon: Icons.share),
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

  void removeFavorite(int index, CoiffureModel coiffureModel) {
    // Timer(Duration(milliseconds: 800), () => localList.removeAt(index));
    _listKey.currentState.removeItem(
      index,
      (BuildContext context, Animation<double> animation) {
        return FadeTransition(
          key: Key('$index'),
          opacity: CurvedAnimation(parent: animation, curve: Interval(0.5, 1.0)),
          child: SizeTransition(
            sizeFactor: CurvedAnimation(parent: animation, curve: Interval(0.2, 1.0)),
            axisAlignment: 0.0,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: CardInfo(coiffureModel: coiffureModel),
            ),
          ),
        );
      },
      duration: Duration(milliseconds: 600),
    );
  }
}
