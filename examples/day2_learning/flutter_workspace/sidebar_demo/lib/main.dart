import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1650, 720), // your original design canvas
      minTextAdapt: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this is the "state" — whichever icon was tapped last
  String selectedLabel = "Clients";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF5), // page bg
      body: SafeArea(
        child: Row(
          children: [
            _buildSideTaskBar(),
            Expanded(
              child: Center(
                child: Text(
                  "You are currently in $selectedLabel section",
                  style: TextStyle(fontSize: 55.sp, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideTaskBar() {
    return Container(
      width: 181.w,
      height: 720.h,
      decoration: BoxDecoration(
        color: const Color(0xFF5C5F74),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 21.w,
            top: 18.h,
            child: _sidebarIcon(
              imagePath: 'assets/images/client_image.png',
              size: 144,
              radius: 50,
              label: "Clients",
            ),
          ),
          Positioned(
            left: 16.w,
            top: 168.h,
            child: _sidebarIcon(
              imagePath: 'assets/images/data_icon_image.png',
              size: 150,
              radius: 55,
              label: "Data",
            ),
          ),
          Positioned(
            left: 16.w,
            top: 322.h,
            child: _sidebarIcon(
              imagePath: 'assets/images/calls_image.jpg',
              size: 150,
              radius: 55,
              label: "Calls",
            ),
          ),
          Positioned(
            left: 16.w,
            top: 472.h,
            child: _sidebarIcon(
              imagePath: 'assets/images/network_image.jpg',
              size: 150,
              radius: 55,
              label: "Networking",
            ),
          ),
        ],
      ),
    );
  }

  Widget _sidebarIcon({
    required String imagePath,
    required double size,
    required double radius,
    required String label,
  }) {
    final bool isSelected = selectedLabel == label;
    return GestureDetector(
      onTap: () => setState(() => selectedLabel = label),
      child: Container(
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          border: isSelected
              ? Border.all(color: Colors.white, width: 2)
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius.r),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}