import 'package:flutter/material.dart';
import 'package:getdata/store.dart';
import 'package:provider/provider.dart';

class ResponseDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: store.isFetching
          ? CircularProgressIndicator()
          : store.getResponseJson() != null
              ? ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: store.getResponseJson().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                       leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            store.getResponseJson()[index]['store_image']),
                      ),
                      title: Text(
                        //store.getResponseJson()[index]["store_name_th"],
                        'jjjjj'
                      ),
                    );
                  },
                )
              //? Text(store.getResponseJson())
              : Text("Press Button above to fetch data"),
    );
  }
}