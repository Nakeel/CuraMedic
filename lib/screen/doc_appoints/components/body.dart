
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cura_medic/screen/doc_appoints/components/appointment_category_widget.dart';
import 'package:cura_medic/screen/doc_appoints/components/doc_appointments_wigdet.dart';
import 'package:cura_medic/screen/doc_appoints/components/doc_availability_days_item.dart';
import 'package:cura_medic/utils/colors.dart';
import 'package:cura_medic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'doc_appointment_item.dart';
import 'doc_available_dates_widget.dart';
import 'doc_times_widget.dart';
import 'view_pager_tab.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}


bool tabSwitch = false;
int selectedCategory = 0;
int selectedDate = 0;
String selectedSortBy ;
bool isPastAppointments = false;
List<String> selectedNightTime;

PageController appointmentsController = PageController(
  initialPage: 0,

);
PageController allAppointmentsController = PageController(
  initialPage: 0,
);

class _BodyState extends State<Body> {

   switchTab() {
    setState(() {
      tabSwitch = !tabSwitch;
    });
    if(tabSwitch){
      allAppointmentsController.animateToPage(1,duration: Duration(milliseconds: 400), curve: Curves.linear);
    }else{
      allAppointmentsController.animateToPage(0,duration: Duration(milliseconds: 400), curve: Curves.linear);
    }

  }



   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: SafeArea(
            child: Container(
              width: size.width,
              color: Color(0xFFE5E5E5),
              padding: EdgeInsets.fromLTRB(20,35,20,10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:  EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.blue,
                          ),
                        ),
                        Text('Appointments', style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          color: Colors.blue
                          ),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(child: ViewPagerTab(tabSwitch: tabSwitch,switchTab: switchTab,)),
                  SizedBox(height: 25,),
                  Expanded(
                    child:PageView(
                      controller: allAppointmentsController,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              height: 40,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categoryList.length,
                                  itemBuilder: (context, index) =>
                                      AppointmentsWidget(
                                        selectCategory: (){
                                          setState(() {
                                            selectedCategory = index;
                                            isPastAppointments = !isPastAppointments;
                                          });
                                          appointmentsController.animateToPage(index,duration: Duration(milliseconds: 400), curve: Curves.linear);
                                        },
                                        selectedCat: selectedCategory,
                                        currentIndex: index,)),
                            ),
                            SizedBox(height: 10,),
                            Expanded(
                              child: PageView(
                                controller: appointmentsController,
                                onPageChanged: (index){
                                  setState(() {
                                    selectedCategory = index;
                                    isPastAppointments = !isPastAppointments;
                                  });
                                },
                                children: <Widget>[
                                  DocAppointmentsWigdet(
                                    isPastAppointments: false,
                                    selectedSortBy: selectedSortBy,
                                    selectedCategory: selectedCategory,
                                    onValueChanged: (value){
                                      setState(() {
                                        selectedSortBy = value;
                                      });
                                    },
                                  ),
                                  DocAppointmentsWigdet(
                                    isPastAppointments: true,
                                    selectedSortBy: selectedSortBy,
                                    selectedCategory: selectedCategory,
                                    onValueChanged: (value){
                                      setState(() {
                                        selectedSortBy = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                            children: [
                                  Container(
                                  height: 50,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: availableDateList.length,
                                      itemBuilder: (context, index) =>
                                          DocAvailabilityDateWidget(
                                            availableDates: availableDateList,
                                            selectDate: (){
                                              setState(() {
                                                selectedDate = index;
                                              });
                                             },
                                            selectedDate: selectedDate,
                                            currentIndex: index,)),
                                ),
                                SizedBox(height: 10,),
                              Flexible(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      DocAvailabilityDateItem(
                                        timeList: availableMorningPeriodList,
                                        timeOfDay: availableTimeOfDayList[0],
                                        timeRange: availableTimeRangeList[0],
                                      ),

                                      DocAvailabilityDateItem(
                                        timeList: availableAfternoonPeriodList,
                                        timeOfDay: availableTimeOfDayList[1],
                                        timeRange: availableTimeRangeList[1],
                                      ),

                                      DocAvailabilityDateItem(
                                        timeList: availableEveningPeriodList,
                                        timeOfDay: availableTimeOfDayList[2],
                                        timeRange: availableTimeRangeList[2],
                                      ),

                                      DocAvailabilityDateItem(
                                        timeList: availableNightPeriodList,
                                        timeOfDay: availableTimeOfDayList[3],
                                        timeRange: availableTimeRangeList[3],
                                          onSelectedItem: (value){

                                          },
                                          key: Key(availableNightPeriodList[0]),
                                      ),
                                      MultiSelectChip(
                                        availableNightPeriodList,
                                        onSelectionChanged: (selectedList) {
                                          setState(() {
                                            selectedNightTime = selectedList;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )

                            ]
                        ),
                      ],
                    )

                  )

                ],
              ),

            )
        )
    );
  }
}