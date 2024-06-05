import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(
          title: 'Best Offer',
          description: 'Buy 1, Get 1 Free',
        ),
        Offer(
          title: 'Best Offer',
          description: 'Buy 1, Get 1 Free',
        ),
        Offer(
          title: 'Best Offer',
          description: 'Buy 1, Get 1 Free',
        ),
        Offer(
          title: 'Best Offer',
          description: 'Buy 1, Get 1 Free',
        ),
        Offer(
          title: 'Best Offer',
          description: 'Buy 1, Get 1 Free',
        ),
      ],
    );
  }
}

class Offer extends StatelessWidget {

  final String title;
  final String description;
  
  const Offer({ super.key, required this.title, required this.description });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.amber[50],
        elevation: 8.0,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.png'),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    color: Colors.amber[50],
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title, style: Theme.of(context).textTheme.headlineLarge)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    color: Colors.amber[50],
                    padding: const EdgeInsets.all(8.0),
                    child: Text(description, style: Theme.of(context).textTheme.headlineMedium)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}