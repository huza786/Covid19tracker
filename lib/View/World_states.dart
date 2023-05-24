import 'package:covid_tracker/Modal/world_states_modal.dart';
import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class World_states extends StatefulWidget {
  const World_states({Key? key}) : super(key: key);

  @override
  State<World_states> createState() => _World_statesState();
}

class _World_statesState extends State<World_states>
    with TickerProviderStateMixin {
  // making an animation controller to control animation later use in animation
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorlist = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];
  StateServices stateServices = StateServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //AsyncSnapshot makes modal data easily accessible
          FutureBuilder(
              future: stateServices.FetchWorldStatesData(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      controller: _controller,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      PieChart(
                        dataMap: {
                          'Total':
                              double.parse(snapshot.data!.cases!.toString()),
                          'Recovered': double.parse(
                              snapshot.data!.recovered!.toString()),
                          'Death':
                              double.parse(snapshot.data!.deaths!.toString()),
                        },
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        colorList: colorlist,
                        legendOptions:
                            LegendOptions(legendPosition: LegendPosition.left),
                        animationDuration: Duration(milliseconds: 1200),
                        chartType: ChartType.ring,
                        chartRadius: MediaQuery.of(context).size.height * .20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      ReusableRow(
                          title: 'Total',
                          value: snapshot.data!.cases.toString()),
                      ReusableRow(
                          title: 'Deaths',
                          value: snapshot.data!.deaths.toString()),
                      ReusableRow(
                          title: 'Recovered',
                          value: snapshot.data!.recovered.toString()),
                      ReusableRow(
                          title: 'Active',
                          value: snapshot.data!.active.toString()),
                      ReusableRow(
                          title: 'Critical',
                          value: snapshot.data!.critical.toString()),
                      ReusableRow(
                          title: 'Deaths',
                          value: snapshot.data!.deaths.toString()),
                      ReusableRow(
                          title: 'Totallly Recovered',
                          value: snapshot.data!.recovered.toString()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 3),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountriesList()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(10)),
                            height: MediaQuery.of(context).size.height * .07,
                            child: const Center(child: Text('Track Countries')),
                          ),
                        ),
                      )
                    ],
                  );
                }
              }),
        ],
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;
  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          )
        ],
      ),
    );
  }
}
