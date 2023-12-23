import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.transparent,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 80,
                  height: 40,
                  child: TextField(
                    controller: logic.searcherController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      fillColor: Colors.grey,
                      hintText: '搜索...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    onSubmitted: (value) {
                      logic.getInfoList(value);
                    },
                    onChanged: (value){
                      logic.text.value = value;
                    },
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {

                  },
                  child: Obx(() {
                    return logic.text.value.isEmpty ? const Text(
                      '确定',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ) : GestureDetector(
                      onTap: (){
                       logic.searcherController.text = '';
                       logic.text.value ='';
                      },
                      child: const Text(
                        '取消',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  })
                )
              ],
            ),
          ),
          Obx(() {
            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: () {
                      final Uri url = Uri.parse(logic.inFowList[index].alt);
                      launchUrl(url);
                    },
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Row(
                        children: [
                          ExtendedImage.network(logic.inFowList[index].alt,
                            headers: const {'referer': ''},
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 150,
                                child: Row(
                                  children: [
                                    SizedBox(width: 180, child: Text(
                                      logic.inFowList[index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1, // 设置最大行数为1
                                    ),),
                                    SizedBox(width: 50, child: Text(
                                      '(${logic.inFowList[index].year})',
                                      style: const TextStyle(
                                          color: Colors.grey),
                                    ),)
                                  ],
                                ),
                              ),
                              Text(
                                '${logic.inFowList[index].rating.average}',
                                style: const TextStyle(color: Colors.orange),

                              ),
                              Row(
                                children: [
                                  const Text(
                                    '电影',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    '英国 美国',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(logic.inFowList[index].genres[0],
                                      style: const TextStyle(
                                          color: Colors.grey)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }, childCount: logic.inFowList.length));
          })
        ],
        // children: [
        //   // Row(
        //   //   mainAxisAlignment: MainAxisAlignment.center,
        //   //   children: [
        //   //     SizedBox(
        //   //       width: MediaQuery.of(context).size.width - 50,
        //   //       height: 40,
        //   //       child: const TextField(
        //   //         decoration: InputDecoration(
        //   //           contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        //   //           fillColor: Colors.grey,
        //   //           hintText: '搜索...',
        //   //           prefixIcon: Icon(Icons.search),
        //   //           border: OutlineInputBorder(
        //   //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //   //           ),
        //   //         ),
        //   //       ),
        //   //     ),
        //   //     const SizedBox(width: 5,),
        //   //     GestureDetector(
        //   //       child: const Text(
        //   //         '取消',
        //   //         style: TextStyle(
        //   //             color: Colors.green,
        //   //             fontSize: 18,
        //   //             fontWeight: FontWeight.bold),
        //   //       ),
        //   //     )
        //   //   ],
        //   // ),
        //   SliverList(delegate: SliverChildBuilderDelegate((context,index){
        //     return Container(
        //       child: Row(
        //         children: [
        //           Image.network('https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&step_word=&hs=0&pn=0&spn=0&di=7264239678495129601&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=906691340%2C2557737291&os=2135671293%2C1475933711&simid=3431096758%2C315878849&adpicid=0&lpn=0&ln=1008&fr=&fmq=1703309154249_R&fm=&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=https%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F7f%2Fdb%2Fc0%2F7fdbc067cb38b6ffb295430ddae8757b.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bjgpj61jfh_z%26e3Bv54AzdH3F15ogs5w1AzdH3Fdma00-8mc88nAzdH3F&gsm=1e&rpstart=0&rpnum=0&islist=&querylist=&nojc=undefined&dyTabStr=MCwzLDEsMiw2LDQsNSw4LDcsOQ%3D%3D&lid=8540147550599541775')
        //         ],
        //       ),
        //     );
        //   },childCount: 10))
        // ],
      ),
    );
  }
}
