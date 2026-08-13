/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(1650,720),
      minTextAdapt:true,
      builder:(context,child){
        return const MaterialApp(
          debugShowCheckedModeBanner:false,
          home:HomePage(),
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
  String selectedLabel:"Clients";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFBF5),
      body:SafeArea(
        child:Row(
          children:[
            _buildSideTaskBar(),
            Expanded(
              child:Center(
                child:Text(
                  "Text : page no. {$selectedLabel}",
                  style:TextStyle(fontSize:20.sp, color:Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSideTaskBar(){
  return Container(
    width:181.w,
    height:720.h,
    decoration:BoxDecoration(
      color:const Color(0xFF5C5F74),
      borderRadius:BorderRadius.circular(25.r),
    ),
    child:Stack(
      children:[
        Positioned(
          left:34.w,
          top:18.h,
          child: _sidebarIcon(
            imagePath:"assets/images/client_image.png",
            size:144,
            radius:50,
            label:"Clients",
          ),
        ),
        Positioned(
          left:16.w,
          top:153.h,
          child: _sidebarIcon(
            imagePath:"assets/images/client_image.png",
            size:150,
            radius:55,
            label:"Data",
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
}){
  final bool isSelected = selectedLabel == label;
  return GestureDetector(
    onTap:()=>setState(()=>selectedLabel = label),
    child:Container(
      width:size.w,
      height:size.h,
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(radius.r),
        border:isSelected ? Border.all(color:Colors.white,width:2) : null,
      ),
      child:ClipRRect(
        borderRadius:BorderRadius.circular(radius.r),
        child: Image.asset(imagePath,fit:BoxFit.cover)
      ),
    ),
  );
}
}
*/