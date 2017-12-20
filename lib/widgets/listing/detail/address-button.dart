import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/map_options.dart';
import 'package:map_view/camera_position.dart';
import 'package:map_view/location.dart';

class AddressButton extends StatefulWidget {
  final MapView mapView;

  AddressButton({ Key key })
  : mapView = new MapView(), 
    super(key: key);

  @override
  _AddressButtonState createState() => new _AddressButtonState();  
}

class _AddressButtonState extends State<AddressButton> {
  @override
  void initState() {
    super.initState();
    widget.mapView.show(mapOptions);
  }
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new RaisedButton(
        onPressed: () { },
        child: const Text('something something')
      ),
    );
  }

  MapOptions get mapOptions => new MapOptions(
    initialCameraPosition: new CameraPosition(new Location(0.0, 0.0), 12.0)
  );
}