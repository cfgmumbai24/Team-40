import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user/view/pages/HomePage.dart';
import 'package:user/view/widgets/save_and_open_pdf.dart';
import 'package:user/view/widgets/simple_pdf_api.dart';

class AddGoat extends StatefulWidget {
  const AddGoat({Key? key}) : super(key: key);
  @override
  State<AddGoat> createState() => _AddGoatState();
}

class _AddGoatState extends State<AddGoat> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController breedController = TextEditingController();
    TextEditingController childrenController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController ownerController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    bool _isLoading=false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Goat Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: breedController,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Breed'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: childrenController,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Number of Children'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
            
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Age of goat'
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: ownerController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Owner of goat'
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: locationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Location of goat'
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            CollectionReference goats = FirebaseFirestore.instance.collection('goats');
                            await goats.add({
                              "age": ageController.text,
                              "breed": breedController.text,
                              "children": childrenController.text,
                              "health": "NA",
                              "location": locationController.text,
                              "name": nameController.text,
                              "owner": ownerController.text
                              // Add more fields as required
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Colors.black
                          ),
                          child: Text('Add',style: TextStyle(color: Colors.white),),
                        ),
                        SizedBox(height: 20.0),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
