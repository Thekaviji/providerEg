import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_application_provider/increment_provider.dart';

class NextPage extends StatefulWidget {
  final List<int> number;
  const NextPage({super.key, required this.number});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Consumer<IncrementProvider>(builder: (context, provider, child){
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: double.infinity,
                color: Colors.redAccent,
                child: Center(
                  child: Text(
                    provider.number.last.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.number.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          provider.number[index].toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );}
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<IncrementProvider>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
