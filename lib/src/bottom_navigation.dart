import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'concave_clipper.dart';
import 'nav_bar_item.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavBarItem> items;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? outerContainerColor;
  final Color? innerContainerColor;
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.selectedColor,
    this.unselectedColor,
    this.innerContainerColor,
    this.outerContainerColor,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  void onItemTapped(int index) {
    widget.onTap(index);
  }

  Widget _buildNavItem(
    int index,
    NavBarItem item,
    Color? selectedColor,
    Color? unselectedColor,
    Color? innerContainerColor,
    Color? outerContainerColor,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.01),
        decoration: BoxDecoration(
          color: outerContainerColor ?? Colors.purple,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.05),
          decoration: BoxDecoration(
            color: (widget.currentIndex == index)
                ? (innerContainerColor ?? Colors.purpleAccent)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (item.svgPath != null) ...[
                SizedBox(
                  width: (screenWidth * 0.2) / widget.items.length,
                  child: SvgPicture.asset(
                    item.svgPath!,
                    colorFilter: ColorFilter.mode(
                      (widget.currentIndex == index)
                          ? (selectedColor ?? Colors.yellow)
                          : (unselectedColor ?? Colors.yellow),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: (screenWidth * 0.2) / widget.items.length,
                  child: Icon(
                    item.icon ?? Icons.navigation_outlined,
                    color: (widget.currentIndex == index)
                        ? (selectedColor ?? Colors.yellow)
                        : (unselectedColor ?? Colors.yellow),
                  ),
                ),
              ],
              if (widget.currentIndex == index) ...[
                SizedBox(width: screenWidth * 0.01),
                Text(
                  item.label,
                  style: TextStyle(
                    color: (index == widget.currentIndex)
                        ? (selectedColor ?? Colors.yellow)
                        : (unselectedColor ?? Colors.yellow),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.1,
      width: screenWidth * 0.9,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.items.length, (index) {
          return Row(
            children: [
              _buildNavItem(
                index,
                widget.items[index],
                widget.selectedColor,
                widget.unselectedColor,
                widget.innerContainerColor,
                widget.outerContainerColor,
              ),
              if (index != widget.items.length - 1) ...[
                SizedBox(
                  width: (screenWidth * 0.1 / widget.items.length),
                  child: ClipPath(
                    clipper: ConcaveClipper(),
                    child: Container(
                      height: 24, // thickness of the line
                      color: widget.outerContainerColor ?? Colors.purple,
                    ),
                  ),
                ),
              ],
            ],
          );
        }),
      ),
    );
  }
}
