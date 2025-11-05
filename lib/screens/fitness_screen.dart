// lib/fitness_screen.dart
import 'package:flutter/material.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({super.key});

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  int steps = 6500;
  int calories = 220;
  int goalSteps = 10000;

  @override
  Widget build(BuildContext context) {
    double progress = steps / goalSteps;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness Tracker"),
        backgroundColor: const Color(0xFF3A0CA3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Summary",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 12,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    "${(progress * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.directions_walk,
                  color: Colors.deepPurple,
                ),
                title: const Text("Steps"),
                subtitle: Text("$steps / $goalSteps"),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.local_fire_department,
                  color: Colors.redAccent,
                ),
                title: const Text("Calories Burned"),
                subtitle: Text("$calories kcal"),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    steps += 500;
                    calories += 20;
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Activity"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
