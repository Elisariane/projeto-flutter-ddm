// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presente_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PresenteListBack on _PresenteListBack, Store {
  final _$listAtom = Atom(name: '_PresenteListBack.list');

  @override
  Future<List<Presente>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Presente>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_PresenteListBackActionController =
      ActionController(name: '_PresenteListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_PresenteListBackActionController.startAction(
        name: '_PresenteListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_PresenteListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
