import 'package:flutter/material.dart';
import 'create_post_screen.dart';
import 'profile_screen.dart';
import '../widgets/post_card.dart';
import '../models/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Post> posts = [
    Post(
      name: 'Michella',
      content: 'Anyone going to the tech society event this week?',
      likes: 12,
      comments: 3,
    ),
    Post(
      name: 'Alex',
      content: 'Looking for a study group for SOFT3202.',
      likes: 8,
      comments: 5,
    ),
    Post(
      name: 'Jamie',
      content: 'Best quiet study spots on campus?',
      likes: 15,
      comments: 7,
    ),
  ];

  Future<void> openCreatePostScreen() async {
    final newPost = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreatePostScreen(),
      ),
    );

    if (newPost != null) {
      setState(() {
        posts.insert(0, newPost);
      });
    }
  }

  void handleBottomNavTap(int index) {
    if (index == 1) {
      openCreatePostScreen();
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusLoop'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),

body: ListView.builder(
  padding: const EdgeInsets.all(16),
  itemCount: posts.length,
  itemBuilder: (context, index) {
    final post = posts[index];

    return PostCard(
      name: post.name,
      content: post.content,
      likes: post.likes.toString(),
      comments: post.comments.toString(),
      isLiked: post.isLiked,
      onLike: () {
        setState(() {
          posts[index] = post.copyWith(
            isLiked: !post.isLiked,
            likes: post.isLiked ? post.likes - 1 : post.likes + 1,
          );
        });
      },
    );
  },
),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: handleBottomNavTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}