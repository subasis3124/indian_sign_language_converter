import 'package:flutter/material.dart';
import 'package:isl/isl_to_text.dart';
import 'package:isl/text_to_isl.dart';
import 'package:isl/audio_to_isl.dart';
import 'package:isl/isl_to_audio.dart';
import 'package:isl/quiz_screen.dart';
import 'video_lectures_screen.dart';
import 'support_screen.dart'; // Import your support screen file
import 'contact_screen.dart'; // Import your contact screen file

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ISL Converter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 8,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/image/sanchaar.png'), context);

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/sanchaar.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 30),
            const Text(
              'Translating Signs \n            '
                  '      Connecting Minds...    ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.purpleAccent,
              ),
              child: const Text(
                'Start Now',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ISL Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle(title: 'Conversion'),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CustomButton(
                    icon: Icons.g_translate,
                    label: 'Sign Language to Text/Speech',
                    color: Colors.deepPurple[300]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ISLToTextScreen()),
                      );
                    },
                  ),
                  CustomButton(
                    icon: Icons.text_fields,
                    label: 'Text to Sign Language',
                    color: Colors.purple[300]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TextToISLScreen()),
                      );
                    },
                  ),
                  CustomButton(
                    icon: Icons.record_voice_over,
                    label: 'Voice to Sign',
                    color: Colors.deepPurple[400]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AudioToISLScreen()),
                      );
                    },
                  ),
                  CustomButton(
                    icon: Icons.hearing,
                    label: 'Sign Language to Audio',
                    color: Colors.purple[400]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ISLToAudioScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SectionTitle(title: 'Tutorial & Quiz'),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CustomButton(
                    icon: Icons.video_collection,
                    label: 'Video Lectures',
                    color: Colors.deepPurple[500]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoLecturesScreen()),
                      );
                    },
                  ),
                  CustomButton(
                    icon: Icons.sort_by_alpha,
                    label: 'A-Z Sign Alphabets',
                    color: Colors.purple[500]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ISLAlphabetScreen()),
                      );
                    },
                  ),
                  CustomButton(
                    icon: Icons.quiz,
                    label: 'Quiz',
                    color: Colors.deepPurple[600]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SectionTitle(title: 'Support'),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CustomButton(
                    icon: Icons.support_agent,
                    label: 'Support',
                    color: Colors.purple[600]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SupportScreen()),
                      );
                    },
                  ),
                  CustomButton(
                    icon: Icons.contact_mail,
                    label: 'Contact Us',
                    color: Colors.deepPurple[700]!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ISLAlphabetScreen extends StatelessWidget {
  const ISLAlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A-Z Sign Alphabets & Numbers'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/image/isl_alphabet.jpg',
              width: MediaQuery.of(context).size.width * 1.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/image/isl_number.jpg',
              width: MediaQuery.of(context).size.width * 1.0,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.left,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback onPressed;

  const CustomButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(15.0),
          shadowColor: Colors.black45,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
