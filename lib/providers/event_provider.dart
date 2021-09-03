import 'dart:convert';

import 'package:auntie_rafiki/models/event.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class EventProvider extends ChangeNotifier {
  final String api = 'http://192.168.43.152:8000/api/';
  List<Event> events = [
    Event(
      id: 1,
      name: 'Flutter event',
      description: 'flutter event about providers',
      category: 'Flutter',
      featuredImage: 'https://via.placeholder.com/640x480.png/0066cc?text=flora',
      location: 'Qlicue',
      time: '12:00',
      date: '23/09/2021',
    ),
    Event(
      id: 2,
      name: 'Laravel event',
      description: 'laravel event about controllers',
      category: 'Laravel',
      featuredImage: 'https://via.placeholder.com/640x480.png/0066cc?text=flora',
      location: 'Buni Huni',
      time: '13:00',
      date: '23/09/2021',
    ),
  ];

  Event getEventById(int id) {
    final event = events.firstWhere((element) => element.id == id);
    return event;
  }

  Future<void> getEvents() async {
    try {
      http.Response response = await http.get(Uri.parse(api + 'events'));
      // print(response.body);
      List<dynamic> res = jsonDecode(response.body);
      // print(res);
      res.forEach((element) {
        final event = Event.fromJson(element);
        events.add(event);
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }

  void addEvent() {
    final Event event = Event(
      id: 3,
      name: 'Flora event',
      description: 'flora event about her life in programming',
      category: 'Programming',
      featuredImage: 'https://via.placeholder.com/640x480.png/0066cc?text=flora',
      location: 'Sayansi',
      time: '15:00',
      date: '25/09/2021',
    );

    events.add(event);
    notifyListeners();
  }

  bool deleteEvent(int id) {
    bool isDeleted = false;
    final event = getEventById(id);

    if (event is Event) {
      events.removeWhere((element) => element.id == id);
      isDeleted = true;
      notifyListeners();
    }
    return isDeleted;
  }
}
