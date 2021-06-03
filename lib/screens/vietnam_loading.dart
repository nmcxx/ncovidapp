import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VietnamLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        loadingCard(),
        loadingCard(),
        loadingCard(),
        loadingCard(),

      ],
    );
  }

  Widget loadingCard()
  {
    return Card(
      elevation: 1,
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Column(
              children: <Widget>[

                Container(
                  width: 100,
                  height: 15,
                  color: Colors.white,
                ),
                Expanded(
                  child: Container(),
                ),
                // Container(
                //   width: double.infinity,
                //   height: 15,
                //   color: Colors.white,
                // ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.white,
                )

              ],
            ),
        ),
      ),
    );
  }
}
