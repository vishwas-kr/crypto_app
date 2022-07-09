import 'package:crypto/app/notifiers/app_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;
    final data = Provider.of<AppNotifiers>(context);

    return ListView.builder(
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
                    Text("3425.0"),
                    Image.network(
                      "https://img.icons8.com/color-glass/48/000000/rick-sanchez.png",
                      height: 30,
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text("MFT/BSD"),
                    Text("+0.81%"),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
