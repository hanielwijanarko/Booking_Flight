import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';

class BookingDetailPage extends StatelessWidget {
  final BookingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pemesanan'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Flight Info Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Obx(() {
                  final flight = controller.selectedFlight.value;
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.flight, color: Colors.blue.shade700),
                          SizedBox(width: 10),
                          Text(
                            flight?.airline ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${controller.fromCity.value} → ${controller.toCity.value}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${flight?.departureTime ?? ''} - ${flight?.arrivalTime ?? ''}',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Penumpang',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    TextField(
                      controller: controller.nameController,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    
                    TextField(
                      controller: controller.ktpController,
                      decoration: InputDecoration(
                        labelText: 'No. KTP',
                        prefixIcon: Icon(Icons.badge, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    
                    TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15),
                    
                    TextField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                        labelText: 'No. HP',
                        prefixIcon: Icon(Icons.phone, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                if (controller.nameController.text.isEmpty ||
                    controller.ktpController.text.isEmpty ||
                    controller.emailController.text.isEmpty ||
                    controller.phoneController.text.isEmpty) {
                  Get.snackbar(
                    'Error',
                    'Mohon lengkapi semua data',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                } else {
                  controller.bookFlight();
                  Get.snackbar(
                    'Berhasil',
                    'Tiket berhasil dipesan!',
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'PESAN SEKARANG',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}