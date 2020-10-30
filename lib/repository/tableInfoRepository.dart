import 'package:retaurant_app/model/tableInfoModel.dart';
import 'package:retaurant_app/service/tableInfoService.dart';

class TableInfoRepository {
  TableInfoService tableInfoService = TableInfoService();
  Future<TableInfoModel> getTableInfo(

    String person,
    String reserveDate,
    String reserveTime,
  ) async {
    TableInfoModel tableInfoModel = await tableInfoService.getTableInfo(
      person,
      reserveDate,
      reserveTime,
    );

    return tableInfoModel;
  }
}
