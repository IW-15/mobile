/*
class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendafataran Rekening'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1/5: Pendafataran Rekening', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            LinearProgressIndicator(value: 0.2), // 20% progress
            SizedBox(height: 20),

            // Heading
            Text('Kelola Usaha Jadi Makin Gampang',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 10),
            Text(
                'Kamu hanya perlu nomor rekening Bank Mandiri untuk mendaftar.',
                style: TextStyle(color: Colors.grey)),

            SizedBox(height: 20),

            // Bank number input
            Text('Nomor Rekening Bank Mandiri *',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Contoh: 1234123412',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Referral code input
            Text('Kode Referral (Optional)',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Contoh: 1234123412',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Register button
            ElevatedButton(
              onPressed: () {
                // Handle registration logic
              },
              child: Text('Daftarkan Usaha Saya'),
            ),

            Spacer(),

            // Bank account link
            TextButton(
              onPressed: () {
                // Handle navigation to bank account creation
              },
              child: Text('Belum punya rekening? Buka Rekening Bank Mandiri'),
            ),
          ],
        ),
      ),
    );
  }
}


 */
