import 'package:presente_crud/app/domain/entities/presente.dart';
import 'package:presente_crud/app/domain/services/presente_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class PresenteFormBack {
  Presente presente;
  var _service = GetIt.I.get<PresenteService>();
  bool _nameIsValid;
  bool _valorEstimadoIsValid;
  bool _phoneIsValid;

  bool get isValid => _nameIsValid && _valorEstimadoIsValid && _phoneIsValid;

  // diferenciar novo com alteração
  PresenteFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    presente = (parameter == null) ? Presente() : parameter;
  }

  //salvar
  save() async {
    await _service.save(presente);
  }

  //validações
  String validateName(String name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateValorEstimado(double valorEstimado) {
    try {
      _service.validateValorEstimado(valorEstimado);
      _valorEstimadoIsValid = true;
      return null;
    } catch (e) {
      _valorEstimadoIsValid = false;
      return e.toString();
    }
  }

  // String validateUnidade(int unidade) {
  //   try {
  //     _service.validateUnidade(unidade);
  //     _unidadeIsValid = true;
  //     return null;
  //   } catch (e) {
  //     _unidadeISValid = false;
  //     return e.toString();
  //   }
  // }
}
