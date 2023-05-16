import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicare/controller/firebase_data.dart';
import 'package:medicare/screens/NavBar.dart';
import 'package:medicare/screens/chatDetailPage.dart';
import 'package:medicare/styles/colors.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class DoctorConsultationRequests extends StatefulWidget {
  const DoctorConsultationRequests({Key? key}) : super(key: key);

  @override
  State<DoctorConsultationRequests> createState() =>
      _DoctorConsultationRequestsState();
}

class _DoctorConsultationRequestsState
    extends State<DoctorConsultationRequests> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  static String? documentId;

  static Future<void> initialize() async {
    documentId = await getdoctorConsultingDocument();
  }

  Stream<QuerySnapshot> stream = FirebaseFirestore.instance
      .collection('doctors')
      .doc(documentId)
      .collection('doctorConsulting')
      .snapshots();

  @override
  void initState() {
    super.initState();

    getdoctorConsultingDocument().then((id) {
      setState(() {
        documentId = id;
        stream = FirebaseFirestore.instance
            .collection('doctors')
            .doc(documentId)
            .collection('doctorConsulting')
            .snapshots();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
          key: scaffoldKey,
          drawer: const NavBar(),
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
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/person.jpg'),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "طلبات الاستشارة",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(MyColors.yellow02)),
                                  ),
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
                  child: StreamBuilder<QuerySnapshot>(
                    stream: stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> data =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;

                            String AppointmentId =
                                snapshot.data!.docs[index].id;

                            DateTime now = data['date'].toDate();
                            DateFormat formatter = DateFormat.yMd().add_jm();
                            String formatted = formatter.format(now);

                            String? customerName = data['customerName'];
                            String? title = data['title'];

                            String? content = data['content'];
                            // bool acceptedDate = data['acceptedDate'];
                            // String image = data['image'];

                            return Card(
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        // CircleAvatar(
                                        //   backgroundImage:
                                        //       AssetImage(_schedule['img']),
                                        // ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              " إسم الراسل : ${customerName!}",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(MyColors.header01),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "عنوان الاستشارة : ${title!}",
                                              style: TextStyle(
                                                color: Color(MyColors.grey02),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        content!,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    DateTimeCard(
                                      date: formatted,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: OutlinedButton(
                                            child: Text('رد'),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return ChatDetailPage();
                                              }));
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            child: Text('مسح'),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 243, 33, 33),
                                                shadowColor: Colors.black),
                                            onPressed: () => {},
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        Center(child: Text('لا يوجد عيادات'));
                      }
                      return Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    Key? key,
    required this.date,
  }) : super(key: key);
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg03),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 50,
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(
              fontSize: 14,
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
    );
  }
}
