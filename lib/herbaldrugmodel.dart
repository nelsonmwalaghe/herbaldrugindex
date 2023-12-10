class Herbaldruglist {
  String? status;
  String? latinNameOfHerbalSubstance;
  String? botanicalNameOfPlant;
  String? englishCommonNameOfHerbalSubstance;
  String? combination;
  String? use;
  String? outcome;
  String? dateAddedToTheInventory;
  String? dateAddedToThePriorityList;
  String? firstPublished;
  String? revisionDate;
  String? url;

  Herbaldruglist(
      {this.status,
        this.latinNameOfHerbalSubstance,
        this.botanicalNameOfPlant,
        this.englishCommonNameOfHerbalSubstance,
        this.combination,
        this.use,
        this.outcome,
        this.dateAddedToTheInventory,
        this.dateAddedToThePriorityList,
        this.firstPublished,
        this.revisionDate,
        this.url});

  Herbaldruglist.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    latinNameOfHerbalSubstance = json['latin_name_of_herbal_substance'];
    botanicalNameOfPlant = json['botanical_name_of_plant'];
    englishCommonNameOfHerbalSubstance =
    json['english_common_name_of_herbal_substance'];
    combination = json['combination'];
    use = json['use'];
    outcome = json['outcome'];
    dateAddedToTheInventory = json['date_added_to_the_inventory'];
    dateAddedToThePriorityList = json['date_added_to_the_priority_list'];
    firstPublished = json['first_published'];
    revisionDate = json['revision_date'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['latin_name_of_herbal_substance'] = this.latinNameOfHerbalSubstance;
    data['botanical_name_of_plant'] = this.botanicalNameOfPlant;
    data['english_common_name_of_herbal_substance'] =
        this.englishCommonNameOfHerbalSubstance;
    data['combination'] = this.combination;
    data['use'] = this.use;
    data['outcome'] = this.outcome;
    data['date_added_to_the_inventory'] = this.dateAddedToTheInventory;
    data['date_added_to_the_priority_list'] = this.dateAddedToThePriorityList;
    data['first_published'] = this.firstPublished;
    data['revision_date'] = this.revisionDate;
    data['url'] = this.url;
    return data;
  }
}