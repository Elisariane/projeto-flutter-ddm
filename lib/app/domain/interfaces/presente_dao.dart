import 'package:presente_crud/app/domain/entities/presente.dart';

abstract class PresenteDAO {
  save(Presente presente);

  remove(int id);

  Future<List<Presente>> find();
}
