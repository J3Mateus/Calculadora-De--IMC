import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: home()));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  GlobalKey <FormState> _formkey  = GlobalKey<FormState>();

  String _infotext = 'Informe Seus Dados ' ;
  void _resteField (){
    setState(() {
      peso.text = '' ;
      altura.text = '' ;
      _infotext = 'Informe Seus Dados';
    });

  }
  
  void _calcularPeso(){
    setState(() {
      double peso_resultado = double.parse(peso.text);
      double altura_resultado = double.parse(altura.text)/100;

      double imc = peso_resultado/(altura_resultado * altura_resultado);

      if (imc < 18.5){
        _infotext = 'Abaixo do peso(${imc.toStringAsPrecision(3) })';
      }else if (imc >= 18.6 && imc <24.9){
        _infotext = 'Peso Ideal (${imc.toStringAsPrecision(3) })';
      }else if (imc>=24.9 && imc < 29.9){
        _infotext = 'Levemente acima do peso(${imc.toStringAsPrecision(3) })';
      }else if (imc >=29.9 && imc <34.9){
        _infotext = 'Obesidade Grau I (${imc.toStringAsPrecision(3) })';
      }else if (imc >=34.9 && imc <39.9){
        _infotext = 'Obesidade Grau II (${imc.toStringAsPrecision(3) })';
      }else if (imc >= 40){
        _infotext = 'Obesidade Grau III (${imc.toStringAsPrecision(3) })';
      }
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,///centrilizar o texto,
        backgroundColor: Colors.amber,///mudar a cor
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: _resteField)],///cria um botão para fazer uma ação na barra
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),/// para da um espaço dos app
        child:  Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,///centraliza icon
            children: [
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green,
              ),///adicionar o icon
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso(Kg)",
                    labelStyle: TextStyle(color: Colors.amber)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: peso,
                validator: (value){
                  if (value!.isEmpty){
                      return "Informe o peso ";
                    }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Alutra(Cm)",
                    labelStyle: TextStyle(color: Colors.amber)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: altura,
              ),

              ///deixa um insert e o keybord e o tipo de teclado,
              Padding(padding:EdgeInsets.only(top: 10.0,bottom:10.0),///espaço em especifico,
                  child: Container(
                    height: 50.0,
                    child:
                    ElevatedButton(
                      onPressed:_calcularPeso,
                      child: Text("Calcular",style: TextStyle(color: Colors.black,fontSize: 25.0),),
                      style: ElevatedButton.styleFrom(primary: Colors.green),///da outra cor para o botão
                    ),
                  )),
              Text("$_infotext",textAlign: TextAlign.center,style: TextStyle(color: Colors.green,fontSize: 25.0),)
            ],
          ),
        )
      )
    );
  }
}
