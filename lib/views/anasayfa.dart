import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/anasayfa_cubit.dart';
import 'package:to_do_application/entity/yapilacaklar.dart';
import 'package:to_do_application/views/yapilacak_is_detay.dart';
import 'package:to_do_application/views/yapilacak_is_kayit.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  bool aramaYapiliyorMu = false;

  void initState(){
    super.initState();
    context.read<AnaSayfaCubit>().yapilacaklariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: aramaYapiliyorMu ?
      TextField(decoration: InputDecoration(hintText: "Arama"),
        onChanged: (aramaSonucu){
        context.read<AnaSayfaCubit>().ara(aramaSonucu);
      },) :
      const Text("Yapılacaklar",style: TextStyle(fontFamily: "Indie",fontSize: 30),),
      centerTitle: true,
      actions: [
        aramaYapiliyorMu ?
        IconButton(onPressed: (){
          setState((){aramaYapiliyorMu = false;});
          context.read<AnaSayfaCubit>().yapilacaklariGetir();
        }, icon: const Icon(Icons.cancel)) :
        IconButton(onPressed: (){
          setState((){aramaYapiliyorMu = true;});
        }, icon: const Icon(Icons.search)),
      ],),
      body: BlocBuilder<AnaSayfaCubit,List<Yapilacaklar>>(
        builder: (context,yapilacaklarListesi){
          if(yapilacaklarListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yapilacaklarListesi.length, //Veri sayısı bilgisi gelecek buraya...
              itemBuilder: (context,indeks){ //0,1,2,3...

                var yapilacak = yapilacaklarListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacakIsDetay(yapilacak: yapilacak))).
                    then((_) {
                      context.read<AnaSayfaCubit>().yapilacaklariGetir();
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${yapilacak.yapilacak_is}", style: TextStyle(fontFamily: "Indie", fontSize: 20),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("${yapilacak.yapilacak_is} Silinsin Mi?"),
                                    action: SnackBarAction(label: "Evet",onPressed: (){
                                      context.read<AnaSayfaCubit>().sil(yapilacak.yapilacak_id);
                                      context.read<AnaSayfaCubit>().yapilacaklariGetir();
                                    },),
                                ));
                          }, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                );

              }



            );
          }
          else{
            return Center(); //Veri yoksa boş döndürüyoruz...
          }

        },

      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.indigo,
          onPressed: (){
            //Yapilacaklar y = Yapilacaklar(yapilacak_id: 1, yapilacak_is: "Ütüleme");
            Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacakIsKayit())).
            then((_) {
              context.read<AnaSayfaCubit>().yapilacaklariGetir();
            });

          },

        ),
      ),
    );
  }
}
