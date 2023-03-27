import 'package:flutter/material.dart';
import 'package:medicare/styles/colors.dart';
import 'package:medicare/styles/styles.dart';
import 'package:medicare/tabs/Category_Doctors.dart';

List<Map> clinics = [
  {
    'img': 'assets/clinics/clinics1.jpg',
    'doctorName': 'د. سعيد عبدالله',
    'doctorTitle': 'عيون'
  },
  {
    'img': 'assets/clinics/clinics2.jpg',
    'doctorName': 'د. فهد العتيبي',
    'doctorTitle': 'أسنان'
  },
  {
    'img': 'assets/clinics/clinics3.jpg',
    'doctorName': 'د. على مرزوق',
    'doctorTitle': 'أسنان'
  },
  {
    'img': 'assets/clinics/clinics4.jpg',
    'doctorName': 'د. سحر ماجد',
    'doctorTitle': 'عظام'
  },
  {
    'img': 'assets/clinics/clinics5.jpg',
    'doctorName': 'د. أحلام المطيري',
    'doctorTitle': 'أمراض القلب'
  }
];
List<Map> doctors = [
  {
    'img': 'assets/doctors/doctor01.jpeg',
    'doctorName': 'د. سعيد عبدالله',
    'doctorTitle': 'عيون'
  },
  {
    'img': 'assets/doctors/doctor03.jpeg',
    'doctorName': 'د. فهد العتيبي',
    'doctorTitle': 'أسنان'
  },
  {
    'img': 'assets/doctors/doctor02.png',
    'doctorName': 'د. على مرزوق',
    'doctorTitle': 'أسنان'
  },
  {
    'img': 'assets/doctors/doctor04.jpeg',
    'doctorName': 'د. سحر ماجد',
    'doctorTitle': 'عظام'
  },
  {
    'img': 'assets/doctors/doctor04.jpeg',
    'doctorName': 'د. أحلام المطيري',
    'doctorTitle': 'أمراض القلب'
  }
];

class HomeTab extends StatelessWidget {
  final void Function() onPressedScheduleCard;
  final void Function() onPressedScheduleCard2;

  const HomeTab({
    Key? key,
    required this.onPressedScheduleCard,
    required this.onPressedScheduleCard2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            UserIntro(),
            SizedBox(
              height: 10,
            ),
            SearchInput(),
            SizedBox(
              height: 20,
            ),
            // CategoryIcons(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    'المزيد',
                    style: TextStyle(
                      color: Color(MyColors.yellow01),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
                Text(
                  'تصفح خدمتك',
                  style: kTitleStyle,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AppointmentCard(
              onTap: onPressedScheduleCard,
            ),
            SizedBox(
              height: 20,
            ),
            AppointmentCard2(
              onTap: onPressedScheduleCard2,
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(MyColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg02),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg03),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class AppointmentCard2 extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard2({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(MyColors.kprimaryButtonsColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    ScheduleCard2(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.ksecondaryButtonCcolor),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.ksecondaryColor),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg01),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "إحجز موعد مع عيادة",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ScheduleCard2 extends StatelessWidget {
  const ScheduleCard2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.kliteblueButtonCcolor),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "طلب إستشارة فورية",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  String image;
  String text;
  final VoidCallback press;

  CategoryIcon({
    required this.image,
    required this.text,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(MyColors.bg01),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoryDoctors(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: press,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(MyColors.bg),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  image,
                  color: Color(MyColors.primary),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color(MyColors.primary),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Color(MyColors.purple02),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'إبحث عن دكتورك المناسب',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserIntro extends StatelessWidget {
  const UserIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/person.jpg'),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'مرحبا بك',
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
            Text(
              '👋 محمود رؤف ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
