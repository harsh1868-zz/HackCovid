import 'package:covid_tracker/model/reportModel.dart';
import 'package:covid_tracker/service/reports.dart';
import 'package:covid_tracker/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Countriespage extends StatefulWidget {
  @override
  _CountriespageState createState() => _CountriespageState();
}

class _CountriespageState extends State<Countriespage> {
  List<CountryReport> reports, _filteredReports;
  String search;

  @override
  void initState() {
    super.initState();
    initialise();
  }

  initialise() async {
    List<CountryReport> temp = await getAllCountriesReport();
    setState(() {
      reports = temp;
      _filteredReports = reports;
    });
    //print(reports);
  }

  @override
  Widget build(BuildContext context) {
    return reports != null
        ? Scaffold(
            // backgroundColor: Colors.white,
             appBar: AppBar(
          title: Text("Countries"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
            // appBar: AppBar(
            //   title: Text(
            //     'Countries',
            //     style: TextStyle(color: Colors.black),
            //   ),
            //   centerTitle: true,
            //   backgroundColor: Colors.red,
            //   iconTheme: IconThemeData(color: Colors.black),
            //   elevation: 0.0,
            // ),
              backgroundColor: Colors.black,
            body: Column(
              
              children: <Widget>[
          

                SizedBox(height: 30),
                Container(
                  // width: screenAwareSize(300, context),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  // height: screenAwareSize(40, context),
                  decoration: BoxDecoration(
                      color: Color(0xFF262626),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: TextField(
                    style: new TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15.0),
                      border: InputBorder.none,
                      hintText: 'Search Here...',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                   onChanged: (text) {
                            setState(() {
                              _filteredReports = reports
                                  .where((r) => (r.countryName
                                      .toLowerCase()
                                      .contains(text.trim().toLowerCase())))
                                  .toList();
                            });
                          },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: _filteredReports.length,
                    itemBuilder: (BuildContext context, int index) {
                      color:Colors.black87;
                      return Card(
                        margin: const EdgeInsets.only(top: 15.0),
                        color: Bgcolor,
                        child: ListTile(
                           leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/coronadetails.png"),
                                      ),
                          onTap: (){
                            Navigator.pushNamed(context, '/countryReport', arguments: {
                              "countryReports" : _filteredReports[index],
                            });
                          },
                          // leading: FaIcon(FontAwesomeIcons.globeAmericas),
                          title: Text(_filteredReports[index].countryName,style:TextStyle(color:Colors.white),),
                          trailing: Icon(Icons.open_in_new, color: Colors.green,),
                        ),
                      );
                    },
                  ),
                )
              ],
            ))
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
