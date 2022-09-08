import 'package:flutter/material.dart';

class HealthDiaryFiltersWidget extends StatelessWidget {
  const HealthDiaryFiltersWidget({super.key, required this.filters});
  final List<Widget> filters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: filters),
          ),
        )
      ],
    );
  }
}
