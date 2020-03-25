import 'package:covid_tracker/widget/homewidget.dart';
import 'package:covid_tracker/widget/requirement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: new AppBar(
          title: new Text('Covid'),
          
        ),
      // backgroundColor: Color(0xFFFFFFFF),
      backgroundColor: Color(0xff232d37),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.black87,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width,
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Prevent COVID - 19 ',
                              style: Theme.of(context).textTheme.title.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100),
                            ),
                            SizedBox(
                              height: 32.0,
                            ),
                            HomeNavItems(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                             Text(
                              "Requirments",
                              style: Theme.of(context).textTheme.title.apply(color:Colors.red),

                              
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Help you to prevent viruses better",
                              style: Theme.of(context).textTheme.caption.apply(color:Colors.white),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      ),
                       Requirements(),
                        
                      Container(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'News',
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Center(
                              child:
                                  Image.asset('assets/images/coming_soon.png'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
