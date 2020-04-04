import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmi_result.dart';
import 'about_me.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  TextEditingController nama = TextEditingController();
  int tahun = 0;
  String _jk="";
  int tinggi = 0;
  int berat = 0;

  void _pilihJk(String value){
    setState(() { _jk = value; });
  }

  @override
  void dispose() {
    nama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.home,
          color: Colors.green,
        ),
        title: Text('MENGHITUNG BMI'),
        actions: <Widget>[ 
          IconButton(
            icon: Icon(Icons.person_outline),
            color: Colors.red, 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfil()),
              );
            },
          ) 
        ],
        bottom: PreferredSize(
          child: Container(
            color:Colors.purple[500],
            height: 4.0,
          ),
          preferredSize: null
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child:
              Image.asset('images/bmi2.png', width: 150, 
                fit: BoxFit.fitWidth,
              ),
            ),

            Container(
              padding: EdgeInsets.all(4),
              color: Colors.blue[500],
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(5),
              child: Column(
                  children: <Widget>[
                    TextField( 
                      controller: nama, 
                      decoration: InputDecoration( 
                        hintText: "Masukkan Nama Lengkap", 
                        labelText: "Nama Lengkap", 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), 
                        ), 
                      ), 
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    TextField( 
                      onChanged: (txt) {
                        setState(() { tahun = int.parse(txt); });
                      }, 
                      keyboardType: TextInputType.number, 
                      maxLength: 4, 
                      decoration: InputDecoration( 
                        hintText: "Masukkan Tahun Lahir", 
                        labelText: "Tahun Lahir", 
                        border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0)) 
                      ), 
                    ),
                    Text('Jenis Kelamin:', style: TextStyle(color: Colors.black87, fontSize: 18.0),),
                  ],
                ),
            ),

            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:RadioListTile( 
                      value: "Laki-laki", groupValue: _jk, title: Text("Laki-laki", style: TextStyle(color: Colors.black87, fontSize: 14.0),), 
                      onChanged: (String value){ _pilihJk(value); }, 
                    ),
                  ),
                  Expanded(
                    child:RadioListTile( 
                      value: "Perempuan", groupValue: _jk, title: Text("Perempuan", style: TextStyle(color: Colors.black87, fontSize: 14.0),), 
                      onChanged: (String value){ _pilihJk(value); },  
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          tinggi = int.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        suffix: Text('cm'),
                        filled: true,
                        hintText: 'Tinggi'
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          berat = int.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        suffix: Text('kg'),
                        filled: true,
                        hintText: 'Berat'),
                    ),
                  ),
                ],
              )
            ),

            Container(
              //height: double.infinity,
                margin: EdgeInsets.only(left: 50,right: 50,bottom: 20),
                child: RaisedButton(
                  onPressed: () {
                    _sendDataTobmiResult(context);
                  },
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  color: Colors.green,
                  // textColor: Colors.white,
                  child: Text(
                    'HITUNG BMI',
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: Colors.blue[500],
          alignment: Alignment.center,
          child: Text(
            'Developed by Arya Widiarta',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
          ),
        ),
        //elevation: 0,
      ),
    );
  }
  
  void _sendDataTobmiResult(BuildContext context) {
    String textToSend = nama.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BMIResult(namaLengkap: textToSend, tahunLahir: tahun, jenisKelamin: _jk, tinggiBadan: tinggi, beratBadan: berat)),
    );
  }
  
}