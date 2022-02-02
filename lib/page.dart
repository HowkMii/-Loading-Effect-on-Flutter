import 'package:flutter/material.dart';
import 'package:loading/card.dart';
import 'const.dart';
import 'howkmii.dart';

class HPage extends StatefulWidget {
  const HPage({Key? key}) : super(key: key);

  @override
  State<HPage> createState() => _HPageState();
}

class _HPageState extends State<HPage> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: _isLoading
            ? ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => const NewsCardSkelton(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: defaultPadding),
              )
            : ListView.separated(
                itemCount: 6,
                itemBuilder: (context, index) => HCard(
                  image: "assets/images/Image$index.png",
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: defaultPadding),
              ),
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Howkmii(height: 120, width: 120),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Howkmii(width: 80),
              const SizedBox(height: defaultPadding / 2),
              const Howkmii(),
              const SizedBox(height: defaultPadding / 2),
              const Howkmii(),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: const [
                  Expanded(
                    child: Howkmii(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Howkmii(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
