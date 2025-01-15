class JsonModel{
  int total;
    int skip;
  int limit;
  List<QuotesModel> quotes;

  JsonModel({required this.total, required this.skip, required this.limit, required this.quotes});

  factory JsonModel.fromJson(Map<String,dynamic> json){

    List<QuotesModel> mQuotes = [];

    for(Map<String,dynamic> eachQuote in json["quotes"]){
      mQuotes.add(QuotesModel.fromJson(eachQuote));
    }

    return JsonModel(
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
        quotes: mQuotes,
    );
  }

}

class QuotesModel {
    int id;
    String quote;
    String author;

    QuotesModel({required this.id,required this.quote,required this.author});

    factory QuotesModel.fromJson(Map<String,dynamic> json){
      return QuotesModel(
          id: json["id"],
          quote: json["quote"],
          author: json["author"]
      );
    }
}