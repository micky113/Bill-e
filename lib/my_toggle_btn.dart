import 'package:flutter/material.dart';

class MyToggleBtn extends StatefulWidget {
  const MyToggleBtn({
    Key? key,
    required this.selected,
  }) : super(key: key);
  final List<bool> selected;

  @override
  State<MyToggleBtn> createState() => _MyToggleBtnState();
}

class _MyToggleBtnState extends State<MyToggleBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ToggleButtons(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        isSelected: widget.selected,
        fillColor: Color(0xFF298F5E),
        selectedColor: Colors.white,
        borderRadius: BorderRadius.circular(50),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('10%'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('11%'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('12%'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('13%'),
          ),
        ],
        onPressed: (int selectedIndex) {
          for (int i = 0; i < widget.selected.length; i++) {
            setState(() {
              widget.selected[i] = selectedIndex == i;
            });
          }
        },
      ),
    );
  }
}
