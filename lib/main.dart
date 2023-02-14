import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('My Profile'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
            titleSpacing: 0,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      child: Text(
                        'JA',
                        style: TextStyle(fontSize: 30),
                      ),
                      radius: 40,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Jishan Ansari",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text('Software Developer')
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 180.0,
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  child: Card(
                    shape: RoundedRectangleBorder(),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 16, top: 20),
                            child: Text('Contact',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.mail_outline,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text('jishan010@gmail.com', style: TextStyle(fontSize: 14.0))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16),
                          child: Row(
                            children: [
                              Icon(Icons.phone_outlined),
                              SizedBox(
                                width: 12,
                              ),
                              Text('+91 9970 655757', style: TextStyle(fontSize: 14.0))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              SizedBox(
                                width: 12,
                              ),
                              Text('Mumbai IND', style: TextStyle(fontSize: 14.0))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 332.0,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 16, top: 20),
                              child: Text('My Information',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Designation', style: TextStyle(fontSize: 12.0)),
                                SizedBox(
                                  width: 12,
                                  height: 4,
                                ),
                                Text('Softwere Engineer', style: TextStyle(fontSize: 14.0))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Employee ID', style: TextStyle(fontSize: 12.0)),
                                SizedBox(
                                  width: 12,
                                  height: 4,
                                ),
                                Text('SR13455', style: TextStyle(fontSize: 14.0))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Division', style: TextStyle(fontSize: 12.0)),
                                SizedBox(
                                  width: 12,
                                  height: 4,
                                ),
                                Text('GTO', style: TextStyle(fontSize: 14.0))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Employee Type', style: TextStyle(fontSize: 12.0)),
                                SizedBox(
                                  width: 12,
                                  height: 4,
                                ),
                                Text('Contractor', style: TextStyle(fontSize: 14.0))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Manager Name', style: TextStyle(fontSize: 12.0)),
                                SizedBox(
                                  width: 12,
                                  height: 4,
                                ),
                                Text('John Doe', style: TextStyle(fontSize: 14.0))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                  height: 155.0,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
