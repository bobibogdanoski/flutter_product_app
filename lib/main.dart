import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Map<String, dynamic>> products = [
    {
      'name': 'Classic B-3 Bomber Jacket',
      'image': 'https://cockpitusa.com/cdn/shop/products/genuine-b-3-bomber-jacket-long-brown-open-Z2102ML.jpg?v=1560249618&width=1000',
      'price': '\$20',
      'description': 'Timeless B-3 bomber jacket, perfect for keeping warm in style.',
    },
    {
      'name': 'Casual Blue Checkered Shirt',
      'image': 'https://www.fashiongroup.com.mk/files/watermark/files/images/slike-proizvoda/media/CON/CONC11-1100-YIWBLU/images/thumbs_w/CONC11-1100-YIWBLU_w_800_1120px.jpg.webp',
      'price': '\$40',
      'description': 'Stylish blue checkered shirt made from premium cotton for a comfortable fit.',
    },
    {
      'name': 'Porsche Money Graphic Tee',
      'image': 'https://drive-fast.de/cdn/shop/products/6489eb103df3c.jpg?v=1686760361&width=700',
      'price': '\$60',
      'description': 'Quirky graphic T-shirt for car enthusiasts. Show your love for Porsche!',
    },
    {
      'name': 'Minimalist Wool Fedora Hat',
      'image': 'https://static.zara.net/assets/public/6cc8/41c7/0c0142babb46/95c2a99be697/05987206800-e1/05987206800-e1.jpg?ts=1732868753225&w=250',
      'price': '\$50',
      'description': 'Elegant wool fedora, designed for both warmth and a sophisticated look.',
    },
    {
      'name': 'Tommy Hilfiger Sneakers',
      'image': 'https://shoptommy.scene7.com/is/image/ShopTommy/FM04921_DW5_BCK?wid=428&hei=564&qlt=80%2C0&resMode=sharp2&op_usm=0.9%2C1.0%2C8%2C0&iccEmbed=0&fmt=webp',
      'price': '\$50',
      'description': 'Sleek Tommy Hilfiger sneakers for casual outings and everyday comfort.',
    },
    {
      'name': 'Lightweight Quilted Jacket',
      'image': 'https://static.pullandbear.net/assets/public/73cd/943a/2d6b4c9e823e/337ddbc1f97f/07591513800-A6M/07591513800-A6M.jpg?ts=1720012491475&w=680&f=auto',
      'price': '\$50',
      'description': 'Modern quilted jacket designed for lightweight warmth and versatility.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.network(
                product['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['name']),
              subtitle: Text('Price: ${product['price']}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: product,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product['image'],
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ${product['price']}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              product['description'],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
