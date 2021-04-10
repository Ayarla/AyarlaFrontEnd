import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/smallCoiffureCard.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import '../coiffure_detail_page.dart';

class FavoritesPage extends StatefulWidget {
  static const id = 'FavoritesPage';

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with SingleTickerProviderStateMixin {
  Functions functions = Functions();
  List localList = [];

  void deleteUser(int index, CoiffureModel coiffureModel) {
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

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: UI.appBarTitleFavorites,
        gradient: functions.decideColor(context),
        showIconButton: false,
      ).build(context),
      body: OverScroll(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: localList.length,
          padding: const EdgeInsets.all(10.0),
          itemBuilder:
              (BuildContext buildContext, int index, Animation animation) {
            return FadeTransition(
              opacity: animation,
              child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoiffureDetailPage(
                          coiffureModel: localList[index],
                          uniqueId: localList[index].uniqueId,
                        ),
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
                    padding: const EdgeInsets.all(8),
                    child: CircularParent(
                      radius: 20,
                      direction: Directions.all,
                      color: Colors.red,
                      child: IconSlideAction(
                          caption: 'Kaldır',
                          color: Colors.transparent,
                          icon: Icons.delete,
                          onTap: () {
                            Provider.of<AppointmentData>(context, listen: false)
                                .myState
                                .setState(() {});
                            setState(() {
                              deleteUser(index, localList[index]);
                            });
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
              ),
            );
          },
        ),
      ),
    );
  }
}
