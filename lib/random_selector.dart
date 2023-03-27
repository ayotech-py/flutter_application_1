import 'package:flutter/material.dart';

class RandomSelectorPage extends StatefulWidget {
  const RandomSelectorPage({super.key});

  @override
  State<RandomSelectorPage> createState() => _RandomSelectorPageState();
}

class _RandomSelectorPageState extends State<RandomSelectorPage> {
  final formkey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            RangeTextForm(
              labelText: 'Minimum',
              intValueSetter: (value) => _min = value,
            ),
            const SizedBox(
              height: 12,
            ),
            RangeTextForm(
              labelText: "Maximum",
              intValueSetter: (value) => _max = value,
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formkey.currentState?.validate() == true) {
            formkey.currentState?.save();
          }
        },
      ),
    );
  }
}

class RangeTextForm extends StatelessWidget {
  const RangeTextForm({
    super.key,
    required this.labelText,
    required this.intValueSetter,
  });

  final String labelText;

  final void Function(int value) intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      // ignore: prefer_const_constructors
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must be an integer";
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
