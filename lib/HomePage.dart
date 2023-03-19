import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notekeeper/AppUtil.dart';

import 'Collection.dart';
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        title: Text("Notes",style: GoogleFonts.robotoSlab(
          fontSize:20,
          fontWeight: FontWeight.w700,
        ),),
        elevation: 0,
      ),
      body:  Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Notes').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error : ${snapshot.hasError}");
              return const Text("Something  Wrong!");
            } else if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    AppUtil.dataList = snapshot.data!.docs;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.black26,width: 2),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: ListTile(
                          onTap: (){
                            Navigator.pushNamed(context, 'edit',
                                arguments: index);                          },
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          tileColor: Color(0xffFE4DCCF),

                          title: Text("${AppUtil.dataList[index]['title']}",style: GoogleFonts.lato(
                            fontSize: 20,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold
                          ),),
                          subtitle: Text("${AppUtil.dataList[index]['desc']}",style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold
                          ),),
                          trailing: IconButton(
                            splashRadius: 25,
                            icon: const Icon(Icons.delete,color: CupertinoColors.black,),
                            onPressed: () {
                              Helper.instance.deleteData(index: index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            AppUtil.titleController.clear();
            AppUtil.descController.clear();
          });
          Navigator.of(context).pushNamed('add');
        },
        backgroundColor: CupertinoColors.black,
        child: Icon(CupertinoIcons.doc_text_fill),
      ),
    );
  }
}
