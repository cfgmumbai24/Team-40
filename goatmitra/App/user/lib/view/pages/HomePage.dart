import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/controllers/mapping.dart';
import 'package:user/view/pages/AddGoat.dart';
import 'package:user/view/pages/ChatBot.dart';
import 'package:user/view/widgets/drawer.dart';
import 'package:user/view/widgets/goatCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("user"),
          ),
      drawer: MyDrawer(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddGoat()),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatBot()),
              );
            },
            child: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back,",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
            ),
            Text(
              "Utkarsh!",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 16, right: 16),
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('goats').snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) =>
                          GoatCard(snap: snapshot.data!.docs[index]));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
