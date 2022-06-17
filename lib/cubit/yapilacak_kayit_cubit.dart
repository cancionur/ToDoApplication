import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/repo/yapilacaklardao_repository.dart';

class YapilacakKayitCubit extends Cubit<void>{

  YapilacakKayitCubit():super(0);

  var yRepo = YapilacaklarDaoRepository();

  Future<void> kayit(String yapilacak_is) async{
    await yRepo.yapilacakKayit(yapilacak_is);
  }

}