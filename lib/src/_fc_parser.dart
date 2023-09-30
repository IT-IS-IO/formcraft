
library _fc_parser;



abstract class ParserAbstract {

  Future<Object> init({ required Map<String, dynamic> data });

}


class Parser extends ParserAbstract {

  @override
  Future<Object> init({ required Map<String, dynamic> data }) async {
    throw UnimplementedError();
  }

}
