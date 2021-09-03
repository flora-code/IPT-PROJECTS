import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PT PROJECT')),
      body: Center(
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('UNIVERSITY OF DARESSALAAM'),
            Image.asset('assets/icons/udsm_logo.png'),
          ],
        )),
      ),
      drawer: Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: [
            //  AppBar(title: Text('INDUSTRIAL PROJECT')),
            UserAccountsDrawerHeader(
              accountName: Text('FLORA'),
              accountEmail: Text('floraikanga112@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/kim.jpg'),
              ),
            ),

            ListTile(
              //leading:circlevatar(backgroundColor:Colors.brown,)
              title: Text('Boom Color Changer'),
              onTap: () {
                Navigator.of(context).pushNamed('boom_color_changer_page');
              },
            ),
            ListTile(
              //leading:circlevatar(backgroundColor:Colors.brown,)
              title: Text('Events'),
              onTap: () {
                Navigator.of(context).pushNamed('event_list_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
