import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample notifications
  final List<Map<String, String>> notifications = [
    {
      "title": "New KYC Submitted",
      "subtitle": "Abinesh has submitted a new KYC form.",
      "time": "2 min ago"
    },
    {
      "title": "Payment Received",
      "subtitle": "You received \$200 from John Doe.",
      "time": "30 min ago"
    },
    {
      "title": "Reminder",
      "subtitle": "Don't forget to approve pending KYCs.",
      "time": "1 hour ago"
    },
    {
      "title": "App Update",
      "subtitle": "Version 2.1.0 is now available.",
      "time": "Yesterday"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        titleSpacing: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Text(
          "Notifications",
          style: b.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          // TextButton(
          //   onPressed: () {
          //     // Mark all as read logic here
          //   },
          //   child: Text(
          //     "Mark all as read",
          //     style: s.copyWith(color: primary, fontWeight: FontWeight.bold),
          //   ),
          // )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: Container(
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.notifications_active_outlined,
                  color: primary,
                ),
              ),
              title: Text(
                notif["title"]!,
                style: b.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                notif["subtitle"]!,
                style: s.copyWith(fontSize: 12, color: Colors.grey[700]),
              ),
              trailing: Text(
                notif["time"]!,
                style: s.copyWith(fontSize: 10, color: Colors.grey[500]),
              ),
            ),
          );
        },
      ),
    );
  }
}
