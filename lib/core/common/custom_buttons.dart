import 'package:expence/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtons extends StatefulWidget {
  final String text;
  final VoidCallback onpressed;
  final bool isLoading;
  const CustomButtons({
    super.key,
    required this.text,
    required this.onpressed,
    this.isLoading = false,
  });

  @override
  State<CustomButtons> createState() => _CustomButtons();
}

class _CustomButtons extends State<CustomButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: widget.isLoading ? null : widget.onpressed,
        child:
            widget.isLoading
                ? SizedBox(
                  // width: 30,
                  // height: 10,
                  child: CircularProgressIndicator(
                    // color: AppColors.orange,
                    strokeCap: StrokeCap.round,
                  ),
                )
                : Text(
                  widget.text,
                  style: GoogleFonts.varelaRound(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
      ),
    );
  }
}
