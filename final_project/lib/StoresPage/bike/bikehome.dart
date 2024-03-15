// ignore: unused_import
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/StoresPage/bike/bikeparts.dart';
import 'package:final_project/services/database1.dart';
import 'package:flutter/material.dart';

class Bikehome extends StatefulWidget {
  const Bikehome({super.key});

  @override
  State<Bikehome> createState() => _HomeState();
}

class _HomeState extends State<Bikehome> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();
  TextEditingController qtycontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  Stream? EmployeeStream;

  getontheload() async {
    EmployeeStream = await DatabaseMethods().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
        stream: EmployeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Item No : " + ds["Item No"],
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      namecontroller.text = ds["Item No"];
                                      agecontroller.text = ds["Model"];
                                      locationcontroller.text = ds["Part"];
                                      qtycontroller.text = ds["QTY"];
                                      pricecontroller.text = ds["Price"];
                                      EditEmployeeDetails(ds["Id"]);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await DatabaseMethods()
                                          .deleteEmployeeDetail(ds["Id"]);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.orange,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Model : " + ds["Model"],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Part : " + ds["Part"],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "QTY : " + ds["QTY"],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Price : " + ds["Price"],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BikeParts()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bike",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Parts",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 20.0, top: 30.0),
        child: Column(
          children: [
            Expanded(child: allEmployeeDetails()),
          ],
        ),
      ),
    );
  }

  Future EditEmployeeDetails(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel)),
                      SizedBox(
                        width: 60.0,
                      ),
                      Text(
                        "Edit",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Details",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Item No",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: namecontroller,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Model",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: agecontroller,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Part",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: locationcontroller,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Text(
                    "QTY",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: qtycontroller,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Text(
                    "Price",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: pricecontroller,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            Map<String, dynamic> updateInfo = {
                              "Item No": namecontroller.text,
                              "Model": agecontroller.text,
                              "QTY": qtycontroller.text,
                              "Price": pricecontroller.text,
                              "Id": id,
                              "Part": locationcontroller.text,
                            };
                            await DatabaseMethods()
                                .updateEmployeeDetail(id, updateInfo)
                                .then((value) {
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Update")))
                ],
              ),
            ),
          ));
}
