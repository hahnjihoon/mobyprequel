import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  final List<String> userNames = ['유모차1', '유모차2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_book),
        title: Text('moby앱'),
        actions: [Icon(Icons.import_contacts_sharp)],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: userNames.length,
          itemBuilder: (context, index) {
            return UserInfoWidget(
              imagePath: '${index + 1}.png',
              userName: userNames[index],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.phone),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.contact_page),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text(
          '김지훈',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class UserInfoWidget extends StatefulWidget {
  final String imagePath;
  final String userName;

  const UserInfoWidget({
    required this.imagePath,
    required this.userName,
  });

  @override
  _UserInfoWidgetState createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 이미지
        Image.asset(
          widget.imagePath,
          width: 80.0,
          height: 80.0,
        ),
        SizedBox(width: 10.0),
        // 체크박스
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        SizedBox(width: 10.0),
        // 이름
        Text(
          widget.userName,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}