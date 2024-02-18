
String getMessages(value) {
  var errors = '';
  int index = 0;
  if (value is Map<dynamic, dynamic>) {
    for (var key in value.keys) {
      errors += '${'$key'} : ';
      index++;
      value[key].forEach((e) {
        if (value[key].length == 1) {
          errors += '$e';
        } else {
          errors += '$e\n';
        }
      });
      if (value.length > index) {
        errors += '\n';
      }
    }
    return errors;
  } else {
    return value ?? '';
  }
}