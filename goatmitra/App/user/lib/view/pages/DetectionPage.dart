import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DetectionPage extends StatefulWidget {
  @override
  _DetectionPageState createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  Uint8List? _image;
  bool _isLoading=false;
  final ImagePicker _picker = ImagePicker();

  Future<void> selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      Uint8List bytes = await image.readAsBytes();
      setState(() {
        _image = bytes;
      });
    }
  }
  String _response = '';
  // Future<void> _fetchData(data) async {
  //   try {
  //     var request =
  //         http.MultipartRequest('POST', Uri.parse('http://${ip_address}:5000/recognize'));
  //     request.files.add(http.MultipartFile.fromBytes(
  //         'file', data!.readAsBytesSync(),
  //         filename: data.path));
  //     var response = await request.send();
  //     if(response.statusCode==200){
  //       setState(() {
  //         _response = 'Matched';
  //       });
  //       final String url = 'http://${ip_address}:8001/attendance/present/id12345/CS45102';
  //       final response = await http.put(Uri.parse(url));
  //     }else{
  //       setState(() {
  //         _response = 'Not Matched';
  //       });
  //       final String url = 'http://${ip_address}:8001/attendance/id12345/CS45102/absent';
  //       final response = await http.put(Uri.parse(url));
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _response = 'Error: $e';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detection Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                : Text('No image selected.'),
            ElevatedButton(
              child: Text('Pick Image'),
              onPressed: selectImage,
            ),
          ],
        ),
      ),
    );
  }
}