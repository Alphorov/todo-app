import 'package:flutter/material.dart';

class HorizontalSelection extends StatefulWidget {
  const HorizontalSelection({
    required this.items,
    this.onItemSelected,
    super.key,
  });

  final List<String> items;
  final void Function(int)? onItemSelected;

  @override
  State<HorizontalSelection> createState() => _HorizontalSelectionState();
}

class _HorizontalSelectionState extends State<HorizontalSelection> {
  int selectedIndex = 0;

  late final List<TextPainter> textPainters = List.of(
    widget.items.map(
      (e) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: e,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        return textPainter;
      },
    ),
  );

  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (widget.onItemSelected != null) {
      widget.onItemSelected!(index);
    }
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i <= textPainters.length - 1; i++) ...[
                  InkWell(
                    onTap: () => selectItem(i),
                    child: Text(
                      textPainters[i].text?.toPlainText() ?? '',
                      style: textPainters[i].text?.style,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: Colors.grey.shade300,
          ),
          // TODO: Make the selection indicator narrower
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
            bottom: 0,
            left: MediaQuery.of(context).size.width /
                textPainters.length *
                selectedIndex,
            child: Container(
              color: Colors.blue,
              width:
                  MediaQuery.of(context).size.width / textPainters.length - 32,
              height: 2,
            ),
          ),
        ],
      );
}
