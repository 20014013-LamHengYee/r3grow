// ignore_for_file: unnecessary_new


import 'date_model.dart';

List<DateModel> getDates() {
  List<DateModel> dates = <DateModel>[];
  DateModel dateModel = new DateModel();



  //1
  dateModel.date = "1";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = new DateModel();


  dateModel.date = "2";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = new DateModel();

 
  dateModel.date = "3";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = new DateModel();

  
  dateModel.date = "4";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = new DateModel();

 
  dateModel.date = "5";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = new DateModel();

  
  dateModel.date = "6";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "7";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = new DateModel();

  return dates;
}


