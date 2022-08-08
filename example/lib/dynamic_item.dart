import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DynamicItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int viewCount;
  static const double ITEM_HEIGHT = 100;
  static const double TITLE_HEIGHT = 80;
  static const double MARGIN_SIZE = 10;

  const DynamicItem(this.title, this.imageUrl, this.viewCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_SIZE),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageWrapper(imageUrl),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleWrapper(context, title),
                _viewCountWrapper(viewCount.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _titleWrapper(BuildContext context, String text) {
    return Container(
        height: TITLE_HEIGHT,
        margin: EdgeInsets.only(left: MARGIN_SIZE),
        child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6,
        ));
  }

  Widget _viewCountWrapper(String text) {
    return Container(
        margin: EdgeInsets.only(left: MARGIN_SIZE),
        height: ITEM_HEIGHT - TITLE_HEIGHT,
        child: Row(
          children: [
            Icon(Icons.remove_red_eye_outlined, size: 14, color: Colors.grey),
            SizedBox(
              height: 5,
            ),
            Text(viewCount.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 14))
          ],
        ));
  }

  Widget _imageWrapper(String imageUrl) {
    return SizedBox(
      width: 150,
      height: ITEM_HEIGHT,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        // placeholder: (context, url) => Image.asset("assets/images/image-default.png"),
        progressIndicatorBuilder: (_, url, downloadProgress) => LinearProgressIndicator(value: downloadProgress.progress),
        errorWidget: (_, url, error) => Image.asset('assets/images/image-failed.png'),
      )
    );
  }
}
