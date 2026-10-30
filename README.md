# Mobile Application Development — Lab 02: Adaptive Flutter UI

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%2300B4AB.svg?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)

An adaptive and responsive Flutter application developed for **CSS3344 Mobile Application Development (Lab 02)**. This project demonstrates responsive layout management across screen orientations (Portrait & Landscape), modular widget composition, and cross-platform UI controls combining **Material Design** and **iOS Cupertino** pickers.

---

## 🌟 Key Features

- 👤 **Student Profile Card**: Displays student details (Photo, Name, Student ID) alongside a personal goal quote.
- 📱 **Adaptive & Responsive Layout**: 
  - **Portrait Mode**: Single-column vertical scroll view cleanly displaying student details, hero media, and interactive controls.
  - **Landscape Mode**: Dual-pane split-screen view optimizing horizontal screen space.
- 🎛️ **Cross-Platform Picker Showcase**:
  - **Material Date Picker**: Android-style date selection modal.
  - **Cupertino Date Picker**: iOS-style smooth scrollable date picker modal.
  - **Cupertino Wheel Picker**: iOS-style item wheel picker for role selection.
  - **Material Dropdown**: Standard Material dropdown selection.
- 🏔️ **Decomposed Layout Sections**: Modular widget breakdown featuring title sections, interactive action buttons (Call, Route, Share), and formatted body content.

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev) (SDK `^3.13.5`)
- **Language**: [Dart](https://dart.dev)
- **UI Components**: `flutter/material.dart` & `flutter/cupertino.dart`
- **Design System**: Material 3 Theme (`useMaterial3: true`) with Indigo color scheme

---

## 📁 Project Structure

```
lib/
├── main.dart           # App entry point & MaterialApp configuration
└── lab2screen.dart     # Main adaptive screen & custom section widgets
assets/
├── my_photo.jpg        # Profile image asset
└── swissalps.jpeg      # Scenic hero image asset
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your environment.
- Android Studio, VS Code, or an active emulator / connected physical device.

### Installation & Execution

1. **Clone the repository**:
   ```bash
   git clone https://github.com/NathanClyde1/mobiletuto2.git
   cd mobiletuto2
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   flutter run
   ```

---

## 👨‍💻 Author

- **Student Name**: Sam Ling
- **Student ID**: `BCS24020017`
- **Course**: CSS3344 Mobile Application Development
