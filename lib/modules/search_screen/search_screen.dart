import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_cubit.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_states.dart';
import 'package:todo_app_news/shared/component/components/components.dart';

class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchConrtoller=TextEditingController();
    return
      BlocConsumer<NewsCubit,NewsStates>(
       listener:(context,state){},
        builder:(context,state){
          var list = NewsCubit.get(context).search;
          return
           Scaffold(
             appBar: AppBar(),
             body: Column(
                 children:[
                   defaultTextForm(
                       oncnged: ( value)
                       {
                         NewsCubit.get(context).getSearch(value);
                       },
                       contrl: searchConrtoller,
                       typ: TextInputType.text,
                       validte: (String value)
                       {
                         if(value.isEmpty)
                         {
                           return 'search must not be empty';
                         }
                         return null;
                       },
                       labell: 'search',
                       prefix: Icons.search
                   ),
                   Expanded(child: buildArticleItem( context,list))

                 ]
             ),
           );
          },
      );

  }
}
