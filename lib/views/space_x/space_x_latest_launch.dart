import 'package:appnation/services/api_services/space_x_api_services/space_x_api_services.dart';
import 'package:appnation/views/space_x/bloc/space_x_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpaceXLatestLaunch extends StatelessWidget {
  const SpaceXLatestLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpaceXBloc(
        RepositoryProvider.of<SpaceXApiServices>(context),
      )..add(LoadSpaceXEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Last Mission'),
        ),
        body: BlocBuilder<SpaceXBloc, SpaceXState>(
          builder: (context, state) {
            if (state is SpaceXLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SpaceXLoadState) {
              return RefreshIndicator(
                onRefresh: () async =>
                    BlocProvider.of<SpaceXBloc>(context).add(LoadSpaceXEvent()),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.grey,
                      expandedHeight: MediaQuery.of(context).size.height * .4,
                      flexibleSpace: FlexibleSpaceBar(
                        title: const Text('SpaceX Last Mission'),
                        background: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              state.spaceXModel!.links!.patch!.small!),
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Container(
                        padding: const EdgeInsets.only(top: 50),
                        height: MediaQuery.of(context).size.height * 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(state.props.first!.name!),
                            Text(state.props.first!.details!),
                          ],
                        ),
                      )
                    ])),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
