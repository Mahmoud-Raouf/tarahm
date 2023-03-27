import 'package:flutter/material.dart';
import 'package:medicare/styles/colors.dart';

class ScheduleTabDoctors extends StatefulWidget {
  const ScheduleTabDoctors({Key? key}) : super(key: key);

  @override
  State<ScheduleTabDoctors> createState() => _ScheduleTabDoctorsState();
}

enum FilterStatus {
  Upcoming,
}

List<Map> schedules = [
  {
    'img': 'assets/doctors/doctor03.jpeg',
    'doctorName': 'د. فهد العتيبي',
    'status': FilterStatus.Upcoming,
  },
  {
    'img': 'assets/doctors/doctor02.png',
    'doctorName': 'د. على مرزوق',
    'status': FilterStatus.Upcoming,
  },
  {
    'img': 'assets/doctors/doctor04.jpeg',
    'doctorName': 'د. سحر ماجد',
    'status': FilterStatus.Upcoming,
  },
  {
    'img': 'assets/doctors/doctor04.jpeg',
    'doctorName': 'د. أحلام المطيري',
    'status': FilterStatus.Upcoming,
  },
  {
    'img': 'assets/doctors/doctor01.jpeg',
    'doctorName': 'د. سعيد عبدالله',
    'status': FilterStatus.Upcoming,
  },
];

class _ScheduleTabDoctorsState extends State<ScheduleTabDoctors> {
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
                  height: 41,
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
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/person.jpg'),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Text("طلب إستشارة",
                                    style: TextStyle(
                                        color: Color(MyColors.header01),
                                        fontWeight: FontWeight.w800)),
                              ],
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
                          Column(
                            children: [
                              Text(
                                'مواعيد العمل : ${_schedule['reservedDate']}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 55),
                                child: Row(
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
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(MyColors.kprimaryButtonsColor),
                            ),
                            child: Text('طلب استشارة'),
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
