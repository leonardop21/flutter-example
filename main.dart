@override
  void initState(context){
    print('iniciou o initState()');
    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg){
        print("chamou onLaunch ------- ${(msg)}");
        _goToDeeplyNestedView();
      },
      onResume: (Map<String, dynamic> msg){

        print("chamou onResume antes -------");
        _goToDeeplyNestedView();
        print("chamou onResdume depois dd------- ${(msg)}");

      },
      onMessage: (Map<String, dynamic> msg){
        print("chamou onMessage ------- ${(msg)}");

        _goToDeeplyNestedView();

      }
    );

    firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(
        sound: true,
        alert: true,
        badge: true
      )
    );
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings setting) {
      print('Configurações do IOS registradas');
    });
    firebaseMessaging.getToken().then((token){
      update(token);
    });
  }




  FUNÇÃO _goToDeeplyNestedView



_goToDeeplyNestedView() {
      var _img = 'image.png';
      var _video_id = 22;
      var _title = 'Titulo da notícia';
      var _date = '20/08/2019 às 23:21';
      var _description = 'Descrição notícia';
      var _category = 'Brasil';
      var _link = 'https://globo.com';
      var _origin = 'globo';

      print('chamou a funcao view ${_title}');

      Navigator.push(navigatorKey.currentContext, MaterialPageRoute(builder: (_) => DetailPage(_img, _video_id, _title, _date, _description, _category, _link, _origin)));

      print('chamou navigator');

}
