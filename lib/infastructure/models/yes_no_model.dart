//Lo que basicamente hacemos aca es crear una instancia de YesNoModel
//Este modelo tiene por objetivo mapear la respuesta
//este es un patron muy comun para evitar errores

// class YesNoModel {
//   String answer;
//   bool forced;
//   String image;

//   YesNoModel({required this.answer, required this.forced, required this.image});

//   factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
//         answer: json["answer"],
//         forced: json["forced"],
//         image: json["image"],
//       );
// }

//Ese codigo es generado por quickType.io

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

// import 'dart:convert';

// YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJson(json.decode(str)); //Esta funcion es Por si recibimos una data como string y la convierte a mapa, usualmente http ya se encarga de transformar y nos devuelve un mapa

// String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson()); //Esta otra parte, tien una instancia de nuestro modelo y crea un string. Es utilsi queremos madar peticiones http "post"

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    //INclusive temos el toJson() que seria el proceso opuesto, teniendo ya la instancia del YesNoModel, me genmera el Mapa que en este caso no es necesario pero dejamos como referencia
    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };
    //Podemos usar este modelo para crear una instancia del mensaje, para eso vamos a crear un Metodo que va a regresar Message y se va a llamar toMessageEntitie el cual no va a recibir ningun argumento(vacio), lo que nos va a regresar una instancia => de Message

    Message toMessageEntitie () => Message(text: answer == 'yes'?'Si':'NO', fromWho: FromWho.yours, imageUrl: image);

}
