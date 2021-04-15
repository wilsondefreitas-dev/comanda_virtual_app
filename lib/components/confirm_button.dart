import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final Function action;
  final String label;

  ConfirmButton(this.label, {this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: ElevatedButton(
        onPressed: action != null ? () => {action()} : null,
        child: Text(
          label,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
