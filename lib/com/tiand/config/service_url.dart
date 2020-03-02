//主url
//const serviceUrl = 'http://test.baixingliangfan.cn/baixing/';
const serviceUrl = 'http://10.0.2.2:5000/';
const serviceUrlStatic = 'http://10.0.2.2:5000/static';
//具体接口
const servicePath = {
//  'homePageContent':serviceUrl+'wxmini/homePageContent', //商店首页信息
  'homePageContent':serviceUrl+'pages/homePageContent/hehe', //商店首页信息
  'homePageInfoByName':serviceUrl+'pages/home_name/',
//  'homePageImgByMongo':serviceUrl+'pages/home_img/',  //首页轮播图片
  'homePageJumu':serviceUrl+'static/get_jumu/',  //首页轮播图片
  'homePageHuobao':serviceUrl+'static/get_huobao/',  //首页推荐图片
};