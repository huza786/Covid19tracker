class WorldStatesModel {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  WorldStatesModel(
      {this.updated,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion,
      this.affectedCountries});

  WorldStatesModel.fromJson(Map<String, dynamic> json) {
    updated = (json["updated"] as num).toInt();
    cases = (json["cases"] as num).toInt();
    todayCases = (json["todayCases"] as num).toInt();
    deaths = (json["deaths"] as num).toInt();
    todayDeaths = (json["todayDeaths"] as num).toInt();
    recovered = (json["recovered"] as num).toInt();
    todayRecovered = (json["todayRecovered"] as num).toInt();
    active = (json["active"] as num).toInt();
    critical = (json["critical"] as num).toInt();
    casesPerOneMillion = (json["casesPerOneMillion"] as num).toInt();
    deathsPerOneMillion = (json["deathsPerOneMillion"] as num).toDouble();
    tests = (json["tests"] as num).toInt();
    testsPerOneMillion = (json["testsPerOneMillion"] as num).toDouble();
    population = (json["population"] as num).toInt();
    oneCasePerPeople = (json["oneCasePerPeople"] as num).toInt();
    oneDeathPerPeople = (json["oneDeathPerPeople"] as num).toInt();
    oneTestPerPeople = (json["oneTestPerPeople"] as num).toInt();
    activePerOneMillion = (json["activePerOneMillion"] as num).toDouble();
    recoveredPerOneMillion = (json["recoveredPerOneMillion"] as num).toDouble();
    criticalPerOneMillion = (json["criticalPerOneMillion"] as num).toDouble();
    affectedCountries = (json["affectedCountries"] as num).toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["updated"] = updated;
    _data["cases"] = cases;
    _data["todayCases"] = todayCases;
    _data["deaths"] = deaths;
    _data["todayDeaths"] = todayDeaths;
    _data["recovered"] = recovered;
    _data["todayRecovered"] = todayRecovered;
    _data["active"] = active;
    _data["critical"] = critical;
    _data["casesPerOneMillion"] = casesPerOneMillion;
    _data["deathsPerOneMillion"] = deathsPerOneMillion;
    _data["tests"] = tests;
    _data["testsPerOneMillion"] = testsPerOneMillion;
    _data["population"] = population;
    _data["oneCasePerPeople"] = oneCasePerPeople;
    _data["oneDeathPerPeople"] = oneDeathPerPeople;
    _data["oneTestPerPeople"] = oneTestPerPeople;
    _data["activePerOneMillion"] = activePerOneMillion;
    _data["recoveredPerOneMillion"] = recoveredPerOneMillion;
    _data["criticalPerOneMillion"] = criticalPerOneMillion;
    _data["affectedCountries"] = affectedCountries;
    return _data;
  }
}
