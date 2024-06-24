
import 'package:flutter/material.dart';
import 'package:movie/models/movieDateModel.dart';
import 'package:movie/movieDetails.dart';
import 'package:movie/services/movieService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var movieName = TextEditingController();
  List<MovieDataModel> movies = [];
  bool isLoading = false;

  void fetchinit() async {
    isLoading = true;
    setState(() {
      isLoading;
    });
    movies = await MovieService.fetchMovie("Pokemon");
    setState(() {
      movies;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchinit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: movieName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)),
                    label: Text("Enter Movie Name:")),
              ),
              SizedBox(
                height: 14,
              ),
              ElevatedButton(
                  onPressed: () async {
                    isLoading = true;
                    setState(() {
                      isLoading;
                    });
                    movies = await MovieService.fetchMovie(movieName.text);
                    setState(() {
                      movies;
                      isLoading = false;
                    });
                  },
                  child: Text("Search")),
              isLoading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MoviesDetails()));
                                  print(movies[index].id);
                                },
                                title: Text("Movie: ${movies[index].title}"),
                                subtitle: Text("Movie: ${movies[index].year}"),
                                leading: Image.network(movies[index].poster),
                                // leading: Text("Movie: ${movies[index].poster}")
                              ),
                            );
                          }),
                    )
            ],
          ),
        ));
  }
}
