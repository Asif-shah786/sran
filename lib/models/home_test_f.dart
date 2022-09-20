//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     gtm.pushEvent('visit_home');
//
//     checkData();
//   }
//
//   checkData() async {
//     setState(() {
//       isLoading = true;
//     });
//     if (! (await context.read<UserProvider>().dataLoaded))   {
//       await context.read<UserProvider>().initApp();
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return isLoading ? SplashScreen(fromHome: true,):
//     WillPopScope(
//       onWillPop: () async {
//         // TO DO
//         return true;
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: _getScreenForIndex(_selectedIndex),
//         bottomNavigationBar: (kIsWeb && !ResponsiveWrapper.of(context).isMobile)
//             ? SizedBox()
//             : TitledBottomNavigationBar(
//           currentIndex: _selectedIndex,
//           height: 89,
//           showGap: false,
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           items: [
//             TitledNavigationBarItem(
//                 selectedIcon: SvgPicture.asset(
//                   kSearchIcon,
//                   color: AppColors.selectedColor,
//                 ),
//                 unSelectedIcon: SvgPicture.asset(
//                   kSearchIcon,
//                   color: AppColors.unselectedColor,
//                 ),
//                 title: Text('Search')),
//             TitledNavigationBarItem(
//                 selectedIcon: SvgPicture.asset(
//                   kSavedIcon,
//                   color: AppColors.selectedColor,
//                 ),
//                 unSelectedIcon: SvgPicture.asset(kSavedIcon),
//                 title: Text('Saved')),
//             TitledNavigationBarItem(
//                 selectedIcon: SvgPicture.asset(
//                   kListingsIcon,
//                   color: AppColors.selectedColor,
//                 ),
//                 unSelectedIcon: SvgPicture.asset(kListingsIcon),
//                 title: Text('Listings')),
//             TitledNavigationBarItem(
//                 selectedIcon: SvgPicture.asset(
//                   kMessagesIcon,
//                   color: AppColors.selectedColor,
//                 ),
//                 unSelectedIcon: SvgPicture.asset(kMessagesIcon),
//                 title: Text('Messages')),
//             TitledNavigationBarItem(
//                 selectedIcon: SvgPicture.asset(
//                   kProfileIcon,
//                   color: AppColors.selectedColor,
//                 ),
//                 unSelectedIcon: SvgPicture.asset(kProfileIcon),
//                 title: Text('Profile')),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _getScreenForIndex(int index) {
//     switch (index) {
//       case 0:
//         return Navigator(
//           onGenerateRoute: (settings) {
//             return MaterialPageRoute(
//               builder: (c) => SearchTab(),
//               settings: settings,
//             );
//           },
//         );
//       case 1:
//         return SavedScreen();
//       case 2:
//         return ListingsScreen();
//       case 3:
//         return MessagesScreen();
//       case 4:
//         return ProfileScreen();
//       default:
//         return Container();
//     }
//   }
// }
