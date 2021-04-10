import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import '../screens/coiffure_detail_page.dart';

class DynamicLinkService {
  Future<Uri> createDynamicLink(String id) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://ayarla.app',
      link: Uri.parse('https://ayarla.app/ZCg5?id=$id'),
      androidParameters: AndroidParameters(
        packageName: 'com.nilsu.ayarla',
        minimumVersion: 1,
      ),
      // iosParameters: IosParameters(
      //   bundleId: 'your_ios_bundle_identifier',
      //   minimumVersion: '1',
      //   appStoreId: 'your_app_store_id',
      // ),
    );
    var dynamicUrl = await parameters.buildUrl();

    return dynamicUrl;
  }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri deepLink = data?.link;

      if (deepLink != null) {
        if (deepLink.queryParameters.containsKey('id')) {
          String id = deepLink.queryParameters['id'];
          // Navigator.of(context).push(
            // MaterialPageRoute(
            //   builder: (context) => CoiffureDetailPage(uniqueId: id),
            // ),
          // );
        }
      }
      // FirebaseDynamicLinks.instance.onLink(
      //     onSuccess: (PendingDynamicLinkData dynamicLink) async {
      //   Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) => CoiffureDetailPage()));
      // });
    } catch (e) {
      print(e.toString());
    }
  }
}
