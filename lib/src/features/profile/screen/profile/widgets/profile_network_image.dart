import 'package:attend_75/src/constants/images.dart';
import 'package:flutter/material.dart';

class ProfileNetworkImage extends StatelessWidget {
  const ProfileNetworkImage({
    super.key,
    required this.profileImageUrl,
    this.onTap,
    this.width = 150,
    this.height = 150
  });

  final String? profileImageUrl;
  final VoidCallback? onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(width),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: InkResponse(
          radius: 60,
          onTap: onTap,
          child: FadeInImage(
            image: NetworkImage(profileImageUrl != null ? profileImageUrl! : 'https://brokenurl.com'),
            placeholder: const AssetImage(appLogo),
            fit: BoxFit.contain,
            imageErrorBuilder: (_, __, ___) {
              return Image.asset(appLogo);
            },
          ),
        ),
      ),
    );
  }
}