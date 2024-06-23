import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saidoffapp/core/router/name_routes.dart';
import 'package:saidoffapp/features/onboarding/view/widgets/constPage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();
  int _PageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.90,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _PageIndex = index;
                  });
                },
                controller: _pageController,
                children: const [
                  ConstPage(),
                  ConstPage(
                    imagePath: 'assets/images/image2.png',
                    title: 'Mental Health \n Service',
                    subtitle:
                        'If you think that you or someone you know has a mental health problem, there are a number of ways that you can seek advice.',
                  ),
                  ConstPage(
                    imagePath: 'assets/images/image3.png',
                    title: 'Get Started',
                    subtitle:
                        'Take the first step on your journey to better mental health. Get started today!',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Skip',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        3,
                        (index) => DotIndicator(
                          isActive: index == _PageIndex,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_PageIndex == 2) {
                        context.goNamed(Routes.login);
                      } else {}
                      _pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          curve: Curves.ease);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Container(
        height: 6,
        width: isActive ? 26 : 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? Colors.white : Colors.white24),
      ),
    );
  }
}
