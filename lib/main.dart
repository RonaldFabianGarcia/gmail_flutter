import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.red),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MailFilter(),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text("INBOX"),
                  ),
                  ListView.builder(
                    itemCount: 30,
                    shrinkWrap: true,
                    physics: FixedExtentScrollPhysics(),
                    itemBuilder: (context, i) {
                      return MailBox();
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class MailBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Card(
        child: ListTile(
            // isThreeLine: true,
            title: Text("Interbank"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Ronald, compra el nuevo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Si no puedes ver este correo"),
              ],
            ),
            leading: CircleAvatar(
              child: Text("I"),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text("1:23PM"), Icon(Icons.star_border)],
            )),
      ),
    );
  }
}

class MailResume extends StatelessWidget {
  final String title;
  final String subtitle;
  final String body;
  const MailResume({
    this.title,
    this.subtitle,
    this.body,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title),
        Text(subtitle),
        Text(body),
      ],
    );
  }
}

class MailFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Card(
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.menu),
            Container(
              width: 200,
              child: Text(
                "Search Mail",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            CircleAvatar(
              radius: 15,
            )
          ],
        ),
      ),
    );
  }
}
