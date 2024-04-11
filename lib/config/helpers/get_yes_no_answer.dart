

import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnser {

final _dio = Dio();
 Future <Message> getAnswer() async{

    final reponse = await _dio.get('https://yesno.wtf/'); 
throw UnimplementedError();
 }

}