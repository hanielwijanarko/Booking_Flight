import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/flight.dart';
import '../models/ticket.dart';
import '../screens/my_ticket_page.dart';

class BookingController extends GetxController {
  var fromCity = ''.obs;
  var toCity = ''.obs;
  var departureDate = ''.obs;
  var returnDate = ''.obs;
  var passengers = 1.obs;
  var searchType = 'Cari'.obs;

  var selectedFlight = Rxn<Flight>();
  var tickets = <Ticket>[].obs;

  final nameController = TextEditingController();
  final ktpController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  List<Flight> getFlights() {
    return [
      Flight(
        airline: 'Garuda Indonesia',
        departureTime: '08:00',
        arrivalTime: '10:30',
        price: 'Rp 1.500.000',
        code: 'GA-101',
      ),
      Flight(
        airline: 'Lion Air',
        departureTime: '10:00',
        arrivalTime: '12:30',
        price: 'Rp 1.200.000',
        code: 'JT-202',
      ),
      Flight(
        airline: 'Citilink',
        departureTime: '14:00',
        arrivalTime: '16:30',
        price: 'Rp 1.000.000',
        code: 'QG-303',
      ),
      Flight(
        airline: 'AirAsia',
        departureTime: '16:00',
        arrivalTime: '18:30',
        price: 'Rp 900.000',
        code: 'QZ-404',
      ),
    ];
  }

  void bookFlight() {
    if (selectedFlight.value != null) {
      final bookingCode = 'BK${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
      final ticket = Ticket(
        bookingCode: bookingCode,
        route: '${fromCity.value} → ${toCity.value}',
        flight: selectedFlight.value!,
        passengerName: nameController.text,
        passengerKTP: ktpController.text,
        passengerEmail: emailController.text,
        passengerPhone: phoneController.text,
      );
      tickets.add(ticket);
      
      // Clear form
      nameController.clear();
      ktpController.clear();
      emailController.clear();
      phoneController.clear();
      
      Get.to(() => MyTicketsPage());
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    ktpController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}