import 'package:dairy_deliver/screens/vendor_portfolio_screen.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile(
      {super.key,
      required this.name,
      required this.area,
      required this.image,
      required this.rating});

  final String name;
  final String area;
  final String image;
  final String rating;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.image),
      ),
      title: Text(widget.name),
      subtitle: Text(widget.area),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.rating,
            style: TextStyle(fontSize: 17),
          ),
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorPortfolio(
              image: widget.image,
              name: widget.name,
              area: widget.area,
              rating: widget.rating,
            ),
          ),
        );
      },
    );
  }
}
