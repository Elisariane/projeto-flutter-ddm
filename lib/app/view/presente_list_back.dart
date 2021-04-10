import 'package:presente_crud/app/domain/entities/presente.dart';
import 'package:presente_crud/app/domain/services/presente_service.dart';
import 'package:presente_crud/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'presente_list_back.g.dart';

class PresenteListBack = _PresenteListBack with _$PresenteListBack;

abstract class _PresenteListBack with Store {
  var _service = GetIt.I.get<PresenteService>();

  //lista de presentes
  @observable
  Future<List<Presente>> list;

  //método para atualizar a lista de presentes
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _PresenteListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Presente presente]) {
    Navigator.of(context)
        .pushNamed(MyApp.PRESENTE_FORM, arguments: presente)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Presente presente) {
    Navigator.of(context)
        .pushNamed(MyApp.PRESENTE_DETAILS, arguments: presente);
  }

  //excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
