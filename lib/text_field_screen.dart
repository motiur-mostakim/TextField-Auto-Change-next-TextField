import 'package:flutter/material.dart';

class AutoNextTextFieldExample extends StatefulWidget {
  const AutoNextTextFieldExample({super.key});

  @override
  _AutoNextTextFieldExampleState createState() =>
      _AutoNextTextFieldExampleState();
}

class _AutoNextTextFieldExampleState extends State<AutoNextTextFieldExample> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Next TextField Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstController,
              focusNode: _firstFocusNode,
              maxLength:
                  10, // যতটুকু টাইপ করলে পরের TextField এ যাবে সেটি নির্ধারণ করুন
              decoration: const InputDecoration(labelText: 'First TextField'),
              onChanged: (value) {
                if (value.length == 10) {
                  _firstFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_secondFocusNode);
                }
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _secondController,
              focusNode: _secondFocusNode,
              decoration: const InputDecoration(labelText: 'Second TextField'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    super.dispose();
  }
}

void main() {
  runApp(const MaterialApp(home: AutoNextTextFieldExample()));
}
