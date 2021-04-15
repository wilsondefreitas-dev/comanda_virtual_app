import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextInput extends StatelessWidget {
  final String _label;
  final IconData iconData;
  final String hint;
  final TextInputType keyBoardType;
  final String mask;
  final Function onChangeAction;
  final TextEditingController controller;
  final bool autofocus;

  const TextInput(this._label, this.onChangeAction,
      {this.iconData,
      this.hint,
      this.keyBoardType,
      this.mask,
      this.controller,
      this.autofocus});

  @override
  Widget build(BuildContext context) {
    MaskTextInputFormatter maskToUse = new MaskTextInputFormatter();

    // if (mask != null) {
    //   if (mask.toLowerCase() == 'rg') {
    //     maskToUse = new MaskTextInputFormatter(
    //       mask: '##.###.###-#',
    //       filter: {"#": RegExp(r'[0-9]')},
    //     );
    //   }
    // }
    //
    //
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: TextField(
        autofocus: autofocus == true,
        style: TextStyle(fontSize: 16.0),
        keyboardType: keyBoardType != null ? keyBoardType : TextInputType.text,
        decoration: InputDecoration(
          icon: iconData != null ? Icon(iconData) : null,
          labelText: _label,
          hintText: hint != null ? hint : null,
        ),
        inputFormatters: [maskToUse],
        onChanged: (string) => {onChangeAction(string)},
        controller: controller != null ? controller : null,
      ),
    );
  }
}
