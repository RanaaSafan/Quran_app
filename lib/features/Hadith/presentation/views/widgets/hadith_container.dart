import 'package:flutter/material.dart';

import '../screens/hadith_sheikh_list.dart';

class HadithContainer extends StatefulWidget {
  const HadithContainer({super.key, required this.name});
  final String name;

  @override
  State<HadithContainer> createState() => _HadithContainerState();
}

class _HadithContainerState extends State<HadithContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HadithSheikhList(data: widget.name)));
          },
      child: Stack(
        children: [
          Container(
            height: 500,
            width: 400,
            decoration: BoxDecoration(
                color: const Color(0xFF522700),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            top: 15,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://img.pikbest.com/origin/09/19/98/717pIkbEsTKBr.jpg!sw800",
                width: 125,
                height: 132,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            bottom: 3,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.name,
                    style: TextStyle(color: Colors.white, fontSize: 20,overflow: TextOverflow.ellipsis,),
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.upload,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
