import 'package:church_ai/presentation/core/constant.dart';
import 'package:church_ai/presentation/core/reusable/general_text.dart';
import 'package:church_ai/presentation/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  bool hasReachedSecondPage = false;

  @override
  void initState(){
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: contents.length,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _pageController,
                itemBuilder: (context, index) => OnboardContent(
                  image: contents[index].image,
                  title: contents[index].title,
                  description: contents[index].description,
                  pageController: _pageController,
                  count: contents.length,
                  currentPageIndex:currentIndex,
                ),
              ),
            ),
          ],
        )
    );
  }
}

class Onboard{
  final String  image, title, description;

  Onboard({required this.image, required this.title, required this.description});
}
final List<Onboard> contents= [
  Onboard(
      image:'images/img.png',
      title:'Real Talks',
      description:'Chat naturally with our smart '
          'Exponential AI—\nget tips '
          'and tools for ministry mastery.'),

  Onboard(
      image:'images/img_2.png',
      title: 'Solid Answers',
      description:'Trust our AI to give you accurate and '
          'faith-\nfocused responses, always reliable,'
          'always\nin line with scripture.'),
  Onboard(
      image:'images/img_3.png',
      title:'Gain insights',
      description:'Gain practical insights to transform the world\n'
          'and acquire tools to run your church.'),
];


class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key, required this.image,
    required this.title,
    required this.description,
    required this.pageController,
    required this.count,
    required this.currentPageIndex,
  });
  final String image, title, description;
  final PageController pageController;
  final int count;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:167.5,right:167.5,top:48,),
                  child: Image.asset("images/img_1.png",),
                ),
                const SizedBox(height: 503.66,),
                Text(title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                Text(description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                 const SizedBox(height: 32,),
                 currentPageIndex < 2?SmoothPageIndicator(
                    controller: pageController ,  // PageController
                    count: count ,
                    effect:   const SlideEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                    ),  // your preferred effect
                    onDotClicked: (index){
                    }
                ):
                // if (currentPageIndex == 2)
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Palette.backgroundColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                            },
                            child: Container(
                              width: getProportionateScreenWidth(163.5),
                              height:getProportionateScreenHeight(40),
                              margin: const EdgeInsets.only(left: 2,right: 2,top: 4,bottom: 4),
                              decoration: BoxDecoration(
                                  color: Palette.primaryColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:  Align(
                                alignment: Alignment.center,
                                child: CreateGeneralText(inputText: 'Log in', fontSize:14, weight:FontWeight.w600, colorName:Palette.textColor1)
                              ),
                            ),
                          ),
                           SizedBox(width:getProportionateScreenWidth(30),),
                          GestureDetector(
                            onTap: (){
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
                            },
                            child: CreateGeneralText(inputText: 'Create account', fontSize: 14 , weight: FontWeight.w600, colorName: Palette.textColor3)
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}