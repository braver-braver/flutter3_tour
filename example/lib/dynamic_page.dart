import 'package:easy_refresh/easy_refresh.dart';
import 'package:example/dynamic_item.dart';
import 'package:example/mock/dynamic_mock_data.dart';
import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  List<Map<String, Object>> _listItems = [];
  int _currentPage = 1;
  static const int PAGE_SIZE = 20;

  @override
  void initState() {
    _requestNewItems();
    super.initState();
  }
  void _refresh() async {
    _currentPage = 1;
    _requestNewItems();
  }

  void _load() async {
    _currentPage += 1;
    _requestNewItems();
  }

  void _requestNewItems() async {
    List<Map<String, Object>> _newItems =
        await DynamicMockData.list(_currentPage, PAGE_SIZE);
    setState(() {
      if (_currentPage > 1) {
        _listItems += _newItems;
      } else {
        _listItems = _newItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EasyRefresh(
            onRefresh: _refresh,
            onLoad: _load,
            child: ListView.builder(
              itemCount: _listItems.length,
              itemBuilder: (_, index) {
                return DynamicItem(
                  _listItems[index]['title'] as String,
                  _listItems[index]['imageUrl'] as String,
                  _listItems[index]['viewCount'] as int,
                );
              },
            )));
  }
}
