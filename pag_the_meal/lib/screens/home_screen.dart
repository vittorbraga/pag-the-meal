import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pag_the_meal/stores/home_store.dart';
import 'package:pag_the_meal/stores/login_store.dart';
import 'package:pag_the_meal/widgets/category_widget.dart';
import 'package:pag_the_meal/widgets/product_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginStore _loginStore;
  HomeStore _homeStore = HomeStore();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _loginStore = Provider.of<LoginStore>(context);
    _homeStore.fetchCategoryList();
    _homeStore.fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pag The Meal"),
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: 130,
                  padding: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(56, 77, 82, .85),
                        Color.fromRGBO(81, 112, 130, .85)
                      ]
                    ),
                    borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250/3.5),
                    bottomRight: Radius.circular(250/3.5)
                    )
                  )
                ),
                Positioned(
                  bottom: 50, left: 30, right: 0,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              _loginStore.user.photoURL,
                            ),
                          )
                        )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          _loginStore.user.displayName,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          )
                        )
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -75, left: 0, right: 0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(50.0),
                      child: TextField(
                        onChanged: _homeStore.setSearch,
                        decoration: new InputDecoration(
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "O que você quer comer?",
                          fillColor: Colors.white
                        ),
                      )
                    )
                  ),
                ),
              ]
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 35.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: Observer(
                builder: (_) {
                  return _homeStore.category != null ?
                    ListView.builder(
                      itemCount: _homeStore.category.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          child: CategoryWidget(_homeStore.category[index]),
                          onTap: () => _homeStore.getchProductListByCategory(_homeStore.category[index].strCategory),
                        );
                      },
                    ) :
                    Center(
                      child: CircularProgressIndicator()
                    );
                },
              )
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return _homeStore.product != null ?
                    GridView.builder(
                      itemCount: _homeStore.product.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (_, index) {
                        return ProductWidget(_homeStore.product[index]);
                      }
                    ) :
                    Center(
                      child: CircularProgressIndicator()
                    );
                }
              )
              // child: GridView.count(
              //   crossAxisCount: 2,
              //   children:
              //     List.generate(6, (index) {
              //       return ProductWidget();
              //     }
              //   )
              // )
            )
          ]
        ),
      ),
    );
  }

}