import 'package:find_v2/controller/filtreController.dart';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/tools/classFiltre.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/category/widgets/rangeSliderView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class FiltreSubCategory extends StatefulWidget {
  const FiltreSubCategory({super.key, required this.categoryModel});
  final SubCategoryModel categoryModel;
  @override
  @override
  State<FiltreSubCategory> createState() => _FiltreSubCategoryState();
}

class _FiltreSubCategoryState extends State<FiltreSubCategory> {
  final FilterController filterController = Get.find();

  List<String> getSelectedFilters() {
    List<String> selectedFilters = [];
    for (final filterData in filterController.popularFilterListData) {
      if (filterData.isSelected) {
        selectedFilters.add(filterData.value);
      }
    }
    return selectedFilters;
  }

  void _applyFilters() {
    filterController.levelFilter.value = getSelectedFilters();

    //filterController.updatePriceFilter(_values);
  }

  double distValue = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          getAppBarUI(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  priceBarFilter(context),
                  const Divider(
                    height: 1,
                  ),
                  popularFilter(),
                  const Divider(
                    height: 1,
                  ),

                  const Divider(
                    height: 1,
                  ),
                  timeLivraison(),
                  const Divider(
                    height: 1,
                  ),
                  onlineFreelance(),
                  // getLocalisation(),
                  const Divider(
                    height: 1,
                  ),
                  getLocalisation(),
                  const Divider(
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: skinFill,
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  highlightColor: Colors.transparent,
                  onTap: () => {_applyFilters(), Navigator.pop(context)},
                  child: const Center(
                    child: Text(
                      'Appliquer',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getAppBarUI(context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.close),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Filters',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: AppBar().preferredSize.height,
              height: AppBar().preferredSize.height,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Effacer filtre'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget priceBarFilter(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Prix du service',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        RangeSliderView(
          values: filterController.priceFilter.value,
          onChangeRangeValues: (RangeValues values) {
            filterController.updatePriceFilter(values);
          },
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget popularFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Niveau Freelance',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getPList(),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget timeLivraison() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Temps de livraison',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Wrap(
            children: getTimeDeliveryRadioList(),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget onlineFreelance() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Status du Freelance',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Wrap(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Freelance En ligne'),
                      const Spacer(),
                      CupertinoSwitch(
                        value: filterController.isOnlineFilter.value,
                        onChanged: (value) {
                          setState(() {
                            filterController.updateIsOnlineFilter(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getPList() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    const int columnCount = 2;
    for (int i = 0;
        i < filterController.popularFilterListData.length / columnCount;
        i++) {
      final List<Widget> listUI = <Widget>[];

      for (int i = 0; i < columnCount; i++) {
        try {
          final LevelFilterListData date =
              filterController.popularFilterListData[count];
          listUI.add(Expanded(
            child: Row(
              children: <Widget>[
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        date.isSelected = !date.isSelected;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: date.isSelected
                            ? skinFill
                            : Colors.grey.withOpacity(0.6),
                      ),
                    ),
                    child: Text(date.titleTxt)),
              ],
            ),
          ));
          if (count < filterController.popularFilterListData.length - 1) {
            count += 1;
          } else {
            break;
          }
        } catch (e) {
          debugPrint('filters_screen.dart: $e');
        }
      }

      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  List<Widget> getTimeDeliveryRadioList() {
    return filterController.timeDeliveyFilteListData.map((data) {
      return Row(
        children: [
          Radio(
            value: data.value,
            groupValue: filterController.deliveryTimeFilter.value,
            onChanged: (value) {
              setState(() {
                filterController.updateDeliveryTimeFilter(value!);
              });
            },
          ),
          Text(data.titleTxt),
        ],
      );
    }).toList();
  }

  Widget getLocalisation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Localisation Freelance',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getPListLocalisation(),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getPListLocalisation() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    const int columnCount = 2;
    final List<LocalisationFreelance> data =
        filterController.localisationFreelanceData.take(5).toList();

    for (int i = 0; i < (data.length / columnCount).ceil(); i++) {
      final List<Widget> listUI = <Widget>[];

      for (int j = 0; j < columnCount; j++) {
        try {
          final int index = (i * columnCount) + j;
          if (index >= data.length) break;
          final LocalisationFreelance date = data[index];
          listUI.add(Expanded(
            child: Row(
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      date.isSelected = !date.isSelected;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: date.isSelected
                          ? skinFill
                          : Colors.grey.withOpacity(0.6),
                    ),
                  ),
                  child: Text(date.ville),
                ),
              ],
            ),
          ));
        } catch (e) {
          debugPrint('filters_screen.dart: $e');
        }
      }
      // Ajouter le bouton "Voir plus" après avoir ajouté 5 éléments
      if (i == 4) {
        listUI.add(Text('all filters'));
      }

      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }
}
