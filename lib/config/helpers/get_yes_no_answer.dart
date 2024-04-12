import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infastructure/models/yes_no_model.dart';

class GetYesNoAnser {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
  //   return Message(
  //       text: yesNoModel.answer,
  //       fromWho: FromWho.yours,
  //       imageUrl: yesNoModel.image);
  // }
  //----------------------------------------------------------------------------------------------------------
  //    Ahora que creamos el metodo toMessageEntitie y lo implementamos de la siguiente manera
  return yesNoModel.toMessageEntitie();
  } 
}
