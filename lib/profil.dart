// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart'; 

class Profil extends StatelessWidget {
  const Profil({super.key}); 

  final String profileImagePath = 'assets/images/pp.jpeg'; 

  // === untuk menampilkan "Prodi" dan "Semester" ===
  static Widget _buildInfoChip({required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.5), //  Warna chip dengan transparansi 50%
        borderRadius: BorderRadius.circular(20), //  Membuat chip berbentuk oval
      ),
      child: Text(
        label, 
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      // Struktur utama halaman 
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          //  Tombol panah untuk kembali ke halaman sebelumnya
        ),
        title: const Text('Profil'),
        centerTitle: true, 
      ),

      body: SingleChildScrollView(
        // bisa di-scroll jika konten panjang
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20), //  Jarak atas

            // === Foto Profil ===
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle, //  Membuat bingkai lingkaran
                gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.purple.shade200],
                  //  Memberi gradasi warna di sekitar foto
                ),
              ),
              child: CircleAvatar(
                radius: 60, //  Ukuran foto profil
                backgroundColor: Colors.white, //  Warna latar belakang foto
                child: ClipOval(
                  //  Memastikan foto berbentuk bulat
                  child: Image.asset(
                    profileImagePath,
                    width: 120, // radius * 2
                    height: 120,
                    fit: BoxFit.cover, //  Menyesuaikan foto agar pas di area
                    errorBuilder: (context, error, stackTrace) {
                      //  Jika foto tidak ditemukan, tampilkan ikon person
                      return const Icon(Icons.person, size: 80, color: Colors.grey);
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // === Kartu Informasi Profil ===
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white, //  Warna latar kartu
                borderRadius: BorderRadius.circular(15), //  Sudut melengkung
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), //  Bayangan lembut
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  const Text('Yungyun Rahayu',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text('NPM: 23670070',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const Text('yungyunrahayu01@gmail.com@gmail.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 20),
                  const Divider(), //  Garis pemisah
                  const SizedBox(height: 10),

                  // === Informasi Akademik ===
                  Wrap(
                    spacing: 10, //  Jarak antar chip secara horizontal
                    runSpacing: 10, //  Jarak antar baris chip
                    alignment: WrapAlignment.center, //  Posisi di tengah
                    children: <Widget>[
                      _buildInfoChip(
                        label: 'Prodi: Teknik Informatika',
                        color: const Color(0xFFD4E157),
                      ),
                      _buildInfoChip(
                        label: 'Semester: 5',
                        color: const Color(0xFFFFCC80),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // === Tombol Kembali ke Dashboard ===
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); 
                  //  Kembali ke halaman sebelumnya (dashboard)
                },
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1ABC9C)),
                label: const Text(
                  'Kembali ke Dashboard',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1ABC9C),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE0F2F1), //  Warna tombol
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), //  Membulatkan tombol
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
