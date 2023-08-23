import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthlab/presenation/Medicine/model/medicine.dart';

import '../../data/Medicine_repository/Medicine_repository.dart';

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine List'),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutConfirmation(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: MedicineRepository().loadMedicineData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final List<Medicine> medicines = snapshot.data as List<Medicine>;
              return ListView.builder(
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  final Medicine medicine = medicines[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(medicine.brandName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Generic Name: ${medicine.genericName}'),
                            const Text('Active Ingredients:'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  medicine.activeIngredients.map((ingredient) {
                                return Text(
                                    '${ingredient.name}: ${ingredient.strength}');
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
