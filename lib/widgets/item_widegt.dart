import 'package:flutter/material.dart';

class ItemWidegt extends StatelessWidget {

  final Map data;

  const ItemWidegt({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.purpleAccent,
        child: ListTile(
          leading: Image.network(data["image"]),
          title: Text(data["name"]),
          subtitle: Text(data["description"]),
        ),
      ),
    );
  }
}