import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notekeeper/AppUtil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notekeeper/Collection.dart';
import 'package:notekeeper/Model.dart';

class Edit_Page extends StatefulWidget {
  const Edit_Page({Key? key}) : super(key: key);

  @override
  State<Edit_Page> createState() => _Edit_PageState();
}

class _Edit_PageState extends State<Edit_Page> {
  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context)!.settings.arguments as int;
    WidgetsBinding.instance.addPostFrameCallback((_){
      AppUtil.titleController.text = AppUtil.dataList[i]['title'];
      AppUtil.descController.text = AppUtil.dataList[i]['desc'];
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(
        CupertinoIcons.back,
        color: CupertinoColors.white,
        size: 30,
    ), onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
        NoteData noteData = NoteData(title: AppUtil.titleController.text, desc: AppUtil.descController.text);
        Helper.instance.updateData(index: i, noteData: noteData);
        AppUtil.titleController.clear();
        AppUtil.descController.clear();
        },),
        backgroundColor: CupertinoColors.black,
        title: Text("Edit Note",style: GoogleFonts.robotoSlab(
          fontSize:20,
          fontWeight: FontWeight.w700,
        ),),
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
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
              maxLines: 23,
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
          ),

        ],
      ),
    );
  }
}
