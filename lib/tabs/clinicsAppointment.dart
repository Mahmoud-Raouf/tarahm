import 'package:flutter/material.dart';
import 'package:medicare/styles/colors.dart';

class ScheduleTabClinics extends StatefulWidget {
  const ScheduleTabClinics({Key? key}) : super(key: key);

  @override
  State<ScheduleTabClinics> createState() => _ScheduleTabClinicsState();
}

enum FilterStatus {
  Upcoming,
}

List<Map> schedules = [
  {
    'img': 'assets/clinics/clinics1.jpg',
    'doctorName': 'عيادة. بيطرية ',
    'reservedDate': 'الاحد والثلاثاء والاربعاء',
    'status': FilterStatus.Upcoming,
  },
  {
    'img': 'assets/clinics/clinics2.jpg',
    'doctorName': 'عيادة. دليل العيادات البيطرية',
    'reservedDate': 'طوال ايام الاسبوع',
    'status': FilterStatus.Upcoming,
  },
  {
    'img': 'assets/clinics/clinics3.jpg',
    'doctorName': 'عيادة. بيت كلينك',
    'reservedDate': 'السبت والاربعاء',
    'status': FilterStatus.Upcoming,
  },
  {
    'img': 'assets/clinics/clinics4.png',
    'doctorName': 'عيادة. مركز الرعاية البيطري',
    'reservedDate': 'الاثنين والخميس',
    'status': FilterStatus.Upcoming,
  },
  {
    'img': 'assets/clinics/clinics5.jpg',
    'doctorName': 'عيادة. فيت كلينك',
    'reservedDate': 'طوال ايام الاسبوع عدا الجمعه',
    'status': FilterStatus.Upcoming,
  },
];

class _ScheduleTabClinicsState extends State<ScheduleTabClinics> {
  FilterStatus status = FilterStatus.Upcoming;
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(MyColors.bg),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Upcoming) {
                                  status = FilterStatus.Upcoming;
                                  _alignment = Alignment.centerLeft;
                                }
                              });
                            },
                            child: Center(
                              child: Text("حجز عيادة",
                                  style: TextStyle(
                                      color: Color(MyColors.header01),
                                      fontWeight: FontWeight.w800)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    margin: !isLastElement
                        ? EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    _schedule['doctorName'],
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(MyColors.header01),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Text(
                                  //   _schedule['doctorTitle'],
                                  //   style: TextStyle(
                                  //     color: Color(MyColors.grey02),
                                  //     fontSize: 12,
                                  //     fontWeight: FontWeight.w600,
                                  //   ),
                                  //   textAlign: TextAlign.right,
                                  // ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                backgroundImage: AssetImage(_schedule['img']),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'مواعيد العمل : ${_schedule['reservedDate']}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '50 - 4.0 تقييم',
                                      style: TextStyle(
                                          color: Color(MyColors.grey02)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(MyColors.yellow02),
                                      size: 18,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(MyColors.text01),
                            ),
                            child: Text('حجز موعد'),
                            onPressed: () => {},
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg03),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '11:00 ~ 12:10',
                style: TextStyle(
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.access_alarm,
                color: Color(MyColors.primary),
                size: 17,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'الاحد, مارس 29',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.calendar_today,
                color: Color(MyColors.primary),
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
