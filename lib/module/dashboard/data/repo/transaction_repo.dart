import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../commons/ui_states.dart';
import '../model/transaction_model.dart';

class DashboardRepo {
  final supabase = Supabase.instance.client;

  Future<void> getTransactions(
    void Function(UiState<List<TransactionModel>>) callback,
  ) async {
    callback(UiState.loading());

    try {
      final res = await supabase.from('transactions').select();

      final data = (res as List)
          .map((e) => TransactionModel.fromJson(e))
          .toList();

      callback(UiState.success(data));
    } catch (e) {
      callback(UiState.error(e.toString()));
    }
  }
}
