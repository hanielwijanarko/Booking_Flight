import 'flight.dart';

class Ticket {
  final String bookingCode;
  final String route;
  final Flight flight;
  final String passengerName;
  final String passengerKTP;
  final String passengerEmail;
  final String passengerPhone;

  Ticket({
    required this.bookingCode,
    required this.route,
    required this.flight,
    required this.passengerName,
    required this.passengerKTP,
    required this.passengerEmail,
    required this.passengerPhone,
  });
}