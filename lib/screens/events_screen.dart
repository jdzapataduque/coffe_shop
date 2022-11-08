import 'package:coffe_shop/models/events.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  final List<Events> events;

  EventsScreen({required this.events});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  ErrorMessages errorHandling = ErrorMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(),
      body: Center(
        child: _showEvents(),
      ),
    );
  }

  Widget _showEvents() {
    return ListView(
      children: widget.events.map((e) {
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.title_rounded),
                      Text(
                        e.title.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.description_rounded),
                      Text(
                        e.description.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded),
                      Text(
                        e.location.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.date_range_rounded),
                      Text(
                        e.start.toString() + '-' + e.end.toString(),
                        style: TextStyle(
                          fontSize: 14.5,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
