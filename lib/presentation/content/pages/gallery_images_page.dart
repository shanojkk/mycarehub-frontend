import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';

class GalleryImagesPage extends StatelessWidget {
  const GalleryImagesPage({
    super.key,
    required this.images,
  });

  final List<GalleryImage>? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: galleryImagesTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: images?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return GalleryImageWidget(
              imageUrl: images?[index].image?.meta?.imageDownloadUrl ?? '',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 12);
          },
        ),
      ),
    );
  }
}
