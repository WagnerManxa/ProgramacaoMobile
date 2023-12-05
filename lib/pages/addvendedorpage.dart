import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaUsuariosPendentesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuários Pendentes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 148, 11, 11),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: getUsuariosPendentes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('Nenhum usuário pendente encontrado.');
          } else {
            final usuariosPendentes = snapshot.data!.docs;

            return ListView.builder(
              itemCount: usuariosPendentes.length,
              itemBuilder: (context, index) {
                final usuario = usuariosPendentes[index];
                final userEmail = usuario['email'] as String;
                final nome = usuario['nome'] as String;
                final sobrenome = usuario['sobrenome'] as String;
                final isApproved = usuario['isApproved'] as bool;

                final nomeCompleto = '$nome $sobrenome';

                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(nomeCompleto),
                      subtitle: Text(
                          'Email: $userEmail\nAprovado: ${isApproved ? 'Sim' : 'Não'}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              if (!isApproved) {
                                showMatriculaDialog(context, usuario.reference,
                                    userEmail, true);
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showMatriculaDialog(
                                  context, usuario.reference, userEmail, false);
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<QuerySnapshot> getUsuariosPendentes() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('isApproved', isEqualTo: false)
        .get();
  }

  void approveUser(DocumentReference userReference, String matricula) {
    userReference.update({
      'isApproved': true,
      'matricula': matricula,
    });
  }

  void removeUser(DocumentReference userReference) {
    userReference.delete();
  }

  Future<void> showMatriculaDialog(
      BuildContext context,
      DocumentReference userReference,
      String userEmail,
      bool isApproval) async {
    String matricula = '';

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isApproval ? 'Aprovar usuário' : 'Remover usuário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isApproval)
                TextFormField(
                  onChanged: (value) {
                    matricula = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Matrícula',
                  ),
                ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (isApproval) {
                  approveUser(userReference, matricula);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Usuário aprovado: $userEmail, Matrícula: $matricula')),
                  );
                } else {
                  removeUser(userReference);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Usuário removido: $userEmail')),
                  );
                }
                Navigator.pop(context);
              },
              child: Text(isApproval ? 'Aprovar' : 'Remover'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
