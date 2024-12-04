import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:store_app/DesignSystem/Components/productCard/product_card.dart';
import 'package:store_app/DesignSystem/Components/productCard/product_card_view_model.dart';
import 'package:store_app/DesignSystem/Components/navBar/nav_bar.dart';
import 'package:store_app/DesignSystem/Components/navBar/nav_bar_view_model.dart';
import 'package:store_app/Scenes/home/home_page_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int actualIndex = 0;

  final List<ProductCardViewModel> productViewModels = [
    ProductCardViewModel(
      imageUrl: 'lib/Images/t-shirt.png',
      productName: 'Twill Suit',
      rating: 4.1,
      reviewCount: 272,
      price: 5233.00,
    ),
    ProductCardViewModel(
      imageUrl: 'lib/Images/joggers.png',
      productName: 'Joggers',
      rating: 4.5,
      reviewCount: 150,
      price: 6432.00,
    ),
    ProductCardViewModel(
      imageUrl: 'lib/Images/round-t-shirt.png',
      productName: 'Twill Suit',
      rating: 4.1,
      reviewCount: 272,
      price: 5233.00,
    ),
    ProductCardViewModel(
      imageUrl: 'lib/Images/poplin-suit.png',
      productName: 'Joggers',
      rating: 4.5,
      reviewCount: 150,
      price: 6432.00,
    ),
    // Adicione mais cartões conforme necessário
  ];

  final List<String> rectangularImageUrls = [
    'lib/Images/traders.png',
    'lib/Images/ace.png',
    // Adicione mais URLs conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'MyShop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                HomeRouter.goToBagPage(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Alinhamento à esquerda da coluna principal
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),  // Adicionando padding para o título
              child: Text(
                'Suggested for you',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productViewModels.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      HomeRouter.goToProductPage(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ProductCard.instantiate(viewModel: productViewModels[index]),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),  // Adicionando padding horizontal
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,  // Alinhamento à esquerda da coluna
                children: [
                  Text(
                    'SELLERS TO WATCH',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'The shops you should know about',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true,
              ),
              items: rectangularImageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(url, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
            ),
          ],
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
              switch (index){
                case 1:
                HomeRouter.goToSearchPage(context);

                case 0:
                HomeRouter.goToHomePage(context);
              }
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }
}
