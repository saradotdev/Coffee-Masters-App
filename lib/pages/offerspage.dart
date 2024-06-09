import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Center(
          child: Wrap(
            children: [
              Offer(
                title: 'Best Offer',
                description: 'Buy 1, Get 1 Free',
              ),
              Offer(
                title: 'Morning Delight',
                description: '20% off on all orders before 11 AM',
              ),
              Offer(
                title: 'Happy Hour',
                description: 'Buy any large coffee and get a free pastry',
              ),
              Offer(
                title: 'Weekend Special',
                description: '25% off on all orders over \$20',
              ),
              Offer(
                title: 'Student Discount',
                description: '15% off with a valid student ID',
              ),
              Offer(
                title: 'Loyalty Rewards',
                description: 'Earn double points on every purchase',
              ),
              Offer(
                title: 'Family Pack',
                description: 'Buy 4 drinks, get 1 free',
              ),
              Offer(
                title: 'Afternoon Treat',
                description: '10% off all drinks from 2 PM to 5 PM',
              ),
              Offer(
                title: 'New Customer',
                description: 'Get 50% off on your first order',
              ),
              Offer(
                title: 'Referral Bonus',
                description: 'Refer a friend and both get 10% off',
              ),
              Offer(
                title: 'Seasonal Offer',
                description: 'Special discounts on seasonal drinks',
              ),
              Offer(
                title: 'Birthday Treat',
                description: 'Free drink on your birthday',
              ),
            ],
          ),
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
      child: SizedBox(
        height: 168,
        width: 350,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Container(
                    color: Colors.amber[50],
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}