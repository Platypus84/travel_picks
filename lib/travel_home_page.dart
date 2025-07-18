import 'package:flutter/material.dart';
import 'package:travel_picks/country_card_list.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  static final List<Map<String, String>> europeCountries = [
    {"emoji": "🇮🇹", "name": "Italien"},
    {"emoji": "🇪🇸", "name": "Spanien"},
    {"emoji": "🇩🇪", "name": "Deutschland"},
    {"emoji": "🇫🇷", "name": "Frankreich"},
    {"emoji": "🇳🇴", "name": "Norwegen"},
  ];

  static final List<Map<String, String>> southAmericaCountries = [
    {"emoji": "🇧🇷", "name": "Brasilien"},
    {"emoji": "🇦🇷", "name": "Argentinien"},
    {"emoji": "🇨🇱", "name": "Chile"},
    {"emoji": "🇵🇪", "name": "Peru"},
    {"emoji": "🇨🇴", "name": "Kolumbien"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "🌎 Willkommen zu deinen Reiseinspirationen",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          CountryCardList(countries: europeCountries, continent: 'Europa'),
          CountryCardList(
            countries: southAmericaCountries,
            continent: 'Südamerika',
          ),
          Wrap(
            spacing: 8,
            children: CountryCardList().getSelectedCountries
                .map((name) => Chip(label: Text(name)))
                .toList(),
          ),
        ],
      ),
    );
  }
}
