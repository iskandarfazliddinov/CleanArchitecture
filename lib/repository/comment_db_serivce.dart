import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

import '../model/comment_model.dart';
import '../service/get_comments.dart';

class CommentDbService {
  CommentService commentService = CommentService();
  late Isar db;

  Future<dynamic> getComments()async{
    dynamic response = await commentService.getComments();
    if(response is List<CommentModel>){
      await openDB();
      await writeToDB(response);
      return db.commentModels.where().findAll();
    }else{
      return response;
    }
  }

  Future<void> openDB() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      db = await Isar.open([CommentModelSchema], directory: appDocDir.path);
    } else {
      db = await Future.value(Isar.getInstance());
    }
  }

  Future<void> writeToDB(List<CommentModel> data) async {
    db.writeTxn(() async {
      await db.commentModels.clear();
      await db.commentModels.putAll(data);
    });
  }
}
