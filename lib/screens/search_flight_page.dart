import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';
import 'search_result_page.dart';

class SearchFlightPage extends StatelessWidget {
  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Penerbangan'),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // From City
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Kota Asal',
                        prefixIcon: Icon(Icons.flight_takeoff, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) => controller.fromCity.value = value,
                    ),
                    SizedBox(height: 15),

                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Kota Tujuan',
                        prefixIcon: Icon(Icons.flight_land, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) => controller.toCity.value = value,
                    ),
                    SizedBox(height: 15),

                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Tanggal Pergi',
                        prefixIcon: Icon(Icons.calendar_today, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null) {
                          controller.departureDate.value = 
                              '${picked.day}/${picked.month}/${picked.year}';
                        }
                      },
                      controller: TextEditingController(
                        text: controller.departureDate.value,
                      ),
                    ),
                    SizedBox(height: 15),
   
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Tanggal Pulang',
                        prefixIcon: Icon(Icons.calendar_today, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null) {
                          controller.returnDate.value = 
                              '${picked.day}/${picked.month}/${picked.year}';
                        }
                      },
                      controller: TextEditingController(
                        text: controller.returnDate.value,
                      ),
                    ),
                    SizedBox(height: 15),
        
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Jumlah Penumpang',
                              prefixIcon: Icon(Icons.people, color: Colors.blue),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            readOnly: true,
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            if (controller.passengers.value > 1) {
                              controller.passengers.value--;
                            }
                          },
                          icon: Icon(Icons.remove_circle, color: Colors.red),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.passengers.value++;
                          },
                          icon: Icon(Icons.add_circle, color: Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
              
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Cari',
                        prefixIcon: Icon(Icons.search, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: ['Cari', 'Promo', 'Jadwal'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.searchType.value = value!;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
 
            ElevatedButton(
              onPressed: () {
                if (controller.fromCity.value.isNotEmpty &&
                    controller.toCity.value.isNotEmpty) {
                  Get.to(() => SearchResultPage());
                } else {
                  Get.snackbar(
                    'Error',
                    'Mohon lengkapi kota asal dan tujuan',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'CARI PENERBANGAN',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}