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
    final isSelected = widget.currentIndex == index;

    return InkWell(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
        padding: EdgeInsets.all(screenWidth * 0.01),
        decoration: BoxDecoration(
          color: outerContainerColor ?? Colors.purple,
          borderRadius: BorderRadius.circular(24),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          padding: EdgeInsets.all(screenWidth * 0.025),
          decoration: BoxDecoration(
            color: isSelected
                ? (innerContainerColor ?? Colors.purpleAccent)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ICON
              if (item.svgPath != null) ...[
                SizedBox(
                  width: (screenWidth * 0.1) / widget.items.length,
                  child: SvgPicture.asset(
                    item.svgPath!,
                    colorFilter: ColorFilter.mode(
                      isSelected
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
                    color: isSelected
                        ? (selectedColor ?? Colors.yellow)
                        : (unselectedColor ?? Colors.yellow),
                  ),
                ),
              ],

              // LABEL (animated)
              AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1.0 : 0.0,
                  child: isSelected
                      ? Row(
                    children: [
                      SizedBox(width: screenWidth * 0.015),
                      Text(
                        item.label,
                        style: TextStyle(
                          color: isSelected
                              ? (selectedColor ?? Colors.yellow)
                              : (unselectedColor ?? Colors.yellow),
                        ),
                      ),
                    ],
                  )
                      : const SizedBox.shrink(),
                ),
              )
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
                  width: (screenWidth * 0.15 / widget.items.length),
                  child: ClipPath(
                    clipper: ConcaveClipper(),
                    child: Container(
                      height: 18, // thickness of the line
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
