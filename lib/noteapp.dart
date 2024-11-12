
import 'package:flutter/material.dart';
import 'package:noteapp_firebase/database.dart';
import 'package:random_string/random_string.dart';
class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key});

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {

  TextEditingController titlecontroller=TextEditingController();
    TextEditingController subtitlecontroller=TextEditingController();
      TextEditingController categorycontroller=TextEditingController();
TextEditingController datecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note App"),),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title"),
            SizedBox(height:10),
            SizedBox(
              height:40,
              width:300,
              child: TextField(
                controller: titlecontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),)),
              SizedBox(height:10),
               Text("Subtitle"),
            SizedBox(height:10),
            SizedBox(
              height:40,
              width:300,
              child: TextField(
                controller: subtitlecontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),)),
              SizedBox(height:10),
                 Text("Category"),
            SizedBox(height:10),
            SizedBox(
              height:40,
              width:300,
              child: TextField(
                controller: categorycontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),)),
              SizedBox(height:10),
              
            Text("Date"),
            SizedBox(height:10),
            SizedBox(
              height:40,
              width:300,
              child: TextField(
                controller: datecontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),)),
              SizedBox(height:10),
           

              SizedBox(height:45),
              SizedBox(
                height: 40,
                width:400,
                child: ElevatedButton(
      style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: ()async {
        String Id=randomAlphaNumeric(10);
        Map<String,dynamic> notepadInfoMap={
          "Title":titlecontroller.text,
          "Subtitle":subtitlecontroller.text,
          "Id":Id,
          "Category":categorycontroller.text,
            "Date":datecontroller.text,

        };
        await Database.addNoteappDetails(notepadInfoMap,Id);
       showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text("Notepad details added successfully"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text('OK'),
        ),
      ],
    );
  },
);

      }, child: Text("Add",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),),),

          ],
        ),
      )
    );
  }
}