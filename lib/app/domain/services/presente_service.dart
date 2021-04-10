import 'package:presente_crud/app/domain/entities/presente.dart';
import 'package:presente_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:presente_crud/app/domain/interfaces/presente_dao.dart';
import 'package:get_it/get_it.dart';

class PresenteService {
  var _dao = GetIt.I.get<PresenteDAO>();
  save(Presente presente) {
    validateName(presente.nome);
    validateValorEstimado(presente.valorEstimado);
    validateUnidade(presente.unidade);
    _dao.save(presente);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Presente>> find() {
    return _dao.find();
  }

  validateName(String name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainLayerException('O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome deve possuir no máximo $max caracteres.');
    }
  }

  validateValorEstimado(double valorEstimado) {
    if (valorEstimado == null && valorEstimado <= 0) {
      throw new DomainLayerException('Este campo é obrigatório');
    }
  }

  validateUnidade(int unidade) {
    if (unidade == null && unidade == 0) {
      throw new DomainLayerException('Este campo é obrigatório');
    }
  }
}
