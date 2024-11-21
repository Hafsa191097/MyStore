import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_store/app/ui/widgets/heading.dart';

class MittKontoPage extends StatelessWidget {
  const MittKontoPage({Key? key}) : super(key: key);

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
            const SizedBox(height: 35),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
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
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hafsa Mehmood",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "hafsaayyhere@gmail.com",
                        style: TextStyle(
                          color: Color(0xFFF2F2F2),
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Text(
                        "0334563234",
                        style: TextStyle(
                          color: Color(0xFFF2F2F2),
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
            const SizedBox(height: 30),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/settings.svg",
                width: 18,
                height: 18,
              ),
              title: const Text(
                "Kontoinstallningar",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
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
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Navigate to Payment Methods
              },
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
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Navigate to Support
              },
            ),
          ],
        ),
      ),
    );
  }
}
