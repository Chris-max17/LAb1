import 'package:flutter/material.dart';

class MeasurementCard extends StatefulWidget {
  final String title;
  final int initialValue;
  final ValueChanged<int> onValueChanged; // Callback to pass the updated value

  const MeasurementCard({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onValueChanged,
  });

  @override
  _MeasurementCardState createState() => _MeasurementCardState();
}

class _MeasurementCardState extends State<MeasurementCard> {
  late int currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
  }

  void incrementValue() {
    setState(() {
      currentValue++;
      widget.onValueChanged(currentValue); // Send updated value to parent
    });
  }

  void decrementValue() {
    setState(() {
      if (currentValue > 0) {
        currentValue--;
        widget.onValueChanged(currentValue); // Send updated value to parent
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Color(0xFF8C8C8C),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            currentValue.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 64,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: decrementValue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF246AFE), // Blue background
                  foregroundColor: Colors.white, // White text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  padding: const EdgeInsets.all(20), // Square button with size
                ),
                child: const Icon(Icons.remove, size: 24),
              ),
              ElevatedButton(
                onPressed: incrementValue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF246AFE), // Blue background
                  foregroundColor: Colors.white, // White text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  padding: const EdgeInsets.all(20), // Square button with size
                ),
                child: const Icon(Icons.add, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
