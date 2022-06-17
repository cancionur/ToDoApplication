import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/yapilacak_detay_cubit.dart';
import 'package:to_do_application/entity/yapilacaklar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YapilacakIsDetay extends StatefulWidget {
  
  Yapilacaklar yapilacak;

  YapilacakIsDetay({required this.yapilacak });

  @override
  State<YapilacakIsDetay> createState() => _YapilacakIsDetayState();
}

class _YapilacakIsDetayState extends State<YapilacakIsDetay> {

  var tfControllerYapilacakIs = TextEditingController();

  void initState(){
    super.initState();
    tfControllerYapilacakIs.text = widget.yapilacak.yapilacak_is;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Yapılacak İş Detay",style: TextStyle(fontFamily: "Indie",fontSize: 30)),centerTitle: true,),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 300,child: TextField(controller: tfControllerYapilacakIs, )),
              ElevatedButton(onPressed: (){
                context.read<YapilacakDetayCubit>().guncelle(widget.yapilacak.yapilacak_id,tfControllerYapilacakIs.text);
              }, child: Text("GÜNCELLE")),

            ],
          ),
        )
    );
  }
}
