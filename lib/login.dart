import 'package:flutter/material.dart'; 

const double desktopMaxWidth = 800.0; 
const double mobileBreakpoint = 600.0; 

class Login extends StatefulWidget { 
  const Login({super.key}); 

  @override
  State<Login> createState() => _LoginScreenState(); 
  // Menghubungkan widget Login dengan state-nya (_LoginScreenState)
}

class _LoginScreenState extends State<Login> {
  // Key untuk mengelola status form (validasi, submit, dll)
  final _formKey = GlobalKey<FormState>(); 

  // Controller untuk mengambil nilai input dari TextField
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // URL gambar dummy (logo sekolah/kampus)
  final String dummyImageUrl = 'https://cdn.icon-icons.com/icons2/1802/PNG/512/schoolbag_115682.png';

  // === Fungsi untuk simulasi login ===
  void _attemptLogin() {
    // Navigasi ke halaman dashboard setelah login berhasil
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  void _navigateToRegister() {
    // Menampilkan pesan snackbar sebagai notifikasi
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Arahkan pengguna ke halaman registrasi eksternal atau form Daftar.'),
        backgroundColor: Color.fromARGB(255, 16, 211, 6), // Warna hijau tosca
        duration: Duration(seconds: 2),
      ),
    );
  }

  // === Membersihkan controller ketika halaman ditutup ===
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // === Tampilan utama halaman login ===
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Struktur dasar halaman (AppBar + body)
      backgroundColor: Colors.white, // Warna latar belakang putih
      body: LayoutBuilder( // Digunakan untuk membuat tampilan responsif
        builder: (context, constraints) {
          final double currentWidth = constraints.maxWidth; // Ambil lebar layar saat ini
          final double contentWidth = currentWidth < mobileBreakpoint 
              ? currentWidth // Jika layar kecil gunakan seluruh lebar
              : desktopMaxWidth; // Jika layar besar  batasi lebar 800 px

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: contentWidth), // Batasi ukuran tampilan
              child: SingleChildScrollView( // Supaya halaman bisa digulir (scroll)
                padding: const EdgeInsets.all(32.0), // Jarak sisi
                child: Form( // Form utama untuk input
                  key: _formKey, // Gunakan key untuk validasi
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // === Logo Sekolah ===
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          dummyImageUrl, // URL logo
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover, // Menyesuaikan ukuran gambar
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.school_sharp, 
                            size: 100, 
                            color: Color(0xFF1ABC9C)
                          ), // Jika gagal memuat gambar, tampilkan ikon default
                        ),
                      ),
                      const SizedBox(height: 30),

                      // === Judul Halaman ===
                      const Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 1, 12, 10),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Login menggunakan akun yang sudah terdaftar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // === Input Email ===
                      TextFormField(
                        controller: _emailController, // Ambil nilai dari text field
                        keyboardType: TextInputType.emailAddress,
                        decoration: _buildInputDecoration('Email / ID Pengguna', Icons.person),
                      ),
                      const SizedBox(height: 20),

                      // === Input Password ===
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true, // Agar teks disembunyikan
                        decoration: _buildInputDecoration('Kata Sandi', Icons.lock).copyWith(
                          suffixIcon: const Icon(Icons.visibility_off), // Ikon mata tertutup
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      // === Tombol Lupa Password ===
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {}, // Belum diatur fungsinya
                          child: const Text('Lupa Kata Sandi?', style: TextStyle(color: Color(0xFF1ABC9C))),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // === Tombol MASUK (Login) ===
                      SizedBox(
                        width: double.infinity, // Tombol selebar container
                        child: ElevatedButton(
                          onPressed: _attemptLogin, // Jalankan fungsi login
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color.fromARGB(255, 36, 173, 66),
                            elevation: 5,
                          ),
                          child: const Text(
                            'MASUK',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // === Tombol Daftar ===
                      TextButton(
                        onPressed: _navigateToRegister, // Panggil fungsi daftar
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Belum punya akun? ', style: TextStyle(color: Colors.grey.shade600)),
                            const Text(
                              'Daftar Sekarang', 
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 209, 28)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// === Fungsi dekorasi input umum ===
InputDecoration _buildInputDecoration(String label, IconData icon) {
  return InputDecoration(
    labelText: label, // Label di dalam field
    prefixIcon: Icon(icon, color: const Color.fromARGB(255, 110, 114, 111)), // Ikon di sisi kiri
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), // Sudut membulat
    filled: true, // Isi background field
    fillColor: Colors.grey.shade50, // Warna background lembut
  );
}
