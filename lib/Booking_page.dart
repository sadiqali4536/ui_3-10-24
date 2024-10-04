import 'package:flutter/material.dart';
import 'package:seat_booking/Confirm_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? date;
  TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Page"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              date != null
                  ? "${date!.day}-${date!.month}-${date!.year}"
                  : "No Date Chosen!",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null && pickedDate != date) {
                  setState(() {
                    date = pickedDate;
                  });
                }
              },
              child: const Text("Select Date"),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              time != null
                  ? "Selected Time: ${time!.hour}:${time!.minute}"
                  : "No Time Chosen!",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    time = pickedTime;
                  });
                }
              },
              child: const Text("Select Time"),
            ),
            const SizedBox(height: 120),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ), 
              onPressed: () {
                if (date != null && time != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const ConfirmPage()));
                  
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'You booked your seat on ${date!.day}-${date!.month}-${date!.year} at ${time!.hour}:${time!.minute}.')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Set your date and time')));
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Confirm Booking"),
                  SizedBox(width: 8),
                  Icon(Icons.check_circle_outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
