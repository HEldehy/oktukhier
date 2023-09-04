import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octukheir/cubit/cubit.dart';
import 'package:octukheir/cubit/states.dart';
import 'package:octukheir/modules/pages/second.dart';
import '../reausable_components/widgets/grid_container.dart';
class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  List<String>name=['New Courses', 'My Courses', 'Other Courses', 'Contact Us'];
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OctuCubit,OctuStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=OctuCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.black
            ),
            elevation: 0,

          ),
          drawer: const Drawer(),
            backgroundColor:Colors.white,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  GridView.count(
                    scrollDirection: Axis.vertical,
                    mainAxisSpacing: 0.5,
                    crossAxisSpacing: 0.5,
                    childAspectRatio: 1 / 1.4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    padding:
                    const EdgeInsets.only(left: 1, right: 1, top: 6),
                    children: [
                      gridContainer(context, const SecondScreen(),
                          'New Courses', 'assets/image/new.png'),
                      gridContainer(context, const SecondScreen(),
                          'My Courses', 'assets/image/mycourses.png'),
                      gridContainer(context, const SecondScreen(),
                          'Other Courses', 'assets/image/other.png'),
                      gridContainer(context, const SecondScreen(),
                          'Contact Us', 'assets/image/info.png'),
                    ],
                  )
                ],
              ),
            ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentIndex,
            onTap: (index){cubit.changeBottomNavIcon(index);

            },

          ),

        );
      },
    );
  }
}
