import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBottomNavBarWithChips extends StatefulWidget {
  const CustomBottomNavBarWithChips({super.key});

  @override
  _CustomBottomNavBarWithChipsState createState() =>
      _CustomBottomNavBarWithChipsState();
}

class _CustomBottomNavBarWithChipsState
    extends State<CustomBottomNavBarWithChips> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Page: ${_getLabelForIndex(_selectedIndex)}',
        style: const TextStyle(fontSize: 24),
      )),
      bottomNavigationBar: Container(
        height: 7.h,
        color: const Color(0xFF4B2E83), // Dark purple background
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding for spacing
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildChoiceChip(0, 'assets/home (1).png', "Home"),
              _buildChoiceChip(1, 'assets/message (1).png', "Chat"),
              _buildChoiceChip(2,  'assets/basket (2).png', "Cart"),
              _buildChoiceChip(3,  'assets/settings (1).png' ,"Settings"),
              _buildChoiceChip(4, 'assets/heart (1).png', "Pages"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceChip(int index, String assetPath, String label) {
    return ChoiceChip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 0),
      backgroundColor: const Color(0xFF4B2E83),
      selectedColor: const Color(0xFF4B2E83),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFF4B2E83), // No border when unselected
          width: 0.0,
        ),
        borderRadius: BorderRadius.circular(8), // Rounded border
      ),
      selected: _selectedIndex == index,
      onSelected: (bool selected) {
        setState(() {
          _selectedIndex = index;
        });
      },
      label: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 3.h, // Adjust the image size
            color: _selectedIndex == index
                ? Colors.white
                : Colors.white, // Change color based on selection
          ),
           const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? Colors.white
                  : Colors.white, // Change color based on selection
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Chat";
      case 2:
        return "Cart";
      case 3:
        return "Settings";
      case 4:
        return "Pages";
      default:
        return "Unknown";
    }
  }
}
