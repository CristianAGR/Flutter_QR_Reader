
import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        required this.id,
        required this.tipo,
        required this.valor,
    }){
      if (tipo.contains('http')) {
        tipo = 'http';
      } else {
        tipo = 'geo';
      }
    }

    int id;
    String tipo;
    String valor;

    // regresa una nueva instancia de la clase
    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

   // pasa la instancia de la clase a un mapa
    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
