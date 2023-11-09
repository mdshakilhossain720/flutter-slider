import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curentpage=0;
  final PageController pageController=PageController();

  List<String> image=[
    "assets/image/imagepageview.jpg",
    "assets/image/imagethreepageview.jpg",
    "assets/image/profileimage.jpg",
    "assets/image/istockphoto-1368264124-1024x1024.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("slider"),),
      body: Column(
        children: [
          SizedBox(height: 400,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index){
              setState(() {
                curentpage=index%image.length;
              });
            },
              itemCount: 4,
              itemBuilder: (context,index){
            return SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(image[index % image.length],fit: BoxFit.cover,),
            );
          }),
          
          
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(var i=0;i<image.length;i++)buildindicator(curentpage==i)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                pageController.jumpToPage(curentpage -1);
              }, icon: Icon(Icons.arrow_back)),
              IconButton(onPressed: (){
                pageController.jumpToPage(curentpage+1);
              }, icon: Icon(Icons.arrow_forward)),
            ],
          )
        ],
      ),
      

    );
  }
  Widget buildindicator(bool isselcetable){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: isselcetable?12:8,
        width: isselcetable?12:8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isselcetable? Colors.black87:Colors.green,
        ),

      ),
    );
  }

}
