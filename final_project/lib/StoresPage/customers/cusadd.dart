import 'package:final_project/services/database4.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CusAdd extends StatefulWidget {
  const CusAdd({super.key});

  @override
  State<CusAdd> createState() => _CusAdd();
}

class _CusAdd extends State<CusAdd> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();
  TextEditingController qtycontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Adding ",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Customer Details",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "NIC No",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Name",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: agecontroller,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "TP",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: locationcontroller,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          Text(
            "Status",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: qtycontroller,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          Text(
            "Paymnet",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: pricecontroller,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  String Id = randomAlphaNumeric(10);
                  Map<String, dynamic> employeeInfoMap = {
                    "NIC No": namecontroller.text,
                    "Name": agecontroller.text,
                    "Status": qtycontroller.text,
                    "Payment": pricecontroller.text,
                    "Id": Id,
                    "TP": locationcontroller.text,
                  };
                  await DatabaseMethods4()
                      .addEmployeeDetails(employeeInfoMap, Id);
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
          )
        ]),
      ),
    );
  }
}
