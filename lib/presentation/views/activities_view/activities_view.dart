import 'package:flutter/material.dart';
import 'package:multi_bank/models/activities_model.dart';

class ActivitiesView extends StatelessWidget {
  ActivitiesView(this.activities, this.cardData, {super.key});

  final List? activities;
  dynamic cardData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: const Text("Actividades"),
          ),
          body: NewActivities(cardData: cardData, activities: activities)),
    );
  }
}

class NewActivities extends StatelessWidget {
  const NewActivities({
    super.key,
    required this.cardData,
    required this.activities,
  });

  final dynamic cardData;
  final List? activities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Numero de producto: ${cardData?.productNumber}"),
              Text("Balance actual: \$${cardData?.balance}"),
              const Text("Actividades"),
              const SizedBox(height: 20),
              Container(
                height: 700,
                width: 400,
                decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: activities?.length,
                    itemBuilder: (context, index) {
                      var singleActivity = activities?[index];
                      ActivitiesModel activity = ActivitiesModel(
                        singleActivity["payment_name"],
                        singleActivity["amount"],
                        singleActivity["transaction_type"],
                        singleActivity["product_numer"],
                        singleActivity["payment_date"],
                      );
                      return SizedBox(
                        width: 286,
                        height: 50,
                        child: Card(
                          surfaceTintColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.shopping_bag_rounded,
                                      color: Colors.black45,
                                      size: 26,
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(activity.transactionType),
                                        Text(activity.paymentName),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 50),
                                Column(
                                  children: [
                                    Text(activity.amount),
                                    Text(activity.paymentDate),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
