// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//CREAACION DE IMPUTS MAS SUS ESTILOS
class InputDecorations {
  static InputDecoration authInputDecoration({
   
    //PARAMETROS DE ENTRADA
    required String hintText,
    required String labelText,
    IconData? prefixIcon,

  }){
    return  InputDecoration(//DECORACIONES ESPECIFICAS DE INPUT

      enabledBorder:  UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple
        ),
      ),

      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2,
        )
      ),

      hintText: hintText,//-EL PLACEHOLDERS
      labelText: labelText,//LABEL DEL INPUT
      labelStyle: TextStyle(      //COLOR DE LABEL
        color: Colors.grey
      ),

      prefixIcon: prefixIcon != null //prefixIcon es diferente de null
       ? Icon(prefixIcon, color: Colors.deepPurple)//RECIBE EL ICONO //IF IS TRUE
       : null,//IF IS FALSE THEN NULL
    );
  }
}

// 