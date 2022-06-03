import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final int age;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.name, this.age, {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "$age tahun",
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.blue
                    ),
                    child: Center(
                        child: Icon(
                      Icons.update,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (onUpdate != null) onUpdate!();
                    }),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.red[900],
                    ),
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (onDelete != null) onDelete!();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
