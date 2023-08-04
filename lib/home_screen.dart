import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lession/list_provider.dart';
import 'package:provider_lession/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, NumbersProviderModel, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Text(
              NumbersProviderModel.numbers.last.toString(),
              style: const TextStyle(fontSize: 30.0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: NumbersProviderModel.numbers.length,
                itemBuilder: (context, index) {
                  return Text(
                    NumbersProviderModel.numbers[index].toString(),
                    style: const TextStyle(fontSize: 30.0),
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondScreen()));
                },
                child: const Text(
                  'Second Screen',
                  style: TextStyle(fontSize: 30.0),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            NumbersProviderModel.add();
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
