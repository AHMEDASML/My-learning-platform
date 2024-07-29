import 'package:dio/dio.dart';
import 'package:educational_platform/global/components/show_toast_app.dart';
import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:educational_platform/modules/layout/page_screen/search/models/search_model.dart';
import 'package:get/get.dart';

class SearchControllerApp extends GetxController {
  final Dio _dio = Dio();
  RxBool loading = false.obs;
  var searchResults = RxList<Datum>([]);

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  void fetchInitialData() async {
    String? token = CacheHelper.getData(key: TOKEN);
    if (token == null) {
      showToastApp(text: 'Token not found');
      return;
    }

  }

  void fetchSearchData(String query) async {
    String? token = CacheHelper.getData(key: TOKEN);
    if (token == null) {
      showToastApp(text: 'Token not found');
      return;
    }

    try {
      loading.value = true;
      var headers = {'Authorization': 'Bearer $token'};
      var response = await _dio.get(
        'https://munastiedu.com/api/search',
        queryParameters: {'query': query},
        // queryParameters: {'query': 're'},
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        var searchModel = SearchModel.fromJson(response.data);

        searchResults.value = searchModel.data;

        print('AAAAAAAAAAAAAAAAAAAAAAAAAA');
        print(searchModel.data);
        loading.value = false;


      } else {
        showToastApp(text: 'Error: ${response.statusMessage}');
        print('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
        loading.value = false;
      }
    } catch (e) {
      showToastApp(text: 'Error: $e');
      loading.value = false;
    }
  }
}