import 'package:presente_crud/app/domain/entities/presente.dart';
import 'package:presente_crud/app/domain/interfaces/presente_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class PresenteDAOImpl implements PresenteDAO {
  Database _db;

  @override
  Future<List<Presente>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('presente');
    List<Presente> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Presente(
          id: linha['id'],
          nome: linha['nome'],
          unidade: linha['unidade'],
          valorEstimado: linha['valorEstimado'],
          urlPresente: linha['url_presente']);
    });

    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM presente WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Presente presente) async {
    _db = await Connection.get();
    var sql;
    if (presente.id == null) {
      sql =
          'INSERT INTO presente (nome, unidade,valorEstimado,url_avatar) VALUES (?,?,?,?)';
      _db.rawInsert(sql, [
        presente.nome,
        presente.unidade,
        presente.valorEstimado,
        presente.urlPresente
      ]);
    } else {
      sql =
          'UPDATE presente SET nome = ?, unidade =?, valorEstimado = ?, url_presente= ? WHERE id = ?';
      _db.rawUpdate(sql, [
        presente.nome,
        presente.unidade,
        presente.valorEstimado,
        presente.urlPresente,
        presente.id
      ]);
    }
  }
}
