import 'package:flutter/material.dart';

class CheckoutOnePage extends StatelessWidget {
  const CheckoutOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Choose your plan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Free",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textScaleFactor: 1.2,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "7 days",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "\$450",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textScaleFactor: 1.2,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "Per week",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "\$900",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textScaleFactor: 1.2,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "Per month",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "\$2000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textScaleFactor: 1.2,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "Lifetime",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
