
import 'package:flutter/material.dart';
import 'package:valyuta/icons.dart';
import 'package:valyuta/model/currency_model.dart';
import 'package:valyuta/service/http_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CurrencyModel> model = [];

  void getModel() async {
    final getResult = await HttpService.get();
    model = [];
    model.addAll(getResult);
  }

  @override
  void initState() {
    super.initState();
    getModel();
  }

  Color balanceCheck(String balance) {
    double balanceValue = double.parse(balance);
    if (balanceValue >= 0) {
      return Colors.greenAccent;
    } else {
      return Colors.red;
    }
  }

  Image imageCheck(String str) {
    double result = double.parse(str);
    if (result >= 0) {
      return Image(
        image: AssetImage(AppIcon.plus),
      );
    } else {
      return Image(
        image: AssetImage(AppIcon.minus),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131316),
      appBar: AppBar(
        leadingWidth: 70,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: SizedBox(
              width: 50,
              child: Image(
                image: AssetImage(
                  AppIcon.wallet,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: SizedBox(
              width: 50,
              child: Image(
                image: AssetImage(
                  AppIcon.scanner,
                ),
              ),
            ),
          )
        ],
        toolbarHeight: 100,
        backgroundColor: const Color(0xff212126),
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            Text(
              "John",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: model.length,
          itemBuilder: (context, index) {
            final todo = model[index];

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: Image(
                  color: double.parse(todo.diff) >= 0 ? Colors.greenAccent : Colors.red,
                  image: AssetImage("assets/logo/logo/${model[index].ccy}.png"),),
                trailing: Column(
                  children: [
                    Text(
                      todo.rate,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 20,
                          child: imageCheck("${todo.diff}"),
                        ),
                        Text(
                          todo.diff,
                          style: TextStyle(
                            color: balanceCheck(
                              todo.diff,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                tileColor: const Color(0xff18181c),
                title: Text(
                  todo.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                subtitle: Text(
                  todo.ccy,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white54,
                      ),
                ),
              ),
            );
          }),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff212126),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                size: 40,
                color: Colors.white,
                Icons.home,
              ),
              label: "",
            ),
            BottomNavigationBarItem(icon: SizedBox(), label: ""),
            BottomNavigationBarItem(
              icon: Icon(
                size: 40,
                color: Colors.white,
                Icons.settings,
              ),
              label: "",
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          onPressed: () {},
          child: const Icon(
            Icons.search,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
