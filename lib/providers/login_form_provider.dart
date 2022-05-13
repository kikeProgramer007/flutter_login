
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey =  GlobalKey<FormState>();//VINCULAR CON EL FORM

  String email     = '';
  String password  = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading( bool value ){//ESTABLECER VALOR PARA ACTALIZAR WIDGETS
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){//VERIFICAR SI EL FORMULARIO ES VALIDO
  
    // ignore: avoid_print
    print(formKey.currentState?.validate());
    // ignore: avoid_print
    print('$email - $password');

    
    return formKey.currentState?.validate() ?? false;
  }

}