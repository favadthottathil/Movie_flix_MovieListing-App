import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_flix_app/Model/now_playing.dart';

class NowPlayingApi {

  // Api Endpoint for Fetching NowPlaying Movies
  static const apiEndPooint = 'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed';

  // Headers for Api Request
  var headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer a07e22bc18f5cb106bfe4cc1f83ad8ed'
  };

  // Fetches data from the Now Playing API endpoint and returns
  // a list of NowPlaying objects.
  Future<List<NowPlayingModel>> getDataFromNowPlayingApi() async {
    final url = Uri.parse(apiEndPooint);

    // Fetch Data from Api using a GET Request  
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      
      // Extract 'results' which contains the list of movies
      List<dynamic> data = jsonResponse['results'];
      
      // Map the retrieved data to a list of NowPlaying objects
      List<NowPlayingModel> nowplaying = data.map((item) => NowPlayingModel.fromJson(item)).toList();

      return nowplaying;
    } else {
      throw Exception('error loading data');
    }
  }
}
