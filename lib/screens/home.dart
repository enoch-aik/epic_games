import 'package:epic_games/app.dart';
import 'package:epic_games/res/style.dart';
import 'package:epic_games/widgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  int selectedGameIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const Color overlayColor = Color(0xffA0A0A0);
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        foregroundColor: const Color(0xffAAAAAA),
        backgroundColor: const Color(0xff313131),
        leading: InkWell(
          onTap: () {},
          child: Image.asset(
            'assets/images/logo.png',
            width: 24.w,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/svg/web.svg',
            ),
          ),
          SizedBox(width: 48.w),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/sign_in.svg'),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 24.w),
                  child: const KText(
                    'SIGN IN',
                    color: Color(0xffAAAAAA),
                  ),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {},
              child: Container(
                color: Colors.blue,
                width: 112.w,
                height: 50.h,
                alignment: Alignment.center,
                child: KText(
                  'DOWNLOAD',
                  fontSize: 18.sp,
                ),
              ))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 181.w, vertical: 28.h),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 1.w),
                    child: SizedBox(
                      width: 420.w,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: overlayColor,
                            ),
                            labelText: 'Search Store',
                            labelStyle:
                                appTextStyle.copyWith(color: overlayColor)),
                      ),
                    ),
                  ),
                  ...List.generate(3, (index) {
                    List<String> options = ['Discover', 'Browse', 'News'];
                    return Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                        child: KText(
                          options[index],
                          color: selectedTabIndex == index
                              ? Colors.white
                              : const Color(0xff666666),
                          fontSize: 26.sp,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 827.w,
                  //height: 432.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/games/god_of_war.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 40.h,
                          left: 48.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              KText(
                                'PRE-PURHCASE AVAILABLE',
                                fontSize: 20.sp,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 8.h, bottom: 40.h),
                                child: KText(
                                  'Kratos now lives as a man in the\nrealm of Norse Gods and monsters. It\nis in this harsh, unforgiving world that\nhe must fight to survive',
                                  fontSize: 22.sp,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 200.w,
                                  height: 50.h,
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: KText(
                                    'PRE-PURHCASE NOW',
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.w),
                  child: Column(
                    children: [
                      ...List.generate(4, (index) {
                        List<String> images = [
                          'assets/images/games/god_of_war_mini.png',
                          'assets/images/games/farcry_mini.png',
                          'assets/images/games/gta_mini.png',
                          'assets/images/games/outlast_mini.png',
                        ];
                        List<String> titles = [
                          'God of War 4',
                          'Farcry 6 Golden Edition',
                          'GTA V',
                          'Outlast 2'
                        ];
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              selectedGameIndex = index;
                            });
                          },
                          child: SizedBox(
                            width: 300.w,
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              if (constraints.maxWidth >= 226) {
                                return AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    width: 300.w,
                                    height: 135.h,
                                    decoration: BoxDecoration(
                                        color: selectedGameIndex == index
                                            ? const Color(0xff252525)
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(images[index]),
                                        Padding(
                                          padding: EdgeInsets.only(left: 24.w),
                                          child: SizedBox(
                                              width: 150.w,
                                              child: KText(titles[index])),
                                        )
                                      ],
                                    ));
                              } else {
                                return AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    // width: 40.w,
                                    height: 135.h,
                                    decoration: BoxDecoration(
                                        color: selectedGameIndex == index
                                            ? const Color(0xff252525)
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(images[index]),
                                        /*Padding(
                                          padding: EdgeInsets.only(left: 24.w),
                                          child: SizedBox(
                                              width: 150.w,
                                              child: KText(titles[index])),
                                        )*/
                                      ],
                                    ));
                              }
                            }),
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: const KText('Games on sale >'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(5, (index) {
                    List<String> images = [
                      'assets/images/games/valorant.png',
                      'assets/images/games/acreed.png',
                      'assets/images/games/rdredemption.png',
                      'assets/images/games/tomb_raider.png',
                      'assets/images/games/cyberpunk.png',
                    ];
                    List<String> titles = [
                      'Valorant',
                      'Assassins\'s creed Valhalla',
                      'Red Dead Redemption 2',
                      'The tomb raider',
                      'Cyberpunk 2077',
                    ];

                    return Padding(
                      padding: EdgeInsets.only(right: 24.w),
                      child: SizedBox(
                        width: 213.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Image.asset(images[index]),
                            ),
                            KText(titles[index]),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 53.w,
                                  height: 30.h,
                                  color: Colors.blue,
                                  alignment: Alignment.center,
                                  child: const KText('-10%'),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: const KText('₹850'),
                                ),
                                const KText('₹850'),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(3, (index) {
                    List<String> title = [
                      'NFS UNBOUND',
                      'FIFA 23',
                      'UNCHARTED 4'
                    ];
                    List<String> details = [
                      'Pre-purchase NFS Unbound and get an exclusive Driving Effect, License Plate, 150,000 Bank, and more.',
                      'FIFA 23 brings The World’s Game to the pitch, with HyperMotion2 Technology, men’s and women’s FIFA World Cup',
                      'Get the definitive Uncharted 4 experience with all Season Pass content, the Ultimate Pack, and upcoming expansion.'
                    ];
                    List<String> imageUrl = [
                      'assets/images/games/nfs.png',
                      'assets/images/games/fifa23.png',
                      'assets/images/games/uncharted.png',
                    ];
                    return Padding(
                      padding: EdgeInsets.only(right: 48.w),
                      child: SizedBox(
                        width: 350.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imageUrl[index]),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: KText(
                                title[index],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            KText(
                              details[index],
                              fontSize: 18.sp,
                              color: Colors.white.withOpacity(0.61),
                            ),
                            const KText(
                              '₹3,499',
                            )
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 355.w),
              child: Container(
                height: 722.h,
                color: const Color(0xff2A2A2A),
                padding: const EdgeInsets.all(40),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/gift.svg',
                              width: 35.w,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            const KText('Free Games')
                          ],
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: Colors.white))),
                          child: const KText('View more'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Row(
                        children: [
                          ...List.generate(4, (index) {
                            List<String> images = [
                              'assets/images/games/darkwood.png',
                              'assets/images/games/acreed_blackflag.png',
                              'assets/images/games/nfs_shift.png',
                              'assets/images/games/warface.png',
                              'assets/images/games/darkwood.png',
                            ];
                            List<String> duration = [
                              'Free Now - Jul 25',
                              'Free Now - Jul 25',
                              'Free  Jul 27 - Aug 5',
                              'Free  Jul 27 - Aug 5',
                              'Free Now - Jul 25',
                            ];
                            List<String> titles = [
                              'Darkwoord',
                              'Assassin\'s creed Black Flag',
                              'NFS-Shift',
                              'Warface',
                              'Darkwood'
                            ];
                            return Padding(
                              padding: EdgeInsets.only(right: 50.w),
                              child: SizedBox(
                                width: 220.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      images[index],
                                      width: 220.w,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    KText(titles[index]),
                                    KText(
                                      duration[index],
                                      color: const Color(0xffAAAAAA),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/explore.png',
                  width: 610.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        'Explore out Catalog',
                        fontSize: 25.sp,
                      ),
                      KText(
                        'Browse by genre, features, price, and more to find your\nnext favorite game.',
                        color: Colors.white.withOpacity(0.6),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 50.h),
            Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/svg/footer.svg',
                  width: 1200.w,
                ))
          ],
        ),
      ),
    );
  }
}
