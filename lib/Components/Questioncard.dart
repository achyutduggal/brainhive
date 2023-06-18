import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteWidget extends StatelessWidget {
  final String subject;
  final String question;
  final DateTime dateTime;
  final VoidCallback onDelete;

  const NoteWidget({
    Key? key,
    required this.subject,
    required this.question,
    required this.dateTime,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.withOpacity(0.4),
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.yMMMd().add_jm().format(dateTime),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              subject,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              question,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
