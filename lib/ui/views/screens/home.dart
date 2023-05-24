import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../configs/colors.dart';
import '../../../configs/size.dart';
import '../../widgets/rounded_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Expanded(flex: 3, child: _buildHeader(context)),
          Expanded(
            child: Container(
              child: Text("data3"),
              color: Colors.green,
            ),
            flex: 7,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final _safePadding = MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGray,
            offset: const Offset(0, 4),
            blurRadius: 16,
          )
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      ),
      child: Column(
        children: [
          SizedBox(height: _safePadding,),
          _buildProfileSection(context),
          // _buildWeeklyCalendar(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.xl,
        horizontal: AppSizes.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedImage(
              radius: 32,
              url:
                  'https://ichef.bbci.co.uk/news/800/cpsprodpb/E172/production/_126241775_getty_cats.png'),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "초코",
                    style: GoogleFonts.gowunBatang(
                      textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w100,
                      )
                    ),
                  ),
                  const SizedBox(height: AppSizes.sm),
                  Text(
                      "고양이",
                      style: GoogleFonts.gowunBatang(
                          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                          )
                      ),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton(
            onPressed: null,
            style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text(
              "펫 정보 수정",
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWeeklyCalendar(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Text("cal"),
        ],
      ),
    );
  }
}
