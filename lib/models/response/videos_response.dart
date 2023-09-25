
class VideosResponse<T> {
  final List<T> videos;
  final int id;

  VideosResponse({required this.videos, required this.id});

  @override
  String toString() {
    return 'VideosResponse{videos: $videos, id: $id}';
  }
}
