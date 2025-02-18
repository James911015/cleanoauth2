import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  static const String name = "FormScreen";

  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _userNameError;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Formulario valido");
    } else {
      print("Formulario invalido");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Formulario"),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _userNameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle_outlined),
                              suffixIcon: _userNameController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        _userNameController.clear();
                                        setState(() {}); // Redibuja para ocultar el ícono
                                      },
                                    )
                                  : null,
                              labelText: "Ingrese su nombre de usuario",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              errorText: _userNameError , // Mostrar el error
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese un nombre de usuario';
                              }
                              return null;
                              },
                            onChanged: (value) {
                              setState(() {
                                // Eliminar el error cuando se escribe algo
                                _userNameError = value.isEmpty
                                    ? 'Por favor ingrese un nombre de usuario'
                                    : "";
                                _formKey.currentState!.validate();
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              suffixIcon: Icon(Icons.clear),
                              labelText: "Ingrese su email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese un email';
                            }
                            if (!value.contains('@')) {
                              return 'Por favor ingrese un email valido';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password_outlined),
                              suffixIcon: Icon(Icons.clear),
                              labelText: "Ingrese su contraseña",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: _submitForm, child: Text("Enviar")),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
