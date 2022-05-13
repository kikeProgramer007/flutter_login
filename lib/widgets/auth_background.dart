
import 'package:flutter/material.dart';
//stless para generar codigo
// ignore: use_key_in_widget_constructors
class AuthBackground extends StatelessWidget {

  final Widget child;

//CONTRUCTOR PARA EL CHILD DE ARRIBA
  const AuthBackground({
    Key? key,
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    return SizedBox(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(//TIPO COLUMNA COLOCA LOS WISGETS UNO ENCIMA DE OTRO
        children: [
          _PurpleBox(),//FUNCION PARA CREAR LAS BURBUJAS

          _HeaderIcon(),//FUNCION PARA CREAR ICONO

          child,//Thi.child
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),//BAJA EL TOP DEL ICONO
        child:  const Icon(Icons.person_pin, color: Colors.white, size: 100),//DAR ICONO, COLOR Y TAMAÑO
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      // ignore: todo
      width: double.infinity, //TODO EL ANCHO
      height: size.height * 0.4,//EL40% DE ALTURA
      decoration: _purpleBackground(), //LLAMANDO A CLASS PURPLEBACK...
      child: Stack(//PARA COLOCAR WIDGETS UNO ENCIMA DE OTRO
        children: [
         Positioned(child: _Bubble(), top: 90, left: 30),//CREAR BURBUJA LLAMANDO A ESTE METODO  Y MOVERLA
         Positioned(child: _Bubble(), top: -40, left: -30),//CREAR BURBUJA LLAMANDO A ESTE METODO  Y MOVERLA
         Positioned(child: _Bubble(), top: -50, right: -20),//CREAR BURBUJA LLAMANDO A ESTE METODO  Y MOVERLA
         Positioned(child: _Bubble(), bottom: -50, left: 10),//CREAR BURBUJA LLAMANDO A ESTE METODO  Y MOVERLA
         Positioned(child: _Bubble(), bottom: 120, right: 20),//CREAR BURBUJA LLAMANDO A ESTE METODO  Y MOVERLA
        
        ], 
      ),
    );
  }


  //WIDGETS COLOR DE FONDO
  BoxDecoration _purpleBackground() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(80, 70, 178, 1)
      ]
      )
  );


}

//WIDGETS PARA CREAR BURBUJAS
class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}