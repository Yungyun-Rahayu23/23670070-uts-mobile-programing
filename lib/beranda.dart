// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart'; 

class Beranda extends StatelessWidget {
  const Beranda({super.key}); 

  //  Batas ukuran tampila
  static const double desktopMaxWidth = 800.0;
  static const double mobileBreakpoint = 600.0;

  @override
  Widget build(BuildContext context) {
    // Fungsi utk tampilan Beranda
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //  Warna latar AppBar
        elevation: 0, //  Tanpa bayang
        title: const Row(
          children: [
            Icon(Icons.menu, color: Colors.black), //  Ikon menu di kiri atas.
            SizedBox(width: 10), //  Jarak ikon dan teks.
            Text(
              'Kampus Kita', 
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // kanan AppBar ikon tema dan notifikasi.
        actions: [
          const Icon(Icons.wb_sunny, color: Colors.amber), //  Ikon tema terang.
          const SizedBox(width: 8),
          Stack(
            //  untk menumpuk elemen (ikon + titik merah notifikasi).
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.black),
                onPressed: () {}, //  Saat ditekan jika belum ada aksi
              ),
              Positioned(
                // titik merah di sudut kanan atas ikon.
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red, // notifikasi baru.
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),

      //  Bagian Menu
      body: LayoutBuilder(
        builder: (context, constraints) {
          //  LayoutBuilder membaca ukuran layar utk menentukan lebar tampilan.
          final double currentWidth = constraints.maxWidth;
          final double contentWidth = currentWidth < mobileBreakpoint
              ? currentWidth //  Jika kecil (HP), gunakan lebar penuh.
              : desktopMaxWidth; //  Jika besar (laptop), batasi 800px.

          return Center(
            // tengah layar.
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: contentWidth),
              child: SingleChildScrollView(
                //  untuk discroll ke bawah
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildHeaderBanner(context), //  Bagian header/banner.
                    const SizedBox(height: 20),

                    //  Bagian "Pintasan"
                    Text(
                      'Pintasan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildQuickActions(), //  Tombol pintasan cepat.
                    const SizedBox(height: 30),

                    //  Menu utama
                    _buildMainMenuGrid(context),
                    const SizedBox(height: 20),

                    //  Aktivitas terbaru
                    Text(
                      'Aktivitas Terbaru',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tugas dikumpulkan: Pemograman Berbasis Mobile - 8 November 2024',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //  Fungsi banner bagian atas halaman.
  Widget _buildHeaderBanner(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        // untuk gambar dan teks bisa ditumpuk.
        children: [
          Image.network(
            //  Menampilkan gambar dari internet.
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbKCnCNc3YXl0sdqXurWMx6g8RGGJhS6Hy5w&s',
            fit: BoxFit.cover, //  Menyesuaikan gambar agar penuh di area.
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              //  Menampilkan loading spinner saat gambar belum selesai dimuat.
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
          ),
          //  Teks sapaan di atas gambar.
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Halo, Yungyun Rahayu!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Selamat Pagi!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Membuat tombol pintasan cepat
  Widget _buildQuickActions() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _QuickActionItem(icon: Icons.today, label: 'Jadwal Hari Ini'),
        _QuickActionItem(icon: Icons.notifications_active, label: 'Informasi'),
        _QuickActionItem(icon: Icons.done_all, label: 'Status Kehadiran'),
      ],
    );
  }

  //  Fungsi untuk membuat grid menu utama
  Widget _buildMainMenuGrid(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'label': 'Profil', 'icon': Icons.account_circle, 'color': Colors.blue.shade700, 'route': '/profile'},
      {'label': 'Nilai Akademik', 'icon': Icons.score, 'color': Colors.green, 'route': null},
      {'label': 'Jadwal Kuliah', 'icon': Icons.calendar_today, 'color': Colors.amber, 'route': null},
      {'label': 'Tagihan', 'icon': Icons.monetization_on, 'color': Colors.lightGreen, 'route': null},
      {'label': 'Tugas', 'icon': Icons.assignment_turned_in, 'color': Colors.deepOrange, 'route': null},
      {'label': 'E-Library', 'icon': Icons.laptop_chromebook, 'color': Colors.brown, 'route': null},
      {'label': 'Point Keaktifan', 'icon': Icons.star, 'color': Colors.redAccent, 'route': null},
      {'label': 'Perpustakaan', 'icon': Icons.library_books, 'color': Colors.indigo, 'route': null},
      {'label': 'Pengaturan', 'icon': Icons.settings, 'color': Colors.grey, 'route': null},
    ];

    return GridView.builder(
      shrinkWrap: true, //  Agar grid bisa berada di dalam scroll.
      physics: const NeverScrollableScrollPhysics(), //  Tidak scroll sendiri.
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //  3 kolom per baris.
        crossAxisSpacing: 10.0, //  Jarak antar kolom.
        mainAxisSpacing: 10.0, //  Jarak antar baris.
        childAspectRatio: 0.9, //  Proporsi ukuran kotak.
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        //  Kirim data ke widget pembuat kotak menu.
        return _gridMenuItem(
          context,
          label: item['label'],
          icon: item['icon'],
          color: item['color'],
          route: item['route'],
        );
      },
    );
  }
}

//  Komponen kecil untuk tombol pintasan (ikon + teks)
class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey, size: 30), //  Ikon utama.
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)), //  Label di bawah ikon.
      ],
    );
  }
}

//  Widget pembuat item grid menu
Widget _gridMenuItem(
  BuildContext context, {
  required String label,
  required IconData icon,
  required Color color,
  required String? route,
}) {
  return InkWell(
    //  InkWell agar item bisa ditekan (efek ripple).
    onTap: () {
      if (route != null) {
        Navigator.pushNamed(context, route); //  Jika ada route, pindah ke halaman lain.
      } else {
        //  Jika belum ada halaman, tampilkan notifikasi bawah.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Menu $label diklik! (Belum ada halaman)')),
        );
      }
    },
    child: Container(
      decoration: BoxDecoration(
        color: color, //  Warna latar belakang menu.
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), //  Bayangan ke bawah.
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.white, size: 35), //  Ikon menu.
          const SizedBox(height: 8),
          Text(
            label, //  Nama menu.
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
