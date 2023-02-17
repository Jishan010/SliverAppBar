import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NestedScroll extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NestedScroll> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
                // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              expandedHeight: 300,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  height: 2,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ),
              elevation: 0,
              centerTitle: false,
              backgroundColor: Colors.white,
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  //todo add back navigation
                },
              ),
              titleSpacing: 0,
              flexibleSpace:
                  LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: false,
                  titlePadding: EdgeInsetsDirectional.only(bottom: 17.0, top: 15.0, start: 50.0),
                  title: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity:
                          top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                      //opacity: 1.0,
                      child: Text('My Profile', style: TextStyle(color: Colors.black))),
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Center(child: Text('JA', style: TextStyle(color: Colors.black))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Jishan Ansari',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Software Engineer',
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
                      ),
                    ],
                  ),
                );
              })),
        ];
      },
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Text("List Item: " + index.toString());
        },
      ),
    ));
  }
}
