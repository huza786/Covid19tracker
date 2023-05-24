import 'package:covid_tracker/View/World_states.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  String image, name;
  int TotalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  CountryDetails({
    required this.TotalCases,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.name,
    required this.image,
    required this.test,
  });

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.067),
          child: Card(
            child: Column(
              children: [
                ReusableRow(title: 'TotalCases', value: widget.name),
                ReusableRow(
                    title: 'Total Deaths',
                    value: widget.totalDeaths.toString()),
                ReusableRow(
                    title: 'Total Recovered',
                    value: widget.todayRecovered.toString()),
                ReusableRow(title: 'Active', value: widget.active.toString()),
                ReusableRow(
                    title: 'Critical', value: widget.critical.toString()),
                ReusableRow(
                    title: 'TodayRecovered',
                    value: widget.todayRecovered.toString()),
                ReusableRow(title: 'Test', value: widget.test.toString()),
              ],
            ),
          ),
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(widget.image),
          radius: 50,
        ),
      ]),
    );
  }
}
