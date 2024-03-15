import 'package:flutter/material.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  "assets/SP.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      width: 500,
                      height: 150,
                      child: const Center(
                        child: Text(
                          "Stores",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/bikehome');
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Bike Parts",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                          ),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(200.00, 50.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 3, 1, 72)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/lighthome');
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Light Vehical",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                          ),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(200.00, 50.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 3, 1, 72)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/heavyhome');
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Heavy Vehical",
                          style: TextStyle(fontSize: 25, color: Colors.red),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(200.00, 50.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 3, 1, 72)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/customer');
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Customers",
                          style: TextStyle(fontSize: 25, color: Colors.red),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(200.00, 50.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 3, 1, 72)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/logout');
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Logout",
                          style: TextStyle(fontSize: 25, color: Colors.red),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(200.00, 50.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 160, 239, 2)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
