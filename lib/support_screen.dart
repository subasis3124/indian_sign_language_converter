import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _FAQItem(
            question: 'How do I start using the Indian Sign Language Translator app?',
            answer: 'Download the app from the Google Play Store or Apple App Store, sign up with your email, and follow the on-screen instructions to explore the app’s features.',
          ),
          _FAQItem(
            question: 'What should I do if the app isn’t recognizing my signs correctly?',
            answer: 'Ensure you\'re in a well-lit area with minimal background distractions. Make sure your camera is properly aligned to capture your gestures. If the issue persists, check for updates or try reinstalling the app.',
          ),
          _FAQItem(
            question: 'Can the app translate Indian Sign Language into multiple languages?',
            answer: 'Yes, the app can translate ISL into text and speech in several Indian languages. You can select your preferred language in the settings.',
          ),
          _FAQItem(
            question: 'Does the app work offline?',
            answer: 'Some features, like the ISL Dictionary, are available offline. However, real-time translation and voice-to-sign conversion require an active internet connection.',
          ),
          _FAQItem(
            question: 'How can I learn Indian Sign Language using this app?',
            answer: 'Access the \'Learn ISL\' section, which includes video tutorials, a dictionary of ISL signs, and interactive quizzes to help you practice.',
          ),
          _FAQItem(
            question: 'What devices are compatible with the app?',
            answer: 'The app is compatible with Android devices running version 6.0 and above, and iOS devices running version 11.0 and above. A device with a high-resolution camera is recommended for the best experience.',
          ),
          _FAQItem(
            question: 'How do I update my profile information?',
            answer: 'Go to the \'Profile\' section in the app, where you can update your personal details, such as your name, email, and preferred language.',
          ),
          _FAQItem(
            question: 'What should I do if I forget my password?',
            answer: 'Click on the "Forgot Password" link on the login page, and follow the instructions to reset your password via email.',
          ),
          _FAQItem(
            question: 'Can I use the app to communicate with someone who doesn’t know sign language?',
            answer: 'Yes, the app can translate your ISL gestures into text or speech, allowing you to communicate with someone who doesn’t know sign language.',
          ),
          _FAQItem(
            question: 'How can I report a bug or issue with the app?',
            answer: 'You can report issues through the \'Contact Us\' section within the app. Fill out the form with details about the bug, and our support team will look into it.',
          ),
          _FAQItem(
            question: 'Does the app store my video data?',
            answer: 'No, the app does not store any video data. All processing is done in real-time, and no personal video information is saved or shared.',
          ),
          _FAQItem(
            question: 'How do I reset the app to its default settings?',
            answer: 'Go to the \'Settings\' menu and select \'Reset to Default.\' This will restore the app to its original settings, but it will not delete your account or personal data.',
          ),
          _FAQItem(
            question: 'Can I customize the voice used for speech output?',
            answer: 'Yes, you can choose from different voices and languages in the app\'s settings under \'Speech Options.\'',
          ),
          _FAQItem(
            question: 'What should I do if the app crashes frequently?',
            answer: 'Ensure your app and device software are up to date. Try clearing the app\'s cache or reinstalling it. If the issue continues, contact our support team through the \'Contact Us\' section.',
          ),
          _FAQItem(
            question: 'How do I delete my account?',
            answer: 'To delete your account, go to the \'Profile\' section, select \'Account Settings,\' and choose \'Delete Account.\' Please note that this action is irreversible.',
          ),
        ],
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              answer,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
