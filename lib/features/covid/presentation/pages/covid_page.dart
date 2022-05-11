import 'package:covid_tracking_using_bloc_with_test/features/covid/data/models/covide_model.dart';
import 'package:covid_tracking_using_bloc_with_test/features/covid/presentation/bloc/covid_bloc.dart';
import 'package:covid_tracking_using_bloc_with_test/features/covid/presentation/widgets/covid_card.dart';
import 'package:covid_tracking_using_bloc_with_test/features/covid/presentation/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  final CovidBloc _newsBloc = CovidBloc();

  @override
  void initState() {
    _newsBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('COVID-19 List')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return _buildLoading();
              } else if (state is CovidLoading) {
                return _buildLoading();
              } else if (state is CovidLoaded) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return ListView.builder(
      itemCount: model.countries!.length,
      itemBuilder: (context, index) {
        return CovidCard(
          country: model.countries![index].country.toString(),
          totalDeath: model.countries![index].totalDeaths.toString(),
          totalConfirmed: model.countries![index].totalConfirmed.toString(),
          totalRecovered: model.countries![index].totalRecovered.toString(),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: ManualLoader());
}
