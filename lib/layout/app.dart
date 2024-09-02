import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContentView extends StatelessWidget {
  final Widget child;
  const ContentView({required this.child}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
      sizingInformation.deviceScreenType == DeviceScreenType.desktop
          ? TextAlign.left
          : TextAlign.center;

      double titleSize =
      sizingInformation.deviceScreenType == DeviceScreenType.mobile
          ? 30
          : 50;
      double descriptionSize =
      sizingInformation.deviceScreenType == DeviceScreenType.mobile
          ? 16
          : 21;

      return Container(
        width: 700,
        margin: EdgeInsets.only(top: 80),
        child: Align(
          alignment: sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? Alignment.centerLeft
              : Alignment.center,
          child: Column(
            crossAxisAlignment: sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'FLUTTER WEB.\nTHE BASICS',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  height: 0.9,
                  fontSize: titleSize,
                ),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus libero, consequat non posuere in, condimentum pharetra ex. Mauris mattis leo nec felis varius consectetur. Quisque sodales justo dolor, non eleifend erat ultricies sed. Duis vel lacus at tortor tristique scelerisque a et risus. Praesent rutrum finibus mi semper volutpat. Proin mollis, quam vel feugiat gravida, eros ante tincidunt elit, eget dignissim libero odio et ex. In ultrices orci vitae arcu porta pharetra. Etiam elementum quam sit amet lacinia blandit. Integer tincidunt nisi in neque vulputate, sit amet fermentum turpis vulputate. Suspendisse molestie scelerisque tristique. Proin efficitur ante orci, vitae bibendum erat lobortis luctus.',
                style: TextStyle(
                  fontSize: descriptionSize,
                  height: 1.7,
                ),
                textAlign: textAlignment,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ActionButtonLg extends StatelessWidget {
  final String title;
  const ActionButtonLg(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 31, 229, 146),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class ActionButtonSm extends StatelessWidget {
  final String title;
  const ActionButtonSm(this.title);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 31, 229, 146),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  ActionButton(this.title);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => ActionButtonSm(title),
      tablet: (BuildContext context) => ActionButtonLg(title),
    );
  }
}