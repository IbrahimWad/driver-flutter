import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class TheClientViewModel extends GetxController {
  // late WebViewController webViewController;

  // Future<Position> getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     throw 'Location services are disabled.';
  //   }

  //   // Request location permission
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       throw 'Location permissions are denied.';
  //     }
  //   }

  //   // Get current location
  //   return await Geolocator.getCurrentPosition();
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  //   webViewController = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setBackgroundColor(const Color(0x00000000))
  //     ..setNavigationDelegate(NavigationDelegate(
  //       onProgress: (int progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {},
  //       onWebResourceError: (WebResourceError error) {},
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.startsWith('https://www.google.com/maps/')) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ))
  //     ..loadRequest(Uri.parse('https://www.google.com/maps/'));
  // }
  void openGoogleMaps(latitude, longitude) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open Google Maps.';
    }
  }

  @override
  void onClose() {
    // webViewController.clearCache();
    super.onClose();
  }
}
