import 'package:flutter/material.dart';
import 'package:project2/model/home_catalog/home_catalog.dart';

List<String> selectedFilters = [];

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> availableFilters = [
    catalogs[0].title,
    catalogs[1].title,
    catalogs[2].title,
    catalogs[3].title,
  ];

  void toggleFilter(String filter) {
    setState(() {
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Catalog'),
      content: Wrap(
        spacing: 8.0,
        children: availableFilters.map((filter) {
          final isSelected = selectedFilters.contains(filter);
          return FilterChip(
            label: Text(filter),
            selected: isSelected,
            onSelected: (_) => toggleFilter(filter),
          );
        }).toList(),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Apply'),
          onPressed: () {
            // Do something with the selected filters
            print(selectedFilters);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
