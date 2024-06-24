
class MoviedataDetails{
  String title;
  String director;
  String writer;


  factory MoviedataDetails.fromJson(Map<String, dynamic> json) {
    return MoviedataDetails(
      title: json['Title'] ?? '',
      director: json['Director'] ?? '',
      writer: json['Writer'] ?? '',
    );
  }

  MoviedataDetails({
    required this.title,
    required this.director,
    required this.writer,
});

  Map<String,dynamic> toJson(){
    return {
      'title': title,
      'director': director,
      'writer': writer,
    };
}

  static List<MoviedataDetails> listFromJson(List<dynamic> data){
    List<MoviedataDetails> modelData = [];
    for(int i=0;i<data.length;i++){
      Map<String,dynamic> mapData = data[i];
      modelData.add(MoviedataDetails.fromJson(mapData));
    }
    return modelData;
  }
}
