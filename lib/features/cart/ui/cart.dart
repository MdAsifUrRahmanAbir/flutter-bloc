import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text("My Cart"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (context, current) => current is CartActionState,
        buildWhen: (context, current) => current is   !CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType){
            case const (CartSuccessState):
              final successState = state as CartSuccessState;
              return _successStateView(successState);
          }
          return Container();
        },
      ),
    );
  }

  _successStateView(CartSuccessState successState) {

  }
}
