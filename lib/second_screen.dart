import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lession/list_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, numbersProviderModel, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Text(
              numbersProviderModel.numbers.last.toString(),
              style: const TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 200.0,
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: numbersProviderModel.numbers.length,
                itemBuilder: (context, index) {
                  return Text(
                    numbersProviderModel.numbers[index].toString(),
                    style: const TextStyle(fontSize: 30.0),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbersProviderModel.add();
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
