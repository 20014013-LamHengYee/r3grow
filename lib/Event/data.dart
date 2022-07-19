import 'date_model.dart';
import 'events_model.dart';

List<DateModel> getDates(){

  List<DateModel> dates = <DateModel>[];
  DateModel dateModel = new DateModel();

  //1
  dateModel.date = "7";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "1";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = new DateModel();


  //1
  dateModel.date = "19";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "3";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = new DateModel();


  //1
  dateModel.date = "4";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = new DateModel();


  //1
  dateModel.date = "5";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = new DateModel();


  //1
  dateModel.date = "6";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = new DateModel();

  return dates;

  

}
List<EventsModel> getEvents(){

  List<EventsModel> events = <EventsModel>[];
  EventsModel eventsModel = new EventsModel();

  //1

  eventsModel.date = "23 July 2022, 9am to 6pm";
  eventsModel.desc = "GreenFest 2022";
  eventsModel.address = "PAssion Wave @Jurong Lake Gardens";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //2

  eventsModel.date = "21-23 September 2022 ";
  eventsModel.desc = "ISWA World Congress 2022";
      eventsModel.address = "Marina Bay Sands Expo & Convention Centre";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  


  return events;
}