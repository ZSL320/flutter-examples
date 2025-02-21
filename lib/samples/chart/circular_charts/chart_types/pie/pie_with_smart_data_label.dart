/// Package imports
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../../model/sample_view.dart';

/// Render the pie series with smart labels.
class PieSmartDataLabels extends SampleView {
  /// Creates the pie series with smart labels.
  const PieSmartDataLabels(Key key) : super(key: key);

  @override
  _PieSmartDataLabelsState createState() => _PieSmartDataLabelsState();
}

/// State class of pie series with smart labels.
class _PieSmartDataLabelsState extends SampleViewState {
  _PieSmartDataLabelsState();
  final List<String> _labelIntersectActionList =
      <String>['shift', 'hide', 'none'].toList();
  String _selectedLabelIntersectAction = 'shift';
  late TooltipBehavior _tooltipBehavior;
  late LabelIntersectAction _labelIntersectAction;

  @override
  Widget buildSettings(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Label intersect \naction',
                    style: TextStyle(
                      color: model.textColor,
                      fontSize: 16,
                    )),
                const Padding(padding: EdgeInsets.fromLTRB(55, 0, 0, 0)),
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: DropdownButton<String>(
                        underline: Container(
                            color: const Color(0xFFBDBDBD), height: 1),
                        value: _selectedLabelIntersectAction,
                        items: _labelIntersectActionList.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(color: model.textColor)));
                        }).toList(),
                        onChanged: (String? value) {
                          _onLabelIntersectActionChange(value);
                          stateSetter(() {});
                        })),
              ],
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSmartLabelPieChart();
  }

  /// Returns the circular charts with pie series.
  SfCircularChart _buildSmartLabelPieChart() {
    return SfCircularChart(
      title: ChartTitle(
          text: isCardView ? '' : 'Gold medals count in Rio Olympics'),
      series: _gettSmartLabelPieSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the pie series with smart data labels.
  List<PieSeries<ChartSampleData, String>> _gettSmartLabelPieSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'USA', y: 46),
      ChartSampleData(x: 'Great Britain', y: 27),
      ChartSampleData(x: 'China', y: 26),
      ChartSampleData(x: 'Russia', y: 19),
      ChartSampleData(x: 'Germany', y: 17),
      ChartSampleData(x: 'Japan', y: 12),
      ChartSampleData(x: 'France', y: 10),
      ChartSampleData(x: 'Korea', y: 9),
      ChartSampleData(x: 'Italy', y: 8),
      ChartSampleData(x: 'Australia', y: 8),
      ChartSampleData(x: 'Netherlands', y: 8),
      ChartSampleData(x: 'Hungary', y: 8),
      ChartSampleData(x: 'Brazil', y: 7),
      ChartSampleData(x: 'Spain', y: 7),
      ChartSampleData(x: 'Kenya', y: 6),
      ChartSampleData(x: 'Jamaica', y: 6),
      ChartSampleData(x: 'Croatia', y: 5),
      ChartSampleData(x: 'Cuba', y: 5),
      ChartSampleData(x: 'New Zealand', y: 4)
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          name: 'RIO',
          dataSource: chartData,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) =>
              data.x + ': ' + (data.y).toString() as String,
          radius: '60%',
          dataLabelSettings: DataLabelSettings(
              margin: const EdgeInsets.all(0),
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: const ConnectorLineSettings(
                  type: ConnectorType.curve, length: '20%'),
              labelIntersectAction: _labelIntersectAction))
    ];
  }

  @override
  void initState() {
    _labelIntersectAction = LabelIntersectAction.shift;
    _tooltipBehavior = TooltipBehavior(enable: true, header: '');
    super.initState();
  }

  /// Method for changing the data label intersect action.
  void _onLabelIntersectActionChange(String? item) {
    setState(() {
      if (item != null) {
        _selectedLabelIntersectAction = item;
        if (_selectedLabelIntersectAction == 'shift') {
          _labelIntersectAction = LabelIntersectAction.shift;
        }
        if (_selectedLabelIntersectAction == 'none') {
          _labelIntersectAction = LabelIntersectAction.none;
        }
        if (_selectedLabelIntersectAction == 'hide') {
          _labelIntersectAction = LabelIntersectAction.hide;
        }
      }
    });
  }
}
