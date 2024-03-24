import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sparrow/core/Backend/firebasemethods.dart';
//import 'package:sparrow/features/model/model.dart' as model;

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  int i = 1;
  Uint8List? _image;

  void selectimage() async {
    Uint8List img = await Firebasemethods().pickimage(ImageSource.gallery);
    _image = img;
  }

  GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _name,
                decoration: InputDecoration(hintText: 'Enter the name'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _description,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(hintText: 'Enter the description'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item quantity';
                  }

                  return null;
                },
              ),
              IconButton(
                  onPressed: () => selectimage(), icon: Icon(Icons.camera_alt)),
              ElevatedButton(
                  onPressed: () async {
                    String res = await Firebasemethods().getdetails(
                        name: _name.text,
                        description: _description.text,
                        index: i,
                        image: _image!);
                    i++;
                    print(res);
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
