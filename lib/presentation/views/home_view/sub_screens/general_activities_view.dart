import 'package:flutter/material.dart';

import '../../../../models/activities_model.dart';
import '../../../widgets/modals/payment_bill.dart';

enum PaymentFilter { QR, MasterCard, visaCard }

class GeneralActivitiesView extends StatefulWidget {
  GeneralActivitiesView({super.key, this.allActivities});
  List<ActivitiesModel>? allActivities;

  @override
  State<GeneralActivitiesView> createState() => _GeneralActivitiesViewState();
}

class _GeneralActivitiesViewState extends State<GeneralActivitiesView> {
  Set<String> filters = <String>{};
  bool isFiltered = false;

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = [];
    int filteredAmount = 0;
    List<String> filteredPaymentMethods = [];

    for (var paymentMethod in widget.allActivities!) {
      setState(() {
        paymentMethods.add(paymentMethod.transactionType);
      });
    }

    var filteredItems = filters
        .map((String e) => paymentMethods.where((element) => element == e))
        .toList();

    for (var item in filteredItems) {
      for (var i in item) {
        filteredPaymentMethods.add(i);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text("Todas las actividades"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                Tooltip(
                  message: 'Change brightness mode',
                  child: IconButton(
                    isSelected: null,
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.wb_sunny_outlined),
                    selectedIcon: const Icon(Icons.brightness_2_outlined),
                  ),
                )
              ],
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
          const SizedBox(height: 20),
          const Text(
            "Filtrar pago por: ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 5.0,
            children: ["QR", "MasterCard", "visaCard"].map((activity) {
              return FilterChip(
                label: Text(activity),
                selected: filters.contains(activity),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      isFiltered = true;
                      filters.add(activity);
                    } else {
                      filters.remove(activity);
                      if (filters.isEmpty) {
                        isFiltered = false;
                      }
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10.0),
          // Text(
          //   'Looking for: ${filters.map((String e) => paymentMethods.where((element) => element == e)).join(', ')}',
          // ),
          const SizedBox(height: 20),
          if (!isFiltered)
            Center(
              child: Container(
                height: 500,
                width: 400,
                decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: widget.allActivities?.length,
                    itemBuilder: (context, index) {
                      ActivitiesModel? singleActivity =
                          widget.allActivities?[index];

                      return SizedBox(
                        width: 286,
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            PaymentBill.showBill(
                                context, widget.allActivities![index]);
                          },
                          child: Card(
                            surfaceTintColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.shopping_bag_rounded,
                                        color: Color(0xff323232),
                                        size: 26,
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(singleActivity!.transactionType),
                                          Text(singleActivity.paymentName),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Column(
                                    children: [
                                      Text(singleActivity.amount),
                                      Text(singleActivity.paymentDate),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          else
            Container(
              height: 500,
              width: 400,
              decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: filteredPaymentMethods.length,
                  itemBuilder: (context, index) {
                    List singleAct = [];

                    for (var activity in widget.allActivities!) {
                      activity.transactionType == filteredPaymentMethods[index]
                          ? singleAct.add(widget.allActivities![index])
                          : null;
                    }
                    var singleActivity =
                        widget.allActivities?[index].transactionType ==
                                filteredPaymentMethods[index]
                            ? widget.allActivities![index]
                            : null;

                    return singleActivity?.transactionType != null
                        ? Column(children: [
                            SizedBox(
                              width: 400,
                              height: 50,
                              child: InkWell(
                                onTap: () {
                                  PaymentBill.showBill(
                                      context, widget.allActivities![index]);
                                },
                                child: Card(
                                  surfaceTintColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.shopping_bag_rounded,
                                              color: Color(0xff323232),
                                              size: 26,
                                            ),
                                            const SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(singleActivity
                                                        ?.transactionType ??
                                                    ""),
                                                Text(singleActivity
                                                        ?.paymentName ??
                                                    ""),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 50),
                                        Column(
                                          children: [
                                            Text(singleActivity?.amount ?? ""),
                                            Text(singleActivity?.paymentDate ??
                                                ""),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              height: 50,
                              child: InkWell(
                                onTap: () {
                                  PaymentBill.showBill(
                                      context, widget.allActivities![index]);
                                },
                                child: Card(
                                  surfaceTintColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.shopping_bag_rounded,
                                              color: Color(0xff323232),
                                              size: 26,
                                            ),
                                            const SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(singleActivity
                                                        ?.transactionType ??
                                                    ""),
                                                Text(singleActivity
                                                        ?.paymentName ??
                                                    ""),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 50),
                                        Column(
                                          children: [
                                            Text(singleActivity?.amount ?? ""),
                                            Text(singleActivity?.paymentDate ??
                                                ""),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              height: 50,
                              child: InkWell(
                                onTap: () {
                                  PaymentBill.showBill(
                                      context, widget.allActivities![index]);
                                },
                                child: Card(
                                  surfaceTintColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.shopping_bag_rounded,
                                              color: Color(0xff323232),
                                              size: 26,
                                            ),
                                            const SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(singleActivity
                                                        ?.transactionType ??
                                                    ""),
                                                Text(singleActivity
                                                        ?.paymentName ??
                                                    ""),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 50),
                                        Column(
                                          children: [
                                            Text(singleActivity?.amount ?? ""),
                                            Text(singleActivity?.paymentDate ??
                                                ""),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])
                        : Container();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
