
abstract class DataState<T> {
   T? data;
   // ignore: deprecated_member_use
   DataRequestError? error;
   DataState({this.data,this.error});
}


class DataIntial<T> extends DataState<T>{
    DataIntial():super();
}
class DataWaiting<T> extends DataState<T>{
    DataWaiting():super();
}

class DataSuccess<T> extends DataState<T>{
    DataSuccess({required T data}):super(data: data);
}

class DataError<T> extends DataState<T>{
    DataError({required DataRequestError error}):super(error: error);
}


class DataRequestError{
  int? statusCode;
  String? message;
  DataRequestError({required this.statusCode,required this.message});
}