import 'package:flutter/material.dart';
import 'package:nex_common_pagination/view/pagination_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagination Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListView(),
    );
  }
}


class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<String> items = [];
  final int totalItems = 100;
  int currentItems = 0;
  final int pageSize = 20;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchMoreItems(); // load first page
  }

  Future<void> _fetchMoreItems() async {
    if (isLoading) return;
    if (currentItems >= totalItems) return;

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    final newItems = List.generate(pageSize, (index) => 'Item ${currentItems + index + 1}',);
    setState(() {
      items.addAll(newItems);
      currentItems = items.length;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paginated List")),
      body: PaginationWidget(
        paginationFunction: _fetchMoreItems,
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
