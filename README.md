
## Getting started

This package provides a utility class for handling pagination when the user scrolls. It triggers a function to load more data when the user reaches near the bottom of the scrollable content.


## Features

- Automatically detects when the user scrolls near the bottom of the content.
- Triggers a provided pagination function to load more data.
- Customizable to fit various use cases.


## Installation

Add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  nex_common_pagination: <latest-version>
```
Run flutter pub get to install the dependencies.

## Usage

The PaginationWidget class is a StatelessWidget that wraps a child widget and listens for scroll notifications to trigger a pagination function when the user reaches near the bottom of the scrollable content.

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pagination_widget.dart';

class MyListView extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index');
  int totalItems = 100;
  int currentItems = 50;

  void fetchMoreItems() {
    // Fetch more items and update the list
  }

  @override
  Widget build(BuildContext context) {
    return PaginationWidget(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(items[index]));
        },
      ),
      paginationFunction: fetchMoreItems,
      total: totalItems,
      current: currentItems,
      paginate: true,
    );
  }
}

```

### Pagination Widget Parameters
- child (Widget): The child widget that will be wrapped by the pagination logic.
- paginationFunction (void Function()): The function to be called to load more data when the user scrolls near the bottom.
- total (int): The total number of items available.
- current (int): The current number of items loaded.
- paginate (bool?, optional): A flag indicating whether to enable pagination.

# nex_common_pagination
