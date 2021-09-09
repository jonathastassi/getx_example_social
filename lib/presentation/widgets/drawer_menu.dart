import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/home/home_page.dart';
import 'package:getx_example_social/presentation/pages/user_list/user_list_page.dart';

class DrawerMenu extends Drawer {
  DrawerMenu()
      : super(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text('JT'),
                ),
                accountName: Text('Jonathas'),
                accountEmail: Text('jonathastassi@hotmail.com'),
              ),
              ListTile(
                onTap: () => Get.offAllNamed(HomePage.route),
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                onTap: () => Get.offAllNamed(UserListPage.route),
                leading: Icon(Icons.people),
                title: Text('Users'),
              ),
            ],
          ),
        );
}
