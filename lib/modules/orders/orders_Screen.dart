import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:requset/layout/cubit/cubit.dart';
import 'package:requset/layout/cubit/states.dart';
import 'package:requset/models/order_model.dart';
import 'package:requset/modules/request/request_details.dart';
import 'package:requset/shared/components/components.dart';
import 'package:loadmore/loadmore.dart';



class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  void initState() {
    super.initState();
  }

  void load() {
    print("load");
    setState(() {
    //  AppCubit.get(context).getOrders();
    });
  }

  bool isFinish(){
    if(AppCubit.get(context).newList.length >= AppCubit.get(context).orderModel.meta.total ){
      print('${AppCubit.get(context).newList.length} + newListLength');
      print('${AppCubit.get(context).orderModel.meta.total} + metaTotal');
      return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Container(
              color: Colors.white,
              child: ConditionalBuilder(
                condition: state is! LoadingGetOrdersState,
                builder: (context) => RefreshIndicator(
                  child: LoadMore(
                    isFinish: isFinish(),
                    onLoadMore: _loadMore,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildOrder(cubit.newList[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 0.0,
                      ),
                      itemCount: cubit.newList.length,
                    ),
                    whenEmptyLoad: false,
                    delegate: DefaultLoadMoreDelegate(),
                    textBuilder: DefaultLoadMoreTextBuilder.english,
                  ),
                  onRefresh: _refresh,
                ),
                fallback: (context) => Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/empty_order.png'),
                      ),
                      Text(
                        'Don\'t have any order yet',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  Future<bool> _loadMore() async {
    if(AppCubit.get(context).page <= AppCubit.get(context).orderModel.meta.pages){
      AppCubit.get(context).getOrders();
      print("onLoadMore");
      await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
      load();
      return true;
    }
    print('false');
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
   // AppCubit.get(context).newList.clear();
    load();
  }


  Widget buildOrder(DataOrder model) => InkWell(
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          myDivider(),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      model.customer.user.profilePhotoUrl,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.customer.user.name,
                      style: TextStyle(
                        fontFamily: 'Jannah',
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 12.0,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '${model.customer.rate}',
                          style: TextStyle(
                            fontFamily: 'Jannah',
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 4.0),
                          height: 25.0,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              'Pending',
                              style: TextStyle(
                                fontFamily: 'Jannah',
                                color: Colors.white,
                                fontSize: 11.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '${DateTime.parse(model.createdAt).minute} mins',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Jannah',
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BarProgress(
              percentage: 50.0,
              backColor: Colors.black12,
              gradient:
              LinearGradient(colors: [Colors.lightGreen, Colors.green]),
              showPercentage: false,
              stroke: 8,
              round: true,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    ),
    onTap: () {
      navigateTo(context, RequestDetails());
    },
  );

}