import 'package:cura_medic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class DocAvailabilityDateItem extends StatefulWidget {
  const DocAvailabilityDateItem({
    Key key, this.timeList, this.timeOfDay, this.timeRange, this.onItemSelected, this.onSelectedItem,
  }) : super(key: key);

  final List<String> timeList;
  final String timeOfDay,timeRange;
  final ValueChanged<bool> onItemSelected;
  final ValueChanged<int> onSelectedItem;

  @override
  _DocAvailabilityDateItemState createState() => _DocAvailabilityDateItemState();
}

class _DocAvailabilityDateItemState extends State<DocAvailabilityDateItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        width: MediaQuery.of(context).size.width * .86,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          border: Border.all(
            color :Colors.grey[400],
          ),
          // shape: BoxShape.circle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                  widget.timeOfDay,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
              ),
            Text(
              widget.timeRange,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                color: Colors.grey.shade600
              ),
            ),
            SizedBox(height: 15,),
            Wrap(
              children:
              widget.timeList
                    .asMap()
                    .entries
                    .map(
                      (e) => GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected = !isSelected;
                            widget.onItemSelected(isSelected);
                            widget.onSelectedItem(e.key);
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                            decoration: BoxDecoration(
                              color:isSelected ? kPrimaryColor.withOpacity(0.3) : Colors.grey[300],
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                color :isSelected ? kPrimaryColor.withOpacity(0.4) : Colors.grey[400],
                              ),
                              // shape: BoxShape.circle,
                            ),
                            child:
                            Text(
                                widget.timeList[e.key],
                              style: GoogleFonts.inter(
                                color: isSelected ? kPrimaryColor.withOpacity(0.4) : Colors.grey[400]
                              ),
                            )
                        ),
                      ),
                )
                    .toList(),
            )
          ],

        ),
      ),
    );
  }
}
