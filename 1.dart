import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFollowing = false;
  bool isLiked = false;

  int followers = 850;
  int likes = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
      ),

      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.deepPurple[100],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.deepPurple,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  'Akerke',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text('Student'),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      children: [
                        Text(
                          '$followers',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Followers'),
                      ],
                    ),

                    Column(
                      children: [
                        Text(
                          '$likes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Likes'),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isFollowing = !isFollowing;

                          if (isFollowing) {
                            followers++;
                          } else {
                            followers--;
                          }
                        });
                      },
                      child: Text(
                        isFollowing ? 'Following' : 'Follow',
                      ),
                    ),

                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;

                          if (isLiked) {
                            likes++;
                          } else {
                            likes--;
                          }
                        });
                      },
                      child: Text(
                        isLiked ? 'Liked ❤️' : 'Like ♡',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    setState(() {
                      isFollowing = false;
                      isLiked = false;
                      followers = 850;
                      likes = 120;
                    });
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
