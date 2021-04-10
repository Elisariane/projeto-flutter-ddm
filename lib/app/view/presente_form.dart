import 'package:flutter/material.dart';
import 'package:presente_crud/app/view/presente_form_back.dart';

class PresenteForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(PresenteFormBack back) {
    return TextFormField(
        validator: back.validateName,
        onSaved: (newValue) => back.presente.nome = newValue,
        initialValue: back.presente.nome,
        decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldUnidade(PresenteFormBack back) {
    return TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (newValue) => back.presente.unidade = int.parse(newValue),
        initialValue: back.presente.unidade.toString(),
        decoration: InputDecoration(labelText: 'Unidade:'));
  }

  Widget fieldValorEstimado(PresenteFormBack back) {
    return TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (newValue) =>
            back.presente.valorEstimado = double.parse(newValue),
        initialValue: back.presente.valorEstimado.toString(),
        decoration: InputDecoration(labelText: 'Valor Estimado:'));
  }

  Widget fieldURLImage(PresenteFormBack back) {
    return TextFormField(
        onSaved: (newValue) => back.presente.urlPresente = newValue,
        initialValue: back.presente.urlPresente,
        decoration: InputDecoration(
            labelText: 'Endereço Foto:', hintText: 'http://www.site.com'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = PresenteFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de presente'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              fieldValorEstimado(_back),
              fieldUnidade(_back),
              fieldURLImage(_back)
            ],
          ),
        ),
      ),
    );
  }
}
