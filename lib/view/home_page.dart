import 'package:clean_architecture/cubit/comment_cubit.dart';
import 'package:clean_architecture/model/comment_model.dart';
import 'package:clean_architecture/service/get_comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) => _Scaffold(context: context, state: state));
  }
}

class _Scaffold extends StatelessWidget {
  final BuildContext context;
  final CommentState state;

  const _Scaffold({
    required this.context,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clean Architecture")),
      body: Builder(builder: (context) {
          if (state is CommentLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CommentErrorState) {
            return Center(
              child: Text((state as CommentErrorState).error),
            );
          } else if (state is CommentCompleteState) {
            List<CommentModel> data = (state as CommentCompleteState).data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].email.toString()),
                );
              },
              itemCount: data.length,
            );
          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
