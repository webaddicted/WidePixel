import 'package:wallpaper/data/bean/CategoryBean.dart';

List<CategoryBean>  categoryBean() =>[
CategoryBean('Abstract', '',
'https://img.freepik.com/free-vector/gradient-liquid-abstract-background_52683-60469.jpg?size=626&ext=jpg'),
CategoryBean('Nature', '',
'https://bsmedia.business-standard.com/_media/bs/img/article/2020-07/28/full/1595904030-4016.jpg'),
CategoryBean('Architecture', '',
'https://static.dezeen.com/uploads/2021/05/oyo-architects-house-dede-belgium-residential-architecture_dezeen_sq3-411x411.jpg'),
CategoryBean('Animals', '',
'https://www.ucsf.edu/sites/default/files/2020-12/astonishing-animals-komodo-dragon-featured.jpg'),
CategoryBean(
'Portraits', '', 'https://jooinn.com/images/portrait-119.jpg'),
CategoryBean(
'Sea', '', 'https://i.ytimg.com/vi/QX4j_zHAlw8/maxresdefault.jpg'),
CategoryBean('Night', '',
'https://texasmotorplex.com/wp-content/uploads/2018/01/NightlightsRotator.jpg'),
CategoryBean('Cars', '', 'https://stimg.cardekho.com/images/carexteriorimages/360x240/Ferrari/Ferrari-488-GTB/047.jpg'),
CategoryBean('Street Art', '', 'https://wallpaperaccess.com/full/210623.jpg'),
CategoryBean('Dark', '', 'https://cdn.statically.io/img/www.wallpaperwolf.com/wallpapers/4k-wallpapers/4k/download/dark-forest-0131-4k.png'),
CategoryBean('Random', '', 'https://cdn.wallpapersafari.com/17/16/1lefPD.jpg'),
// list.add(CategoryBean('', '', ''));
];


colorCategoryBean() {
  List<CategoryBean> list = [];
  list.add(CategoryBean('Black', '#000000',
      'https://c4.wallpaperflare.com/wallpaper/636/353/280/spider-man-wallpaper-preview.jpg'));
  list.add(CategoryBean('White', '#FFFFFF',
      'https://bestwallpapers.in/wp-content/uploads/2018/04/cats-kitten-cute-white-brown-5k-wallpaper-2560x1600.jpg'));
  list.add(CategoryBean('Red', '#FF0000',
      'https://images.hdqwalls.com/wallpapers/red-mask-neon-eyes-4k-0k.jpg'));
  list.add(CategoryBean('Green', '#00FF00',
      'https://cdn.statically.io/img/wallpaperaccess.com/full/545792.jpg'));
  list.add(CategoryBean('Blue', '#0000FF',
      'https://www.printawallpaper.com/wp-content/uploads/2020/07/Blue_Guitar_on_Brick_Wall_dn.jpg'));
  list.add(CategoryBean(
      'Yellow', '#FFFF00', 'https://wallpapercave.com/wp/wp8106092.jpg'));
  list.add(CategoryBean('Violet', '#EE82EE',
      'https://images.alphacoders.com/110/thumb-1920-1103203.png'));
}
