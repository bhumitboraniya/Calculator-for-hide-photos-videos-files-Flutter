// import 'package:flutter/material.dart';
// import 'package:flutter_calculator_vault/calculator_page.dart';
// import 'package:flutter_calculator_vault/set_password.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'calculator_page.dart';
// // import 'package:math_expressions/math_expressions.dart';

// class InstructionPage extends StatefulWidget {
//   const InstructionPage({super.key, required this.title});
//   final String title;

//   @override
//   State<InstructionPage> createState() => _InstructionPageState();
// }

// class _InstructionPageState extends State<InstructionPage> {
//     final List<String> images = [
//      "assets/setpassword.jpg", // Replace with your image asset paths
//     "assets/calculator.jpg",
//     "assets/authendication.jpg",
//     "assets/vault.jpg",
//   ];
//   PageController _pageController = PageController(initialPage: 0);
//     @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(_pageListener);
//   }

//   void _pageListener() {
//     setState(() {
//       _currentImage = _pageController.page?.round() ?? 0;
//     });
//   }

//   @override
//   void dispose() {
//     _pageController.removeListener(_pageListener);
//     _pageController.dispose();
//     super.dispose();
//   }
// ////////////////////////////////////////////////////////////
//   TextEditingController textEditingController = TextEditingController();
//   String _imagepath = "assets/setpassword.jpg";
//   int _currentImage = 1;
//   String imagetxt = "Set Your Password";
//   int totalimages = 4;
//   var allignbutton = MainAxisAlignment.end;
//   bool showPage2Content = false;

//   void togglePage2Content() {
//     setState(() {
//       showPage2Content = !showPage2Content;
//     });
//   }

//   void backimage() {
//     setState(() {
//       _currentImage--;
//       if (_currentImage == 1) allignbutton = MainAxisAlignment.end;
//       if (_currentImage == 1) {
//         imagetxt = "Set Your Password";
//         _imagepath = "assets/setpassword.jpg";
//       }

//       if (_currentImage == 2) {
//         imagetxt = "To open your Vault Long Press on 0";
//         _imagepath = "assets/calculator.jpg";
//       }
//       if (_currentImage == 3) {
//         imagetxt = "Enter Your Password";
//         _imagepath = "assets/authendication.jpg";
//       }
//       if (_currentImage == 4) {
//         imagetxt = "Now Your Vault is Opend";
//         _imagepath = "assets/vault.jpg";
//       }
//     });
//   }

//   void nextimage() {
//     setState(() {
//       if (_currentImage < totalimages) _currentImage++;
//       allignbutton = MainAxisAlignment.spaceBetween;
//       if (_currentImage == 2) {
//         imagetxt = "To open your Vault Long Press on 0";
//         _imagepath = "assets/calculator.jpg";
//       }
//       if (_currentImage == 3) {
//         imagetxt = "Enter Your Password";
//         _imagepath = "assets/authendication.jpg";
//       }
//       if (_currentImage == 4) {
//         imagetxt = "Now Your Vault is Opend";
//         _imagepath = "assets/vault.jpg";
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isFirstTime;
//     if (showPage2Content) {
//       return const SetPassword(title: 'Set Password');
//     }
//     // ignore: no_leading_underscores_for_local_identifiers
//     Future<void> _setFirstTimeFlag() async {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('first_time', false);
//     }

//     _setFirstTimeFlag(); // Store flag when visiting first page


//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 3, 2, 2),
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//               child: Image.asset(
//                 _imagepath,
//                 height: 500,
//                 width: 500,
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
//                     height: 50,
//                     child: Center(
//                       child: Text(
//                         imagetxt,
//                         style: const TextStyle(
//                             fontSize: 20,
//                             color: Color.fromARGB(255, 251, 249, 249)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int j = 1; j < _currentImage; j++)
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
//                     child: const Icon(
//                       size: 10,
//                       color: Colors.white,
//                       Icons.circle_outlined,
//                     ),
//                   ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
//                   child: const Icon(
//                     size: 10,
//                     color: Colors.white,
//                     Icons.circle,
//                   ),
//                 ),
//                 for (int i = _currentImage; i < totalimages; i++)
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
//                     child: const Icon(
//                       size: 10,
//                       color: Colors.white,
//                       Icons.circle_outlined,
//                     ),
//                   ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: allignbutton,
//               children: [
//                 if (_currentImage != 1)
//                   Container(
//                     width: 100,
//                     height: 50,
//                     margin: const EdgeInsets.all(8.0),
//                     child: TextButton(
//                         style: const ButtonStyle(
//                           backgroundColor: MaterialStatePropertyAll(
//                               Color.fromARGB(255, 241, 237, 237)),
//                           foregroundColor: MaterialStatePropertyAll(
//                               Color.fromARGB(255, 8, 7, 7)),
//                         ),
//                         onPressed: backimage,
//                         child: const Text(
//                           "Previous",
//                           style: TextStyle(fontSize: 20),
//                         )),
//                   ),
//                 if (_currentImage < totalimages)
//                   Container(
//                     width: 100,
//                     height: 50,
//                     margin: const EdgeInsets.all(8.0),
//                     child: TextButton(
//                         style: const ButtonStyle(
//                           backgroundColor: MaterialStatePropertyAll(
//                               Color.fromARGB(255, 244, 240, 240)),
//                           foregroundColor: MaterialStatePropertyAll(
//                               Color.fromARGB(255, 11, 10, 10)),
//                         ),
//                         onPressed: nextimage,
//                         child: const Text(
//                           "Next",
//                           style: TextStyle(fontSize: 20),
//                         )),
//                   ),
//                 if (_currentImage == totalimages)
//                   Container(
//                     width: 100,
//                     height: 50,
//                     margin: const EdgeInsets.all(8.0),
//                     child: TextButton(
//                         style: const ButtonStyle(
//                           backgroundColor: MaterialStatePropertyAll(
//                               Color.fromARGB(255, 244, 240, 240)),
//                           foregroundColor: MaterialStatePropertyAll(
//                               Color.fromARGB(255, 11, 10, 10)),
//                         ),
//                         onPressed: togglePage2Content,
//                         // () {
//                         //   Navigator.push(
//                         //       context,
//                         //       MaterialPageRoute(
//                         //           builder: (context) => const SetPassword(
//                         //                 title: 'Set Password',
//                         //               )));
//                         // },
//                         child: const Text(
//                           "Done",
//                           style: TextStyle(fontSize: 20),
//                         )),
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











// ignore: duplicate_ignore
// ignore_for_file: unused_import, unnecessary_import

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator_vault/calculator_page.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
// ignore: unused_import
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:file_selector/file_selector.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:math_expressions/math_expressions.dart';

// Future<void> main() async {

//   runApp(VaultPage(setdir: '/storage/emulated/0/', title: 'Vault Page',));
// }

// ignore: must_be_immutable
class VaultPage extends StatefulWidget {
  final String title;
  String setdir;
  List<FileSystemEntity> itemToMoveAndCopy;
  String? copyOrMove;
  // ignore: non_constant_identifier_names
  VaultPage(
      {super.key,
      required this.title,
      required this.setdir,
      required this.itemToMoveAndCopy,
      this.copyOrMove});

  @override
  State<VaultPage> createState() => _VaultPageState();
}

class _VaultPageState extends State<VaultPage> {
  TextEditingController textEditingController = TextEditingController();
  List<FileSystemEntity> _filesAndFolders = [];
  int changeFolder = 0;
  bool refreshVaultPage = false;
  bool goToCalculator = false;
  var appStorage;
  List<FileSystemEntity> selectedItems = [];
  List<FileSystemEntity> itemToMoveAndCopy = [];
  // List<FileSystemEntity> backPath = [];
  String currentDirectory = '';
  String copyOrMove = "";
  Map<String, dynamic> sourceAndDestination = {};

  @override
  void initState() {
    super.initState();
    _loadFilesAndFolders();
  }

  @override
  Widget build(BuildContext context) {
    List<String> backPathHeader = path.split(widget.setdir);
    currentDirectory = widget.setdir;
    if (widget.copyOrMove == 'copy' || copyOrMove == 'copy') {
      copyOrMove = 'copy';
    } else if (widget.copyOrMove == 'move' || copyOrMove == 'move') {
      copyOrMove = 'move';
    } else if (copyOrMove == 'rename') {
      copyOrMove = '';
      refreshVaultPage = true;
    } else if (copyOrMove == 'delete') {
      copyOrMove = 'delete';
    } else {
      copyOrMove = '';
    }

    if (widget.itemToMoveAndCopy.isNotEmpty) {
      itemToMoveAndCopy = widget.itemToMoveAndCopy;
    }
    // if (widget.copyOrMove != null && widget.copyOrMove!.isNotEmpty) {
    //   copyOrMove = widget.copyOrMove!;
    // }
    // if(widget.copyOrMove!.isNotEmpty) copyOrMove = widget.copyOrMove!;

    if (refreshVaultPage) {
      return VaultPage(
        title: 'Vault Page',
        setdir: widget.setdir,
        itemToMoveAndCopy: const [],
      );
    }
    if (goToCalculator) {
      return const CalculatorPage(
        title: 'Calculator Page',
      );
    }
    debugPrint('Selected items bool: ${selectedItems.isEmpty}');
    debugPrint('itemsToMoveAndCopy bool: ${itemToMoveAndCopy.isEmpty}');
    debugPrint('widget.copyOrMove bool: ${widget.copyOrMove}');
    debugPrint('copyOrMove bool: $copyOrMove');

    // // if (selectedItems.isNotEmpty)
    // for (var i in selectedItems) {
    //   debugPrint('Selected items: ${i.path}');
    // }
    // for (var i in itemToMoveAndCopy) {
    //   debugPrint('itemsToMoveAndCopy: ${i.path}');
    // }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 96, 96),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleMenuItemClick,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'createFolder',
                  child: Text('Create Folder'),
                ),
                const PopupMenuItem<String>(
                  value: 'createFile',
                  child: Text('Create File'),
                ),
                const PopupMenuItem<String>(
                  value: 'goToCalculator',
                  child: Text('Calculator'),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<String>(
                  value: 'moreOptions',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.more_horiz),
                    title: Text('More Options'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          appStorage = await getApplicationDocumentsDirectory();
          String parentDirectory = '${appStorage.path}/MySecretFolder';
          if (currentDirectory != '${appStorage.path}/MySecretFolder') {
            parentDirectory = path.dirname(currentDirectory);
          } else {
            // Program to exit app
            // ignore: unused_local_variable, use_build_context_synchronously
            bool shouldPop = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Exit App?'),
                content: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
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
          }
          // debugPrint(
          //     'appStorage.path: ${appStorage.path}/MySecretFolder !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          // debugPrint(
          //     'currentDirectory:  ${currentDirectory.split('/').last} !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          // debugPrint(
          //     'parentDirectory:  $parentDirectory !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VaultPage(
                        setdir: parentDirectory,
                        title: 'Vault Page',
                        itemToMoveAndCopy: itemToMoveAndCopy,
                        copyOrMove: copyOrMove,
                      )));
          return true;
        },
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 35,
                child: Row(children: [
                  IconButton(
                    color: Colors.black,
                      onPressed: () async {
                        appStorage = await getApplicationDocumentsDirectory();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VaultPage(
                                      title: 'Vault Opend',
                                      setdir: '${appStorage.path}/MySecretFolder',
                                      itemToMoveAndCopy: const [],
                                    )));
                      },
                      icon: const Icon(Icons.home_filled)),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: backPathHeader.length -
                            (backPathHeader.indexOf('MySecretFolder') + 1),
                        itemBuilder: (BuildContext context, int index) {
                          String entity = backPathHeader[index +
                              (backPathHeader.indexOf('MySecretFolder') + 1)];
                          return TextButton(
                              style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(0, 0)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VaultPage(
                                              setdir: backPathHeader
                                                  .sublist(
                                                      0,
                                                      (findLastIndexOfBackPath(backPathHeader,entity) +
                                                          1))
                                                  .join('/'),
                                              title: 'Vault Page',
                                              itemToMoveAndCopy:
                                                  itemToMoveAndCopy,
                                              copyOrMove: copyOrMove,
                                            )));
                              },
                              child: Text('$entity>'));
                        }),
                  ),
                ]),
              ),
              Expanded(
                child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  itemCount: _filesAndFolders.length,
                  itemBuilder: (BuildContext context, int index) {
                    FileSystemEntity entity = _filesAndFolders[index];
                    return Container(
                      margin: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                      color: (selectedItems.isEmpty
                          ? (!blockFolderForMove(entity.path)
                              ? const Color.fromARGB(255, 162, 159, 159)
                              : const Color.fromARGB(255, 255, 255, 255))
                          : selectedColor(entity.path)),
                      child: ListTile(
                          horizontalTitleGap: 0,
                          // title: Text(entity.path.split('/').last),
                          leading: Icon(
                              entity is File ? Icons.file_open : Icons.folder),
                          iconColor: (entity is File
                              ? const Color.fromARGB(255, 119, 100, 25)
                              : const Color.fromARGB(255, 239, 156, 48)),
                          subtitle: Text(
                            (entity is File
                                ? fileSize(entity.path)
                                : itemsInFolder(entity.path)),
                            style: const TextStyle(color: Colors.black),
                          ),
                          title: Text(
                            entity.path.split('/').last,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            // ignore: curly_braces_in_flow_control_structures
                            if (selectedItems.isEmpty) {
                              if (entity is File) {
                                _handleFileTap(entity);
                              } else if (entity is Directory &&
                                  blockFolderForMove(entity.path)) {
                                _loadFilesAndFolders();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VaultPage(
                                              setdir: entity.path,
                                              title: 'Vault Page',
                                              itemToMoveAndCopy:
                                                  itemToMoveAndCopy,
                                              copyOrMove: copyOrMove,
                                            )));
                                // itemToMoveAndCopy=[];
                                // _refreshVaultPage();
                              }
                            } else {
                              debugPrint(
                                  'On Tap Adding Selected Items..........');
                              selectedView(entity);
                            }
                          },
                          onLongPress: () {
                            debugPrint(
                                'On Tap Adding Selected Items..........');
                            selectedView(entity);
                          }),
                    );
                  },
                ),
              ),
              if (selectedItems.isNotEmpty)
                Container(
                  height: 55,
                  color: const Color.fromARGB(255, 145, 144, 144),
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.file_copy_outlined),
                          onPressed: () {
                            setState(() {
                              itemToMoveAndCopy = selectedItems;
                              selectedItems = [];
                              copyOrMove = "copy";
                              debugPrint("Copying.........$copyOrMove....");
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.cut),
                          onPressed: () {
                            itemToMoveAndCopy = selectedItems;
                            setState(() {
                              itemToMoveAndCopy = selectedItems;
                              selectedItems = [];
                              copyOrMove = "move";
                              debugPrint("Moveing.........$copyOrMove....");
                              _refresh();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              itemToMoveAndCopy = selectedItems;
                              selectedItems = [];
                              copyOrMove = "rename";
                              // Rename
                              if (copyOrMove == "rename") {
                                for (FileSystemEntity entity
                                    in itemToMoveAndCopy) {
                                  _popUpInput(context, "Rename", entity.path);
                                }
                              }
                              itemToMoveAndCopy = [];
                              debugPrint("Renameing.........$copyOrMove....");
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              itemToMoveAndCopy = selectedItems;
                              selectedItems = [];
                              copyOrMove = "delete";
                              debugPrint("Deleteing.........$copyOrMove....");
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              selectedItems = [];
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              if (itemToMoveAndCopy.isNotEmpty)
                Container(
                    height: 55,
                    color: const Color.fromARGB(255, 145, 144, 144),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                widget.itemToMoveAndCopy = [];
                                itemToMoveAndCopy = [];
                                selectedItems = [];
                                _refreshVaultPage();
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              setState(() {
                                debugPrint('copyOrMove string: $copyOrMove');
                                // copy
                                if (copyOrMove == "copy") {
                                  for (FileSystemEntity entity
                                      in itemToMoveAndCopy) {
                                    copySourceAndDestination(
                                        entity.path, currentDirectory);
                                  }
                                  sourceAndDestination.forEach((key, value) {
                                    copyItems(key, value);
                                  });
                                }
                                // Move
                                if (copyOrMove == "move") {
                                  for (FileSystemEntity entity
                                      in itemToMoveAndCopy) {
                                    copySourceAndDestination(
                                        entity.path, currentDirectory);
                                  }
                                  sourceAndDestination.forEach((key, value) {
                                    copyItems(key, value);
                                  });
                                  for (FileSystemEntity entity
                                      in itemToMoveAndCopy) {
                                    deleteItems(entity.path);
                                  }
                                }

                                // // Rename
                                // if (copyOrMove == "rename") {
                                //   for (FileSystemEntity entity
                                //       in itemToMoveAndCopy) {
                                //     _popUpInput(context, "Rename", entity.path);
                                //   }
                                // }

                                // delete
                                if (copyOrMove == "delete") {
                                  for (FileSystemEntity entity
                                      in itemToMoveAndCopy) {
                                    deleteItems(entity.path);
                                  }
                                }

                                itemToMoveAndCopy = [];
                                widget.itemToMoveAndCopy = [];
                                copyOrMove = "";
                                widget.copyOrMove = "";
                                _refreshVaultPage();
                              });
                            },
                          ),
                        ),
                      ],
                    ))
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: ((selectedItems.isEmpty && itemToMoveAndCopy.isEmpty)
            ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
            : const EdgeInsets.fromLTRB(0, 0, 0, 45)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: FloatingActionButton(
                onPressed: _goToCalculator,
                tooltip: 'Calculator',
                child: const Icon(Icons.calculate),
              ),
            ),
            FloatingActionButton(
              onPressed: () async {
                final result =
                    await FilePicker.platform.pickFiles(allowMultiple: true);
                if (result == null) {
                  debugPrint('No files selected.');
                  return;
                }

                for (var file in result.files) {
                  File newFile = File(
                    "${widget.setdir}/${file.name}",
                  );
                  File(file.path!).copy(newFile.path);
                }
                _refreshVaultPage();
              },
              tooltip: 'Add file',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  } // @overide Build()


int findLastIndexOfBackPath(List<String> list, String value) {
  for (int i = list.length - 1; i >= 0; i--) {
    if (list[i] == value) {
      return i;
    }
  }
  return list.indexOf('MySecretFolder'); // Value not found in the list
}

  renameItems(String current, String renameto) {
    if (File(current).existsSync()) {
      renameto = '$renameto${path.extension(current)}';
      if (!File('${widget.setdir}/$renameto').existsSync()) {
        // Rename the file
        File(current).renameSync('${widget.setdir}/$renameto');
        Navigator.pop(context);
        _refresh();
        debugPrint('File renamed successfully.');
      }
    } else if (Directory(current).existsSync()) {
      if (!Directory('${widget.setdir}/$renameto').existsSync()) {
        // Rename the folder
        Directory(current).renameSync('${widget.setdir}/$renameto');
        Navigator.pop(context);
        _refresh();
        debugPrint('Folder renamed successfully.');
      }
    }
  }

  void deleteItems(String path) {
    final file = File(path);
    if (file.existsSync()) {
      try {
        file.deleteSync();
        debugPrint('File deleted successfully.');
      } catch (e) {
        debugPrint('Error deleting file: $e');
      }
    } else {
      debugPrint('File does not exist.');
    }

    final directory = Directory(path);

    if (directory.existsSync()) {
      try {
        directory.deleteSync(recursive: true);
        debugPrint('Directory deleted successfully.');
      } catch (e) {
        debugPrint('Error deleting directory: $e');
      }
    } else {
      debugPrint('Directory does not exist.');
    }
  }

  void copySourceAndDestination(String sourcePath, String destinationPath) {
    final sourceFile = File(sourcePath);

    if (File(sourcePath).existsSync()) {
      if (!File('$destinationPath/${sourceFile.uri.pathSegments.last}')
          .existsSync()) {
        sourceAndDestination[sourcePath] =
            '$destinationPath/${sourceFile.uri.pathSegments.last}';
      }
    } else if (Directory(sourcePath).existsSync()) {
      if (!Directory('$destinationPath/${sourceFile.path.split('/').last}')
          .existsSync()) {
        sourceAndDestination[sourcePath] =
            '$destinationPath/${sourceFile.uri.pathSegments.last}';
      }

      final entities = Directory(sourcePath).listSync();
      if (entities.isNotEmpty) {
        for (var entity in entities) {
          copySourceAndDestination(entity.path,
              '$destinationPath/${sourceFile.uri.pathSegments.last}');
        }
      }
      debugPrint('$sourcePath is a directory.');
    }
  }

  void copyItems(String sourcePath, String destinationPath) {
    if (File(sourcePath).existsSync()) {
      if (!File(destinationPath).existsSync()) {
        File(sourcePath).copySync(destinationPath);
      }
    } else if (Directory(sourcePath).existsSync()) {
      if (!Directory(destinationPath).existsSync()) {
        Directory(destinationPath).createSync();
      }
    }
  }

  void _handleFileTap(File file) {
    OpenFile.open(file.path);
  }

  Future<void> _loadFilesAndFolders() async {
    Directory directory = Directory(widget.setdir);
    setState(() {
      _filesAndFolders = directory.listSync();
    });
  }

  void saveFile(PlatformFile file) {
    // appStorage = await getApplicationDocumentsDirectory();
    File newFile = File(
      "${widget.setdir}/${file.name}",
    );
    File(file.path!).copy(newFile.path);
  }

  void _refreshVaultPage() {
    setState(() {
      refreshVaultPage = true;
    });
  }

  void _goToCalculator() {
    setState(() {
      goToCalculator = true;
    });
  }

  Future<void> createFolder([String? inputFileFolder]) async {
    final Directory newDirectory =
        Directory("${widget.setdir}/$inputFileFolder");

    debugPrint("Folder creat check: ${widget.setdir}/$inputFileFolder");
    // ignore: use_build_context_synchronousl
    if (newDirectory.existsSync()) {
      debugPrint('Directory already exists.');
    } else {
      newDirectory.createSync();
      _refreshVaultPage();
      debugPrint('Directory created successfully.');
    }
  }

  Future<void> createFile([String? inputFileFolder]) async {
    // var tmp = await _popUpInput(context, "Create Folder");
    // appStorage = await getApplicationDocumentsDirectory();
    String filePath = "${widget.setdir}/$inputFileFolder";

    File file = File(filePath);

    try {
      file.createSync(); // Create the file synchronously

      if (file.existsSync()) {
        _refreshVaultPage();
        debugPrint('File created successfully at: $filePath');
      } else {
        debugPrint('File creation failed.');
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
    }
  }

  void _popUpInput(BuildContext context, String txt, [String? current]) {
    TextEditingController textEditingController2 = TextEditingController();
    final textFieldBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 0, 0, 0),
        width: 3,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(7),
    );
    // final threeDButton = BoxDecoration(
    //   borderRadius: BorderRadius.circular(8),
    //   gradient: const LinearGradient(
    //     colors: [
    //       Color.fromARGB(255, 169, 174, 169),
    //       Color.fromARGB(255, 106, 112, 106)
    //     ],
    //     begin: Alignment.topCenter,
    //     end: Alignment.bottomCenter,
    //   ),
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.black.withOpacity(0.3),
    //       blurRadius: 5.0,
    //       offset: const Offset(0, 3),
    //     ),
    //   ],
    // );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String create = 'Create';
        create = (txt == 'Rename' ? "Rename" : "Create");
        return AlertDialog(
          backgroundColor: Colors.white,
          contentTextStyle: const TextStyle(
            color: Colors.black,
          ),
          title: Text(
            txt,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // decoration: BoxDecoration(
                        //   // border: ,
                        //   color: const Color.fromARGB(255, 91, 126, 78),
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        // margin: const EdgeInsets.all(8),
                        // height: 75,
                        // width: 100,
                        // // width: 370,
                        child: TextField(
                          autofocus: true,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),
                          // decoration: InputDecoration(
                          //   hintText: "Name",
                          //   hintStyle: const TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 30,
                          //   ),
                          //   enabledBorder: textFieldBorder,
                          //   focusedBorder: textFieldBorder,
                          // ),
                          controller: textEditingController2,
                          // textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // decoration: threeDButton,
                      margin: const EdgeInsets.only(top: 15),
                      child: TextButton(
                          style: const ButtonStyle(
                            minimumSize:
                                MaterialStatePropertyAll(Size(100, 45)),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )),
                    ),
                    Container(
                      // decoration: threeDButton,
                      margin: const EdgeInsets.only(top: 15),
                      child: TextButton(
                          style: const ButtonStyle(
                            minimumSize:
                                MaterialStatePropertyAll(Size(100, 45)),
                          ),
                          onPressed: () {
                            setState(() {
                              var inputFileFolder = textEditingController2.text;
                              if (txt == "Create Folder") {
                                createFolder(inputFileFolder);
                                Navigator.pop(context);
                              }
                              if (txt == "Create File") {
                                createFile(inputFileFolder);
                                Navigator.pop(context);
                              }
                              if (txt == "Rename") {
                                renameItems(current!, inputFileFolder);
                              }
                            });
                          },
                          child: Text(
                            create,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          )),
                    ),
                  ],
                ) // Add more options as needed
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleMenuItemClick(String value) async {
    // Handle the clicked menu item
    // debugPrint('Clicked: $value');
    if (value == 'createFolder') {
      // createFolder();
      _popUpInput(context, "Create Folder");
    }
    if (value == 'goToCalculator') {
      _goToCalculator();
    }
    if (value == 'createFile') {
      _popUpInput(context, "Create File");
    }
  }

  String itemsInFolder(String path) {
    String directoryPath = path; // Replace with the actual directory path

    int fileCount = 0;
    int folderCount = 0;

    Directory directory = Directory(directoryPath);
    if (directory.existsSync()) {
      directory.listSync().forEach((entity) {
        if (entity is File) {
          fileCount++;
        } else if (entity is Directory) {
          folderCount++;
        }
      });

      // debugPrint('Number of files: $fileCount');
      // debugPrint('Number of folders: $folderCount');
    } else {
      debugPrint('Directory not found.');
    }
    return '$folderCount Folders/$fileCount Files';
  }

  String fileSize(String path) {
    if (path == "") return "";

    var file = File(path);
    var size = file.lengthSync();
    String Size = size >= 1000000000
        ? '${(size / 1000000000).toStringAsFixed(2)} GB'
        : (size >= 1000000
            ? '${(size / 1000000).toStringAsFixed(2)} MB'
            : (size >= 1000
                ? '${(size / 1000).toStringAsFixed(2)} KB'
                : "0 b"));
    return Size;
  }

  selectedView(FileSystemEntity entity) {
    setState(() {
      bool notSelected = true;
      for (FileSystemEntity item in selectedItems) {
        if (entity.path == item.path) {
          selectedItems.remove(entity);
          notSelected = false;
          break; // Exit the loop when the string is found
        }
      }
      if (notSelected) selectedItems.add(entity);
    });
  }

  selectedColor(String path) {
    for (FileSystemEntity item in selectedItems) {
      if (path == item.path) {
        return const Color.fromARGB(255, 151, 191, 136);
        break; // Exit the loop when the string is found
      }
    }
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0));
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VaultPage(
                  setdir: widget.setdir,
                  title: 'Vault Page',
                  itemToMoveAndCopy: itemToMoveAndCopy,
                  copyOrMove: copyOrMove,
                )));
  }

  bool blockFolderForMove(String path) {
    if (copyOrMove == 'move') {
      for (var i in widget.itemToMoveAndCopy) {
        if (i.path == path) return false;
      }
    }
    return true;
  }
}
