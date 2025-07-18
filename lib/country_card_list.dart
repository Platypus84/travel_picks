import 'package:flutter/material.dart';
import 'package:travel_picks/country_card.dart';

class CountryCardList extends StatelessWidget {
  final String continent;
  final List<Map<String, String>> countries;
  final void Function(String) onTap;

  const CountryCardList({
    super.key,
    required this.continent,
    required this.countries,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Text(continent, style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: countries
                .map(
                  (country) => CountryCard(
                    emoji: country["emoji"]!,
                    name: country["name"]!,
                    onTap: () => onTap(country["name"]!),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
