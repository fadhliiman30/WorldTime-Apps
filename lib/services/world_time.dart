// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {

    try {
      Response response = await get(Uri.http('worldtimeapi.org', '/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      //print(datetime);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 18;
      time = DateFormat.jm().format(now);
    }
    
    catch(e) {
      print('caught error $e');
      time = 'could not get time data';
    }

  }

}