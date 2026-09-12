import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const PageBase(),
    );
  }
}

class PageBase extends StatelessWidget {
  const PageBase({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleAppBar = TextButton.styleFrom(
      foregroundColor: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                style: styleAppBar,
                onPressed: () {},
                child: const Text("Photo"),
              ),
              const SizedBox(width: 16),
              TextButton(
                style: styleAppBar,
                onPressed: () {},
                child: const Text("Paramètre"),
              ),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 30, // 30 photos
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          return ImageTile(
            imageUrl: 'https://picsum.photos/id/${index + 10}/300/300',
          );
        },
      ),
    );
  }
}

// Widget indépendant pour chaque case de la galerie
class ImageTile extends StatefulWidget {
  final String imageUrl;

  const ImageTile({super.key, required this.imageUrl});

  @override
  State<ImageTile> createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; 
        });
      },
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey, 
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
