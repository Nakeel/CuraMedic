import 'package:cura_medic/utils/colors.dart';
import 'package:cura_medic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'doc_appointment_item.dart';

class DocAppointmentsWigdet extends StatelessWidget {
  final int selectedCategory;
  final String selectedSortBy;
  final bool isPastAppointments;
  final ValueChanged onValueChanged;

  const DocAppointmentsWigdet({Key key, this.selectedCategory, this.selectedSortBy, this.isPastAppointments, this.onValueChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sort by: ',
                style: GoogleFonts.lato(
                  color: kPrimaryColor.withOpacity(.6),
                  fontSize: 14,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  border: Border.all(
                    color :kPrimaryColor.withOpacity(.4),
                  ),
                  // shape: BoxShape.circle,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedSortBy,
                    iconEnabledColor: kPrimaryColor.withOpacity(.6),
                    onChanged: onValueChanged,
                    items: sortByList.map((String sortBy) {
                      return DropdownMenuItem<String>(
                          value: sortBy,
                          child: Text(
                            sortBy,
                            style: GoogleFonts.lato(
                              color: kPrimaryColor.withOpacity(.5),
                              fontSize: 12,
                            ),
                          ));
                    }).toList(),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              DocAppointmentItem(isPastAppointment: isPastAppointments,),
              DocAppointmentItem(isPastAppointment: isPastAppointments,),
              DocAppointmentItem(isPastAppointment: isPastAppointments,),
            ],
          )
        ],
      ),
    );
  }
}
