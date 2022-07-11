import 'dart:async';

import 'package:crypto/app/notifiers/app_notifiers.dart';
import 'package:crypto/constants.dart';
import 'package:crypto/model/crypto_symbol.dart';
import 'package:crypto/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;
    var data = Provider.of<AppNotifiers>(context, listen: false);
    //  Timer.periodic(Duration(milliseconds: 833), (timer) {
    //   data.getData();
    // });

    return FutureBuilder(
      future: data.getData(),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Opps! Try Again later."),
          );
        }
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const Center(
        //       child: CircularProgressIndicator(
        //     color: kGreen,
        //   ));
        // }
        if (snapshot.hasData) {
          List _snapshot = snapshot.data as List;
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            itemCount: snapshot.data.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              CryptoData crypto = _snapshot[index];
              var color = double.parse(crypto.changePercent24Hr.toString());
              // if (crypto.changePercent24Hr!= null ||crypto.changePercent24Hr < ) {
              //   color = Colors.red;
              // } else {
              //   color = kGreen;
              // }
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: Container(
                  height: height * 100,
                  width: width * 150,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            double.parse(crypto.priceUsd.toString())
                                .toStringAsFixed(2),
                            style: TextStyle(
                                color: color < 0 ? Colors.red : kGreen),
                          ),
                          Image.network(
                            "https://img.icons8.com/color-glass/48/000000/rick-sanchez.png",
                            height: 30,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(crypto.symbol.toString()),
                          SizedBox(
                            width: width * 10,
                          ),
                          Text(
                            "${double.parse(crypto.changePercent24Hr.toString()).toStringAsFixed(2)}%",
                            style: TextStyle(
                                color: color < 0 ? Colors.red : kGreen),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        }

        return const Center(
            child: CircularProgressIndicator(
          color: kGreen,
        ));
      }),
    );
  }
}
