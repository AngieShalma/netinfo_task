import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());



  bool colormode=false;
  Color colorscreen=Colors.white.withOpacity(0.8);//Color(0xffFBE4D8);
  Color colorDate=Colors.grey;
  Color colortext=Colors.black;
  Color colorappbar=Color(0xff522B5B);





  bool load = true;
  List source=[];
  late String cat;
  late String title;
  getsorce() async {
    load = true;
    emit(StartLoadingFor_getdata_state());
    print('start');
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=bcab4ccbe2314cb48eef06d945ee8a31"));
    if (res.statusCode == 200) {

      source = json.decode(res.body)["sources"];
      print(source.length);
      emit(GetDataFromApi());
    }
    else{
      print(json.decode(res.body));
      print('jfhdjfhjdhf');
    }
    load = false;
    emit(EndLoadingFor_getdata_state());
  }

  bool loading = true;
  List listviewdata=[];
  late String Url;
  getlist({ required scr}) async {
    print("startgetlist");
    loading = true;
    listviewdata = [];
    emit(StartLoadingFor_getlist_state());
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=bcab4ccbe2314cb48eef06d945ee8a31&source=$scr"));
    if (res.statusCode == 200) {
      listviewdata = jsonDecode(res.body)["articles"];
      print(listviewdata.length);
      emit(GetDataListFromApi());
    }else{
      print(json.decode(res.body));
      print('no data');
    }

    loading = false;
    emit(EndLoadingFor_getlist_state());
  }
}
