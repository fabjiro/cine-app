import 'package:cineapp/constantes.dart';
import 'package:cineapp/Providers/theme.dart';
import 'package:cineapp/data.dart';
import 'package:cineapp/pages/PageHome/DetaildTandas.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Tandas extends StatelessWidget {
  const Tandas({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  final CustomThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(paddingScreen),
            child: Text(
              "Tandas",
              style: TextStyle(
                fontSize: 18.sp,
                color: themeProvider.theme.textColor!.withOpacity(.7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ), //Proximamente
          Container(
            height: 25.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: paddingScreen),
              itemCount: listTandas.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: paddingScreen,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DetailTandas(itemTandas: listTandas[index]),
                      )),
                      child: Container(
                        width: 30.w,
                        height: 20.h,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Hero(
                                tag: listTandas[index].id,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          listTandas[index].portada),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: listTandas[index].estreno,
                              child: Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 2,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Estreno",
                                        style: TextStyle(
                                          color: themeProvider
                                              .theme.textColorInvert,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .9.h,
                    ),
                    Container(
                      width: 30.w,
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: 12.sp),
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: themeProvider.theme.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                          text: listTandas[index].title,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
