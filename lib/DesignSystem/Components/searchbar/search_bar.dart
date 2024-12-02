import 'package:flutter/material.dart';
import 'package:store_app/DesignSystem/Shared/colors.dart';
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
        widget.viewModel.searchText = widget.viewModel.searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),  // Ajustando o padding
      child: TextField(
        controller: widget.viewModel.searchController,
        onChanged: widget.viewModel.onSearchTextChanged,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.search, color: grey700),
            onPressed: widget.viewModel.onSearchPressed,
          ),
          suffixIcon: widget.viewModel.searchText.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: grey700),
                  onPressed: () {
                    widget.viewModel.clearSearchText();
                    setState(() {});  // Atualizando o estado
                  },
                )
              : null,
          hintText: 'Search items',
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),  // Ajustando o padding interno
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
