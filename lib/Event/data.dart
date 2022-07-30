// ignore_for_file: unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'date_model.dart';
import 'events_model.dart';

List<DateModel> getDates() {
  List<DateModel> dates = <DateModel>[];
  DateModel dateModel = new DateModel();

  //1
  dateModel.date = "31";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "25";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "26";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "27";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "28";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "29";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "30";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = new DateModel();

  return dates;
}


