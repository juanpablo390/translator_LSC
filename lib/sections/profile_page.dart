import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F509D),
        elevation: 0,
        title: const Text(
          "Perfil",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0.w),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2F509D), Color(0xFF9AB6E4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            CircleAvatar(
              radius: 60.r,
              backgroundColor: const Color.fromARGB(255, 105, 105, 105),
              child: Icon(Icons.person_2_rounded,
                  color: Colors.white,
                  size: 100.sp), // Agrega una imagen en assets
            ),
            SizedBox(height: 20.h),
            Text(
              "Sharith Ortega",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "sharith.ortega@example.com",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Información Personal",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F509D),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      ListTile(
                        leading:
                            const Icon(Icons.phone, color: Color(0xFF2F509D)),
                        title: Text(
                          "+57 300 123 4567",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on,
                            color: Color(0xFF2F509D)),
                        title: Text(
                          "Bogotá, Colombia",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.cake, color: Color(0xFF2F509D)),
                        title: Text(
                          "23 años",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.white),
                        label: Text(
                          "Editar Perfil",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F509D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
