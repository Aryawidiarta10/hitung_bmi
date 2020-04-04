import 'package:flutter/material.dart';
import 'dart:math';


class BMIResult extends StatelessWidget {

  BMIResult({@required this.namaLengkap, @required this.tahunLahir, @required this.jenisKelamin, @required this.tinggiBadan, @required this.beratBadan});
  final String namaLengkap;
  final int tahunLahir;
  final String jenisKelamin;
  final int tinggiBadan;
  final int beratBadan;

  @override
  Widget build(BuildContext context) {
    int umur = 2020-tahunLahir;
    double bmi = beratBadan/pow(tinggiBadan/100,2);
    String cBMI;
    if (bmi>=28) cBMI="Obese";
    else if (bmi>=23) cBMI="Overweight";
    else if (bmi>=17.5) cBMI="Normal";
    else cBMI="Underweight";
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULT'),
        bottom: PreferredSize(
          child: Container(
            color:Colors.purple[500],
            height: 4.0,
          ),
          preferredSize: null
        ),
      ),
      body: Center(
        child:Column(
          children: <Widget>[ 
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left:20, right: 15, top: 15, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.cyan[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                )
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text('Biodata Diri', style: TextStyle(color: Colors.black, fontSize: 24.0,fontWeight: FontWeight.w500,),),
                    padding: EdgeInsets.only(left:70, right: 70),
                    decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    )
                  ),
                  ),
                  Text(
                    "Nama : $namaLengkap",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,),
                  ),
                  Text(
                  "Umur : $umur Tahun",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,),
                  ),
                  Text(
                    "Jenis Kelamin : $jenisKelamin", 
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,),
                    textAlign: TextAlign.left,
                  ),
                ],
              ) 
            ),

           Container(
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.only(left:25, right: 25, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.cyan[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                )
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text('Hasil BMI', style: TextStyle(color: Colors.black, fontSize: 24.0,fontWeight: FontWeight.w500,),),
                    padding: EdgeInsets.only(left:40, right: 40),
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      )
                    ),
                  ),
                  Text(
                    cBMI,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Normal BMI Range',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '17,5 -  22.9 ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            )  
          ],
        ),
      ),

      bottomSheet: Container(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          color: Colors.blue[500],
          child: Text('BACK',
            style: TextStyle(
              fontSize: 30
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

}