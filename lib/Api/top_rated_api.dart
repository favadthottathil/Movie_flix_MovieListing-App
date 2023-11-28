import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_flix_app/Model/top_rated.dart';

class TopRatedApi {
  // Api Endpoint for Fetching TopRated Movies
  static const apiEndPoint = 'https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed';

  // Headers for Api Request
  var headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer a07e22bc18f5cb106bfe4cc1f83ad8ed'
  };

  // Fetches data from the Now Playing API endpoint and returns
  // a list of NowPlaying objects.
  Future<List<TopRatedModel>> getDataFromTopRatedApi() async {
    final url = Uri.parse(apiEndPoint);
    try {
      // Fetch Data from Api using a GET Request
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Extract 'results' which contains the list of movies
        List<dynamic> data = jsonResponse['results'];

        // Map the retrieved data to a list of NowPlaying objects
        List<TopRatedModel> topRated = data.map((item) => TopRatedModel.fromJson(item)).toList();

        return topRated;
      } else {
        throw Exception("Can't get Top Rated Movies");
      }
    } catch (e) {
      throw Exception("Error fetching financial news: $e");
    }
  }
}
