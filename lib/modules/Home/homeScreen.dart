import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/Home/cubit/cubit.dart';
import 'package:untitled/modules/Home/cubit/state.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var cubit =HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Home Sweet Home'),
            ),
            body: cubit.Screens[cubit.current_index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.current_index,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
                },
              items: cubit.bottomItems,
            ),
          );
          },
      ),
    );
  }
}
