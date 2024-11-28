import 'package:flutter/material.dart';

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(0),
              width: constraints.maxWidth * 0.5,
              child: Card(
                color: Colors.deepPurple.shade100,
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset('assets/images/phone.jpeg'),
                        const SizedBox(height: 10,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Samsung S23 Ultra"),
                            Text("Price : 80000")
                          ],
                        ),
                        const SizedBox(height: 10,),
                        if(constraints.maxWidth > 600)...[
                           const Text("The Samsung Galaxy S20, S20 Plus, and S20 Ultra all have an IP68 rating, indicating resistance to dust and water. They can be submerged in water up to 1.5 meters deep for 30 minutes. Water resistance does not mean that no water enters the device, but rather that it won't impede functionality.")
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}




