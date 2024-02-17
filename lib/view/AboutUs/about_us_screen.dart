import 'package:flutter/material.dart';
import 'package:kezel/constants/size.dart';
import 'package:kezel/domain/data_model/data_model.dart';

class AboutUsScreen extends StatelessWidget {
  final WebsiteDetails details;
  const AboutUsScreen({required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aboutUsColum(heading: 'About us', details: details.aboutUs),
            aboutUsColum(heading: 'Phone', details: details.phone),
            aboutUsColum(heading: 'Email', details: details.email),
            aboutUsColum(heading: 'Address', details: details.address),
            aboutUsColum(heading: 'copyright', details: details.copyright),
            aboutUsColum(heading: 'facebook', details: details.facebookLink),
            aboutUsColum(heading: 'instagram', details: details.instagramLink),
            aboutUsColum(heading: 'twitter', details: details.twitterLink),
            aboutUsColum(heading: 'pinterest', details: details.pinterestLink),
            aboutUsColum(heading: 'linkedin', details: details.linkedinLink),
          ],
        ),
      ),
    );
  }
}

Widget aboutUsColum({required String heading, required String details}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      tSizedBoxHeight10,
      Text(
        heading,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      tSizedBoxHeight10,
      Text(
        details,
        style: const TextStyle(fontSize: 16),
      ),
    ],
  );
}
