import 'package:bloc/bloc.dart';
import 'package:clean_architecture/model/comment_model.dart';
import 'package:clean_architecture/repository/comment_db_serivce.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(const CommentInitial()){
    getComment();
  }

  CommentDbService commentDbService = CommentDbService();

  Future<void> getComment() async {
    emit(const CommentLoadingState());
    dynamic response = await commentDbService.getComments();
    if (response is List<CommentModel>) {
      emit(CommentCompleteState(response));
    } else {
      emit(CommentErrorState(response));
    }
  }
}
