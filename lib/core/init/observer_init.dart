import 'package:bloc/bloc.dart';

import '../../observer.dart';

observerinit(){
  Bloc.observer = MyBlocObserver();
}