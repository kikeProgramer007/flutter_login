import 'package:flutter/material.dart';
// ignore: use_key_in_widget_constructors
class CardContainer extends StatelessWidget {
  // const CardContainer({Key? key}) : super(key: key);

final Widget child;

  const CardContainer({
    Key? key,
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(//PARA USAR EL PADDING
      padding: const EdgeInsets.symmetric(horizontal:30),//CREAR SEPARACION
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: _createCardShape(),
        child: child,
      ),
    );
  }

//ESTILO DEL CARD DE FORMULARIO
  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12, //COLOR DE LA SOBRA
        blurRadius: 15,       //RADIUS DEL CARD
        offset:  Offset(0,5),//SOMBRA DEL CARD
      )
    ],
  );

}