import 'package:presente_crud/app/database/sqlite/dao/presente_dao_impl.dart';
import 'package:presente_crud/app/domain/interfaces/presente_dao.dart';
import 'package:presente_crud/app/domain/services/presente_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<PresenteDAO>(PresenteDAOImpl());
  getIt.registerSingleton<PresenteService>(PresenteService());
}
