import 'dart:convert';
import 'package:flutter/material.dart';
import 'input.dart';
import 'output1.dart';
import 'controller.dart';

class OutputSplashScreen extends StatefulWidget {
  // const OutputSplashScreen({super.key});
  Input input;
  // List<String> response;
  // final VoidCallback onInitializationComplete;

  // OutputSplashScreen(
  //     {required this.response,
  //     required this.input,
  //     required this.onInitializationComplete});
  OutputSplashScreen({required this.input});

  @override
  State<StatefulWidget> createState() => _OutputSplashScreenState();
}

class _OutputSplashScreenState extends State<OutputSplashScreen> {
  @override
  void initState() {
    super.initState();
    // _initializeAsyncDependencies();
    handleSplashscreen();
  }

  void handleSplashscreen() async {
    // Wait for async to complete
    List<String>? dishes = await fetchResult();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => OutputPage1(response: dishes!)));
  }

  Future<List<String>?> fetchResult() async {
    // Do some Network or other stuff
    final response;

    if (widget.input.famCountry == "korea" &&
        widget.input.curCountry == "korea") {
      response = await baseClient().post('/category1', widget.input);
      // if (response == null) return;
      debugPrint('Cat1 success');
    } else if (widget.input.famCountry == "vietnam" &&
        widget.input.curCountry == "vietnam") {
      response = await baseClient().post('/category2', widget.input);
      // if (response == null) return;
      debugPrint('Cat2 success');
    } else if (widget.input.famCountry == "korea" &&
        widget.input.curCountry == "vietnam") {
      response = await baseClient().post('/category3', widget.input);
      // if (response == null) return;
      debugPrint('Cat3 success');
    } else {
      response = await baseClient().post('/category4', widget.input);
      // if (response == null) return;
      debugPrint('Cat4 success');
    }

    var dishesJson = jsonDecode(jsonDecode(jsonEncode(response)))['similar_dishes'];

    final List<String>? dishes =
        dishesJson != null ? List.from(dishesJson) : null;

    print(dishes);

    return dishes;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/food.jpg"),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "You are familiar with ${widget.input.famCountry} foods, and You are curious about ${widget.input.curCountry} foods!",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
