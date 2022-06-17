import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/yapilacak_kayit_cubit.dart';

class YapilacakIsKayit extends StatefulWidget {
  const YapilacakIsKayit({Key? key}) : super(key: key);

  @override
  State<YapilacakIsKayit> createState() => _YapilacakIsKayitState();
}

class _YapilacakIsKayitState extends State<YapilacakIsKayit> {

  var tfControllerYapilacakIs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Yapılacak İş Kayıt",style: TextStyle(fontFamily: "Indie",fontSize: 30)),centerTitle: true,),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 300,child: TextField(controller: tfControllerYapilacakIs, decoration: const InputDecoration(hintText: "Yapılacak İş"),)),
              ElevatedButton(onPressed: (){
                context.read<YapilacakKayitCubit>().kayit(tfControllerYapilacakIs.text);
              }, child: Text("KAYDET")),

            ],
          ),
        )
    );
  }
}
