import 'package:cura_medic/utils/colors.dart';
import 'package:flutter/material.dart';

class ViewPagerTab extends StatelessWidget {

  final bool tabSwitch;
  final Function switchTab;
  const ViewPagerTab({
    Key key, this.tabSwitch, this.switchTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color textColor = tabSwitch ? Colors.white : kPrimaryColor;
      return Container(
        height: size.height * 0.045,
        width: size.width * 0.7,
        // padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Color(0xFFD9DBE9),
            borderRadius: BorderRadius.circular(23)
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              child: Container(
                width: size.width * 0.1,
                height: size.height * .04,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(23)
                ),
              ),
              duration: Duration(milliseconds: 300),
              right: tabSwitch ? 0 : 120,
              top: 0,
              bottom: 0,
              left: tabSwitch ? 120 : 0,
            ),
            Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if (tabSwitch) {
                          switchTab();
                        }
                      },
                      child: Container(
                          color: Colors.transparent,
                          width: size.width * .35,
                          child: Center(child: Text('Appointments',
                            style: TextStyle(
                                fontSize: !tabSwitch ? 18 : 16,
                                fontWeight: !tabSwitch ? FontWeight.bold : FontWeight.normal,
                              color: !tabSwitch ? Colors.white : kPrimaryColor
                            ),
                          ))),
                    ),
                    GestureDetector(
                      onTap: (){
                        if (!tabSwitch)
                          switchTab();
                      },
                      child: Container(
                          width: size.width * .35,
                          color: Colors.transparent,
                          child: Center(
                              child: Text('Availability',
                                style: TextStyle(
                                    fontSize: tabSwitch ? 18 : 16,
                                    fontWeight: tabSwitch ? FontWeight.bold : FontWeight.normal,
                                    color: textColor),))),
                    ),

                  ],
                )
            )
          ],
        ),
      );
    }
  }

