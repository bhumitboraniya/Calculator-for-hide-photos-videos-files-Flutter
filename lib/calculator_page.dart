import 'dart:io';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_calculator_vault/authendication_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:math_expressions/math_expressions.dart';
// import 'package:path_provider/path_provider.dart';

// import 'calculator_page.dart';
// import 'vault_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});
  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController textEditingController = TextEditingController();
  String exp = "";
  double bmargin = 5;
  double bsize = 85;
  double bheight = 60;
  bool showPage2Content = false;

  void togglePage2Content() {
    setState(() {
      showPage2Content = !showPage2Content;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double containerWidth = screenWidth * 0.8; // 80% of the screen width
    if (showPage2Content) {
      return const AuthendicationPage(title: 'Enter Your Password');
    }

    // double bsize = 85;

    final textFieldBorder = OutlineInputBorder(
    );

    final threeDButton = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    );

    return WillPopScope(
      onWillPop: () async {
        // Program to exit app
        // ignore: unused_local_variable, use_build_context_synchronously
        bool shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App?'),
            content: const Text('Are you sure you want to exit?'),
            actions: <Widget>[
              TextButton(
                // onPressed: () => Navigator.of(context).pop(true),
                onPressed: () => Navigator.of(context).pop(true),
              child: Text('No',style: TextStyle(color: Color(0xfff69906)),),
              ),
              TextButton(
                // onPressed: () => Navigator.of(context).pop(true),
                onPressed: () {
                  exit(0);
                },
                child: Text('Yes',style: TextStyle(color: Color(0xfff69906)),),
              ),
            ],
          ),
        );

        // debugPrint(
        //     'appStorage.path: ${appStorage.path}/MySecretFolder !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        // debugPrint(
        //     'currentDirectory:  ${currentDirectory.split('/').last} !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        // debugPrint(
        //     'parentDirectory:  $parentDirectory !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        // ignore: use_build_context_synchronously
        return false;
      },
      child: Scaffold(
        
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        // backgroundColor: Color.fromARGB(255, 73, 72, 72),
        body: Container(
          decoration: threeDButton,
          padding: const EdgeInsets.fromLTRB(2, 0, 2, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(8),
                      height: 50,
                      // width: 370,
                      child: Text(
                        exp,
                        style: const TextStyle(
                          fontFamily:
                              'SevenSegmentFont', // Use the font family defined in pubspec.yaml
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        // border: ,
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.all(8),
                      height: 75,
                      width: 100,
                      // width: 370,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        readOnly: true,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        decoration: InputDecoration( 
                           border: InputBorder.none, 
                          hintText: textEditingController.text,
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.clear,color: Color(0xffffffff),),
                            onPressed: () {
                              setState(() {
                                textEditingController.text = "";
                                exp = "";
                              });
                            },
                          ),
                          
                        ),
                        controller: textEditingController,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff69906),
                            Color(0xfff69906),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton.icon(
                        icon: const Icon(Icons.backspace_sharp,
                            color: Color.fromARGB(255, 245, 241, 241)),
                        label: const Text(""),
                        onPressed: () {
                          setState(() {
                            if (textEditingController.text.isNotEmpty) {
                              textEditingController.text =
                                  textEditingController.text.substring(
                                      0, textEditingController.text.length - 1);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff69906),
                            Color(0xfff69906),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}(";
                          });
                        },
                        // style: ButtonStyle(
                        //   backgroundColor: MaterialStatePropertyAll(Colors.white),
                        //   foregroundColor: MaterialStatePropertyAll(Colors.black),
                        //   minimumSize:
                        //       MaterialStatePropertyAll(Size(bsize, bheight)),
                        //   maximumSize:
                        //       MaterialStatePropertyAll(Size(bsize, bheight)),
                        // ),
                        child: const Text(
                          "(",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff69906),
                            Color(0xfff69906),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            setState(() {
                              textEditingController.text =
                                  "${textEditingController.text})";
                            });
                          });
                        },
                        child: const Text(
                          ")",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff69906),
                            Color(0xfff69906),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}+";
                          });
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}7";
                          });
                        },
                        child: const Text(
                          "7",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}8";
                          });
                        },
                        child: const Text(
                          "8",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}9";
                          });
                        },
                        child: const Text(
                          "9",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff69906),
                            Color(0xfff69906),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}-";
                          });
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}4";
                          });
                        },
                        child: const Text(
                          "4",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}5";
                          });
                        },
                        child: const Text(
                          "5",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}6";
                          });
                        },
                        child: const Text(
                          "6",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff69906),
                            Color(0xfff69906),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}*";
                          });
                        },
                        child: const Text(
                          "x",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}1";
                          });
                        },
                        child: const Text(
                          "1",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(

                                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}2";
                          });
                        },
                        child: const Text(
                          "2",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}3";
                          });
                        },
                        child: const Text(
                          "3",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff69906),
                            Color(0xfff69906),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}/";
                          });
                        },
                        child: const Text(
                          "/",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                     
                                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}0";
                          });
                        },
                        onLongPress: togglePage2Content,
                        //() {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => AuthendicationPage(
                        //                 title: 'Authendication Needed',
                        //               )));
                        // },

                        child: const Text(
                          "0",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}.";
                          });
                        },
                        child: const Text(
                          ".",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
    
                                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff313131),
                            Color(0xff313131),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text =
                                "${textEditingController.text}%";
                          });
                        },
                        child: const Text(
                          "%",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff69906),
                            Color(0xfff69906),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            exp = textEditingController.text;
                            try {
                              Parser parser = Parser();
                              Expression expression = parser.parse(exp);
                              ContextModel contextModel = ContextModel();
                              textEditingController.text = expression
                                  .evaluate(EvaluationType.REAL, contextModel)
                                  .toString();
                            } catch (e) {
                              debugPrint("Error : $e");
                            }
                          });
                        },
                        child: const Text(
                          "=",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 245, 241, 241)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   child: const Icon(Icons.add),
        // ), //s trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
