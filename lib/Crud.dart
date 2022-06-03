import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest7_1915016084_yudiaulia/Controller.dart';
import 'package:postest7_1915016084_yudiaulia/MainPage.dart';
import 'package:postest7_1915016084_yudiaulia/item_card.dart';

class Crud_Data extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final TextEditingController nameUpdateController = TextEditingController();
  final TextEditingController passUpdateController = TextEditingController();
  final TextEditingController ageUpdateController = TextEditingController();

  Future<dynamic> CustomAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          actions: [
            Column(
              children: [
                Text(
                  "Update Data Anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: nameUpdateController,
                        decoration: InputDecoration(hintText: "Nama"),
                      ),
                      TextField(
                        controller: passUpdateController,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      TextField(
                        controller: ageUpdateController,
                        decoration: InputDecoration(hintText: "Umur"),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Update",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center(
            child: Text(
              'Manajemen Akun',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                //// VIEW DATA HERE
                StreamBuilder<QuerySnapshot>(
                  stream: users.orderBy('nama', descending: false).snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map(
                                  (e) => ItemCard(
                                    e.get('nama'),
                                    e.get('umur'),
                                    onUpdate: () {
                                      CustomAlert(context);
                                      users.doc(e.id).update({
                                        'nama': nameUpdateController.text,
                                        'password': passUpdateController.text,
                                        'umur': int.tryParse(
                                                ageUpdateController.text) ??
                                            0
                                      });
                                    },
                                    onDelete: () {
                                      users.doc(e.id).delete();
                                    },
                                  ),
                                )
                                .toList(),
                          )
                        : Text('Loading...', textAlign: TextAlign.center,);
                  },
                ),
                SizedBox(height: 150)
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-9, 0),
                        blurRadius: 20,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 160,
                  child: Row(
                    children: [
                      Container(
                          height: 110,
                          width: 110,
                          padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Tambah Data',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                if (nameController.text == '' &&
                                    ageController.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Data Belum Diisi"),
                                  ));
                                } else if (ageController.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Umur Belum Diisi"),
                                  ));
                                } else if (nameController.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Nama Belum Diisi"),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Upload Berhasil"),
                                  ));
                                  users.add({
                                    'nama': nameController.text,
                                    'password': passController.text,
                                    'umur':
                                        int.tryParse(ageController.text) ?? 0,
                                  });
                                }
                              })),
                      SizedBox(
                        width: 18,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(hintText: "Nama"),
                            ),
                            TextField(
                              controller: passController,
                              decoration: InputDecoration(hintText: "Password"),
                            ),
                            TextField(
                              controller: ageController,
                              decoration: InputDecoration(hintText: "Umur"),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
