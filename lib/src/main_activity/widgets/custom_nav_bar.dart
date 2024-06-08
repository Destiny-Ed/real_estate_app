import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/src/main_activity/providers/nav_provider.dart';
import 'package:real_estate_app/style/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, state, child) {
        return Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xff2b2b2b),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(state.navItems.length, (index) {
                final icon = state.navItems[index];
                final isSelected = state.navIndex == index;
                return GestureDetector(
                  onTap: () {
                    state.setNavIndex = index;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.darkAmber : const Color(0xff232220),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(isSelected ? 10 : 8),
                    child: Icon(icon, color: AppColors.white, size: 22),
                  ),
                );
              })),
        );
      },
    );
  }
}
