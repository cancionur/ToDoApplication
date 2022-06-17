import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/entity/yapilacaklar.dart';
import 'package:to_do_application/repo/yapilacaklardao_repository.dart';
import 'package:to_do_application/views/anasayfa.dart';

class AnaSayfaCubit extends Cubit<List<Yapilacaklar>>{

  AnaSayfaCubit():super(<Yapilacaklar>[]);

  var yRepo = YapilacaklarDaoRepository();

  Future<void> yapilacaklariGetir() async{
    var liste = await yRepo.tumYapilacaklariGetir();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async{
    var liste = await yRepo.aramaYap(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async{
    await yRepo.yapilacakSil(yapilacak_id);
  }


}