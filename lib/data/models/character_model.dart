class Character {
  int? charId;
  String? name;
  String? nickname;
  String? image;
  List<dynamic>? jobs;
  String? statusIfDeadOrAlive;
  List<dynamic>? appearanceOfSeasons;
  String? actorName; //Actor Name in reality
  String? categoryForTowSeries;
  List<dynamic>? betterCallSaulAppearance;
  Character(
      {this.charId,
      this.name,
      this.jobs,
      this.image,
      this.statusIfDeadOrAlive,
      this.nickname,
      this.appearanceOfSeasons,
      this.actorName,
      this.categoryForTowSeries,
      this.betterCallSaulAppearance});

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    jobs = json['occupation'];
    image = json['img'];
    statusIfDeadOrAlive = json['status'];
    nickname = json['nickname'];
    appearanceOfSeasons = json['appearance'];
    actorName = json['portrayed'];
    categoryForTowSeries = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['occupation'] = jobs;
    data['img'] = image;
    data['status'] = statusIfDeadOrAlive;
    data['nickname'] = nickname;
    data['appearance'] = appearanceOfSeasons;
    data['portrayed'] = actorName;
    data['category'] = categoryForTowSeries;
    data['better_call_saul_appearance'] = betterCallSaulAppearance;
    return data;
  }
}
