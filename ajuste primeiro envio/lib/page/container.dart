
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progressValue;
  final VoidCallback onTap;

  const CustomContainer({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.progressValue,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18)),
                Text(subtitle, style: TextStyle(fontSize: 14)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerScreen extends StatelessWidget {
  final String title;
  final String imageAsset;

  const ContainerScreen({
    Key? key,
    required this.title,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: 200.0,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}