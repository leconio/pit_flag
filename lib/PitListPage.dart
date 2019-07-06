import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pit_flag/pit_bean.dart';

class PitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About 100 Different Pits"),
      ),
      body: PitListView(),
    );
  }
}

class PitListView extends StatefulWidget {
  @override
  _PitListViewState createState() => _PitListViewState();
}

class _PitListViewState extends State<PitListView> {
  List<PitBean> pits = List();
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() {
    getPitBeans().then((newPits) {
      setState(() {
        pits = newPits;
      });
    });
  }

  List<PitBean> _getDataByCondition(String local) {
    return pits.where((bean) => _filterByCondition(bean, local)).toList();
  }

  bool _filterByCondition(PitBean bean, String local) {
    return bean.locale.contains(local);
  }

  _onSearchTextChanged(String text) async {
    if (text == "" || text == null) {
      _getData();
    } else {
      pits = _getDataByCondition(text);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: TextField(
            onChanged: _onSearchTextChanged,
            controller: editingController,
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Please inpit country code",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          alignment: Alignment.centerLeft,
          child: Text("Total: ${pits.length}"),
        ),
        ...ListTile.divideTiles(context: context, tiles: [
          for (var pit in pits) _buildPitView(pit),
        ]).toList()
      ],
    );
  }

  Widget _buildPitView(PitBean bean) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          _buildCountryCode(bean.locale),
        ),
      ),
      title: Text("Value: ${bean.string}"),
      subtitle: Text("Country: ${bean.country}"),
    );
  }

  Future<List<PitBean>> getPitBeans() async {
    final jsonStr = await _loadAStudentAsset();
    return getPitBeanList(json.decode(jsonStr));
  }

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/pit_bean.json');
  }

  String _buildCountryCode(String countryCode) {
    if (countryCode.contains("-")) {
      return countryCode.split("-")[1];
    }
    return countryCode;
  }
}
