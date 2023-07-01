import 'package:flutter/material.dart';
// Uncomment lines 3 and 6 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              //di Column MainAxis ke bawah, dan ke kenan
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Presidential Palace, Dushanbe. Somoni 7',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Republic of Tajikistan',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
// kita bisa mengontrol row dan colum menggunakan MainAxis dan CrossAxis
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      //row di MainAxis ke kanan, dan ke bawah
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The Government of Tajikistan (Taj. Hukumati Jumhurii Tojikiston) '
        'is the highest executive body of state power in Tajikistan. In accordance with Article 64 of the Constitution of Tajikistan,'
        'Thus, the powers and responsibilities of the Government of Tajikistan include ensuring effective management of the economic,'
        'social and cultural spheres and the implementation of laws, joint resolutions of the Majlisi Milli and Majlisi Namoyandagon,'
        'Members of the Government are not entitled to hold another position, be deputies of representative bodies, engage in entrepreneurial activities,',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Search Maps',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps at Tajikistan'),
        ),
        body: ListView(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Dushanbe_Presidential_Palace_01.jpg/1280px-Dushanbe_Presidential_Palace_01.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
