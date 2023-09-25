import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmku/shared/widgets/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmku/app/app_configs.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:filmku/shared/widgets/rating_bar.dart';

class BookmarkCard extends StatefulWidget {
  final MovieDetail movieDetail;
  final VoidCallback onDisLike;

  const BookmarkCard(
      {Key? key, required this.movieDetail, required this.onDisLike})
      : super(key: key);

  @override
  State<BookmarkCard> createState() => _BookmarkCardState();
}

class _BookmarkCardState extends State<BookmarkCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    _animationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 1000));

    _slideAnimation=Tween<Offset>(
      begin: const Offset(0,0),
      end: const Offset(2,-1)
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut)
    )..addListener(() {
      if(_slideAnimation.isCompleted){
        widget.onDisLike();
      }
    });
    // _animationController.forward();
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        padding: EdgeInsets.only(
            top: AppDimens.p8, right: AppDimens.p16, left: AppDimens.p16),
        child: Row(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.p8)),
              elevation: 8.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.p8),
                child: CachedNetworkImage(
                  imageUrl:
                      AppConfigs.preMoviePoster(widget.movieDetail.posterPath),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  height: AppDimens.nowShowingPosterHeight,
                  width: AppDimens.nowShowingPosterWidth,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: AppDimens.p10, left: AppDimens.p8, right: AppDimens.p8),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: HeartButton(
                        isBookmarked: true,
                        onBtnPressed: () {
                          _animationController.forward();
                        },
                      ),
                    ),
                    Text(
                      widget.movieDetail.title,
                      maxLines: 2,
                      style: context.textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: AppDimens.p14,
                    ),
                    RatingBar(rating: widget.movieDetail.voteAverage),
                    SizedBox(
                      height: AppDimens.p8,
                    ),
                    Text(
                      widget.movieDetail.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
