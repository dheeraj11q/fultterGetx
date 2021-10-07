import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageShow {
  static network(
      {String url = "",
      double width = 100,
      double height = 100,
      String? placeHolderAssetImage,
      bool shimmerPlaceHolder = true,
      String? onErrorImagesAsset,
      Widget? child,
      BoxBorder? border,
      BorderRadiusGeometry? borderRadius,
      bool loaderEnable = true,
      Color loaderColor = Colors.grey}) {
    return Container(
      width: width,
      height: height,
      child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  border: border,
                  borderRadius: borderRadius,
                  image: DecorationImage(
                    image: imageProvider,

                    fit: BoxFit.cover,

                    // colorFilter:
                    //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                  ),
                ),
                child: child,
              ),
          placeholder: (context, url) => shimmerPlaceHolder
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: border,
                      borderRadius: borderRadius,
                      image: DecorationImage(
                        image: AssetImage("$placeHolderAssetImage"),

                        fit: BoxFit.cover,

                        // colorFilter:
                        //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                      ),
                    ),
                    child: child,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    border: border,
                    borderRadius: borderRadius,
                    image: DecorationImage(
                      image: AssetImage("$placeHolderAssetImage"),

                      fit: BoxFit.cover,

                      // colorFilter:
                      //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                    ),
                  ),
                  child: child,
                ),
          errorWidget: (context, url, error) => onErrorImagesAsset != null
              ? Container(
                  decoration: BoxDecoration(
                    border: border,
                    borderRadius: borderRadius,
                    image: DecorationImage(
                      image: AssetImage("$onErrorImagesAsset"),

                      fit: BoxFit.cover,

                      // colorFilter:
                      //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                    ),
                  ),
                  child: child,
                )
              : Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                )),
    );
  }

  static circulalAvtarNetwork(
      {String url = "",
      double width = 50,
      double height = 50,
      bool shimmerPlaceHolder = true,
      String? onErrorImagesAsset,
      Widget? child,
      BoxBorder? border,
      BorderRadiusGeometry? borderRadius,
      bool loaderEnable = true,
      Color loaderColor = Colors.grey}) {
    return Container(
      width: width,
      height: height,
      child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  border: border,
                  borderRadius: borderRadius,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
                child: child,
              ),
          placeholder: (context, url) => shimmerPlaceHolder
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: border,
                      borderRadius: borderRadius,
                      shape: BoxShape.circle,
                    ),
                    child: child,
                  ),
                )
              : SizedBox(),
          errorWidget: (context, url, error) => onErrorImagesAsset != null
              ? Container(
                  decoration: BoxDecoration(
                    border: border,
                    borderRadius: borderRadius,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("$onErrorImagesAsset"),

                      fit: BoxFit.contain,

                      // colorFilter:
                      //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                    ),
                  ),
                  child: child,
                )
              : Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                )),
    );
  }
}
