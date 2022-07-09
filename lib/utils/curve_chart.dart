// import 'package:crypto/services/api.dart';
// import 'package:crypto/services/modal.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class Testing extends StatefulWidget {
//   const Testing({Key? key}) : super(key: key);

//   @override
//   State<Testing> createState() => _TestingState();
// }

// class _TestingState extends State<Testing> {
//   // Future getResponse() async {
//   //   var res = await API.getCryptoDetails();
//   //   return res;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: API.getCryptoDetails(),
//         builder: (BuildContext context, snapshot) {
//           if (!snapshot.hasData) {
//             return Container();
//           } else if (snapshot.hasData) {
//             Currency response = snapshot.data as Currency;
//             print(response.price);
//             return Container(
//                 child: Text(
//               response.name,
//             ));
//           }
//           return Text("NO");
//         });
//   }
// }

// // Widget Chart(){
// //   return SfCartesianChart(
// //     primaryXAxis: CategoryAxis(),
// //   title: ChartTitle(text: 'Half yearly sales analysis'),
// //   series: <ChartSeries<SalesData, String>>[
// //     LineSeries<SalesData, String>(
// //       dataSource: chartData,
// //       xValueMapper: (SalesData sales, _) => sales.month,
// //       yValueMapper: (SalesData sales, _) => sales.sales,
// //     )
// //   ]
// //   )
// // }
