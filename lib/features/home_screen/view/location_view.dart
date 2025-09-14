import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/features/home_screen/cubit/location_cubit.dart';
import 'package:newsapp/features/home_screen/cubit/location_state.dart';
import 'package:newsapp/features/settings_screen/view/settings_view.dart';


class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..getLocation(),
      child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state)
          {
            if(state is LocationLoading)
            {
              return Center(child: CircularProgressIndicator(),);
            }
            else if(state is LocationSuccess)
            {
              return GoogleMap(
                
                initialCameraPosition: CameraPosition(
                  target: state.latLng,
                  zoom: 5,
                ),
                markers: {
            Marker(
              markerId: MarkerId("selected"),
              position: state.latLng,
              draggable: true,
              onDragEnd: (newPos) {
                LocationCubit.get(context).changeLocation(newPos);
              },
            ),
          },
          onTap: (pos) {
            LocationCubit.get(context).changeLocation(pos);
            Goto(context, SettingsView(index: 3));
          },
              );
            }
            else if(state is LocationError)
            {
              return Text(state.message);
            }
            else
            {
              return SizedBox();
            }
          }
        ),
      );
  }
}