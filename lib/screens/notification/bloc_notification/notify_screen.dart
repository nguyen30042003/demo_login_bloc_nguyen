
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/data_app/models/notify_count_request.dart';
import 'package:login/data_app/models/notify_type.dart';
import 'package:login/data_app/repository/notify_repository.dart';
import 'package:login/screens/notification/bloc_notification/notify_bloc.dart';
import 'package:login/screens/notification/bloc_notification/notify_state.dart';
import 'package:login/screens/notification/notify_page_screen.dart';
import 'package:login/utils/pallete.dart';
import 'package:badges/badges.dart' as badgeLib;

import '../../../utils/app_images.dart';
import 'notify_event.dart';



class NotifyScreen extends StatefulWidget {
  const NotifyScreen({super.key});

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {

  final PageController _controller = PageController(viewportFraction: 1.0);
  int _selectedMenuIndex = 0;

  int _tradePromotionUnread = 0;
  int _otherTradeUnread = 0;
  int _noteUnread = 0;
  int _totalUnread = 0;
  int _otherUnread = 0;
  @override
  void initState(){
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    NotifyCountRequest notifyCountRequest = NotifyCountRequest(fromDate: "11/01/2024", toDate: "11/01/2024", langId: "vi");
    return BlocListener<NotifyBloc, NotifyState>(
      listener: (context, state){
        if(state is TotalNotificationLoaded){
          _tradePromotionUnread = state.tradePromotionUnRead ?? 0;
          _otherTradeUnread = state.otherTradeUnRead ?? 0;
          _noteUnread = state.noteUnRead ?? 0;
          _totalUnread = state.totalUnread ?? 0;
          _otherUnread = state.otherUnRead ?? 0;
        }

        else if (state is ChangeIndexPageState) {
          _selectedMenuIndex = state.index;
        }
      },
      child:BlocBuilder<NotifyBloc, NotifyState>(
          builder: (context, state) {
            return  Scaffold(
              backgroundColor: Pallete.background1Color,
              body: Column(
                children: <Widget>[
                  _appBar(),
                  _buildForm()
                ],
              ),
            );
          }
      ),
    );
  }

  Widget _appBar(){
    return Container(
      padding: EdgeInsets.only(top:  MediaQuery.of(context).size.height / 20),
      decoration: BoxDecoration(
        color: Pallete.background2Color,
        image: DecorationImage(
          image: AssetImage(AppImages.getImages('bg_notify.png')),
          fit: BoxFit.cover,
        ),
      ),
      child: _buildAppbar(),
    );
  }
  Widget _buildAppbar() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 34,
                  margin: const EdgeInsets.only(left: 16),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: const Text(
                      "Thông báo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const FaIcon(FontAwesomeIcons.checkDouble, color: Colors.white, size: 22,),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 15,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const FaIcon(FontAwesomeIcons.sliders, color: Colors.white, size: 22,),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 50,
              child: _tabs()
          ),
        ],
      ),
    );
  }


  Widget _tabs() {
    return  Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTab(name: "Tất cả", index: 0, counterBadge: _totalUnread,  onPress: () => _onItemTapped(0),),
          _buildTab(name: "Trade khuyến mãi", index: 1, counterBadge: _tradePromotionUnread,  onPress: () => _onItemTapped(1)),
          _buildTab(name: "CT khuyến mãi khác", index: 2, counterBadge: _otherTradeUnread,  onPress: () => _onItemTapped(2),),
          _buildTab(name: "Ghi chú", index: 3, counterBadge: _noteUnread,  onPress: () => _onItemTapped(3)),
          _buildTab(name: "Khác", index: 4, counterBadge: _otherUnread,  onPress: () => _onItemTapped(4)),
        ],
      ),
    );
  }


  Widget _buildForm() {
    return Expanded(
      child: PageView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          pageSnapping: true,
          children: const <Widget>[
            NotifyPageScreen(type: NotifyType.All),
            NotifyPageScreen(type: NotifyType.AutoPromoTrade),
            NotifyPageScreen(type: NotifyType.OtherTrade),
            NotifyPageScreen(type: NotifyType.WorkingNote),
            NotifyPageScreen(type: NotifyType.Other),
          ]
      ),
    );
  }


  Widget _buildTab({
    required Function onPress,
    required String name,
    required int index,
    int counterBadge = 0,
  }) {
    double marginRight = 5.0;
    double marginLeft = 5.0;
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      child: counterBadge == 0
          ? Container(
        padding: const EdgeInsets.all(5),
        child: RawMaterialButton(
          onPressed: () {
            if (index != _selectedMenuIndex) onPress();
          },
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            side: BorderSide(
              color: index != _selectedMenuIndex ? Colors.white : Pallete.colorPrimary,
            ),
          ),
          fillColor: index == _selectedMenuIndex ? Colors.white : Pallete.colorPrimary.withOpacity(0.5),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            child: Text(
              name,
              style: TextStyle(
                color: index != _selectedMenuIndex ? Colors.white : Pallete.colorPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
      : badgeLib.Badge(
        position: badgeLib.BadgePosition.topEnd(top: counterBadge < 10 ? -3 : 0, end: 1),
        badgeContent: Container(
          padding: counterBadge < 10 ? EdgeInsets.symmetric(horizontal: 2, vertical: 2) : EdgeInsets.zero,
          child: Text(
            '$counterBadge',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 10),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: RawMaterialButton(
            onPressed: () {
              if (index != _selectedMenuIndex) onPress();
            },
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              side: BorderSide(
                  color: index != _selectedMenuIndex ? Colors.white : Pallete.colorPrimary),
            ),
            fillColor: index == _selectedMenuIndex ? Colors.white : Pallete.colorPrimary.withOpacity(0.5),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              child: Text(
                name,
                style: TextStyle(
                  color: index != _selectedMenuIndex ? Colors.white : Pallete.colorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _onItemTapped(int index) async {
    final notifyBloc = BlocProvider.of<NotifyBloc>(context);
    notifyBloc.add(ChangeIndexPageEvent(index: index));
    _controller.jumpToPage(index);
  }
}
