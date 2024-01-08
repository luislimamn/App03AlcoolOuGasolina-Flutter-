import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QualCombustivel extends StatefulWidget {
  const QualCombustivel({Key? key}) : super(key: key);

  @override
  State<QualCombustivel> createState() => _QualCombustivelState();
}

class _QualCombustivelState extends State<QualCombustivel> {
  var _titulo = "Álcool ou Gasolina";
  var _resultado = "";
  var _imagemLogo = "imagens/logo.png";
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  void _calcular(){
    double? precoALcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoALcool == null && precoGasolina == null){
      setState(() {
        _resultado = "Digite o Preço correto do Alcool e da Gasolina";
      });
    }else if(precoALcool == null){
      setState(() {
        _resultado = "Digite o Preço correto do Alcool";
      });
    }else if(precoGasolina == null){
      setState(() {
        _resultado = "Digite o Preço correto da Gasolina";
      });
    }else{
      if(precoALcool<(precoGasolina*0.7)){
        setState(() {
          _resultado = "Melhor Abastecer com Alcool";
        });
      }else{
        setState(() {
          _resultado = "Melhor Abastecer com Gasolina";
        });
      }
    }
    //Limpar Campos
    //_limparCampos();
  }
  void _limparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.indigo.shade900,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(_imagemLogo),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro:",
                  style: TextStyle(
                    color: Colors.indigo.shade900,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Álcool, Ex: 3.99"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, Ex: 5.99"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child:
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.indigo),
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  //color: Colors.orange,
                  //padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  onPressed: _calcular
                ),
                /*
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _calcular
                ),
                */
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
