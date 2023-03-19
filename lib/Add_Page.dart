
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notekeeper/AppUtil.dart';

import 'Collection.dart';
import 'Model.dart';

class Add_Page extends StatefulWidget {
  const Add_Page({Key? key}) : super(key: key);

  @override
  State<Add_Page> createState() => _Add_PageState();
}

class _Add_PageState extends State<Add_Page> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: CupertinoColors.white,
            size: 30,
          ),
          onPressed: () {
            var notes = NoteData(
                title: AppUtil.titleController.text, desc: AppUtil.descController.text);
            print(AppUtil.titleController.text);
            Helper.instance.insertData(notes);
              AppUtil.titleController.clear();
              AppUtil.descController.clear();
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: AppUtil.titleController,

              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: AppUtil.descController,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              maxLines: 25,
              decoration: InputDecoration(
                  fillColor: Color(0xffE8D5C4),
                  filled: true,
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Descrption",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),

                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: CupertinoColors.black)),),
            ),
          )
        ],
      ),
      backgroundColor: CupertinoColors.white,
      resizeToAvoidBottomInset: false,
    );
  }
}
