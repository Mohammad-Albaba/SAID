String firebaseToken = '';

String fcmToken = '';

String token = '';

String uId = '';

String phone = '';

String placemarkName = '';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
