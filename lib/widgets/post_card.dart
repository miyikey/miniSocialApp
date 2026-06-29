import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String name;
  final String content;
  final String likes;
  final String comments;
  final bool showName;

  const PostCard({
    super.key,
    required this.name,
    required this.content,
    required this.likes,
    required this.comments,
    this.showName = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showName)
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    child: Icon(Icons.person, size: 20),
                  ),

                  const SizedBox(width: 12),

                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

            if (showName) const SizedBox(height: 12),

            Text(
              content,
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(Icons.favorite_border, size: 20),
                const SizedBox(width: 4),
                Text(likes),

                const SizedBox(width: 20),

                const Icon(Icons.comment_outlined, size: 20),
                const SizedBox(width: 4),
                Text(comments),

                const Spacer(),

                const Icon(Icons.bookmark_border, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}