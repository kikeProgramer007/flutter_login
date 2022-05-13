
import 'package:app_consultas/providers/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:app_consultas/ui/input_decorations.dart';
import 'package:app_consultas/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthBackground(
       child: SingleChildScrollView(
         child:Column(//ORDENAR EN COLUMNAS
          children: [

            const SizedBox(height: 250),//BAJAR EL CARD AL CENTRO

            CardContainer(//EL CARD DEL FORMULARIO
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('Login',style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height:30),
                  
                  ChangeNotifierProvider(//SOLO EL PROVIDER
                    create: ( _ ) => LoginFormProvider(),
                    child:_LoginForm(),//CREAR FORMULARIO
                  ),
                  

                ],
              ),
            ),

            const SizedBox(height: 50),
            const Text('Crear una nueva cuenta',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),
            const SizedBox(height: 50),//SALDO DE LINEA O SEPARACION
          ],
         ),
       ),
      )
    );
  }
}

//FORMULARIO DE CAJA DE TEXTO
class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//TENEMOS ACESSO AL loginForm
  final loginForm = Provider.of<LoginFormProvider>(context);//AHORA SE PUEDE OBTENER ACCESO A LA CLASE "LoginFormProvider"

    return Form(

      key: loginForm.formKey,//ASOCIAL EL KEY DE "login_form_provider"

      autovalidateMode: AutovalidateMode.onUserInteraction,//COMPONENTE PARA MOSTRAR ERROR DE VALIDACION
      child: Column(
        children:  [
          
          //CAJA DE TEXTO 1 MAS STILOS
          TextFormField(//CAJA DE TEXTO
            autocorrect: false,//NO AUTOCORREGIR
            keyboardType: TextInputType.emailAddress,//TIPO DE ENTRADA EMAIL
            decoration: InputDecorations.authInputDecoration(//USAR ESE METODO DE LA CLASE InputDecorations
              hintText: 'jont.doe@gmail.com',
              labelText: 'Correo Electrónico',
              prefixIcon: Icons.alternate_email_sharp
            ),
            
            onChanged: ( value ) => loginForm.email = value,//RESTABLECER

            //RECIBE EL VALOR DEL INPUNT PARA VALIDARLO CUANDO ESTA SCRIBIENDO
            validator: ( value ) {
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp  = RegExp(pattern);

              return regExp.hasMatch(value ?? '') //VERIFICAR O VALIDAR LA EXPRESION VALUE:PUEDE Q RECIBA O NO RECIBA PARAMETRO
              ? null                          //SI ES VALIDO
              : 'El dato no luce como un correo';   //NO ES VALIDO
            },
          ),

          const SizedBox(height: 30),//SALDO DE LINEA O SEPARACION

          //CAJA DE TEXTO 2 MAS STILOS
          TextFormField(//CAJA DE TEXTO
            autocorrect: false,//NO AUTOCORREGIR
            obscureText: true,//OCULTAR LO QUE SE ESCRIBE
            keyboardType: TextInputType.emailAddress,//TIPO DE ENTRADA EMAIL
            decoration: InputDecorations.authInputDecoration(//ENVIANDO PARAMETROS METODO
              hintText: '********',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline
            ),//USAR ESE METODO DE LA CLASE InputDecorations
            
            onChanged: ( value ) => loginForm.password = value,//RESTABLECER

            //RECIBE EL VALOR DEL INPUNT DE CONTRASEÑA PARA VALIDARLO CUANDO ESTA SCRIBIENDO
            validator: ( value ) {
              if(value != null && value.length >= 6){//EL DATO NO ESTA VACIO Y CUMPLE CON MAS 6 CARACTERES
                return null;
              }else{
                return 'La contraseña tener más de 6 caracteres';
              }
            },


          ),

          const SizedBox(height: 30),//SALDO DE LINEA O SEPARACION

          //BOTON DE INGRESAR
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),//DAR BORDER RADIOS AL BUTTON
            disabledColor:Colors.grey,//CAMBIA A ESE COLOR AL PRESS BUTTON
            elevation: 0,
            color: Colors.deepPurple,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),//DAR ANCHO Y LARGO DE BUTTON
                child: Text(
                    loginForm.isLoading//ESTA CARGANDO?
                    ?'Espere...'
                    :'Ingresar',
                    style: const TextStyle(color: Colors.white //COLOCAR TEXTO Y DAR COLOR BLANCO
                  )
              ),
            ),
            onPressed: loginForm.isLoading ? null : () async{//SI ESTA CARGANDO ENTONCES NULL Y SINO IR A FUNCION

              FocusScope.of(context).unfocus(); //QUITA EL TECLADO DE LA PANTALLA

              if(!loginForm.isValidForm()) return;    //LLAMA AL METODO DE VALIDAR FORMULARIO DE "login_form_provides"
              
              loginForm.isLoading = true;

              await Future.delayed(const Duration(seconds: 2));//UNA PAUSA DE 2 SEGUNDOS

              //todo: validar si el login es correcto
              loginForm.isLoading = false;//DEJAR DE CARGAR

              Navigator.pushReplacementNamed(context, 'home');//ESTA LINEA LO QUE HACE ES ENVIAR A OTRA VISTA
            }
          )

        ],
      ),
    );
  }
}