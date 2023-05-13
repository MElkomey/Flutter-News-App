//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:bloc/bloc.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_cubit.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_states.dart';
import 'package:todo_app_news/modules/search_screen/search_screen.dart';
import 'package:todo_app_news/shared/component/components/components.dart';
import 'package:todo_app_news/shared/cubit/cubit.dart';
import 'package:todo_app_news/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return
      BlocConsumer<NewsCubit, NewsStates>(
       listener: (BuildContext context,NewsStates state) {},
       builder: (BuildContext context,NewsStates state) {
         var cubit= NewsCubit.get(context);
         return Scaffold(
           appBar: AppBar(
             title: Text(
               'NewsApp'
           ),
             actions: [
               IconButton(onPressed: (){
                 navigateTo(context, searchScreen());
               }, icon: Icon(Icons.search)),
               IconButton(onPressed: (){
                 AppCubit.get(context).appModeChange();
               }, icon: Icon(Icons.brightness_4_outlined))
             ],
           ),
             body:cubit.screens[cubit.currentIndex] ,
           bottomNavigationBar: BottomNavigationBar(
             currentIndex: cubit.currentIndex,
             items: cubit.items,
             onTap: (index){cubit.bottomNavBarChange(index);},
           )

       );
         },


      );
  }


}