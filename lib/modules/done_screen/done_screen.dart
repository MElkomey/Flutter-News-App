import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_news/shared/component/components/components.dart';
import 'package:todo_app_news/shared/cubit/cubit.dart';
import 'package:todo_app_news/shared/cubit/states.dart';

class DoneScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return
            ListView.separated(
              itemBuilder: (context,index)=> buildTaskItem(AppCubit.get(context).doneTasks[index],context),
              separatorBuilder: (context,index)=> Container(height: 1,),
              itemCount: AppCubit.get(context).doneTasks.length,
            );
        },
      );
  }


}