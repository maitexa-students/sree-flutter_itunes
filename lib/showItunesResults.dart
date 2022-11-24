import 'package:flutter/material.dart';
import 'model/results.dart';
import 'service/apiservice.dart';


class ShowItunesResults extends StatefulWidget {

  Map<String,String> formData;
    ShowItunesResults(this.formData, {Key? key}) : super(key: key);

  @override
  State<ShowItunesResults> createState() => _ShowItunesResultsState();
}

class _ShowItunesResultsState extends State<ShowItunesResults> {
  APIService apiService = APIService();
 String? searchTerm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("iTunes Results",)),
      body: FutureBuilder<List<ItunesResults>>(

          future: apiService.getResults(widget.formData['searchTerm'].toString()),
          builder: (context,snapshot) {
            return ListView.builder(itemCount: snapshot.data!.length, itemBuilder: (context, index) {

              return  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  snapshot.data?[index].artworkUrl != null ?
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data![index].artworkUrl.toString()), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ) :
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('https://source.unsplash.com/weekly?coding'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      snapshot.data![index].artistName.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                    ,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    snapshot.data![index].collectionName.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              );

              // return Container(
              //   margin: EdgeInsets.all(5.0),
              //   width: double.maxFinite,
              //   height: 200,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(image: NetworkImage(snapshot.data![index].urlToImage.toString()),fit: BoxFit.cover)),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //
              //       Container(
              //           height: 200.0,
              //           width: double.infinity,
              //           padding: EdgeInsets.all(5),
              //           child: Text(snapshot.data![index].title.toString()))
              //     ],
              //   ),
              // );
            });

          }
      ),
    );
  }
}

