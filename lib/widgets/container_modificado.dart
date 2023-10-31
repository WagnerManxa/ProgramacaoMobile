import 'package:flutter/material.dart';

import 'circular_modificado.dart';

class ContainerModificado extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final double projectionProgress;
  final VoidCallback onTap;

  const ContainerModificado({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.projectionProgress,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color progressColor = Colors.red;
    if (progress >= 0.85 && progress < 0.94) {
      progressColor = Colors.yellow;
    } else if (progress >= 0.94) {
      progressColor = Colors.green;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              children: [
                CustomCircularProgressIndicator(
                  progress: progress,
                  radius: 40,
                  value: progress * 100,
                  subtitle: 'Realizado',
                  backgroundColor: Colors.grey,
                  progressColor: progressColor,
                  valueColor: Colors.black,
                ),
                SizedBox(height: 10),
                CustomCircularProgressIndicator(
                  progress: projectionProgress,
                  radius: 40,
                  value: projectionProgress * 100,
                  subtitle: 'Projeção',
                  backgroundColor: Colors.grey,
                  progressColor: progressColor,
                  valueColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
