import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:todo_app_news/layout/counter_with_cubit/counter_with_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app_news/layout/layout_screen.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_cubit.dart';
import 'package:todo_app_news/layout/news_app_layout/news_cubit/news_states.dart';
import 'package:todo_app_news/layout/news_app_layout/news_layout.dart';
import 'package:todo_app_news/shared/cubit/cubit.dart';
import 'package:todo_app_news/shared/cubit/states.dart';
import 'package:todo_app_news/shared/network/local/cashe_helper.dart';
import 'package:todo_app_news/shared/network/remote/dio_helper.dart';
import 'package:todo_app_news/shared/styles/themes.dart';


void main() {//async{
 // WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 // await CasheHelper.init();
 //bool? isDark= CasheHelper.getBoolean(key:'isDark');
  //runApp(MyApp( isDark!));
    runApp(MyApp());
}

class MyApp extends StatelessWidget{
 // final bool isDark;
// MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
   return
     MultiBlocProvider(
       providers: [
         BlocProvider(create:(context)=> NewsCubit()..getBussiness()),
         BlocProvider(create: (BuildContext context)=>AppCubit())
         
       ], child:
     BlocConsumer<AppCubit,AppStates>(
       listener:(context, state) {} ,
       builder: (context,state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: lightTheme,
           themeMode:AppCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light ,
           darkTheme: darkTheme,
           home: Directionality(
             child: NewsLayout(),
             textDirection: TextDirection.rtl,
           ),
         );
       },
     ),
        
     );


     //);


  }

}