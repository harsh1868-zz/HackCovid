import 'dart:core';

class Report {
  int recovered;
  int confirmed;
  int deaths;
  int foreignnation;
  int indiannation;
  int totalCases;
  String updatedDate;
  String updatedTime;

  Report(
      {this.confirmed,
      this.recovered,
      this.foreignnation,
      this.indiannation,
      this.deaths,
      this.totalCases,
      this.updatedDate,
      this.updatedTime});
}

class StateReport {
  int recovered;
  int confirmed;
  int deaths;
  int foreignnation;
  int indiannation;
  int totalCases;
  String updatedDate;
  String updatedTime;
  String statename;

  StateReport(
      {this.confirmed,
      this.recovered,
      this.foreignnation,
      this.indiannation,
      this.deaths,
      this.totalCases,
      this.updatedDate,
      this.updatedTime,
      this.statename});
}

class StateHistory {
  Map<DateTime, int> cases;
  Map<DateTime, int> deaths;
  Map<DateTime, int> recovered;
  StateHistory({this.cases, this.deaths, this.recovered});
}
