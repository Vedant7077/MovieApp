class MovieDataModel{
  String title;
  String year;
  String poster;
  String id;

  factory MovieDataModel.fromJson(Map<String, dynamic> json) {
    return MovieDataModel(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      poster: json['Poster'] ?? '',
      id: json['imdbID'] ?? '',
    );
  }

  MovieDataModel({
    required this.title,
    required this.year,
    required this.poster,
    required this.id,
});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'year': year,
      'poster': poster,
      'Id':id,
    };
  }

  static List<MovieDataModel> listFromJson(List<dynamic> data){
    List<MovieDataModel> modelData = [];
    for(int i=0;i<data.length;i++){
      Map<String,dynamic> mapData = data[i];
      modelData.add(MovieDataModel.fromJson(mapData));
    }
    return modelData;
  }
}