import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/yapilacak_kayit_cubit.dart';
import 'package:to_do_application/repo/yapilacaklardao_repository.dart';

class YapilacakDetayCubit extends Cubit<void>{

  YapilacakDetayCubit():super(0);

  var yRepo = YapilacaklarDaoRepository();

  Future<void> guncelle(int yapilacak_id, String yapilacak_is) async{
    await yRepo.yapilacakGuncelle(yapilacak_id, yapilacak_is);
  }


}