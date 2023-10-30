// import 'package:uved/core/utils/typedefs.dart';

class PanelController {

  // ChangedEvent? onChanged;
  List<double> _percentages = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];


  void onChangedPager(int index, int childrenCount, int currentChildPage) {
    updatePercent(index, childrenCount, currentChildPage);
    // onChanged?.call(index);
  }


  void updatePercent(int page, int childrenCount, int currentChildPage) {

    final newPercent = (((100 / childrenCount) * currentChildPage) / 100).clamp(0, 1);
    final currentPercent = _percentages[page];

    if (newPercent > currentPercent) {
      _percentages[page] = newPercent.toDouble();
    }

  }


  double getPercentage(int index) => _percentages[index];

}