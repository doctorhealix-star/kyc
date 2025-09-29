import 'package:flutter/material.dart';

import '../../../core/constant/fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),

      appBar: AppBar(
        titleSpacing: 0,
        title:  Text(
          "About App",
          style: h.copyWith( fontWeight: FontWeight.bold ,fontSize: 18),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [   Color(0xFF85CDCD),    Color(0xFF85CDCD),],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
               Text(
                "Features",
                style: h.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),

              const FeatureTile(
                icon: Icons.calendar_month,
                title: "Easy Appointment Booking",
                description:
                "Book hospital appointments anytime, anywhere in just a few taps.",
              ),
              const FeatureTile(
                icon: Icons.person_search,
                title: "Find Doctors",
                description:
                "Search and explore doctors by specialty, availability, and experience.",
              ),
              const FeatureTile(
                icon: Icons.notifications_active,
                title: "Appointment Reminders",
                description:
                "Get instant notifications and reminders before your appointment.",
              ),
              const FeatureTile(
                icon: Icons.history,
                title: "Medical History",
                description:
                "Access and manage your past appointments and reports easily.",
              ),
              const FeatureTile(
                icon: Icons.payment,
                title: "Secure Payments",
                description:
                "Pay consultation fees securely within the app using multiple methods.",
              ),
              const FeatureTile(
                icon: Icons.support_agent,
                title: "24/7 Support",
                description:
                "Get instant help and support regarding your bookings and queries.",
              ),

              const SizedBox(height: 20),

              // App Images Section
               Text(
                "App Images",
                style: h.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
               Text(
                "Take a quick look at our app screens to explore its clean and modern design.",
                style: h.copyWith(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    AppImageCard(imagePath: "assets/images/app_image_01.jpeg"),
                    AppImageCard(imagePath: "assets/images/app_image_02.jpeg"),
                    AppImageCard(imagePath: "assets/images/app_image_03.jpeg"),
                    AppImageCard(imagePath: "assets/images/app_image_04.jpeg"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Footer
              Center(
                child: Column(
                  children:  [
                    SizedBox(height: 8),
                    Text(
                      "Version 1.0.0",
                      style: s.copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Healthy Life, Easy Booking",
                      style: s.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 4,
      shadowColor: Colors.green.withOpacity(0.3),
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.green.withOpacity(0.15),
          child: Icon(icon, color: Colors.green, size: 28),
        ),
        title: Text(
          title,
          style:  b.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          description,
          style:  s.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}

class AppImageCard extends StatelessWidget {
  final String imagePath;

  const AppImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
