import 'package:auto_size_text/auto_size_text.dart';
import 'package:cura_medic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class DocAppointmentItem extends StatelessWidget {
  const DocAppointmentItem({
    Key key, @required this.isPastAppointment,
  }) : super(key: key);
  final bool isPastAppointment;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        width: MediaQuery.of(context).size.width * .8,
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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                  decoration: BoxDecoration(
                    color: isPastAppointment ? Color(0xFF978242) : Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Jan',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        '30',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 15,),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chukwudi Dara',
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Category: Eyes, Teeth',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(height: 4,),
                        Text(
                          'Complaints',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(height: 4,),
                        AutoSizeText(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse cursus libero est, quis efficitur augue efficitur id. Morbi aliquet lorem feugiat enim dignissim, in sodales tellus ullamcorper. Suspendisse potenti. Maecenas varius ante magna. Quisque fermentum, '
                              'erat vitae consectetur imperdiet, est nisi congue velit, vel cursus metus nunc nec metus. ',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 14,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                        SizedBox(height: 9,),
                        Text(
                          '08:30AM - 09:30AM',
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                )


              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: .6,color: Colors.grey[400],),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(55,10, 15,10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.chat_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.videocam_rounded,
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            )

          ],

        ),
      ),
    );
  }
}
