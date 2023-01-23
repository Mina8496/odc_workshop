import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:odc_workshop/presentation/widgets/default_text.dart';

class NewsCardItem extends StatelessWidget {
  const NewsCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(3.sp),
            child: CircleAvatar(
              radius: 30.sp,
              backgroundImage: const NetworkImage(
                'http://www.clker.com/cliparts/6/k/l/B/v/3/book-with-title-md.png',
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const DefaultText(text: 'title'),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 1.5.h),
                  child: DefaultText(
                    maxLines: 2,
                    fontSize: 8.sp,
                    text:
                        'title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title itle title title title title title title title ',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
