import 'package:flutter/material.dart';
import 'package:foodeul/outputsplash.dart';
import 'input.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // TextEditingController CtrlTextFormField = TextEditingController();
  // static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController _famCountryController = TextEditingController();
    final TextEditingController _curCountryController = TextEditingController();
    final TextEditingController _favDishController = TextEditingController();
    final TextEditingController _dislikeIngredientController =
        TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFffffff),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            // key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                const Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 34, color: Color(0xffFF8A00)),
                ),
                const Text(
                  "Foodeul !",
                  style: TextStyle(fontSize: 34, color: Color(0xffFF8A00)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                    controller: _famCountryController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      labelText: "Familiar country",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 43, 2)),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                    controller: _curCountryController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      labelText: "Curious country",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 43, 2)),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                    controller: _favDishController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      labelText: "Your favourite dish",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 43, 2)),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                    controller: _dislikeIngredientController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      labelText: "Ingredient you don't like",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 43, 2)),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffFF8A00), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    var input = Input(
                      famCountry:
                          _famCountryController.text.toString().toLowerCase(),
                      curCountry:
                          _curCountryController.text.toString().toLowerCase(),
                      favDish: _favDishController.text.toString().toLowerCase(),
                      dislikeIngredient: _dislikeIngredientController.text
                          .toString()
                          .toLowerCase(),
                    );
                    debugPrint("familiar country: ${input.famCountry}");
                    debugPrint("curious country: ${input.curCountry}");
                    debugPrint("favorite dish: ${input.favDish}");
                    debugPrint(
                        "dislike ingredient: ${input.dislikeIngredient}");

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            OutputSplashScreen(input: input)));

                    // Get.to(OutputSplashScreen(input: input));
                  },
                  child: const Text('Submit', style: TextStyle(fontSize: 17)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
