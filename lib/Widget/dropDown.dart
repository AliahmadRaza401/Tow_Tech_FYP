import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final String _key;
  final List<String> _values;
  final Function update; // Add this line.

  Dropdown(this._key, this._values, {this.update = null}); // Fix this line.

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  var _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: DropdownButton<String>(
        hint: Text(widget._key),
        value: _chosenValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        isExpanded: true,
        items: widget._values.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String value) {
          // Fix start.
          setState(() {
            _chosenValue = value;
          });
          if (widget.update != null) {
            (widget._key == 'Favourite Animal' && _chosenValue == 'Cat')
                ? widget.update(true)
                : widget.update(false);
          }
          // Fix end.
        },
      ),
    );
  }
}