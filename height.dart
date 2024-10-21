import 'package:flutter/material.dart';

class HeightInput extends StatelessWidget {
  final TextEditingController heightController;

  const HeightInput({super.key, required this.heightController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: [
          const Text(
            'Height (cm)',
            textAlign: TextAlign.center, 
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE1E2E8)),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: heightController,
              decoration: const InputDecoration(
                hintText: 'Enter height in cm',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFBDBDBD),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 17),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}
