import 'package:flutter/material.dart';
import 'package:user/controllers/mapping.dart';
import 'package:user/view/pages/ProfilePage.dart';

class GoatCard extends StatelessWidget {
  final snap;
  const GoatCard({Key? key,required this.snap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // String name = "Goat";
    var photo = AssetImage("/assets/goatPhoto.jpg");
    // String department = "breed";
    // String year = "age";
    var outo=0x000000;
    return GestureDetector(
      onTap: () {
        Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfilePage(snap:snap)),
);
      },
      child: Container(
          margin: EdgeInsets.only(top: 20),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: Color(outo), offset: Offset(1.5, 1), blurRadius: 2)
            ],
            color: Color.fromARGB(255, 23, 30, 30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text("${snap['name']}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400)),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        snap['health']=="Good"?Icon(Icons.check,color: Colors.green,size: 40,):snap['health']=="NA"?Icon(Icons.dehaze_outlined,color: Colors.grey,size: 40,):Icon(Icons.close,color: Colors.red,size: 40,),
                        Text("${snap['health']}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text("Health Status",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ],
            ),
          )
      )
    );
  }
}