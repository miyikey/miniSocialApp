import 'package:flutter/material.dart';
import '../widgets/post_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final List<Map<String, String>> myPosts = const [
    {
      'content': 'Anyone going to the tech society event this week?',
      'likes': '12',
      'comments': '3',
    },
    {
      'content': 'Working on my Flutter project today!',
      'likes': '20',
      'comments': '4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Michella Krishna',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            '@michella',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Computer Science student building Flutter, backend, and social app projects.',
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _ProfileStat(label: 'Posts', value: '2'),
              _ProfileStat(label: 'Followers', value: '120'),
              _ProfileStat(label: 'Following', value: '85'),
            ],
          ),

          const SizedBox(height: 32),

          const Text(
            'My Posts',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...myPosts.map((post) {
            return PostCard(
              name: 'Michella',
              content: post['content']!,
              likes: post['likes']!,
              comments: post['comments']!,
              showName: false,
            );
          }),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label),
      ],
    );
  }
}