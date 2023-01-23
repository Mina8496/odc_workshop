import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:odc_workshop/data/Models/lectures_model.dart';
import 'package:odc_workshop/presentation/views/lectures_card_item.dart';
import 'package:odc_workshop/presentation/widgets/default_appbar.dart';

class LecturesScreen extends StatelessWidget {
  LecturesScreen({Key? key}) : super(key: key);

  List lecturesModelDummyData = <LecturesModel>[
    LecturesModel(
        lectureTitle: 'Flutter',
        lectureTime: '3HRs',
        examDate: '19-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'React',
        lectureTime: '3HRs',
        examDate: '8-08-2022',
        startTime: '1:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Ionic',
        lectureTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Xamarin',
        lectureTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Android',
        lectureTime: '4HRs',
        examDate: '18-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
  ];

  /// TODO: Get data form API.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const DefaultAppbar(
            automaticallyImplyLeading: true,
            title: 'Lectures',
          )),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          elevation: 5,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.sp),
              borderSide: const BorderSide(
                color: Colors.teal,
              )),
          margin: EdgeInsets.symmetric(
            vertical: 1.h,
          ),
          child: LecturesCardItem(
            lecturesModel: lecturesModelDummyData[index],
          ),
        ),
        itemCount: lecturesModelDummyData.length,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
      ),
    );
  }
}
