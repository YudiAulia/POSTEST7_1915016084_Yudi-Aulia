import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest7_1915016084_yudiaulia/Controller.dart';

class HasilForm extends StatelessWidget {
  HasilForm({Key? key}) : super(key: key);

  final Controller myControl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
        flexibleSpace: Obx(() => Container(
              color: myControl.switchValue.value ? Colors.orange : Colors.green,
            )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            Obx((() => Text("Nama Widget    : ${myControl.namaWidget}",
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold)))),
            const SizedBox(height: 25),
            Obx((() => Text("Kategori             : ${myControl.option}",
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold)))),
            const SizedBox(height: 25),
            Obx((() => Text("Nama Ruangan : ${myControl.namaRoom}",
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold)))),
            const SizedBox(height: 25),
            Obx((() => Text("Status                 : ${myControl.status}",
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold)))),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
