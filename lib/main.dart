import 'package:flutter/material.dart'; 
import 'package:utspmb/beranda.dart'; 
import 'package:utspmb/login.dart';
import 'package:utspmb/profil.dart';  

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    // build utk membangun tampilan UI dari widget.
    return MaterialApp(
      title: 'Kampus Kita', 

      theme: ThemeData(
        primaryColor: const Color(0xFF1ABC9C), 
        // Warna utama (teal/hijau tosca), digunakan untuk AppBar, tombol, dsb.

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
            .copyWith(secondary: const Color(0xFF4DB6AC)), 
        // Skema warna tambahan utk menentukan warna sekunder untuk elemen UI lain.

        useMaterial3: true, 
        // Mengaktifkan gaya Material Design 3
      ),

      // === Routing (navigasi antar halaman) ===
      initialRoute: '/', 
      // Halaman pertama kali yang dibuka adalah '/' halaman Login.

      routes: {
        '/': (context) => const Login(), 
        // Ketika path '/' dipanggil buka halaman Login.

        '/dashboard': (context) => const Beranda(), 
        // Ketika path '/dashboard' dipanggil buka halaman Beranda (setelah login berhasil).

        '/profile': (context) => const Profil(), 
        // Ketika path '/profile' dipanggil buka halaman Profil pengguna.
      },

      debugShowCheckedModeBanner: false, 
      // Menonaktifkan label "Debug" di pojok kanan atas aplikasi saat dijalankan.
    );
  }
}
