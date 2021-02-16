import 'package:cura_medic/utils/colors.dart';
import 'package:cura_medic/utils/constants.dart';
import 'package:flutter/material.dart';

class AppointmentsWidget extends StatelessWidget {
  final int selectedCat;
  final int currentIndex;
  final Function selectCategory;

  const AppointmentsWidget({Key key, this.selectedCat, this.selectCategory, this.currentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: selectCategory,
            child: Text(categoryList[currentIndex],
                style: TextStyle(
                    color: currentIndex == selectedCat
                        ? kPrimaryColor
                        : kPrimaryColor.withOpacity(0.4),
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentIndex == selectedCat
                    ? kPrimaryColor
                    : Colors.transparent),
          )
        ],
      ),
    );
  }
}
