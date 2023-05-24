import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/View/country_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  StateServices stateServices = StateServices();
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Search country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              controller: _textEditingController,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          // always always i mean it use futurebuilder inside expanded
          Expanded(
            child: FutureBuilder(
              future: stateServices.FetchWorldlist(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ));
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]['country'];
                      if (_textEditingController.text.isEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountryDetails(
                                            TotalCases: snapshot.data![index]
                                                ['cases'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            test: snapshot.data![index]
                                                ['tests'])));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag'])),
                              ),
                            ),
                          ],
                        );
                      } else if (name.toLowerCase().contains(
                          _textEditingController.text.toLowerCase())) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountryDetails(
                                            TotalCases: snapshot.data![index]
                                                ['cases'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            test: snapshot.data![index]
                                                ['tests'])));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag'])),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
