import 'package:flutter/material.dart';
import 'package:nex_common_pagination/view/pagination_widget.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyListView(),
    ),
  );
}

class MyListView extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index');
  final int totalItems = 100;
  final int currentItems = 50;

  MyListView({super.key});

  void fetchMoreItems() {
    // Fetch more items and update the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paginated List")),
      body: PaginationWidget(
        paginationFunction: fetchMoreItems,
        total: totalItems,
        current: currentItems,
        paginate: true,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(items[index]));
          },
        ),
      ),
    );
  }
}
