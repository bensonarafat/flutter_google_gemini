import 'package:flutter/material.dart';
import 'package:flutter_google_gemini/flutter_google_gemini.dart';
import 'package:flutter_google_gemini_example/pages/chat.dart';
import 'package:flutter_google_gemini_example/pages/generate_from_text.dart';
import 'package:flutter_google_gemini_example/pages/generate_from_text_and_image.dart';
import 'package:flutter_google_gemini_example/pages/stream_fast_interactions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Google Gemini
  await FlutterGoogleGemini.initialize(
    modelName: 'gemini-pro',
    apiKey: 'AIzaSyCfJ6mTB1bjc5uPqsv6wdOUJ_Mdt9MPQsw',
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Google Gemini'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Usecases",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GenerateFromText()),
                  );
                },
                child: const Text("Generate Text From Text"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GenerateFromTextAndImage()),
                  );
                },
                child: const Text("Generate Text From Text and Image"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chat()),
                  );
                },
                child: const Text("Multi-turn conversations"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StreamFastInteraction()),
                  );
                },
                child: const Text("Streaming for faster interactions"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
