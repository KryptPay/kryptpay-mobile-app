import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:krypt/features/dashboard/home/home_screen.dart';
import 'package:krypt/features/dashboard/market_place_screen.dart';
import 'package:krypt/features/scan/scan_to_pay.dart';
import 'package:krypt/util/app_icons.dart';
import 'package:krypt/util/theme/colors.dart';

@RoutePage(name: "DashboardScreenRoute")
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  void setCurrentIndex(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _destinations = [
    const HomeScreen(),
    const MarketPlaceScreen(),
    const ScanToPay(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey100,
      body: SafeArea(child: _destinations[_currentIndex]),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Material(
          elevation: 14,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _renderBottomNavIcon(
                  _currentIndex,
                  positionIndex: 0,
                  selectedIcon: AppIcons.icHomeSelected,
                  unSelectedIcon: AppIcons.icHomeUnSelected,
                  onTap: () => setCurrentIndex(0),
                ),
                _renderBottomNavIcon(
                  _currentIndex,
                  positionIndex: 1,
                  selectedIcon: AppIcons.icMarketSelected,
                  unSelectedIcon: AppIcons.icMarketUnSelected,
                  onTap: () => setCurrentIndex(1),
                ),
                GestureDetector(
                  onTap: () => setCurrentIndex(2),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFD8A200)),
                    child: Center(child: AppIcons.icQrCodeScanner),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: _renderBottomNavIcon(
                    _currentIndex,
                    positionIndex: 3,
                    selectedIcon: AppIcons.icHistorySelected,
                    unSelectedIcon: AppIcons.icHistoryUnSelected,
                    onTap: () => setCurrentIndex(3),
                  ),
                ),
                _renderBottomNavIcon(
                  _currentIndex,
                  positionIndex: 4,
                  selectedIcon: AppIcons.icUserUnSelected,
                  unSelectedIcon: AppIcons.icUserUnSelected,
                  onTap: () => setCurrentIndex(4),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderBottomNavIcon(
    int index, {
    required VoidCallback onTap,
    required int positionIndex,
    required Widget selectedIcon,
    required Widget unSelectedIcon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: index.isNegative || index != positionIndex ? unSelectedIcon : selectedIcon,
    );
  }
}
