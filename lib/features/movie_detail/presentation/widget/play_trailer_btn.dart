import 'package:avatar_glow/avatar_glow.dart';
import 'package:filmku/features/movie_detail/presentation/bloc/video/videos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayTrailerButton extends StatelessWidget {
  const PlayTrailerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc,VideosState>(
      builder: (context,state){
        return Column(
          children: [
            AvatarGlow(
                endRadius: 40.sp,
                child: InkWell(
                  onTap: () {
                    context.read<VideosBloc>().add(const VideoIconPressedEvent());
                  },
                  child: const Icon(
                    Icons.play_circle,
                    size: 30,
                  ),
                ))
          ],
        );
      },
    );
  }
}
