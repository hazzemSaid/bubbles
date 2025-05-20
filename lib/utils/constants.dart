import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color athensGray1 = Color(0xFFECEEF2); // hsla(220, 13%, 91%, 1)
  static const Color athensGray2 = Color(0xFFF9FBFD); // hsla(210, 20%, 98%, 1)
  static const Color black = Color(0xFF000000); // hsla(0, 0%, 0%, 1)
  static const Color candlelight = Color(
    0xFFFEEA3A,
  ); // hsla(48, 95.8%, 53.1%, 1)
  static const Color doveGray = Color(0xFF666666); // hsla(0, 0%, 40%, 1)
  static const Color grayChateau = Color(
    0xFFA4AABD,
  ); // hsla(218, 10.6%, 64.9%, 1)
  static const Color jacksonsPurple = Color(
    0xFF2A3DA8,
  ); // hsla(224, 64.3%, 32.9%, 1)
  static const Color luxorGold = Color(0xFF9E853D); // hsla(49, 57.7%, 41.8%, 1)
  static const Color paleSky = Color(0xFF6C7481); // hsla(220, 8.9%, 46.1%, 1)
  static const Color riverBed = Color(0xFF4C5562); // hsla(215, 13.8%, 34.1%, 1)
  static const Color shamrock = Color(0xFF2AD28D); // hsla(142, 69.2%, 58%, 1)
  static const Color thunder = Color(0xFF292628); // hsla(330, 5%, 15.7%, 1)
  static const Color wedgewood = Color(0xFF4B6A84); // hsla(214, 37%, 46.1%, 1)
  static const Color white = Color(0xFFFFFFFF); // hsla(0, 0%, 100%, 1)
  static const Color whiteWildSand = Color(0xFFFFFFFF); // duplicate
  static const Color wildSand = Color(0xFFF5F5F5); // hsla(0, 0%, 96.1%, 1)
}

class AppTextStyles {
  // Pacifico Regular - 1rem = 16px
  static final TextStyle pacificoRegular = GoogleFonts.pacifico(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  // Semantic Heading 1 - 1rem = 16px
  static final TextStyle semanticHeading1 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Semantic Input - 0.58rem = 9.28px
  static final TextStyle semanticInput = GoogleFonts.inter(
    fontSize: 9.28,
    fontWeight: FontWeight.w400,
  );

  // Semantic Button - 0.67rem = 10.72px
  static final TextStyle semanticButton = GoogleFonts.inter(
    fontSize: 10.72,
    fontWeight: FontWeight.w600,
  );

  // Inter Regular - 0.58rem = 9.28px
  static final TextStyle interRegular = GoogleFonts.inter(
    fontSize: 9.28,
    fontWeight: FontWeight.w400,
  );

  // Inter Regular Underline - 0.58rem = 9.28px + underline
  static final TextStyle interRegularUnderline = GoogleFonts.inter(
    fontSize: 9.28,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );
}
