import 'package:booky/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_html_css/simple_html_css.dart';

class BookContentScreen extends StatefulWidget {
  const BookContentScreen({super.key});

  @override
  State<BookContentScreen> createState() => _BookContentScreenState();
}

class _BookContentScreenState extends State<BookContentScreen> {
  List<HighlightedList> offsets = [];
  String highlightedText = "";
  String checker() {
    String articleTextLevel1 = "";
    articleTextLevel1 = summary;

    for (int x = 0; x < offsets.length; x++) {
      articleTextLevel1 = articleTextLevel1.replaceAll(
          offsets[x].highlightedText,
          "<annotation style='background-color:#${offsets[x].colour};'>${offsets[x].highlightedText}</annotation>");
    }
    return articleTextLevel1;
  }

  highlightText(String color) {
    setState(
      () {
        for (int x = 0; x < offsets.length; x++) {
          if (offsets[x].highlightedText == highlightedText) {
            offsets.removeAt(x);
          }
          // if (offsets[x].highlightedText.contains(highlightedText)) {
          //   Fluttertoast.showToast(
          //     msg: "You can't highlight already highlighted words bug",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.black87,
          //     textColor: Colors.white,
          //     fontSize: 16.0,
          //   );
          // }
        }
        offsets.add(
          HighlightedList(
            offsets.length,
            highlightedText,
            color,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: SelectableText.rich(
          HTML.toTextSpan(
            context,
            checker(),
            defaultTextStyle: Theme.of(context).textTheme.bodyMedium,
            overrideStyle: <String, TextStyle>{
              'body': const TextStyle(fontSize: 16),
              'p': const TextStyle(
                fontSize: 17,
              ),
              'a': const TextStyle(
                wordSpacing: 5,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            },
          ),
          onSelectionChanged: (selection, cause) {
            setState(() {
              highlightedText =
                  summary.substring(selection.start, selection.end);
            });
          },
          contextMenuBuilder: (context, editableTextState) {
            return MyContextMenu(
              anchor: editableTextState.contextMenuAnchors.secondaryAnchor!,
              children: [
                ToolBarItem(
                  onTap: () {
                    highlightText("FFFFFF");
                  },
                  color: 0xFFFFFF,
                ),
                const SizedBox(
                  width: 10,
                ),
                ToolBarItem(
                  onTap: () {
                    highlightText("B6B725");
                  },
                  color: 0xFFB6B725,
                ),
                const SizedBox(
                  width: 10,
                ),
                ToolBarItem(
                  onTap: () {
                    highlightText("f48989");
                  },
                  color: 0xFFf48989,
                ),
                const SizedBox(
                  width: 10,
                ),
                ToolBarItem(
                  onTap: () {
                    highlightText("a1e0d9");
                  },
                  color: 0xFFa1e0d9,
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: highlightedText));
                    // setState(() {
                    //   isSelected = false;
                    // });
                  },
                  child: const Icon(
                    Icons.copy,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyContextMenu extends StatelessWidget {
  const MyContextMenu({
    super.key,
    required this.anchor,
    required this.children,
  });

  final Offset anchor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 80.h,
          left: MediaQuery.of(context).size.width / 5,
          child: Card(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: children,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HighlightedList {
  String highlightedText;
  String colour;
  int id;
  HighlightedList(
    this.id,
    this.highlightedText,
    this.colour,
  );
}

class ToolBarItem extends StatelessWidget {
  const ToolBarItem({
    Key? key,
    required this.onTap,
    required this.color,
  }) : super(key: key);
  final Function() onTap;
  final int color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: Color(color),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(255, 224, 224, 224),
              width: 1,
            )),
      ),
    );
  }
}
