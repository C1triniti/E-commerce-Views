import 'package:flutter/material.dart';
import 'package:store_app/DesignSystem/Components/searchBar/search_bar.dart';
import 'package:store_app/DesignSystem/Components/searchBar/search_bar_view_model.dart';
import 'package:store_app/DesignSystem/Components/productCard/product_card.dart';
import 'package:store_app/DesignSystem/Components/productCard/product_card_view_model.dart';
import 'package:store_app/DesignSystem/Components/navBar/nav_bar.dart';
import 'package:store_app/DesignSystem/Components/navBar/nav_bar_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int actualIndex = 1;  // Define the search tab as the default index
  final SearchFieldViewModel _searchViewModel = SearchFieldViewModel();

  final List<ProductCardViewModel> searchResults = [
    ProductCardViewModel(
      imageUrl: 'lib/Images/t-shirt.png',
      productName: 'Round T-Shirt',
      rating: 4.1,
      reviewCount: 272,
      price: 1499.00,
    ),
    ProductCardViewModel(
      imageUrl: 'lib/Images/joggers.png',
      productName: 'Joggers',
      rating: 4.1,
      reviewCount: 272,
      price: 4236.00,
    ),
    ProductCardViewModel(
      imageUrl: 'lib/Images/poplin-suit.png',
      productName: 'Poplin Suit',
      rating: 4.1,
      reviewCount: 272,
      price: 4236.00,
    ),
    ProductCardViewModel(
      imageUrl: 'lib/Images/round-t-shirt.png',
      productName: 'Round T-Shirt',
      rating: 4.1,
      reviewCount: 272,
      price: 4236.00,
    ),
    // Adicione mais resultados conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: SearchField.instantiate(viewModel: _searchViewModel),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Results for "Shirt"',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.builder(
                padding: const EdgeInsets.only(top: 8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ProductCard.instantiate(viewModel: searchResults[index]);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifications",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          onIndexChanged: (index) {
            setState(() {
              actualIndex = index;
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }
}
