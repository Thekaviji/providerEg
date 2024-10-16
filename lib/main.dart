import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_application_provider/increment_provider.dart';
import 'package:simple_application_provider/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IncrementProvider>(
            create: (context) => IncrementProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Provider Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<IncrementProvider>(builder: (context, provider, child) {
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
                    provider.number.last.toString(),  // Get the last number from provider
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
                          provider.number[index].toString(),  // Get each number from provider
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NextPage(
                        number: provider.number,  // Pass the list to NextPage
                      ),
                    ),
                  );
                },
                child: const Text('Next Page'),
              ),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<IncrementProvider>().increment();  // Add a number through the provider
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
