import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadJsonToFirestore extends StatefulWidget {
  const UploadJsonToFirestore({super.key});

  @override
  State<UploadJsonToFirestore> createState() => _UploadJsonToFirestoreState();
}

class _UploadJsonToFirestoreState extends State<UploadJsonToFirestore> {
  Future<void> uploadJsonToFirestore() async {
    try {
      // Pick JSON file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null) {
        // Get the file path
        String filePath = result.files.single.path!;

        // Read file content
        File file = File(filePath);
        String fileContent = await file.readAsString();

        // Parse JSON
        List<dynamic> jsonData = json.decode(fileContent);

        // Get Firestore instance
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Reference to the "Report" collection
        CollectionReference reports = firestore.collection('Report');

        // Upload each item in the JSON array
        for (var item in jsonData) {
          await reports.add(item);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('JSON data uploaded successfully')),
        );
      }
    } catch (e) {
      debugPrint('Error uploading JSON: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error uploading JSON data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload JSON to Firestore')),
      body: Center(
        child: ElevatedButton(
          onPressed: uploadJsonToFirestore,
          child: const Text('Upload JSON'),
        ),
      ),
    );
  }
}