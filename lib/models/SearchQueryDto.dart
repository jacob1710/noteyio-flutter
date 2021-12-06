class SearchQueryDto{
  String searchQuery;
  String userId;
  SearchQueryDto({required this.searchQuery, required this.userId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> newQuery = new Map<String, dynamic>();
    newQuery['userId'] = this.userId;
    newQuery['searchQuery'] = this.searchQuery;
    return newQuery;
  }

}