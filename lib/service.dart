import 'package:http/http.dart' as http;

import 'model.dart';

class AllExpirationClass {
  Future<AllExpirationModelClass> getData() async {
    // try {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vYXBpLmFsYmFrYWUuY29tLy9hcGkvbG9naW4iLCJpYXQiOjE2MzMyODA5MTMsIm5iZiI6MTYzMzI4MDkxMywianRpIjoiN3YzTmlJS0xTVjduY3ZWOCIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.gHJ5YJn-ztNVFWW5e9rVA-0OfjIkgkQNwoRv12oqRD8'
    };
    var request = http.Request(
        'POST', Uri.parse('http://api.albakae.com/api/all-expiration'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >= 400) {
      print(response.statusCode);
      throw ('Error');
    } else {
      print(response.reasonPhrase);
      return allExpirationModelClassFromJson(response.body);
    }
    // } catch (e) {
    //   print(e);
    //   return null;
    // }
  }
}
