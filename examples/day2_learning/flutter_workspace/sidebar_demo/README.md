# Sidebar Demo — Ubuntu-Desktop Inspired Flutter UI<br/>


https://github.com/user-attachments/assets/d0971d1e-b337-472f-84d7-95bef0991bbd

<br/>

A landscape-locked, fully responsive Flutter UI featuring a custom rounded sidebar and a desktop-style icon grid that navigates to new screens — inspired by the Ubuntu desktop experience.

## Overview

This project implements a custom "Page 1" design consisting of:

- A rounded **side task bar** with two clickable circular icons
- A **main content area** styled like a desktop, with icon shortcuts that open new screens on tap
- Full **responsiveness** across mobile device sizes
- A **landscape-only** orientation lock (both Dart-level and native Android-level)

## Design Specifications

| Element | Property | Value |
|---|---|---|
| Page | Size | 1650 × 720 (base design canvas) |
| Page | Background color | `#FDFBF5` |
| Side task bar | Size | 181 × 720 |
| Side task bar | Color | `#5C5F74` |
| Side task bar | Corner radius | 25 |
| Client image | Size / Position | 144 × 144 at (34, 18) |
| Client image | Corner radius | 50 |
| Data icon image | Size / Position | 150 × 150 at (16, 153) |
| Data icon image | Corner radius | 55 |

## Features

### 1. Responsive Layout
All dimensions are scaled using [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil), with `1650 × 720` set as the reference design size via `ScreenUtilInit`. This ensures the UI scales proportionally across different device screens instead of breaking on smaller/larger phones.

### 2. Custom Sidebar
Built using `Stack` + `Positioned` widgets to place the two circular icons at exact pixel coordinates from the design, matching the original mockup precisely. Icons are clickable via `GestureDetector` and support a `setState`-driven selection state.

### 3. Landscape Lock
The app is locked to landscape orientation using two complementary approaches:
- **Dart-level**: `SystemChrome.setPreferredOrientations()` in `main()`
- **Native Android-level**: `android:screenOrientation="landscape"` set on the main activity in `AndroidManifest.xml`, preventing a brief portrait "flash" on app launch

### 4. Desktop-Style Navigation
The main content area uses a `Wrap` of icon tiles (image + label), each wired to `Navigator.push()` with `MaterialPageRoute`, opening a dedicated full screen per icon — similar to double-clicking an app icon on a desktop environment.

## Project Structure

```
sidebar_demo/
├── android/
│   └── app/src/main/AndroidManifest.xml   # landscape lock (native)
├── assets/
│   └── images/
│       ├── client_image.png
│       └── data_icon_image.png
├── lib/
│   ├── main.dart                          # app entry, sidebar, desktop grid
│   └── screens.dart                       # destination screens (Clients, Data)
└── pubspec.yaml                           # dependencies & asset registration
```

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Android Studio (SDK tools + emulator)
- Run `flutter doctor` to confirm your setup is ready

### Installation

```bash
git clone <your-repo-url>
cd sidebar_demo
flutter pub get
```

### Run

```bash
flutter run
```

> Orientation and manifest changes require a full restart (`flutter run`), not hot reload.

## Dependencies

| Package | Purpose |
|---|---|
| [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil) | Scales fixed design measurements to be responsive across devices |

## Current Status / Roadmap

- [x] Base page layout with sidebar and background color
- [x] Sidebar icons positioned per design spec, clickable
- [x] Responsive scaling across device sizes
- [x] Landscape-only orientation lock
- [x] Main body converted into a desktop-style icon grid with navigation
- [ ] Flesh out actual content for `ClientsScreen` / `DataScreen`
- [ ] Add a dock/taskbar showing open screens (Ubuntu-style)
- [ ] Custom transition animations when opening a screen

## License

Add your license of choice here (e.g. MIT).
