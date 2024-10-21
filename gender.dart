import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = 'Female'; // Default selected gender

  void updateGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20), // Add vertical padding
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Aligns items in the center
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                updateGender('Male');
              },
              icon: Icon(
                Icons.male,
                color: selectedGender == 'Male'
                    ? Colors.white
                    : const Color(0xFF246AFE),
                size: 24,
              ),
              label: const Text('Male'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedGender == 'Male'
                    ? const Color(0xFF246AFE)
                    : Colors.white,
                foregroundColor: selectedGender == 'Male'
                    ? Colors.white
                    : const Color(0xFF246AFE),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: const Color(0xFF246AFE),
                    width: selectedGender == 'Male' ? 0 : 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 13),
              ),
            ),
          ),
          const SizedBox(width: 20), // Space between buttons
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                updateGender('Female');
              },
              icon: Icon(
                Icons.female,
                color: selectedGender == 'Female'
                    ? Colors.white
                    : const Color(0xFF246AFE),
                size: 24,
              ),
              label: const Text('Female'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedGender == 'Female'
                    ? const Color(0xFF246AFE)
                    : Colors.white,
                foregroundColor: selectedGender == 'Female'
                    ? Colors.white
                    : const Color(0xFF246AFE),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: const Color(0xFF246AFE),
                    width: selectedGender == 'Female' ? 0 : 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
