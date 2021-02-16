import 'package:cura_medic/utils/colors.dart';
import 'package:flutter/material.dart';

class DocAvailabilityDateWidget extends StatelessWidget {
  final int selectedDate;
  final int currentIndex;
  final Function selectDate;
  final List<String> availableDates;

  const DocAvailabilityDateWidget({Key key, this.selectedDate, this.selectDate, this.currentIndex, this.availableDates}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectDate,
      child:
    Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: currentIndex == selectedDate
              ? kSecondaryColor.withOpacity(.4)
              : Colors.transparent),
      child: Center(
        child: Text(availableDates[currentIndex],
            style: TextStyle(
                color: currentIndex == selectedDate
                    ? Colors.grey.shade100
                    : Colors.grey.withOpacity(0.4),
                fontSize:currentIndex == selectedDate ? 16 : 14,
                fontWeight: currentIndex == selectedDate ? FontWeight.w700 : FontWeight.normal)),
      ),

    ),
    );
  }
}
