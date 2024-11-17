import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});
  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide:
          const BorderSide(color: Color.fromARGB(255, 5, 5, 5), width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(100)),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 41, 41),
      appBar: AppBar(
        title: const Text('Currency Converter'),
        backgroundColor: const Color.fromARGB(95, 227, 29, 29),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                result.toStringAsFixed(2),
                style: const TextStyle(
                  color: Color.fromARGB(244, 233, 143, 53),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Color.fromARGB(255, 4, 4, 4)),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in INR',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black54,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Convert the input text to a double and multiply by 81 (conversion rate)
                  if (textEditingController.text.isNotEmpty &&
                      double.parse(textEditingController.text) > 0) {
                    result = double.parse(textEditingController.text) * 81;
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 214, 223, 230),
                fixedSize: const Size(410, 50),
              ),
              child: const Text(
                'Convert',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
