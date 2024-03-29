// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:simple_html_css/simple_html_css.dart';

// typedef OnHighlightedCallback = void Function(
//     List<HighlightedList> updatedHighlightedOffsetsList);

// class Highlighter extends StatefulWidget {
//   final String textData;
//   final List<HighlightedList>? preHighlightedTexts;
//   final OnHighlightedCallback? onHighlightedCallback;
//   const Highlighter(
//       {Key? key,
//       required this.textData,
//       this.preHighlightedTexts,
//       this.onHighlightedCallback})
//       : super(key: key);

//   @override
//   _HighlighterState createState() => _HighlighterState();
// }

// class _HighlighterState extends State<Highlighter> {
//   List<HighlightedList> offsets = [];
//   String formattedText = "";

//   @override
//   void initState() {
//     offsets = widget.preHighlightedTexts ?? offsets;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SelectableText.rich(
//       HTML.toTextSpan(
//         context,
//         checker(),
//         defaultTextStyle: const TextStyle(fontSize: 16),
//         overrideStyle: <String, TextStyle>{
//           'body': const TextStyle(fontSize: 16),
//           'p': const TextStyle(
//             fontSize: 17,
//           ),
//           'a': const TextStyle(
//             wordSpacing: 5,
//             color: Colors.black,
//             decoration: TextDecoration.none,
//           ),
//         },
//       ),
//       // selectionControls: ,
//       contextMenuBuilder: (context, editableTextState) {
//         var buttonItem = editableTextState.contextMenuButtonItems;
//         buttonItem.insert(
//           0,
//           ContextMenuButtonItem(
//             label: "Hello",
//             onPressed: () {},
//           ),
//         );
//         return AdaptiveTextSelectionToolbar.buttonItems(
//           anchors: editableTextState.contextMenuAnchors,
//           buttonItems: buttonItem,
//         );
//       },
//     );
//   }

//   String checker() {
//     String articleTextLevel1 = "";
//     articleTextLevel1 = widget.textData;

//     for (int x = 0; x < offsets.length; x++) {
//       articleTextLevel1 = articleTextLevel1.replaceAll(
//           offsets[x].highlightedText,
//           "<annotation style='background-color:#${offsets[x].colour};'>${offsets[x].highlightedText}</annotation>");
//     }
//     return articleTextLevel1;
//   }
// }

// class ToolBarItem extends StatelessWidget {
//   const ToolBarItem({
//     Key? key,
//     required this.item,
//     this.onItemPressed,
//   }) : super(key: key);
//   final Widget item;
//   final Function(String text, int start, int end)? onItemPressed;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onItemPressed;
//       },
//       child: item,
//     );
//   }
// }

// class HighlightedList {
//   String highlightedText;
//   String colour;
//   int id;
//   HighlightedList(
//     this.id,
//     this.highlightedText,
//     this.colour,
//   );
// }


// /*
// [
//           ToolBarItem(
//             item: const Icon(
//               Icons.circle,
//               color: Color(0xffB6B725),
//               size: 28,
//             ),
//             onItemPressed:
//                 (String highlightedText, int startIndex, int endIndex) {
//               setState(
//                 () {
//                   for (int x = 0; x < offsets.length; x++) {
//                     if (offsets[x].highlightedText == highlightedText) {
//                       offsets.removeAt(x);
//                     }
//                     if (offsets[x].highlightedText.contains(highlightedText)) {
//                       Fluttertoast.showToast(
//                           msg:
//                               "You can't highlight already highlighted words bug",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.BOTTOM,
//                           timeInSecForIosWeb: 1,
//                           backgroundColor: Colors.black87,
//                           textColor: Colors.white,
//                           fontSize: 16.0);
//                     }
//                   }
//                   offsets.add(
//                     HighlightedList(
//                       offsets.length,
//                       highlightedText,
//                       "B6B725",
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//           ToolBarItem(
//             item: const Icon(
//               Icons.circle,
//               color: Color(0xfff48989),
//               size: 28,
//             ),
//             onItemPressed:
//                 (String highlightedText, int startIndex, int endIndex) {
//               setState(
//                 () {
//                   for (int x = 0; x < offsets.length; x++) {
//                     if (offsets[x].highlightedText == highlightedText) {
//                       offsets.removeAt(x);
//                     }
//                   }

//                   offsets.add(
//                     HighlightedList(
//                       offsets.length,
//                       highlightedText,
//                       "f48989",
//                     ),
//                   );
//                 },
//               );
//               if (widget.onHighlightedCallback != null) {
//                 widget.onHighlightedCallback!(offsets);
//               }
//             },
//           ),
//           ToolBarItem(
//             item: const Icon(
//               Icons.circle,
//               color: Color(0xffa1e0d9),
//               size: 28,
//             ),
//             onItemPressed:
//                 (String highlightedText, int startIndex, int endIndex) {
//               setState(
//                 () {
//                   for (int x = 0; x < offsets.length; x++) {
//                     if (offsets[x].highlightedText == highlightedText) {
//                       offsets.removeAt(x);
//                     }
//                   }
//                   offsets.add(
//                     HighlightedList(
//                       offsets.length,
//                       highlightedText,
//                       "a1e0d9",
//                     ),
//                   );
//                 },
//               );
//               if (widget.onHighlightedCallback != null) {
//                 widget.onHighlightedCallback!(offsets);
//               }
//             },
//           ),
//           ToolBarItem(
//             item: const Icon(
//               Icons.copy,
//               size: 28,
//             ),
//             onItemPressed: (
//               String highlightedText,
//               int startIndex,
//               int endIndex,
//             ) {},
//           ),
//         ],
//  */