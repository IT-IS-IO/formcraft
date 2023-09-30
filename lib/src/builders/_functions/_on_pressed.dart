






abstract class FunctionAbstractBuilder {

  Future<Object> build({ required Map<String, dynamic> data });

}


class FunctionBuilder extends FunctionAbstractBuilder {

  @override
  Future<Object> build({ required Map<String, dynamic> data }) async {
    throw UnimplementedError();
  }





}