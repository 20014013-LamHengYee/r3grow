// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';

class QrCodeOutline extends StatelessWidget {
  const QrCodeOutline({Key? key, required this.overlayColor}) : super(key: key);

  final Color overlayColor;

  @override
  Widget build(BuildContext context) {
    //Change the size of scanner cutout depend on the device
    double scanArea = (MediaQuery.of(context).size.width < 600 ||
            MediaQuery.of(context).size.height < 600)
        ? 300.0
        : 200.0;
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(overlayColor, BlendMode.srcOut),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    // handle the background and difference it out
                    backgroundBlendMode: BlendMode.dstOut),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: scanArea,
                  width: scanArea,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
