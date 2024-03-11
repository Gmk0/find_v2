import 'package:shared_preferences/shared_preferences.dart';

class ApiEndPoints {
  static const String baseUrl = "http://10.0.2.2:8000/api/";
  static const String imageUrlDomaine =
      'http://10.0.2.2:8000/images/domaines2.png';
  static const String imageUrl = 'http://10.0.2.2:8000/images/domaines2.png';

  static _AuthEndPoints authEndPoints = _AuthEndPoints();
  // ignore: library_private_types_in_public_api
  static _CategoryEndPoints categoryEndPoints = _CategoryEndPoints();
  // ignore: library_private_types_in_public_api
  static _ServiceEndPoints serviceEndPoints = _ServiceEndPoints();
  static _FreelanceEndPoints freelanceEndPoints = _FreelanceEndPoints();
  static _ConversationEndPoints conversationEndPoints =
      _ConversationEndPoints();

  static Future<Map<String, String>> getHeaders() async {
    //
    String? userToken =
        await getUserToken(); // Remplacez cela par votre logique pour obtenir le token de l'utilisateur
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    if (userToken != null) {
      headers['Authorization'] = 'Bearer $userToken';
    }

    return headers;
  }

  static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Remplacez 'userTokenKey' par la clé réelle que vous utilisez pour stocker le token
    return prefs.getString('token');
  }
}

class _AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
  final String categorie = 'service_api';
}

class _CategoryEndPoints {
  final String allCategory = 'fetchAll';
}

class _ServiceEndPoints {
  final String allService = 'allServices';
  final String popularService = 'popularService';
}

class _FreelanceEndPoints {
  final String allFreelance = 'allFreelances';
}

class _ConversationEndPoints {
  final String allConversation = 'getUserConversations';
}
