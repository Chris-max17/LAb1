import 'package:flutter/material.dart';
import 'package:laborator1/gender.dart';
import 'package:laborator1/measurement.dart';
import 'package:laborator1/height.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  int weight = 70;
  int age = 23;
  double height = 170.0;
  double bmi = 0.0;
  String bmiStatus = "";
  String selectedGender = " ";
  final TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    heightController.text = height.toString();
  }

  @override
  void dispose() {
    heightController.dispose();
    super.dispose();
  }

  void calculateBMI() {
    setState(() {
      height = double.tryParse(heightController.text) ?? 170;
      bmi = weight / ((height / 100) * (height / 100));

      if (bmi < 18.5) {
        bmiStatus = "Underweight";
      } else if (bmi >= 18.5 && bmi < 24.9) {
        bmiStatus = "Normal weight";
      } else if (bmi >= 25 && bmi < 29.9) {
        bmiStatus = "Overweight";
      } else {
        bmiStatus = "Obese";
      }
    });
  }

  void updateWeight(int newWeight) {
    setState(() {
      weight = newWeight;
    });
  }

  void updateAge(int newAge) {
    setState(() {
      age = newAge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD1D9E6),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16), // Add padding around the content
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align all items vertically
              children: [
                const SizedBox(height: 48),
                const Text(
                  'Welcome 😊',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.44,
                  ),
                ),
                const SizedBox(height: 20),
                GenderSelector(), // Gender selector row
                const SizedBox(
                    height: 30), // Space between gender and measurement cards
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Align weight and age side-by-side
                  children: [
                    Expanded(
                      child: MeasurementCard(
                        title: 'Weight',
                        initialValue: weight,
                        onValueChanged: updateWeight,
                      ),
                    ),
                    const SizedBox(width: 22), // Spacing between cards
                    Expanded(
                      child: MeasurementCard(
                        title: 'Age',
                        initialValue: age,
                        onValueChanged: updateAge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 30), // Space between measurement and height input
                HeightInput(
                  heightController: heightController,
                ),
                const SizedBox(height: 26),
                Center(
                  child: Column(
                    children: [
                      Text(
                        bmi == 0 ? 'Your BMI' : bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 67,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF246AFE),
                        ),
                      ),
                      if (bmiStatus.isNotEmpty)
                        Text(
                          bmiStatus,
                          style: const TextStyle(
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF246AFE),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 63),
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF246AFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize:
                        const Size(double.infinity, 50), // Full-width button
                  ),
                  child: const Text(
                    'Let\'s Go',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
