import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailDialog extends StatelessWidget {
  final String title;
  final String details;
  final String? playStoreLink;
  final String? appImagePath;

  const ProjectDetailDialog({
    Key? key,
    required this.title,
    required this.details,
    this.playStoreLink,
    this.appImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasImage = appImagePath != null && appImagePath!.isNotEmpty;
    final bool hasLink = playStoreLink != null && playStoreLink!.isNotEmpty;

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 550),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.20),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),

                const SizedBox(height: 16),

                // Image if available
                if (hasImage)
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          backgroundColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: PhotoView(
                              imageProvider: appImagePath!.startsWith('http') ? CachedNetworkImageProvider(appImagePath!) : AssetImage(appImagePath!) as ImageProvider,
                            ),
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: appImagePath!.startsWith('http')
                          ? CachedNetworkImage(
                              imageUrl: appImagePath!,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 80),
                            )
                          : Image.asset(
                              appImagePath!,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),

                const SizedBox(height: 16),

                // Project Description
                Text(
                  details,
                  style: const TextStyle(
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 16),

                // Play Store Link
                if (hasLink)
                  GestureDetector(
                    onTap: () async {
                      final uri = Uri.parse(playStoreLink!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.link, color: Colors.teal),
                        SizedBox(width: 8),
                        Text(
                          'View Project',
                          style: TextStyle(
                            color: Colors.tealAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 20),

                // Close Button
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Close"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
