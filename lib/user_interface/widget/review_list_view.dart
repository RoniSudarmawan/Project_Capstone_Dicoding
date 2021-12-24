import 'package:capstone_project/model/data_clothes_model.dart';
import 'package:flutter/material.dart';

class ReviewListView extends StatelessWidget {
  final List<DataReview> reviewData;
  final BuildContext context;
  const ReviewListView(
      {Key? key, required this.reviewData, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewData[index].reviewName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  reviewData[index].reviewContent,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  reviewData[index].reviewDate.toString(),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: reviewData.length,
    );
  }
}
