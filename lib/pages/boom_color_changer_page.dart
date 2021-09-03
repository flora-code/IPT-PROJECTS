import 'package:auntie_rafiki/components/round_button.dart';
import 'package:flutter/material.dart';

class BoomColorChangerPage extends StatefulWidget {
  const BoomColorChangerPage({Key? key}) : super(key: key);

  @override
  _BoomColorChangerPageState createState() => _BoomColorChangerPageState();
}

class _BoomColorChangerPageState extends State<BoomColorChangerPage> {
  Color _backgroundColor = Colors.pinkAccent;
  List<Color> _colorList = [
    Colors.blue,
    Colors.amber,
    Colors.grey,
    Colors.yellow,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.color_lens,
          size: 60,
          color: Colors.white,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_rounded)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 70,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Boom - magic color change!'),
          SizedBox(height: 60.0),
          Container(
            height: 100,
            child: ListView.builder(
                itemCount: _colorList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RoundButton(
                      onTap: () {
                        setState(() {
                          _backgroundColor = _colorList[index];
                        });
                      },
                      color: _colorList[index],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
