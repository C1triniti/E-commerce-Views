import 'package:flutter/material.dart';
import '../../Shared/colors.dart';
import 'search_bar_view_model.dart';

class SearchField extends StatefulWidget {
  final SearchFieldViewModel viewModel;

  const SearchField._({super.key, required this.viewModel});

  static Widget instantiate({required SearchFieldViewModel viewModel}) {
    return SearchField._(viewModel: viewModel);
  }

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.searchController.addListener(() {
      setState(() {
        // This will cause the widget to rebuild whenever the text changes
        widget.viewModel.searchText = widget.viewModel.searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.viewModel.searchController,
        onChanged: widget.viewModel.onSearchTextChanged,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(Icons.search, color: grey700),
            onPressed: widget.viewModel.onSearchPressed,
          ),
          suffixIcon: widget.viewModel.searchText.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: grey700),
                  onPressed: () {
                    widget.viewModel.clearSearchText();
                    setState(() {});  // Atualize o estado para refletir a mudança
                  },
                )
              : null,
          hintText: 'Search items',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
