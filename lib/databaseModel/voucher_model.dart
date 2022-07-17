// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';

class VoucherModel {
  String? uid, image, deductedPoints, balancePoints, time;
  bool? redeemed;
  int? timeStamp;

  VoucherModel(
      {this.uid,
      this.image,
      this.deductedPoints,
      this.balancePoints,
      this.time,
      this.redeemed,
      this.timeStamp});

  VoucherModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    deductedPoints = json['deductedPoints'];
    balancePoints = json['balancePoints'];
    time = json['time'];
    redeemed = json['redeemed'] as bool;
    timeStamp = int.parse(
        json['timeStamp'] == null ? '-1' : json['timeStamp'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['deductedPoints'] = this.deductedPoints;
    data['balancePoints'] = this.balancePoints;
    data['time'] = this.time;
    data['redeemed'] = this.redeemed;
    data['timeStamp'] = this.timeStamp;

    return data;
  }
}
