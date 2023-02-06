import 'package:flutter/material.dart';
import 'dart:convert';
import 'homesplash.dart';

class OutputPage1 extends StatefulWidget {
  // const OutputPage1({super.key});

  List<String> response;

  OutputPage1({required this.response});

  @override
  State<OutputPage1> createState() => _OutputPage1State();
}

class _OutputPage1State extends State<OutputPage1> {
  // TextEditingController CtrlTextFormField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "We recommend these foods...",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              height: 600,
              // alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 6,
                  color: const Color(0xffFF8A00),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(widget.response.length, (index) {
                  return Text(
                    "${index + 1}. ${widget.response[index].toString()}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  );
                }),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffFF8A00), // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeSplashScreen()));

                // Get.to(OutputSplashScreen(input: input));
              },
              child: const Text('Return to homepage',
                  style: TextStyle(fontSize: 17)),
            )
          ],
        ),
      ),
    );
  }
}
