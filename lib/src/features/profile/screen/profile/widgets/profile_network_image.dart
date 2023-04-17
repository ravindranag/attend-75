import 'package:attend_75/src/constants/images.dart';
import 'package:flutter/material.dart';

class ProfileNetworkImage extends StatelessWidget {
  const ProfileNetworkImage({
    super.key,
    required this.profileImageUrl,
    this.onTap
  });

  final String profileImageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: InkResponse(
          radius: 60,
          onTap: onTap,
          child: FadeInImage(
            image: NetworkImage(profileImageUrl),
            placeholder: const AssetImage(appLogo),
            fit: BoxFit.cover,
            width: 100,
            height: 100,
            imageErrorBuilder: (_, __, ___) {
              return Image.asset(appLogo);
            },
          ),
        ),
      ),
    );
  }
}