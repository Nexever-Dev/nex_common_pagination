import 'package:flutter/material.dart';
import 'package:nex_common_pagination/view/pagination_widget.dart';

void main() {
  runApp( MyListView());
}

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
