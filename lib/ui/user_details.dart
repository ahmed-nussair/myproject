import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../bloc/users/users_bloc.dart';
import 'screen_util.dart';

class UserDetails extends StatelessWidget {
  final int userId;

  UserDetails({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final ScreenUtil _screenUtil = ScreenUtil();
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => UsersBloc()..add(LoadUserDetailsEvent(userId)),
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) => state is LoadingUserDetailsState
                ? Stack(
                    children: [
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                      Positioned(
                        left: _screenUtil.setSp(50),
                        top: _screenUtil.setSp(50),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: _screenUtil.setSp(100),
                          ),
                        ),
                      ),
                    ],
                  )
                : state is UserDetailsLoadedState
                    ? ListView(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // top left back arrow
                              Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      EdgeInsets.all(_screenUtil.setSp(30)),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                      size: _screenUtil.setSp(100),
                                    ),
                                  ),
                                ),
                              ),

                              // Name
                              Text(
                                state.data['name'],
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(70),
                                ),
                              ),

                              // username
                              Text(
                                state.data['username'],
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(50),
                                ),
                              ),

                              // email
                              Text(
                                state.data['email'],
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(50),
                                ),
                              ),

                              // phone
                              Text(
                                state.data['phone'],
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(50),
                                ),
                              ),

                              // website
                              Padding(
                                padding: EdgeInsets.only(
                                  right: _screenUtil.setSp(50),
                                  left: _screenUtil.setSp(50),
                                ),
                                child: Text(
                                  state.data['website'],
                                  style: TextStyle(
                                    fontSize: _screenUtil.setSp(50),
                                  ),
                                ),
                              ),

                              // Divider
                              Divider(
                                thickness: _screenUtil.setSp(5),
                              ),

                              // Company Label
                              Text(
                                'Company',
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(70),
                                ),
                              ),

                              // Company Name
                              Row(
                                children: [
                                  SizedBox(
                                    width: _screenUtil.setSp(400),
                                    child: Text(
                                      'Company Name: ',
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.data['company']['name'],
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // spacing
                              SizedBox(
                                height: _screenUtil.setSp(50),
                              ),

                              // Company Catch Phrase
                              Row(
                                children: [
                                  SizedBox(
                                    width: _screenUtil.setSp(400),
                                    child: Text(
                                      'Catch Phrase: ',
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.data['company']['catchPhrase'],
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Spacing
                              SizedBox(
                                height: _screenUtil.setSp(50),
                              ),

                              // BS
                              Row(
                                children: [
                                  SizedBox(
                                    width: _screenUtil.setSp(400),
                                    child: Text(
                                      'BS: ',
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.data['company']['bs'],
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //Divider
                              Divider(
                                thickness: _screenUtil.setSp(5),
                              ),

                              // Address Label
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(70),
                                ),
                              ),

                              // street
                              Row(
                                children: [
                                  SizedBox(
                                    width: _screenUtil.setSp(400),
                                    child: Text(
                                      'Street: ',
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.data['address']['street'],
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // suite
                              Row(
                                children: [
                                  SizedBox(
                                    width: _screenUtil.setSp(400),
                                    child: Text(
                                      'Suite: ',
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.data['address']['suite'],
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // city
                              Row(
                                children: [
                                  SizedBox(
                                    width: _screenUtil.setSp(400),
                                    child: Text(
                                      'City: ',
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.data['address']['city'],
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // zipcode
                              Row(
                                children: [
                                  SizedBox(
                                    width: _screenUtil.setSp(400),
                                    child: Text(
                                      'Zip Code: ',
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.data['address']['zipcode'],
                                      style: TextStyle(
                                        fontSize: _screenUtil.setSp(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Location on the map
                              SizedBox(
                                height: _screenUtil.setHeight(1000),
                                width: MediaQuery.of(context).size.width,
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        double.parse(state.data['address']
                                            ['geo']['lat']),
                                        double.parse(state.data['address']
                                            ['geo']['lng'])),
                                    zoom: 14.4746,
                                  ),
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                  markers: {
                                    Marker(
                                      markerId: MarkerId(state.data['name']),
                                      position: LatLng(
                                          double.parse(state.data['address']
                                              ['geo']['lat']),
                                          double.parse(state.data['address']
                                              ['geo']['lng'])),
                                    ),
                                  },
                                  gestureRecognizers:
                                      <Factory<OneSequenceGestureRecognizer>>{}
                                        ..add(Factory<PanGestureRecognizer>(
                                            () => PanGestureRecognizer()))
                                        ..add(Factory<
                                                HorizontalDragGestureRecognizer>(
                                            () =>
                                                HorizontalDragGestureRecognizer()))
                                        ..add(Factory<
                                                VerticalDragGestureRecognizer>(
                                            () =>
                                                VerticalDragGestureRecognizer()))
                                        ..add(Factory<ScaleGestureRecognizer>(
                                            () => ScaleGestureRecognizer()))
                                        ..add(Factory<EagerGestureRecognizer>(
                                            () => EagerGestureRecognizer())),
                                ),
                              ),

                              SizedBox(
                                height: _screenUtil.setHeight(500),
                              ),
                            ],
                          ))
                        ],
                      )
                    : state is ErrorState
                        ? Center(
                            child: Text(state.errorMessage),
                          )
                        : Container(),
          ),
        ),
      ),
    );
  }
}
