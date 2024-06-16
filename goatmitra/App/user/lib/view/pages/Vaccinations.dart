import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/Models/provider/vaccinaProvider.dart';

class Vaccinations extends StatefulWidget {
  Vaccinations({super.key});

  @override
  State<Vaccinations> createState() => _VaccinationsState();
}

class _VaccinationsState extends State<Vaccinations> {
  @override
  Widget build(BuildContext context) {
    List<String> done= Provider.of<ListProvider>(context).done;
    List<String> remain= Provider.of<ListProvider>(context).remain;
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccinations'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Vaccinations Done:-",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SingleChildScrollView(
                child: Container(
                  height: 300,
                  child: ListView.builder(
                      itemCount: done.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: IconButton(
                              icon: Icon(Icons.dehaze_outlined ,size: 20,),
                              onPressed: () {
                                Provider.of<ListProvider>(context, listen: false)
                                    .removeItem(done[index]);
                              },
                            ),
                            title: Text("${done[index]}",style: TextStyle(color: Colors.green.shade600,fontWeight: FontWeight.bold),),);
                      }),
                ),
              ),
              Text("Vaccinations Remaining:-",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SingleChildScrollView(
                child: Container(
                  height: 400,
                  child: ListView.builder(
                      itemCount: remain.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: IconButton(
                              icon: const Icon(Icons.add ,size: 20,),
                              onPressed: () {
                                Provider.of<ListProvider>(context, listen: false)
                                    .addItem(remain[index]);
                              },
                            ),
                            title: Text("${remain[index]}",style: TextStyle(color: Colors.red.shade600,fontWeight: FontWeight.bold),),);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

