import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';

import '../controllers/scan_fridges_controller.dart';

class ScanFridgesView extends GetView<ScanFridgesController> {
  const ScanFridgesView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Scan Fridges"),
        backgroundColor: whiteColor,
        body: FutureBuilder(
            future: controller.moveToResult(),
            builder: (context, _) {
              return Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      child: (controller.imageShow != null &&
                              controller.imageShow!.existsSync())
                          ? Container(
                              height: MediaQuery.of(context).size.height / 1.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  controller.imageShow!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : makeLoadingIndicator(),
                    ),
                  ),
                  Container(
                    color: '00000080'.toColor(),
                    child: Center(
                        child: SizedBox(
                      width: 250,
                      child: Lottie.asset("assets/lottie/scan-loading.json"),
                    )),
                  )
                ],
              );
            }),
      ),
    );
  }
}
