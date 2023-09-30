



class FcContextManager extends Object {


  final Map<String, dynamic> _originalData;

  final Map<String, dynamic> _data;

  final Map<String, dynamic> _context = { };


  FcContextManager({ required Map<String, dynamic> data }) : _originalData = data, _data = data;

  Map<String, dynamic> get data => _data;

  Map<String, dynamic> get context => _context;

  void setContext(String key, dynamic value) {
    _context[key] = value;
  }


}