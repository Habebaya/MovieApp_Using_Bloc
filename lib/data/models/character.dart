class Character{
   late int charId;
   late  String name,nickName;
   late String image;
   late List <dynamic> jobs;
   late String status;
   late List <dynamic> appearanceOfSeasons;
   late String actorName;
   late String category;
   late List <dynamic> ?appearanceOfAnother;


  Character.fromJson(Map<String , dynamic> json){
    charId = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["img"];
    jobs = json["occupation"];
    status = json["status"];
    appearanceOfSeasons = json["appearance"];
    actorName = json["portrayed"];
    category = json["category"];
    appearanceOfAnother = json["better_call_saul_appearance"];


  }









}