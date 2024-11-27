import 'package:flutter/material.dart';
import 'package:store_app/DesignSystem/Components/searchbar/search_bar.dart';
import '../Components/searchbar/search_bar_view_model.dart';



class SearchBarSample extends StatefulWidget {
  const SearchBarSample({super.key});

  @override
  State<SearchBarSample> createState() => _SearchBarSampleState();
}

class _SearchBarSampleState extends State<SearchBarSample> {
  final SearchFieldViewModel _viewModel = SearchFieldViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar Example'),
      ),
      body: Column(
        children: [
          SearchField.instantiate(viewModel: _viewModel),
          const Expanded(
            child: Center(
              child: Text(
                'Type something in the search bar!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

