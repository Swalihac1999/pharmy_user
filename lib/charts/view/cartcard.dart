
import 'package:flutter/material.dart';

class cartCard extends StatelessWidget {
  const cartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(136, 102, 101, 101),
      shadowColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.greenAccent,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      child: ListTile(
        subtitle: Column(
          children: [
            Row(
              children: [
                Image.network('https://w7.pngwing.com/pngs/439/541/png-transparent-badmintonracket-yonex-shuttlecock-badminton-racket-sport-sporting-goods-sports-equipment.png',height: 250,width: 100,),
            Text('shuttle bat'),
            const SizedBox(
              height: 5,
            ),  ],
            ),
            
           
            Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ''',),
            // Text(),
          ],
        ),
      ),
    );
  }
}
