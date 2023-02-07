import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/app_string.dart';

class HeaderAndSeeMoreMovies extends StatelessWidget {
  const HeaderAndSeeMoreMovies({
    Key? key,
    required this.title,
    required this.onTapSeeMore,
  }) : super(key: key);

  final String title;
  final VoidCallback onTapSeeMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: onTapSeeMore,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(AppString.seeMore),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
