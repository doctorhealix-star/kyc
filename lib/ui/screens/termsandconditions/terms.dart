import 'package:flutter/material.dart';

import '../../../core/constant/fonts.dart';

class TermsPolicyScreen extends StatelessWidget {
  const TermsPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        titleSpacing: 0,
        scrolledUnderElevation: 0,
        title:  Text(
          "Terms & Privacy Policy",
          style: b.copyWith( fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF85CDCD),    Color(0xFF85CDCD),],
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
            children: const [
              SectionTitle(title: "Terms of Service"),
              SectionText(
                text:
                "By using this Hospital Appointment Booking App, you agree to follow all applicable rules and regulations. "
                    "Appointments must be booked honestly and patients are responsible for providing accurate details. "
                    "The hospital reserves the right to cancel or reschedule appointments if necessary.",
              ),
              SizedBox(height: 20),

              SectionTitle(title: "Privacy Policy"),
              SectionText(
                text:
                "We value your privacy. All personal data including your name, contact details, medical history, and payments "
                    "are stored securely. We do not share your data with third parties without your consent, except as required by law. "
                    "Your information is used solely for improving medical services and appointment management.",
              ),
              SizedBox(height: 20),

              SectionTitle(title: "User Responsibilities"),
              SectionText(
                text:
                "Users are responsible for maintaining confidentiality of their login details. "
                    "Misuse of the app, including fraudulent bookings or sharing personal data of others without permission, "
                    "may result in account suspension.",
              ),
              SizedBox(height: 20),

              SectionTitle(title: "Contact Us"),
              SectionText(
                text:
                "If you have any questions about these Terms or the Privacy Policy, please contact our support team at:\n\n"
                    "📧 DoctorHealix.in\n📞 +91 9344125022",
              ),
              SizedBox(height: 30),

              Center(
                child: Text(
                  "Last Updated: Sept 2025",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: h.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;
  const SectionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: b.copyWith(fontSize: 16, color: Colors.black54, height: 1.5),
    );
  }
}
