import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_store/app/ui/widgets/heading.dart';
import 'package:my_store/core/themes/colors.dart';
import 'package:my_store/core/utils/spaces.dart';

class MittKontoPage extends StatelessWidget {
  const MittKontoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.08,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopHeadings(heading: 'Hafsa Mehmood'),
            verticalSpace(height: 35),
            Container(
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: white,
                    ),
                  ),
                  verticalSpace(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hafsa Mehmood",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      verticalSpace(height: 5),
                      const Text(
                        "hafsaayyhere@gmail.com",
                        style: TextStyle(
                          color: lightGrey,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const Text(
                        "0334563234",
                        style: TextStyle(
                          color: lightGrey,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(height: 30),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/settings.svg",
                width: 18,
                height: 18,
              ),
              title: const Text(
                "Kontoinstallningar",
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/mina.svg",
                width: 18,
                height: 18,
              ),
              title: const Text(
                "Mina betalmetoder",
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/support.svg",
                width: 18,
                height: 18,
              ),
              title: const Text(
                "Support",
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
