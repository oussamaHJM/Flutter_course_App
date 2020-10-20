import 'package:flutter_app/data/dataSources/localData/BaseHiveProvider.dart';
import 'package:flutter_app/data/entities/Response.dart';
import 'package:flutter_app/data/entities/Response.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


class CharacterHiveProvider extends BaseHiveProvider<Results, CharacterHiveProvider>{

  CharacterHiveProvider._privateConstructor();
  static Future<CharacterHiveProvider> create() async{
    final component = CharacterHiveProvider._privateConstructor();
    final dir = await getApplicationDocumentsDirectory();
    if(_box == null){
      Hive
        ..init(dir.path)
        ..registerAdapter<Results>(ResultsAdapter());
      _box = await Hive.openBox('Characters');
    }
    return component;
  }

  static Box<Results> _box;

  @override
  Future<void> add(String id, Results object) => _box.put(id, object);

  @override
  Future<void> addAll(Map<String, Results> map) => _box.putAll(map);

  @override
  Future<void> clear() => _box.clear();

  @override
  Future<void> delete(String id) => _box.delete(id);

  @override
  Results get(String id) => _box.get(id);

  @override
  List<Results> getAll() => List<Results>.from(_box.values.toList());

  @override
  Future<void> close() => _box.close();
  
}