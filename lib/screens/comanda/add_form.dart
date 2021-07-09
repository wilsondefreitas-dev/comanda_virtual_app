import 'package:comanda_virtual_app/components/confirm_button.dart';
import 'package:comanda_virtual_app/components/text_input.dart';
import 'package:comanda_virtual_app/models/comanda.dart';
import 'package:flutter/material.dart';

class AddComanda extends StatefulWidget {
  @override
  _AddComandaState createState() => _AddComandaState();
}

class _AddComandaState extends State<AddComanda> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerID = TextEditingController();

  bool buttonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Nova Comanda'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextInput(
            'Nome do Cliente',
            isFormFullFilled2EnableButton,
            hint: 'Insira o nome completo...',
            iconData: Icons.person,
            controller: _controllerName,
          ),
          TextInput(
            'RG do Cliente (ou número de identificação)',
            isFormFullFilled2EnableButton,
            hint: '00.000.000-0',
            iconData: Icons.person,
            controller: _controllerID,
            keyBoardType: TextInputType.number,
            mask: 'rg',
          ),
          ConfirmButton(
            'Criar Comanda',
            action: buttonEnabled ? submit : null,
          ),
        ],
      ),
    );
  }

  void isFormFullFilled2EnableButton(input) {
    if (_controllerName.text.length > 0 && _controllerID.text.length > 0) {
      setState(() => {buttonEnabled = true});
    } else {
      setState(() => {buttonEnabled = false});
    }
  }

  void submit() {
    Navigator.pop(
        context, new Comanda(_controllerName.text, _controllerID.text));
  }
}
