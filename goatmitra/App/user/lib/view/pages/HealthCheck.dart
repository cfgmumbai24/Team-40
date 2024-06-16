import 'package:flutter/material.dart';
import 'package:number_editing_controller/parsed_number_format/text_controller.dart';
import 'package:user/Models/healthModel.dart';
import 'package:user/controllers/mlpost.dart';
import 'package:user/view/pages/Result.dart';
import 'package:user/view/widgets/save_and_open_pdf.dart';
import 'package:user/view/widgets/simple_pdf_api.dart';

class HealthCheckPage extends StatefulWidget {
  final name;
  const HealthCheckPage({Key? key,required this.name}) : super(key: key);

  @override
  State<HealthCheckPage> createState() => _HealthCheckPageState();
}

class _HealthCheckPageState extends State<HealthCheckPage> {
  @override
  Widget build(BuildContext context) {
    final name=widget.name;
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController feverController = TextEditingController();
    TextEditingController runningNoseController = TextEditingController();
    TextEditingController lathargicController = TextEditingController();
    TextEditingController diarrheaController = TextEditingController();
    TextEditingController coughingController = TextEditingController();
    TextEditingController coatController = TextEditingController();
    String _res="";
    bool _isLoading=false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Diagnosis'),
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
                      controller: weightController,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Weight'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: heightController,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Height'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: feverController,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Does the goat have a fever?'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
            
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: runningNoseController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Does the goat have a running nose?'
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
                      controller: lathargicController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Is the goat lathargic?'
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
                      controller: diarrheaController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Does the goat have Diarrhea?'
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
                      controller: coughingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Is the goat coughing/sneezing?'
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
                      controller: coatController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Has the goat shown changes in its coat?'
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
                            setState(() {
                              _isLoading=true;
                            });
                            final simplePdfApi = SimplePdfApi();
                            
                            final simplePdfFile = await simplePdfApi.generateSimpleTextPdf(name: name, weight: weightController.text, height: heightController.text, fever: feverController.text, nose: runningNoseController.text, lathargic: lathargicController.text, diarrhea: diarrheaController.text, sneezing: coughingController.text, coatChange: coatController.text);
                            setState(() {
                              _isLoading=false;
                            });
                            SaveAndOpenDocument.openPDF(simplePdfFile);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Colors.black
                          ),
                          child: Text('Generate Health Card',style: TextStyle(color: Colors.white),),
                        ),
                        SizedBox(height: 20.0),
                       ElevatedButton(
  onPressed: () async {
    setState(() {
      _isLoading = true;
    });
    String result = await Http.post(
      weight: weightController.text,
      height: heightController.text,
      fever: feverController.text,
      lethargy: lathargicController.text,
      diarrhea: diarrheaController.text,
      runningNose: runningNoseController.text,
      coughingSneezing: coughingController.text,
      coatChanges: coatController.text
    );
    setState(() {
      _res = result;
      _isLoading = false;
    });
          Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Result(res:_res)),
);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor:  Colors.black
  ),
  child: Text('Predict Health',style: TextStyle(color: Colors.white),),
),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 500,
               child:Text(_res,style: TextStyle(color: Colors.black),)
            )
          ],
        ),
      ),
    );
  }
}
