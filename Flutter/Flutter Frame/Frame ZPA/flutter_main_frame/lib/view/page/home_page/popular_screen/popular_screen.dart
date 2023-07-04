import 'package:flutter/material.dart';
import 'package:flutter_main_frame/localization/app_translation.dart';
import 'package:flutter_main_frame/ob/movie_ob.dart';
import 'package:flutter_main_frame/ob/response_ob.dart';
import 'package:flutter_main_frame/tools/internet_provider.dart';
import 'package:flutter_main_frame/utils/app_constants.dart';
import 'package:flutter_main_frame/view/page/home_page/popular_screen/popular_bloc.dart';

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  PopularBloc bloc; //null

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = PopularBloc();
    bloc.getPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    bool isInternet = InternetProvider.of(context).internet;

    return Column(
      children: <Widget>[
        isInternet
            ? Container()
            : Container(
                width: double.infinity,
                color: Colors.red,
                child: Center(
                    child:
                        Text(AppTranslations.of(context).trans("no_internet"))),
              ),
        Expanded(
          child: StreamBuilder(
            stream: bloc.popularStream(),
            initialData: ResponseOb(data: null, message: MsgState.loading),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              ResponseOb ob = snapshot.data;
              if (ob.message == MsgState.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (ob.message == MsgState.data) {
                List<Results> results = ob.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return movieWidget(results[index]);
                  },
                  itemCount: results.length,
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: Text(ob.data)),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        child: Text(
                          AppTranslations.of(context).trans("try_again"),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          bloc.getPopularMovie();
                        },
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget movieWidget(Results res) {
    return Column(
      children: <Widget>[
        Image.network(IMG_BASE_URL + res.backdropPath),
        Text(res.title),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }
}
