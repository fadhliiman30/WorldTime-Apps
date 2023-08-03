// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Athens'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance =locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}