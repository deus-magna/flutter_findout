import 'dart:ui';

import 'package:find_out/framework/custom_icons.dart';
import 'package:find_out/widgets/interact_button.dart';
import 'package:find_out/widgets/rounded_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _backgroundImage(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/home_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ));
  }

  Widget _buildContent(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          _buildTopBar(context),
          SizedBox(height: 58),
          _buildCategory(context),
          _buildHeader(context),
          _buildScrollIndicators(),
          Expanded(child: SizedBox(height: 1)),
          _buildBlurCard(context)
        ],
      ),
    );
  }

  Container _buildBlurCard(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.365,
      color: Colors.black.withOpacity(0.63),
      child: _buildBlurCardContent(context),
    );
  }

  Padding _buildScrollIndicators() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Padding _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 73),
      child: RichText(
        text: TextSpan(
          text: 'Coktails\n',
          style: Theme.of(context).textTheme.headline2,
          children: <TextSpan>[
            TextSpan(
                text: 'Luango',
                style: Theme.of(context).textTheme.headline1,),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedIcon(iconData: CustomIcons.settings),
          Row(
            children: [
              Text(
                'Zihuatanejo, México',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                width: 12,
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          RoundedIcon(iconData: CustomIcons.profile),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3)),
          child: Row(
            children: [
              Text(
                'Buscar categoria',
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(width: 35),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3)),
          child: Row(
            children: [
              Icon(CustomIcons.vista),
              SizedBox(width: 12),
              Text(
                'Vista',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBlurCardContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 43),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50),
          Text(
            'Información',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 16),
          Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InteractButton(
                text: '20',
                iconData: Icons.favorite_border,
                onPressed: () {},
              ),
              SizedBox(width: 60),
              InteractButton(
                text: '5',
                iconData: CustomIcons.comment,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            children: [
              Icon(Icons.keyboard_arrow_up),
              Text('desliza hacia arriba', style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 10, fontWeight: FontWeight.w500),)
            ],
          )
        ],
      ),
    );
  }
}
