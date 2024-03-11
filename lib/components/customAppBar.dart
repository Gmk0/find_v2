import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(54);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool showNotificationArea = true;

  @override
  Widget build(BuildContext context) {
    ScaffoldState scaffoldState = Scaffold.of(context);
    return AppBar(
      toolbarHeight: 57,
      backgroundColor: lightBG,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          scaffoldState.isDrawerOpen == false
              ? scaffoldState.openDrawer()
              : scaffoldState.closeDrawer();
        },
        child: Icon(
          Icons.sort_rounded,
          color: skinFill,
          size: 28,
        ),
      ),
      centerTitle: true,
      title: Center(
        child: Image.asset(
          'assets/images/find_02.png',
          height: 32,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            showNotificationDialog();
          },
          child: Container(
            margin:
                const EdgeInsets.only(right: 25, top: 20, bottom: 6, left: 20),
            padding: const EdgeInsets.only(left: 5, right: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: skinFill,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.notifications,
                color: skinFill,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future showNotificationDialog() {
    return showGeneralDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        barrierLabel: "FIND",
        pageBuilder: (_, __, ___) {
          return Stack(
            alignment: Alignment.topRight,
            fit: StackFit.loose,
            children: [
              Container(
                height: 233,
                width: 210,
                margin: EdgeInsets.only(top: 90, right: 16),
                // padding: EdgeInsets.only(left: 10.w, top: 2.h),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 5, spreadRadius: 1),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: 15.h,
                      //   color: Colors.transparent,
                      //   child: Icon(Icons.play_arrow_rounded),
                      // ),
                      // Positioned(
                      //   child: Icon(Icons.play_arrow_rounded),
                      // ),
                      Container(
                        height: 32,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, top: 2),
                        decoration: BoxDecoration(
                          color: skinFill,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        child: DefaultTextStyle(
                          child: Text("Notification"),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: _buildListTile(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _buildListTile() {
    return ListView.separated(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 5,
      padding: EdgeInsets.all(0),
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 1,
        indent: 5,
        endIndent: 5,
        color: greyColor3,
      ),
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(
            "Knowledge Repository Published to you",
            // style: LmsTextUtil.textRoboto11(),
          ),
          subtitle: Text(
            "date",
            // formatDateTime(),
            style: TextStyle(
              color: greyColor3,
              fontWeight: FontWeight.w500,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(left: 12, right: 8, top: 0, bottom: 0),
          minVerticalPadding: 10,
          horizontalTitleGap: 0,
          minLeadingWidth: 0,
          dense: true,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        );
      },
    );
  }
}
