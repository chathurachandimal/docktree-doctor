import 'package:doctor_app/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: size.height * 0.04),
            Container(
              height: 170.0,
              child: Center(
                child: ListView.builder(
                  primary: false,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListCard(index: index);
                  },
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  primary: false,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 4 == 0) {
                      return TimelineListHeader();
                    } else {
                      return TimelineListCard();
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03)
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  int index;

  ListCard({this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        //Get.to(PatientProfileScreen());
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, right: 10, left: 10),
            padding: EdgeInsets.all(20),
            height: 130,
            width: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index == 0
                  ? appBarBackgroundColor.withOpacity(.3)
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 30,
                  color: kShadowColor,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //Get.to(screen_);
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  'Dr Rizil',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: kTextDarkColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: kTextFillColor),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text('Today - Thu Apr 13'),
    );
  }
}

class TimelineListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('9.00 AM', style: TextStyle(fontSize: 13)),
            Text('15min',
                style: TextStyle(fontSize: 12, color: Colors.black45)),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fourth Visit', style: TextStyle(fontSize: 13)),
            Text(
                'Allergies, also known as allergic diseases,are a number of conditions caused by hypersensitivity',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic)),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(Icons.location_pin, size: 12, color: Colors.black45),
            SizedBox(width: 5),
            Text('Colombo',
                style: TextStyle(fontSize: 12, color: Colors.black45)),
          ],
        ),
        onTap: () {
          //Get.to(DoctorProfileScreen());
        });
  }
}
