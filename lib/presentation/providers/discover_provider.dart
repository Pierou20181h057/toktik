import 'package:flutter/widgets.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';

import '../../shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRespository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRespository});

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 5));

    //final List<VideoPost> newVideos = videoPosts
    //.map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //.toList();

    final newVideos = await videosRespository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
