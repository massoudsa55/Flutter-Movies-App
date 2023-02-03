import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/api_services.dart';
import '../../../core/utils/enums.dart';
import '../../controllers/bloc/movie_bloc.dart';
import '../../controllers/bloc/movie_state.dart';

class NowPlayingMovieWidget extends StatelessWidget {
  const NowPlayingMovieWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String textNowPlaying = 'Now Playing'.toUpperCase();
    return BlocBuilder<MovieBloc, MovieState>(
        buildWhen: (previous, current) =>
            previous.nowPlayingRequestState != current.nowPlayingRequestState,
        builder: (context, state) {
          switch (state.nowPlayingRequestState) {
            case RequestState.loading:
              return const SizedBox(
                height: 400.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case RequestState.laoded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.linearToEaseOut,
                    // autoPlayCurve: Curves.slowMiddle,
                    // enlargeCenterPage: true,
                    // enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {},
                  ),
                  items: state.nowPlayingListMovies.map(
                    (item) {
                      return GestureDetector(
                        key: const Key('openMovieMinimalDetail'),
                        onTap: () {
                          /// TODO : NAVIGATE TO MOVIE DETAILS
                        },
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // fromLTRB
                                    Colors.transparent,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0, 0.3, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                              child: CachedNetworkImage(
                                height: 560.0,
                                imageUrl:
                                    ApiServices.imageUrl(item.backdropPath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Container(
                                      width:
                                          textNowPlaying.length.toDouble() * 14,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.redAccent,
                                            size: 12.0,
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            textNowPlaying,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 400.0,
                child: Center(
                  child: Text(state.nowPlayingMessage),
                ),
              );
          }
        });
  }
}
