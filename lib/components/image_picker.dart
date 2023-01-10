import 'dart:developer';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vol_org/components/show_toast.dart';

import '../services/user_service.dart';
import '../styles/styles.dart';
import '../utils/pick_image.dart';

class ImagePicker extends ConsumerWidget {
  final String url;
  final String savePath;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final Color? fillColor;
  final BoxShape shape;
  final double height;
  final BorderRadius? borderRadius;
  final double aspectRatio;

  ImagePicker(
      {Key? key,
        required this.url,
        required this.savePath,
        String? initialValue,
        this.focusNode,
        this.decoration,
        this.onChanged,
        this.readOnly = false,
        this.fillColor,
        this.shape = BoxShape.rectangle,
        required this.height,
        this.borderRadius,
        this.aspectRatio = 16/9})
      : super(key: key);

  final userService = UserService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: shape == BoxShape.rectangle ? aspectRatio : 1,
        child: SizedBox(
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              if(url.isNotEmpty)
                Positioned.fill(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                    BoxDecoration(shape: shape, color: styles.baseColors.white, borderRadius: borderRadius),
                    child: CachedNetworkImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        imageUrl: url,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          return Image.network(
                            "assets/img/placeholder.jpg",
                            fit: BoxFit.cover,
                          );
                        }),
                  ),
                )
              else
                Positioned.fill(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: styles.themeColors.background,
                      shape: shape,
                      borderRadius: borderRadius,
                    ),
                    child: Image.asset(
                      "assets/img/placeholder.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (!readOnly)
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: SizedBox(
                    child: IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: styles.baseColors.darkSilver.withOpacity(0.7),
                          foregroundColor: styles.baseColors.softGreen
                      ),
                      onPressed: () async {
                        try {
                          XFile? image = await FlutterImagePicker.getImage;
                          if (image != null) {
                            final bytes = await image.readAsBytes();
                            await userService.uploadImage(bytes, savePath + image.name);
                            final imageUrl = await userService.getImageUrl(savePath + image.name);
                            onChanged?.call(imageUrl);
                          }
                        } catch (e) {
                          log("$e");
                          showFailureMessage(e.toString());
                        }
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
