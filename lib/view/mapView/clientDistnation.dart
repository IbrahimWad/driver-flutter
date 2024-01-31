// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../core/controller/theClientViewModel.dart';

// class TheClintDistnation extends StatelessWidget {
//   const TheClintDistnation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TheClientViewModel>(builder: (controller) {
//       return Container(
//           child: Scaffold(
//               body: 
//               GoogleMap(
//                 polylines: Set<Polyline>.from(controller.polylines),
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(37.7749, -122.4194),
//                   zoom: 10,
//                 ),
//                 onMapCreated: (GoogleMapController mapController) {
//                   controller.mapController =
//                       mapController; // Assign mapController directly to the controller property
//                 },
//               ),
//               floatingActionButton: FloatingActionButton(
//                 child: Icon(Icons.add),
//                 onPressed: () {
//                   // controller.drawRoute(
//                   //   startPoint: LatLng(37.7749, -122.4194),
//                   //   endPoint: LatLng(37.3352, -122.0498),
//                   // );
//                 },
//               )));
//     });
//   }
// }
