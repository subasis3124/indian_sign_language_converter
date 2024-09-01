import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoLecturesScreen extends StatelessWidget {
  const VideoLecturesScreen({super.key});

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Lectures'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVideoSection(
                context,
                'Learn ISL in English',
                [
                  {'id': 'JPV-vboWfhY', 'thumbnail': 'https://img.youtube.com/vi/JPV-vboWfhY/0.jpg'},
                  {'id': 'qcdivQfA41Y', 'thumbnail': 'https://img.youtube.com/vi/qcdivQfA41Y/0.jpg'},
                  {'id': 'vnH2BmcSRMA', 'thumbnail': 'https://img.youtube.com/vi/vnH2BmcSRMA/0.jpg'},
                ],
                'https://youtube.com/playlist?list=PLxYMaKXKMMcMgg4f47WkG7AM0bb3AyjTi&si=2vjwkd5f7NIliJyQ',
              ),
              const SizedBox(height: 20),
              _buildVideoSection(
                context,
                'Learn ISL in Hindi',
                [
                  {'id': '5PF6JXzYyUI', 'thumbnail': 'https://img.youtube.com/vi/5PF6JXzYyUI/0.jpg'},
                  {'id': 'n42ohSmbAFI', 'thumbnail': 'https://img.youtube.com/vi/n42ohSmbAFI/0.jpg'},
                  {'id': '5vHmvYA8Z6Q', 'thumbnail': 'https://img.youtube.com/vi/5vHmvYA8Z6Q/0.jpg'},
                ],
                'https://youtube.com/playlist?list=PLFjydPMg4DapfRTBMokl09Ht-fhMOAYf6&si=SUhirDWsUB82v6X3',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoSection(BuildContext context, String title, List<Map<String, String>> videos, String playlistUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 120, // Adjust the height based on the number of videos
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return _buildVideoThumbnail(context, video['thumbnail']!, video['id']!);
            },
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: TextButton(
            onPressed: () => _launchURL(playlistUrl),
            child: const Text('View More', style: TextStyle(color: Colors.blue)),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoThumbnail(BuildContext context, String thumbnailUrl, String videoId) {
    return GestureDetector(
      onTap: () => _launchURL('https://www.youtube.com/watch?v=$videoId'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Image.network(thumbnailUrl, fit: BoxFit.cover, width: 160, height: 90), // Adjust dimensions as needed
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
