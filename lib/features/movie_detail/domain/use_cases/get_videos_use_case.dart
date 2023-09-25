import 'package:dartz/dartz.dart';
import 'package:filmku/features/movie_detail/data/datasource/remote/movie_detail_remote_datasource.dart';
import 'package:filmku/models/response/videos_response.dart';
import 'package:filmku/shared/util/app_exception.dart';

class GetVideosUseCase{
  final MovieDetailRemoteDataSource movieDetailRemoteDataSource;
  GetVideosUseCase({required this.movieDetailRemoteDataSource});

  Future<Either<AppException,VideosResponse>> execute({required int id}) async{

    return movieDetailRemoteDataSource.getVideos(id: id);
  }

}