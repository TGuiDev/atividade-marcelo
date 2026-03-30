import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Margatsni",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong', // Se houvesse a fonte, mas usaremos default bold
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories
            SizedBox(
              height: 120, // Aumentado de 110 para 120 para evitar overflow
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStoryItem(
                      "Seu story",
                      "lib/assets/images/marcelo.jpg",
                      true,
                    ),
                    _buildStoryItem(
                      "Gui Portilho",
                      "lib/assets/images/gui_portilho.jpg",
                      false,
                    ),
                    _buildStoryItem(
                      "Gui Alan",
                      "lib/assets/images/gui_silva.jpg",
                      false,
                    ),
                    _buildStoryItem(
                      "Rafa Gimenes",
                      "lib/assets/images/rafa.jpg",
                      false,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1),
            // Feed
            _buildPostItem(
              context,
              "m.ciacco",
              "lib/assets/images/marcelo.jpg",
              "lib/assets/images/postagem.jpg",
              "Thaís, parabéns pela medalha de aluna modelo, é de seu merecimento! 🎓👏 #aluna #modelo #orgulho",
              "1.234",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), label: "Reels"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildStoryItem(String name, String imageUrl, bool isMe) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isMe
                      ? null
                      : const LinearGradient(
                          colors: [Colors.yellow, Colors.orange, Colors.red, Colors.purple],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                  color: isMe ? Colors.grey[300] : null,
                ),
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: AssetImage(imageUrl),
                  ),
                ),
              ),
              if (isMe)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem(
    BuildContext context,
    String username,
    String avatarUrl,
    String postImageUrl,
    String caption,
    String likes,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[300],
                backgroundImage: AssetImage(avatarUrl),
              ),
              const SizedBox(width: 10),
              Text(
                username,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
        // Image
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Image.asset(
            postImageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.error_outline, size: 50, color: Colors.red),
              );
            },
          ),
        ),
        // Actions
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
          ],
        ),
        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "$likes curtidas",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "$username ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: caption),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
