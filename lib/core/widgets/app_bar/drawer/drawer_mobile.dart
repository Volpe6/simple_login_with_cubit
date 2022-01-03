import 'package:cubit_login_sample/core/cubit/session_cubit/session_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({ Key? key }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return  OrientationBuilder(
      builder: (context, orientation) {
        return BlocBuilder<SessionCubit, SessionState>(
          builder: (BuildContext context, state) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _createHeader(),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.account_circle, size: 22,),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.user!.name),
                        ]
                      ),
                    )
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }

    Widget _createHeader() {
      return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image:  AssetImage('assets/img/imf.png',)
          )
        ),
        child: Stack(
          children: const [
            Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(
                "App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500
                )
              )
            ),
          ]
        )
      );
  }
}