import 'package:flutter/material.dart';
import 'package:silverbar_poc/size_calculator.dart';

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
            expandedHeight: SizeCalculator.getComponentHeight(context, 0.335),
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
                SizedBox(
                    height: SizeCalculator.getComponentHeight(context, 0.260),
                    width: double.infinity,
                    child: Card(
                      color: Colors.red,
                      margin: EdgeInsets.all(16),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            contactRowWidget(icon: Icons.email, value: 'johndoe@example.com'),
                            SizedBox(height: 12),
                            contactRowWidget(icon: Icons.phone, value: '(123) 456-7890'),
                            SizedBox(height: 12),
                            contactRowWidget(
                                icon: Icons.location_on, value: '123 Main St, Anytown USA'),
                          ],
                        ),
                      ),
                    )),
                Container(
                    height: SizeCalculator.getComponentHeight(context, 0.440),
                    width: double.infinity,
                    child: Card(
                      color: Colors.green,
                      margin: EdgeInsets.all(16),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text('My Information',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            informationColumnWidget(
                                label: 'Designation', value: 'Softwere Engineer'),
                            informationColumnWidget(label: 'Employee ID', value: 'SR13455'),
                            informationColumnWidget(label: 'Division', value: 'GTO'),
                            informationColumnWidget(label: 'Employee Type', value: 'Contractor'),
                            informationColumnWidget(label: 'Manager Name', value: 'John Doe'),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: SizeCalculator.getComponentHeight(context, 0.190),
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

  Widget contactRowWidget({required IconData icon, required String value}) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 12),
        Text(value),
      ],
    );
  }

  Widget informationColumnWidget({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12.0)),
        SizedBox(
          height: 4,
        ),
        Text(value, style: TextStyle(fontSize: 14.0)),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
