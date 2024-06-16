import 'dart:convert';

class HealthModel {
  final String prediction;

  HealthModel({required this.prediction});

  factory HealthModel.fromJson(Map<String, dynamic> map) {
    return HealthModel(
      prediction: map['prediction'] as String,
    );
  }


}

class detailsModel {
   String weight;
     String height;
     String fever;
     String lethargy;
     String diarrhea;
     String runningNose;
     String coughingSneezing;
     String coatChanges;

  detailsModel({required this.weight, required this.height, required this.fever, required this.lethargy, required this.diarrhea, required this.runningNose, required this.coughingSneezing, required this.coatChanges});

  Map<String, dynamic> toMap() {
    return {
      'Weight': weight,
      'Height': height,
      'Fever': fever,
      'Lethargy': lethargy,
      'Diarrhea': diarrhea,
      'Running_Nose': runningNose,
      'Coughing_Sneezing': coughingSneezing,
      'Coat_Changes': coatChanges,
    };
  }

  factory detailsModel.fromMap(Map<String, dynamic> map) {
    return detailsModel(
      weight: map['weight'] ?? '',
      height: map['height'] ?? '',
      fever: map['fever'] ?? '',
      lethargy: map['lethargy'] ?? '',
      diarrhea: map['diarrhea'] ?? '',
      runningNose: map['runningNose'] ?? '',
      coughingSneezing: map['coughingSneezing'] ?? '',
      coatChanges: map['coatChanges'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory detailsModel.fromJson(String source) => detailsModel.fromMap(json.decode(source));
}
