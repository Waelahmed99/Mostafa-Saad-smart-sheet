import 'package:flutter/material.dart';
import 'package:scoreboard/models/problem.dart';
import 'package:scoreboard/page%20structure/main_page.dart';
import 'helpers/codeforces_api.dart';
import 'dart:html';
import 'dart:js' as js;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // get handles/problems json files from url.
    // var url = window.location.href;
    // final Map<String, String> params = Uri.parse(url).queryParameters;
    // String handle = params['handle'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Oswald"),
      home: Scaffold(
        body: MainPage(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class UserDetails extends StatefulWidget {
  final String handle;

  const UserDetails({Key key, this.handle}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  bool _isLoading;
  CfApi cf;

  set isLoading(bool value) => setState(() => _isLoading = value);

  get isLoading => _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    cf = CfApi();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (isLoading) {
        await cf.getProblems();
        await cf.setProblemVerdict(widget.handle);
        isLoading = false;
      }
    });

    // No handle is passed.
    if (widget.handle == null || widget.handle.isEmpty)
      return Center(
        child: Text(
          'Please pass your handle like this:\nurl/?handle=YOUR_HANDLE',
          textAlign: TextAlign.center,
        ),
      );

    // Problems are still loading.
    if (isLoading)
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 24),
            Text('Welcome ${widget.handle}'),
          ],
        ),
      );

    // Done loading problems.
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Table(
          border: TableBorder.all(color: Colors.black),
          children: cf.problems.map((e) {
            List<String> sep = e.split(' ');
            String problemId = sep[0];
            String problemName = "";
            for (int i = 1; i < sep.length; i++) problemName += sep[i] + ' ';
            Problem problem = cf.userSubmissions[problemId];
            Verdict result = problem?.verdict;
            if (result == null) result = Verdict.NOT_SOLVED;
            //     return GestureDetector(
            //       onTap: () => js.context.callMethod('open', [
            //         'https://codeforces.com/problemset/problem/${problemId.substring(0, problemId.length - 1)}/${problemId[problemId.length - 1]}'
            //       ]),
            //       child: Container(
            //         child: Text('$problemName  $result'),
            //       ),
            return TableRow(
              children: [
                GestureDetector(
                  onTap: () => js.context.callMethod('open', [
                    'https://codeforces.com/problemset/problem/${problemId.substring(0, problemId.length - 1)}/${problemId[problemId.length - 1]}'
                  ]),
                  child: Container(
                    child: Text(problemName),
                  ),
                ),
                Text(result.toString()),
              ],
            );
          }).toList()),
    );
  }
}

// class AppRoot extends StatefulWidget {
//   @override
//   _AppRootState createState() => _AppRootState();
// }

// class _AppRootState extends State<AppRoot> {
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
//     // get handles/problems json files from url.
//     var url = window.location.href;
//     final Map<String, String> params = Uri.parse(url).queryParameters;
//     String handle = params['handle'];

//     if (handle == null || handle.isEmpty) {
//       return MaterialApp(
//         home: Scaffold(
//           body: Center(
//             child: Text(
//               'Please pass your handle like this:\nurl/?handle=YOUR_HANDLE',
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       );
//     }
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Hello'),
//         ),
//         body: Center(
//           child: Text('Welcome ${params['handle']}'),
//         ),
//       ),
//     );
//   }
// }
