import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final String feature;
  final Color color;
  const DetailWidget({required this.feature,required this.color,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Text(feature,style: TextStyle(
        color: (color==Colors.yellow)? Colors.black:Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),),
    );
  }
}
