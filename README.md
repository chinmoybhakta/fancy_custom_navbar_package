# Your Flutter Package Name

A short and attractive description of what your package does.

---

## ✨ Features

* Easy to use widgets
* Customizable concave/convex shapes
* Lightweight and fast
* Supports Flutter Web, iOS, Android

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  your_package_name: ^1.0.0
```

Run:

```sh
flutter pub get
```

---

## 🚀 Usage Example

Here is a full working example using this package:

```dart
import 'package:custom_bottom_nav_bar/fancy_custom_navbar.dart';
import 'package:flutter/material.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';
import 'screens/screen4.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Screen1(),
      Screen2(),
      Screen3(),
      Screen4(),
    ];

    return MaterialApp(
      home: Scaffold(
        body: pages[selectedScreen],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BottomNavigation(
          currentIndex: selectedScreen,
          onTap: (newIndex) {
            setState(() {
              selectedScreen = newIndex;
            });
          },
          items: const [
            NavBarItem(label: "Home", icon: Icons.home),
            NavBarItem(label: "Love", icon: Icons.favorite),
            NavBarItem(label: "Profile", icon: Icons.person),
            NavBarItem(label: "Setting", icon: Icons.settings),
          ],
          selectedColor: Colors.red,
          unselectedColor: Colors.yellow,
          innerContainerColor: Colors.cyanAccent,
          outerContainerColor: Colors.cyan,
        ),
      ),
    );
  }
}
```

```dart
ConcaveConvexContainer(
  height: 120,
  width: double.infinity,
  curveDepth: 20,
  child: Center(child: Text("Hello Shape!")),
)
```

---

## 🖼️ Use Case Preview

Below are example images showing how this package can be used:

### Example 1 – 

![Example 1](assets/imgs/ss01.png)

### Example 2 – 

![Example 2](assets/imgs/ss02.png)


### Example 3 –

![Example 3](assets/imgs/ss03.png)

> Place your images in a folder named `images/` inside the root of your package.

---

## ⚠️ Limitations

* **Maximum 4 items** are supported across all devices.
* **Long labels are not allowed** (short labels recommended for best UI).

---

## 📐 Customization

You can customize:

* `curveDepth` – how deep the curve is
* `curveType` – concave or convex
* `height` & `width`
* `color` or `gradient`

Example:

```dart
ConcaveConvexContainer(
  curveType: CurveType.concave,
  curveDepth: 30,
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.purple],
  ),
)
```

---

## 📂 Folder Structure

```
your_package/
│
├── lib/
│   └── concave_convex_container.dart
├── images/
│   ├── concave_example.png
│   └── convex_example.png
└── README.md
```

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to change.

---

## 📄 License

This project is licensed under the MIT License.

---

Made with ❤️ using Flutter
