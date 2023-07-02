import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/model/comment_model.dart';
import 'package:dio/dio.dart';

class CommentService {
  Future<dynamic> getComments() async {
    try {
      Response response =
          await Dio().get(MyConstants.url);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CommentModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
