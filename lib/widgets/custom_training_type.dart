import 'package:fitjournal/const/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTrainingType extends StatefulWidget {
  const CustomTrainingType({
    super.key,
    required this.type,
    required this.weightController,
  });
  final String type;
  final TextEditingController weightController;

  @override
  State<CustomTrainingType> createState() => _CustomTrainingTypeState();
}

class _CustomTrainingTypeState extends State<CustomTrainingType> {
  void _changeWeight(int amount) {
    int currentWeight = int.tryParse(widget.weightController.text) ?? 0;
    int newWeight = currentWeight + amount;
    if (newWeight < 0) newWeight = 0;

    setState(() {
      widget.weightController.text = newWeight.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
           border: Border(
                    left: BorderSide(color: Appcolors.whiteOpacity30),
                    right: BorderSide(color: Appcolors.whiteOpacity30),
                  ),
          borderRadius: BorderRadius.circular(30),
          color: Appcolors.whiteOpacity10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.type,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _changeWeight(-1),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolors.whiteOpacity10,
                    ),
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),

                Expanded(
                  child: TextFormField(
                    controller: widget.weightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () => _changeWeight(1),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolors.whiteOpacity10,
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}