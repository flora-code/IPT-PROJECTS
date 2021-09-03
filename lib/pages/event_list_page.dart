import 'package:auntie_rafiki/pages/event_page.dart';
import 'package:auntie_rafiki/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({Key? key}) : super(key: key);

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  @override
  void initState() {
    Provider.of<EventProvider>(context, listen: false).getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: eventProvider.events.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EventPage(
                  id: eventProvider.events[index].id,
                );
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventProvider.events[index].name,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      eventProvider.events[index].featuredImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          eventProvider.addEvent();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
