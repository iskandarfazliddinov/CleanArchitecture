part of 'comment_cubit.dart';

@immutable
abstract class CommentState extends Equatable{
  const CommentState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentInitial extends CommentState {
  const CommentInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentLoadingState extends CommentState{
  const CommentLoadingState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentCompleteState extends CommentState{
  final List<CommentModel> data;

  const CommentCompleteState(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class CommentErrorState extends CommentState{
  final String error;
  const CommentErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}