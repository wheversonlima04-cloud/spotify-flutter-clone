import 'package:flutter/material.dart';

void main() {
  runApp(const SpotifyClone());
}

class SpotifyClone extends StatelessWidget {
  const SpotifyClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Clone',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Spotify",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [

          const Text(
            "Boa noite",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3,
            children: const [

              PlaylistTile(
                image: "assets/album1.jpg",
                title: "Rock",
              ),

              PlaylistTile(
                image: "assets/album2.jpg",
                title: "Rap",
              ),

              PlaylistTile(
                image: "assets/album3.webp",
                title: "Metal",
              ),

              PlaylistTile(
                image: "assets/album4.jpg",
                title: "Anos 80",
              ),

            ],
          ),

          const SizedBox(height: 25),

          const Text(
            "Músicas",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const SongTile(
            image: "assets/album1.jpg",
            title: "A Cruz e a Espada",
            artist: "Renato Russo",
          ),

          const SongTile(
            image: "assets/album2.jpg",
            title: "Segundo Sol",
            artist: "Cássia Eller",
          ),

          const SongTile(
            image: "assets/album3.webp",
            title: "Bird",
            artist: "Eminem",
          ),

          const SongTile(
            image: "assets/album4.jpg",
            title: "P.I.M.P",
            artist: "50 Cent",
          ),

          const SongTile(
            image: "assets/album5.jpg",
            title: "Snuff",
            artist: "Slipknot",
          ),

          const SongTile(
            image: "assets/album6.webp",
            title: "Taciturn",
            artist: "Corey Taylor",
          ),

          const SongTile(
            image: "assets/album7.jpg",
            title: "Faroeste Caboclo",
            artist: "Legião Urbana",
          ),

          const SongTile(
            image: "assets/album8.jpg",
            title: "Magic",
            artist: "Rude",
          ),

          const SongTile(
            image: "assets/album9.jpg",
            title: "Logo eu",
            artist: "Jorge e Mateus",
          ),

        ],
      ),
    );
  }
}

class PlaylistTile extends StatelessWidget {

  final String image;
  final String title;

  const PlaylistTile({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(6),
      ),

      child: Row(
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),

            child: Image.asset(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class SongTile extends StatefulWidget {

  final String image;
  final String title;
  final String artist;

  const SongTile({
    super.key,
    required this.image,
    required this.title,
    required this.artist,
  });

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {

  bool liked = false;

  @override
  Widget build(BuildContext context) {

    return ListTile(

      leading: Image.asset(
        widget.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),

      title: Text(widget.title),

      subtitle: Text(widget.artist),

      trailing: IconButton(
        icon: Icon(
          liked ? Icons.favorite : Icons.favorite_border,
          color: liked ? Colors.green : Colors.white,
        ),

        onPressed: () {
          setState(() {
            liked = !liked;
          });
        },
      ),
    );
  }
}