import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vega }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<StatefulWidget> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactosoFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _vegaFilterSet = false;

//giúp lưu lại trạng thái của toggle khi ấn là true thì ko bị reset thành false chuẩn bị cho màn hình trở về trạng thái ban đầu
  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactosoFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _vegaFilterSet = widget.currentFilters[Filter.vega]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      //drawer 3 gạch
      // drawer: MainDrawer(onSelectedScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          //tạo bộ lộc theo list được chọn ở đây
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactosoFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vega: _vegaFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            //gluten-free
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text('Only include gluten-free meals.'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            //lactozo-free
            SwitchListTile(
              value: _lactosoFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactosoFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text('Only include lactose-free meals.'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            //vegetarian
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text('Only include vegetarian meals.'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            //vega
            SwitchListTile(
              value: _vegaFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegaFilterSet = isChecked;
                });
              },
              title: Text(
                'Vega',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text('Only include vega meals.'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
