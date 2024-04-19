import 'package:fashion_shops/controllers/auth-controller.dart';
import 'package:fashion_shops/screens/cart/cart-screen.dart';
import 'package:fashion_shops/screens/product/product-screen.dart';
import 'package:fashion_shops/screens/profile/profile-screen.dart';
import 'package:fashion_shops/screens/search/search-screen.dart';
import 'package:fashion_shops/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _showAppBar = true;

  void _onItemTapped(int index) {
    setState(() {
      _showAppBar = index == 0;
    });
  }

  final List<Widget> _pages = [
    const ProductScreen(),
    // SettingsPage(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: _showAppBar
          ? AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  size: 26,
                  color: Colors.black87,
                ),
              ),
              title: Text(
                "BELLEMERÉ",
                style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        color: Colors.black87, // Màu của bóng
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CartScreen());
                  },
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(() => const CartScreen());
                        },
                        icon: const Icon(
                          Icons.local_mall_outlined,
                          size: 26,
                          color: Colors.black87,
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.black87, shape: BoxShape.circle),
                          child: const Text(
                            "5",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : null,
      drawer: const DrawerCustom(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _onItemTapped(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: "Profile")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {},
        tooltip: "Help?",
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sms,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}
