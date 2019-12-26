import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    title: ("IMC"),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _imagemApp = AssetImage("images/gato_stock.png");


  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "";
      _formKey = GlobalKey<FormState>();

      if(_imagemApp == _imagemApp) {
        return _imagemApp = AssetImage("images/gato_stock.png");
      }
    });

  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight/ (height*height);

      if (imc< 18.6) {
        _infoText = "Você está um pouco abaixo do peso ideal, (${imc.toStringAsPrecision(4)}), fique forte, se alimente bem!!       " + "       且_(・_・ ) ";
        _imagemApp = AssetImage("images/gato_magro.png");
      } else if (imc>=18.6 && imc <24.9) {
        _infoText = "Você está no peso ideal, (${imc.toStringAsPrecision(4)}), parabéns por conseguir ＼(★^∀^★)／ ";
        _imagemApp = AssetImage("images/gato_saudavel.png");
      }else if (imc>=24.9 && imc <29.9) {
        _infoText = "Você está levemente acima do Peso,(${imc.toStringAsPrecision(4)}), com um pouco de esforço e dedicação, você consiguirá chegar ao seu peso ideal, força e não desista!☆*。★ﾟ*♪ヾ(☆ゝз・)ノ";
        _imagemApp = AssetImage("images/gato_acima_peso.png",);
      }else if (imc>=29.9 && imc <34.9) {
        _infoText = "Você está virando uma bolinha de pelos, (${imc.toStringAsPrecision(4)}), você deve fazer mais exercícios e se alimentar melhor, não desista, pois você consegue! Caso precise, procure um profissional para ajuda-lo ( • ̀ω•́  )✧";
        _imagemApp = AssetImage("images/gato_obeso1.png");
      }else if (imc>=34.9 && imc <39.9) {
        _infoText = "Sua bolinha de pelos ficou um pouco maior,(${imc.toStringAsPrecision(4)}), procure um profissional da área da saúde para cuidar de você, é uma média perigosa e pode causar muitos prejúizos a sua saúde! (ಥ﹏ಥ)";
        _imagemApp = AssetImage("images/gato_obeso2.png");
      }else if (imc>=40) {
        _infoText = "PERIGO, VOCÊ AGORA É UMA BOLINHA DE PELOS MUITO GRANDE, (${imc.toStringAsPrecision(4)}), POR FAVOR, PROCURE UM PROFISSIONAL PARA AJUDA-LO, ESTAMOS TORCENDO MUITO POR VOCÊ!! ⊃゜Д゜）⊃";
        _imagemApp = AssetImage("images/gato_obeso3.png");
      }
    });

  }



  String _infoText = "Informe seus dados acima!";

  final Color _green = Color(0xFF1E8161);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: _green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetField),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.8,
              decoration: BoxDecoration(
                color: _green,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Image(image:_imagemApp, width: 98, height: 98,),
                          Column(
                            children: <Widget>[
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Peso(kg)",
                                    labelStyle: TextStyle(color: Colors.white)),
                                controller: weightController,
                                validator: (value){
                                  if(value.isEmpty) {
                                    return "Insira seu Peso";
                                  }
                                },
                              ),
                            ],
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Altura(cm)",
                                labelStyle: TextStyle(color: Colors.white)),
                            controller: heightController,
                            validator: (value){
                              if(value.isEmpty) {
                                return "Insira sua altura!";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: (){
                            if(_formKey.currentState.validate()){
                              _calculate();
                            }
                          },
                          child: Text(
                            "Calcular",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 280,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  Text(_infoText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
