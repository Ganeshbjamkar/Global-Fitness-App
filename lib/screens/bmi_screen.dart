import 'package:flutter/material.dart';
import 'package:global_fitness/shared/menu_bottom.dart';
import 'package:global_fitness/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];

    super.initState();
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert a height in ${(isMetric) ? 'meters' : 'inches'}';
    weightMessage =
        'Please insert a weight in ${(isMetric) ? 'kilogram' : 'pounds'}';
    return Scaffold(
        appBar: AppBar(title: const Text('BMI calculator')),
        bottomNavigationBar: const MenuBottom(),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ToggleButtons(
                isSelected: isSelected,
                onPressed: toggleMeasure,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metrics',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                    controller: txtWeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: weightMessage)),
              ),
              ElevatedButton(
                onPressed: findBMI,
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Text(
                result,
                style: TextStyle(fontSize: fontSize),
              )
            ],
          ),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
}
