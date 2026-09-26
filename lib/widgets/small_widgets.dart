import 'package:fitjournal/const/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SmallWidgets extends StatefulWidget {
  const SmallWidgets({super.key, required this.icon, required this.label, required this.text});
  final String text;
  final String label;
  final String icon;

  @override
  State<SmallWidgets> createState() => _SmallWidgetsState();
}

class _SmallWidgetsState extends State<SmallWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Appcolors.whiteOpacity30),
          right: BorderSide(color: Appcolors.whiteOpacity30),
        ),
        color: Appcolors.liquidglassColor,
        borderRadius: BorderRadius.circular(40),
      ),
      width: double.infinity,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 5),
              SvgPicture.asset(widget.icon,),
            ],
          ),
          Text(
           widget.label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
