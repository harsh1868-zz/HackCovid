import 'package:covid_tracker/model/reportModel.dart';
import 'package:covid_tracker/service/reports.dart';
import 'package:covid_tracker/widget/chart.dart';
import 'package:covid_tracker/widget/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  Report _report;
  int fallback = 0;

  @override
  void initState() {
    super.initState();
    initialise();
  }

  void initialise() async {
    Report _temp = await getReport();

    setState(() {
      _report = _temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(
          'Reports',
          style: Theme.of(context).textTheme.title,

        ),
//        backgroundColor: Colors.black,
        elevation: 0.0,
        textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,

      ),
      body:

      _report != null
          ? SafeArea(

              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PieChartSample2(_report),
                      _report.updatedDate != null ? Text(
                        'Last Updated - ${_report.updatedDate} ${_report.updatedTime}',
                        style: Theme.of(context).textTheme.overline,
                      ) : SizedBox(),
                      SizedBox(
                        height: 16.0,
                      ),
                      Details(report: _report),
                      Container(
                        child: Image.asset('assets/images/covidmap.png'),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      
                    ],
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
