import 'dart:typed_data';
import 'package:brainhive/Providers/user_provider.dart';
import 'package:brainhive/Resources/firestore_methods.dart';
import 'package:brainhive/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddQuestionScreen extends StatefulWidget {
  static const id = 'question_screen';

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _questioncontroller = TextEditingController();

  void postQuestion(
    String uid,
    String username,
    String profImage,
  ) async {
    String res = await FirestoreMethods()
        .uploadPost(_questioncontroller.text, _file!, uid, username, profImage);

    if(res == "success"){
      showSnackBar('Posted!', context);
    }
    else{
      showSnackBar(res, context);
    }
  }

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await PickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await PickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _questioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 330.0),
                Center(
                  child: IconButton(
                    icon: const Icon(Icons.upload_file_outlined),
                    onPressed: () => _selectImage(context),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Upload your image here'),
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: CupertinoColors.activeBlue,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              title: const Text('Add a Question'),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () {
                    postQuestion(userProvider.getUser!.uid, userProvider.getUser!.username, userProvider.getUser!.photoUrl);
                  },
                  child: const Text('Post',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 0.5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextField(
                          controller: _questioncontroller,
                          decoration: const InputDecoration(
                            hintText: 'Write your Question...',
                            border: InputBorder.none,
                          ),
                          maxLines: 8,
                        ),
                      ),
                      SizedBox(
                        height: 45.0,
                        width: 45.0,
                        child: AspectRatio(
                          aspectRatio: 487 / 451,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: MemoryImage(_file!),
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            )),
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
