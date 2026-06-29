import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final postController = TextEditingController();

  String errorMessage = '';

  void submitPost() {
    final content = postController.text.trim();

    if (content.isEmpty) {
      setState(() {
        errorMessage = 'Post cannot be empty.';
      });
      return;
    }

    final newPost = {
      'name': 'Michella',
      'content': content,
      'likes': '0',
      'comments': '0',
    };

    Navigator.pop(context, newPost);
  }

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "What's on your mind?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: postController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'Write something...',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: submitPost,
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}