import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'تراحم',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                'trahum@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/trahum.jpg',
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 151, 152, 153),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/person.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/person.jpg',
                width: 30.0,
                fit: BoxFit.cover,
              ),
              title: const Text('رسائلي'),
              // onTap: () =>
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const JobsQuestions()),
              // ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/person.jpg',
                width: 30.0,
                fit: BoxFit.cover,
              ),
              title: const Text('الأدمن'),
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const WelcomeSwing()),
              // ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/person.jpg',
                width: 30.0,
                fit: BoxFit.cover,
              ),
              title: const Text('الطبيب'),
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const WelcomeChef()),
              // ),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/person.jpg',
                width: 30.0,
                fit: BoxFit.cover,
              ),
              title: const Text('الصفحة الرئيسية'),
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const AllResults()),
              // ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/person.jpg',
                width: 30.0,
                fit: BoxFit.cover,
              ),
              title: const Text('طلب إستشارة'),
              // onTap: () => reset()
            ),
            ListTile(
              title: const Text('Exit'),
              leading: Icon(
                Icons.exit_to_app,
                size: 30.0,
              ),
              iconColor: Colors.red,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
