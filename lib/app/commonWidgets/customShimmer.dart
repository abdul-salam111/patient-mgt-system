import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(10, (index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            height: 150,
                            width: 150,
                          ).box.rounded.clip(Clip.antiAlias).make(),
                          5.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                height: 20,
                                width: 100,
                              ).box.roundedSM.clip(Clip.antiAlias).make(),
                              10.heightBox,
                              Container(
                                color: Colors.white,
                                height: 20,
                                width: 120,
                              ).box.roundedSM.clip(Clip.antiAlias).make(),
                              10.heightBox,
                              Row(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    height: 30,
                                    width: 30,
                                  ),
                                  5.widthBox,
                                  Container(
                                    color: Colors.white,
                                    height: 20,
                                    width: 120,
                                  ).box.roundedSM.clip(Clip.antiAlias).make()
                                ],
                              ),
                              10.heightBox,
                              Container(
                                color: Colors.white,
                                height: 20,
                                width: 140,
                              ).box.roundedSM.clip(Clip.antiAlias).make(),
                            ],
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.white,
                            height: 30,
                            width: 100,
                          ).box.roundedSM.clip(Clip.antiAlias).make(),
                          Container(
                            color: Colors.white,
                            height: 30,
                            width: 100,
                          ).box.roundedSM.clip(Clip.antiAlias).make(),
                          Container(
                            color: Colors.white,
                            height: 30,
                            width: 100,
                          ).box.roundedSM.clip(Clip.antiAlias).make(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
  }
}
