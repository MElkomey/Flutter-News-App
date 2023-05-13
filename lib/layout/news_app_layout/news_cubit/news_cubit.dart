import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_states.dart';
import 'package:todo_app_news/modules/business_news/business_screen.dart';
import 'package:todo_app_news/modules/science_news/science_screen.dart';
import 'package:todo_app_news/modules/settings_news/settings_screen.dart';
import 'package:todo_app_news/modules/sports_news/sports_screen.dart';
import 'package:todo_app_news/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);


  int currentIndex=0;

  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'),


  ];

  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void bottomNavBarChange(int index){
    currentIndex= index;
    if(index==1){
      getSports();
    }
    if(index==2){
      getScience();
    }
    emit(NewsBottomNavChangeState());
  }


  List<dynamic>bussiness=[];
   void getBussiness(){
    emit(GetNewsBussinessLoadingState());
    if (bussiness.length==0){
      DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'7edef1e5a5774fcb9f699a503c3c751d'
      },
    ).then((value){
      bussiness=value.data['articles'];
      print(bussiness[0]['title']);
      emit(GetNewsBussinessSuccessState());
      //print(value.data['articles'][0]['title']);
    }).catchError((error){(
        error.toString());
    emit(GetNewsBussinessErrorState(error.toString()));
    }
    );}else{
      emit(GetNewsBussinessSuccessState());
    }

    
  }

  List<dynamic>sports=[];
  void getSports(){
    emit(GetNewsSportsLoadingState());
    if (sports.length==0){
      DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'Sports',
        'apiKey':'7edef1e5a5774fcb9f699a503c3c751d'
      },
    ).then((value){
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(GetNewsSportsSuccessState());
      //print(value.data['articles'][0]['title']);
    }).catchError((error){(
        error.toString());
    emit(GetNewsSportsErrorState(error.toString()));
    }
    );}else{
      emit(GetNewsSportsSuccessState());
    }


  }

  List<dynamic>science=[];
  void getScience(){
    emit(GetNewsScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apiKey':'7edef1e5a5774fcb9f699a503c3c751d'
      },
    ).then((value){
      science=value.data['articles'];
      print(science[0]['title']);
      emit(GetNewsScinceSuccessState());
      //print(value.data['articles'][0]['title']);
    }).catchError((error){(
        error.toString());
    emit(GetNewsScienceErrorState(error.toString()));
    }
    );}else{
      emit(GetNewsScinceSuccessState());
    }


  }


  List<dynamic>search=[];
  void getSearch(String value)
  {
    emit(GetNewsSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'7edef1e5a5774fcb9f699a503c3c751d',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(GetNewsSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetNewsSearchErrorState(error.toString()));
    });
  }



}