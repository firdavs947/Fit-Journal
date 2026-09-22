import 'package:fitjournal/const/colors/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFeild extends StatefulWidget {
  const TextFormFeild({super.key, required this.hintText});
  final String hintText;
  @override
  State<TextFormFeild> createState() => _TextFormFeildState();
}

class _TextFormFeildState extends State<TextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Appcolors.whiteOpacity65),
          bottom: BorderSide(color: Appcolors.whiteOpacity65),
        ),
        boxShadow: [
          BoxShadow(
            color: Appcolors.whiteOpacity20,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Appcolors.containerColor2,
      ),
      // height:
      // MediaQuery.sizeOf(context).height * 0.5,
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.only(left: 10),
            child: Text(
              widget.hintText,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.grey),
              //   borderRadius: BorderRadius.circular(20),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Appcolors.primary),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
