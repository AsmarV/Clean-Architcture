List<Map<String, dynamic>> convertModelsToJson(dynamic modelList) {
  try {
    final List<Map<String, dynamic>> data = [];

    for (var item in modelList) {
      data.add(item.toJson());
    }

    return data;
  } catch (e) {
    return [];
  }
}
