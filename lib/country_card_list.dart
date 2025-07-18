import 'package:flutter/material.dart';
import 'package:travel_picks/country_card.dart';

class CountryCardList extends StatefulWidget {
  final String continent;
  final List<Map<String, String>> countries;
  final List<String> _selectedCountries = [];

  CountryCardList({
    super.key,
    required this.continent,
    required this.countries,
  });

  get getSelectedCountries {
    return _selectedCountries;
  }

  @override
  State<CountryCardList> createState() => _CountryCardListState();
}

class _CountryCardListState extends State<CountryCardList> {
  void _addCountry(String countryName) {
    if (!widget._selectedCountries.contains(countryName)) {
      setState(() {
        widget._selectedCountries.add(countryName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 24),
        Text(widget.continent, style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.countries
                .map(
                  (country) => CountryCard(
                    emoji: country["emoji"]!,
                    name: country["name"]!,
                    onTap: () => _addCountry(country["name"]!),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
