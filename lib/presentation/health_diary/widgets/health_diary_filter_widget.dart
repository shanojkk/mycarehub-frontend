import 'package:flutter/material.dart';

class HealthDiaryFiltersWidget extends StatelessWidget {
  const HealthDiaryFiltersWidget({Key? key, required this.filters})
      : super(key: key);
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
