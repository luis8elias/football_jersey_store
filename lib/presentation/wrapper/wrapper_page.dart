import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/custom_navigation_bar.dart';
import 'bloc/wrapper_bloc.dart';

class WrapperPage extends StatelessWidget {
  final int pageIndex;


  const WrapperPage({Key? key,required this.pageIndex}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => WrapperBloc(index: pageIndex),
      child: const WrapperPageUI(),
    );
  }
}

class WrapperPageUI extends StatelessWidget {
  const WrapperPageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<WrapperBloc>(context);

    return BlocBuilder<WrapperBloc, IndexChangedState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomNavigationBar(
            index: state.currentIndex,
            onIndexSelected: (index) {
              bloc.add(IndexChangedEvent(index: index));
            },
          ),
          body: Column(
            children: [
              Expanded(
                  child: IndexedStack(
                index: state.currentIndex,
                children: [
                  Container(),
                  Container(),
                  Container(),
                 Container(),
                ],
              )),
            ],
          ),
        );
      },
    );
    
  }
}