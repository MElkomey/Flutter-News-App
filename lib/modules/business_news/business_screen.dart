import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_cubit.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_states.dart';
import 'package:todo_app_news/shared/component/components/components.dart';

class BusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return

   BlocConsumer<NewsCubit,NewsStates>(
     listener:(context, state) {},
     builder:(context,state){
       var list=NewsCubit.get(context).bussiness;
       if (list.length>0){
         return ListView.separated(
             itemBuilder: (context, index) => buildArticleItem(list[index],context),
             separatorBuilder: (context,index)=>Container(height: 1.0, width: double.infinity,color: Colors.grey,),
             itemCount: list.length);
       }
       else{
         return Center(child: CircularProgressIndicator());
       }

     }
   )
  ;
  }
}