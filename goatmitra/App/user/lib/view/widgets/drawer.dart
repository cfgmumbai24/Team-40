import 'package:flutter/material.dart';
import 'package:user/controllers/mapping.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user/view/pages/DetectionPage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 0.7 * (MediaQuery.of(context).size.width),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: 0.5 * (MediaQuery.of(context).size.width),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListView(children: [
                SizedBox(height: 50),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/profilepic.png'),
                      ),
                    ),
                  ),
                ),
                Container(height: 27),
                ListTile(
                  title: Text('Home',
                      style: GoogleFonts.ptSansCaption(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 34),
                ListTile(
                  title: Text('Diseases Detection',
                      style: GoogleFonts.ptSansCaption(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetectionPage()),
                    );
                  },
                ),
                SizedBox(height: 34),
                ListTile(
                  title: Text('Contact Us',
                      style: GoogleFonts.ptSansCaption(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
            )));
  }
}
