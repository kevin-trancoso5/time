import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'env/env.dart';
import 'screens/home.dart';

import 'blocs/search/search_bloc.dart';
import 'providers/api.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocDelegate();
  runApp(MyApp());
}

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Api>(
          create: (context) => Api(
            authority: env['api_authority'] as String,
            endpoint: env['api_endpoint'] as String,
            endpointPath: env['api_path'] as String,
            port: env['api_port'] as int,
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SearchBloc>(
            create: (context) =>
                SearchBloc(api: RepositoryProvider.of<Api>(context)),
          )
        ],
        child: Home(),
      ),
    );
  }
}
