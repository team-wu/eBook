/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.18-log : Database - db_ebook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_ebook` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_ebook`;

/*Table structure for table `t_bigtype` */

DROP TABLE IF EXISTS `t_bigtype`;

CREATE TABLE `t_bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_bigtype` */

insert  into `t_bigtype`(`id`,`name`,`remarks`) values (1,'文学','<p>文学</p>'),(2,'军事','<p>军事</p>'),(3,'科学','<p>科学</p>'),(4,'教育','<p>教育</p>'),(6,'是2','<p>大发2</p>');

/*Table structure for table `t_book` */

DROP TABLE IF EXISTS `t_book`;

CREATE TABLE `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '书名',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `isbn` varchar(50) DEFAULT NULL COMMENT 'ISBN',
  `price` float DEFAULT NULL COMMENT '价格',
  `press` varchar(200) DEFAULT NULL COMMENT '出版社',
  `publishTime` date DEFAULT NULL COMMENT '出版时间',
  `kaiben` varchar(20) DEFAULT NULL COMMENT '开本',
  `mulu` text COMMENT '目录',
  `description` text COMMENT '简介',
  `smallTypeId` int(11) DEFAULT NULL COMMENT '小类别',
  `slide` smallint(6) DEFAULT NULL COMMENT '是否轮播0否1是',
  `yeshu` int(11) DEFAULT NULL COMMENT '页数',
  `zishu` int(11) DEFAULT NULL COMMENT '字数',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `click` int(11) DEFAULT NULL COMMENT '点击次数',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_book` */

insert  into `t_book`(`id`,`name`,`author`,`isbn`,`price`,`press`,`publishTime`,`kaiben`,`mulu`,`description`,`smallTypeId`,`slide`,`yeshu`,`zishu`,`pic`,`updateTime`,`click`,`stock`) values (3,'追风筝的人','卡勒德·胡赛尼','9787208061644',51,'上海人民出版社','2018-06-20','16开','<p>1第一部分：　　第1节：改变了一切 　　第2节：摔进水沟 　　第3节：凡人的国王 　　第4节：<a href=\"https://www.baidu.com/s?wd=%E6%88%91%E7%9A%84%E5%85%AC%E4%B8%BB&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\">我的公主</a> 　　第5节：痛击窃贼 　　第6节：厌恶溢于言表 　　第7节：市场闲逛 　　第8节：死于非命 2第二部分：第9节：血流成河 　　第10节：不锈钢拳套 　　第11节：一把新手枪 　　第12节：放风筝 　　第13节：无上的荣耀 　　第14节：风筝比赛 　　第15节：愚蠢的梦 　　第16节：送上不归路 3第三部分：第17节：财富的象征 　　第18节：一段记忆 　　第19节：崇高的目的 　　第20节：给炉子点火 　　第21节：<a href=\"https://www.baidu.com/s?wd=%E5%A4%B1%E7%9C%A0%E7%97%87&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\">失眠症</a> 　　第22节：尴尬和空虚 　　第23节：卷到大洋中间 　　第24节：生日快乐 　　4第四部分： 　第25节：血腥钱 　　第26节：继续生活 　　第27节：手掌拍死苍蝇 　　第28节：士兵老爷 　　第29节：<a href=\"https://www.baidu.com/s?wd=%E5%9B%BE%E5%B0%94&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\">图尔</a>的霉运 　　第30节：为光芒感恩 　　第31节：<a href=\"https://www.baidu.com/s?wd=%E5%8A%A0%E5%88%A9%E7%A6%8F%E5%B0%BC%E4%BA%9A&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\">加利福尼亚</a> 　　第32节：最后一件礼物 　　5第五部分： 第33节：需要一辆车 　　第34节：拥抱<a href=\"https://www.baidu.com/s?wd=%E7%BE%8E%E5%9B%BD&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\">美国</a> 　　第35节：改变一生 　　第36节：名誉和尊严 　　第37节：令人心碎 　　第38节：爸爸感冒了 　　第39节：枕头上有血 　　第40节：勇气</p>','<p>小说以第一人称的角度讲述了阿米尔的故事。阿米尔生于1963年<a href=\"https://baike.baidu.com/item/%E5%96%80%E5%B8%83%E5%B0%94\">喀布尔</a>的一个富人社区中的一个富裕家庭。其父亲“爸爸”是<a href=\"https://baike.baidu.com/item/%E6%99%AE%E4%BB%80%E5%9B%BE%E4%BA%BA\">普什图人</a>，一名法官的儿子，成功的地毯商人。阿米尔家的仆人阿里的儿子哈桑则出身<a href=\"https://baike.baidu.com/item/%E5%93%88%E6%89%8E%E6%8B%89%E4%BA%BA\">哈扎拉人</a>。阿米尔和哈桑是好玩伴，哈桑是一个特别忠实，正直，一心只为阿米尔少爷着想的人，两个人经常一起玩耍、游戏。阿米尔是出色的“风筝斗士”，即善于用自己的风筝切断别人的风筝的线；哈桑也是杰出的“风筝追逐者”，因为阿富汗斯坦的传统是线被切断而落下的风筝归追到它的人所有。爸爸对两个孩子都很喜爱，但嫌阿米尔过于怯懦。两个孩子和人打架时总是哈桑出头。阿米尔展露出写作的才华，但爸爸并不看重。爸爸的朋友拉辛汗成了阿米尔的忘年知己。1973年<a href=\"https://baike.baidu.com/item/%E7%A9%86%E7%BD%95%E9%BB%98%E5%BE%B7%C2%B7%E8%BE%BE%E4%B9%8C%E5%BE%B7%C2%B7%E6%B1%97\">穆罕默德·达乌德·汗</a>等发动政变，在<a href=\"https://baike.baidu.com/item/%E9%98%BF%E5%AF%8C%E6%B1%97%E6%96%AF%E5%9D%A6\">阿富汗斯坦</a>推翻帝制建立共和国。</p><p>社区中一个仰慕纳粹的<a href=\"https://baike.baidu.com/item/%E6%99%AE%E4%BB%80%E5%9B%BE%E6%97%8F\">普什图族</a>孩子阿塞夫和阿米尔、哈桑发生冲突。哈桑用弹弓维护了阿米尔。1975年，在一次风筝比赛中，阿米尔为了赢得爸爸的好感而勇夺冠军，哈桑则保证去追到第二名的风筝以证明阿米尔的战绩。但在哈桑的归途被阿塞夫等人截住。阿塞夫要哈桑把风筝给他，但哈桑不肯，于是他强暴了哈桑。这一切被阿米尔看到，但由于怯懦阿米尔没有挺身而出。</p><p>之后的日子里阿米尔由于无法面对哈桑而希望爸爸把阿里、哈桑解雇，被严词拒绝。于是阿米尔在13岁生日的晚上陷害哈桑，说他偷了自己的生日礼物。哈桑洞悉一切，而承认了偷窃。阿里和哈桑不顾爸爸的反对搬到了<a href=\"https://baike.baidu.com/item/%E5%93%88%E6%89%8E%E6%8B%89%E6%97%8F\">哈扎拉族</a>聚居的哈扎拉贾特山区。</p><p>1979年苏联入侵阿富汗斯坦，1981年爸爸带着阿米尔逃往到<a href=\"https://baike.baidu.com/item/%E5%B7%B4%E5%9F%BA%E6%96%AF%E5%9D%A6\">巴基斯坦</a><a href=\"https://baike.baidu.com/item/%E7%99%BD%E6%B2%99%E7%93%A6\">白沙瓦</a>，把家留给拉辛汗照看。后来阿米尔父子又迁到美国旧金山湾区的<a href=\"https://baike.baidu.com/item/%E8%B4%B9%E5%88%A9%E8%92%99\">费利蒙</a>居住。阿米尔在美国上大学，毕业之后成了作家，还在<a href=\"https://baike.baidu.com/item/%E5%9C%A3%E4%BD%95%E5%A1%9E\">圣何塞</a>的<a href=\"https://baike.baidu.com/item/%E8%B7%B3%E8%9A%A4%E5%B8%82%E5%9C%BA\">跳蚤市场</a>认识了同样来自阿富汗的一个将军塔赫里的女儿索拉雅，并和她结婚。爸爸在此期间因肺癌去世。阿米尔和索拉雅搬到了<a href=\"https://baike.baidu.com/item/%E6%97%A7%E9%87%91%E5%B1%B1\">旧金山</a>。他们想有一个孩子，但始终没能如愿。</p><p>2001年，<a href=\"https://baike.baidu.com/item/%E7%BD%B9%E6%82%A3\">罹患</a>绝症的拉辛汗从巴基斯坦给阿米尔打电话，让他去<a href=\"https://baike.baidu.com/item/%E5%B7%B4%E5%9F%BA%E6%96%AF%E5%9D%A6\">巴基斯坦</a>，因为“那儿有再次成为好人的路”。原来拉辛汗在阿米尔父子走后, 去哈扎拉贾特找到了哈桑及其母亲，他们一起回到喀布尔管理阿米尔家的大房子，哈桑还有了一个儿子索拉博。然而1996年塔利班占领喀布尔之后，强占了这个房子，还因为种族歧视当街枪毙了哈桑及其妻子。索拉博进了孤儿院。拉辛汗希望阿米尔回去<a href=\"https://baike.baidu.com/item/%E5%96%80%E5%B8%83%E5%B0%94\">喀布尔</a>救索拉博，但阿米尔不愿意。拉辛汗于是告诉阿米尔，哈桑其实是阿米尔爸爸的私生子。</p><figure class=\"image\"><img src=\"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=f8f01fffd662853596e0d523a0ee76f2/fc1f4134970a304e46bfc5f7d2c8a786c9175c19.jpg\" alt=\"追风筝的人\"></figure><p><a href=\"https://baike.baidu.com/pic/%E8%BF%BD%E9%A3%8E%E7%AD%9D%E7%9A%84%E4%BA%BA/3708735/14939858/fc1f4134970a304e46bfc5f7d2c8a786c9175c19?fr=lemma&amp;ct=cover\">追风筝的人(4张)</a></p><p>阿米尔在出租车司机法里德的帮助下回到<a href=\"https://baike.baidu.com/item/%E5%A1%94%E5%88%A9%E7%8F%AD\">塔利班</a>控制的喀布尔。在找到了索拉博所在的孤儿院之后，发现索拉博已经被一个塔利班头目带走，而这个头目会出现在足球赛上。阿米尔在球赛中约了这个头目，并在之后其住所见到了他。原来这个塔利班头目就是阿塞夫。阿塞夫在被苏联人扶植的共产党政权的监狱中受尽折磨之后加入塔利班，和苏军作战，成了一个头目。索拉博已经成了一个性侵犯的舞童。阿塞夫告诉阿米尔可以带走索拉博，但必须和他先处理一些陈年烂账。在屏蔽左右之后，阿塞夫戴上不锈钢拳套，轻松毒打毫无搏击经验的阿米尔，但不料索拉博用形影不离的弹弓打瞎了其左眼。阿米尔和索拉博这才趁机逃出。</p><p>在巴基斯坦首都<a href=\"https://baike.baidu.com/item/%E4%BC%8A%E6%96%AF%E5%85%B0%E5%A0%A1\">伊斯兰堡</a>，因为阿米尔无法证明索拉博是孤儿，而无法取得美国签证，从而收养索拉博。索拉博需要暂时入住孤儿院。出于对孤儿院的惧怕，索拉博割腕自杀，之后被救起。在阿米尔带着索拉博回到美国之后，索拉博因为感情受到伤害不再和任何人交流。在2001年九一一事件之后的一个周末，在一个公园里，索拉博终于因为追风筝对阿米尔微笑。</p>',1,1,425,74125,'static/images/book/1529928852310.jpg','2018-06-25 20:14:12',84,100),(4,'肖申克的救赎','[美]斯蒂芬·金 ','435645645',108,'上海人民出版社','1982-01-01','16开','<p><a href=\"http://www.99lib.net/book/1907/52975.htm\">第一节</a></p><p><a href=\"http://www.99lib.net/book/1907/52976.htm\">第二节</a></p><p><a href=\"http://www.99lib.net/book/1907/52977.htm\">第三节</a></p><p><a href=\"http://www.99lib.net/book/1907/52978.htm\">第四节</a></p><p><a href=\"http://www.99lib.net/book/1907/52979.htm\">第五节</a></p><p><a href=\"http://www.99lib.net/book/1907/52980.htm\">第六节</a></p><p><a href=\"http://www.99lib.net/book/1907/52981.htm\">第七节</a></p><p><a href=\"http://www.99lib.net/book/1907/52982.htm\">第八节</a></p><p><a href=\"http://www.99lib.net/book/1907/52983.htm\">第九节</a></p><p><a href=\"http://www.99lib.net/book/1907/52984.htm\">第十节</a></p><p><a href=\"http://www.99lib.net/book/1907/52985.htm\">第十一节</a></p><p><a href=\"http://www.99lib.net/book/1907/52986.htm\">第十二节</a></p><p><a href=\"http://www.99lib.net/book/1907/52987.htm\">第十三节</a></p><p><a href=\"http://www.99lib.net/book/1907/52988.htm\">第十四节</a></p><p><a href=\"http://www.99lib.net/book/1907/52989.htm\">第十五节</a></p><p><a href=\"http://www.99lib.net/book/1907/52990.htm\">第十六节</a></p><p><a href=\"http://www.99lib.net/book/1907/52991.htm\">第十七节</a></p><p><a href=\"http://www.99lib.net/book/1907/52992.htm\">第十八节</a></p><p><a href=\"http://www.99lib.net/book/1907/52993.htm\">第十九节</a></p><p><a href=\"http://www.99lib.net/book/1907/52994.htm\">第二十节</a></p><p><a href=\"http://www.99lib.net/book/1907/52995.htm\">第二十一节</a></p><p><a href=\"http://www.99lib.net/book/1907/52996.htm\">第二十二节</a></p><p><a href=\"http://www.99lib.net/book/1907/52997.htm\">第二十三节</a></p><p><a href=\"http://www.99lib.net/book/1907/52998.htm\">第二十四节</a></p><p><a href=\"http://www.99lib.net/book/1907/52999.htm\">第二十五节</a></p><p><a href=\"http://www.99lib.net/book/1907/53000.htm\">第二十六节</a></p><p><a href=\"http://www.99lib.net/book/1907/53001.htm\">第二十七节</a></p><p><a href=\"http://www.99lib.net/book/1907/53002.htm\">第二十八节</a></p><p><a href=\"http://www.99lib.net/book/1907/53003.htm\">第二十九节</a></p><p><a href=\"http://www.99lib.net/book/1907/53004.htm\">第三十节</a></p><p><a href=\"http://www.99lib.net/book/1907/53005.htm\">第三十一节</a></p><p><a href=\"http://www.99lib.net/book/1907/53006.htm\">第三十二节</a></p><p><a href=\"http://www.99lib.net/book/1907/53007.htm\">第三十三节</a></p><p><a href=\"http://www.99lib.net/book/1907/53008.htm\">第三十四节</a></p><p><a href=\"http://www.99lib.net/book/1907/53009.htm\">第三十五节</a></p><p><a href=\"http://www.99lib.net/book/1907/53010.htm\">后记</a></p>','<p>小说的背景是20个世纪30年代，那时，“美国的政治腐败已经迟到</p><figure class=\"image\"><img src=\"https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=98907577af6eddc422e7b3f909dab6a2/b8014a90f603738d3f1357b0b11bb051f919ecc3.jpg\" alt=\"《肖申克的救赎》小说-封面\"></figure><p>《肖申克的救赎》小说-封面 了商人面前”，甚至波及到了监狱。故事中，年轻的银行家安迪因为妻子和她的情人被杀而被判无期徒刑，由于监狱的腐败，他在真相即将大白的情况下仍然得不到昭雪，反而在肖申克监狱饱受了各种精神上和肉体上的摧残。然而，安迪并没有被多舛的命运毁掉，他经过20多年水滴石穿般地不懈挖掘，终于在一个雷雨交加的夜晚，从500码长的污粪管道中爬出，重获自由，在墨西哥海边过上了自由人的生活。</p>',1,1,420,85000,'static/images/book/1529928559334.jpg','2018-06-25 20:09:19',38,100),(5,'查无此人','于是','9787020128723',49,'人民文学出版社','2018-03-01','32开','<p>目录</p><p>冬</p><p>春</p><p>夏</p><p>秋</p><p>后记</p>','<p>&nbsp; &nbsp; &nbsp; &nbsp; 子清，自小缺失家族观念，是生长于改革开放时代的新一代都市移民后代，&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;浪迹天涯是一种理想，也是一种无根的无奈。子清被迫承担起照顾父亲的重责，因此彻底改变了原有的生活方式，作品深刻、细腻地描写了都市养老现况，在老龄化日益严重的时代里，这样的记录极具现实意义。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;子清不得不去东北替父寻亲，也在此过程中，惊讶地发现父母的命运和那段历史息息相关，诧异于远亲印象中的父母和自己所认识的父母是截然不同的。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;父亲的病，犹如隐喻，意味着一代历史的消隐，一方面是当事人的主动忘却，另一方面是客观的因病而忘，结果便是后代的无知，上一代的人生无法得到证据。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;在表层的寻亲访故场景之后，作为隐线的内省增添了作品的精神内核，将失智、失忆作为动乱年代既得利益者的回忆的隐喻体，含蓄表达了这一代中老年对中国近代史的态度——</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;失去记忆的老人，也很快被遗忘、被告别，恰如他所经历的那整个动荡的时代。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;寻找记忆的中年人，则陷入不可考的时代泥沼，一切只能归结于想象。传统、历史、家族……这些厚重的生命附加值在这一代人的日常生活中逐渐隐没，但她们也将拥有这一代人所独有的生命印记，在非家族化的城市人际关系中继续领略生老病死的意义。</p>',1,1,352,562520,'static/images/book/1529928253236.jpg','2018-06-25 20:04:13',41,100),(6,'没有凶手的暗夜','[日]东野圭吾 著','9787020134908',39,'人民文学出版社','2018-01-01','32','<p>小小的恶作剧故事黑暗中的两个人舞女无尽之夜白色凶器!别了，教练 没有凶手的暗夜&nbsp;</p>','<p>东野圭吾短篇小说代表作，囊括七篇推理杰作　　唐泽寿明、坂口宪二、三浦春马、户田惠梨香　　联袂演绎同名日剧，富士电视台东野圭吾悬疑剧场原著</p><p>　　以高中校园为故事舞台的《小小故意事件》，以白领职场为故事舞台的《白色凶器》，问题家庭麻烦百出的《没有凶手的暗夜》，射箭训练队员告白的《再见了，教练》，难以忍受分居两地的《无尽长夜》…… 木曜剧场《东野圭吾悬疑剧场》原作。</p>',1,1,244,485201,'static/images/book/1529928366858.jpg','2018-06-25 20:06:06',17,100),(7,'穿透烟雾的记忆',' [以]阿哈龙·阿佩尔菲尔德','9787020139163',36,'人民文学出版社','2018-05-01','32开','<p>&nbsp;</p>','<p>《穿透烟雾的记忆》是阿哈龙•阿佩尔菲尔德的自传体小说。</p><p>主人公“我”1932年出生于犹太中产阶级的家庭，“二战”爆发时居住于罗马尼亚。“我”目睹了母亲的遇害，之后与父亲走散，在贫民区度过了一段日子，又在被押往集中营的途中颠沛流离长达两个月。在出逃后，“我”在乌克兰的森林里度过了两年的时光，此后南下意大利，*终来到以色列，在那里重新寻回平静、获得自由。</p><p>这位备受称誉的犹太作家将童年及青年时代那不同寻常的痛苦回忆以小说的形式记录下来，以动人心弦的笔触描述了他如何在充满敌意的世界里由少年步入了成人时代。</p>',1,1,450,50000,'static/images/book/1529929187231.jpg','2018-06-25 20:19:47',21,100),(8,'刻骨铭心','叶兆言','9787020134458',59,'人民文学出版社','2018-04-01','32开','<p>第*章 哈萨克斯坦</p><p>烈女游娜&nbsp;</p><p>作家努尔扎克</p><p>第二章 1926 年的大明照相馆 31</p><p>在大明照相馆的留影</p><p>刺杀冯焕庭&nbsp;</p><p>第三章 黄金十年</p><p>亚声的遗骸</p><p>雨花台下&nbsp;</p><p>第四章 爱住金陵为六朝</p><p>希俨参与了首都计划</p><p>高云岭45 号</p><p>成了电影明星的秀兰</p><p>第五章 新都游览指南</p><p>秦淮河畔</p><p>金陵王气黯然收</p><p>虎贲之师</p><p>第六章 鸡鸣落日</p><p>国际安全区</p><p>在南京的阿瑟丹尼尔</p><p>清凉古道上的刺客</p><p>第七章 摵摵萧萧里</p><p>王可大的告白</p><p>天若有情天亦老</p><p>国民代表大会&nbsp;</p><p>后 记</p><p>有点多余的匆匆结尾</p>','<p>上世纪二三十年代，在中国历史上是个很特殊的时期，军阀混战，日军侵华，而南京，则处于这一切的风口浪尖之上，《刻骨铭心》则聚焦了当时南京各个阶层的生活，小说中的各路人物在这里都经历了刻骨铭心的人生。如《钟山》杂志评价所说：“小说让耳熟能详的历史事件虚化后退，请虚构的人物站上舞台中心，通过对一系列历史碎片的打捞与拼贴，将焦点集中在个体生命在大时代波浪翻滚下的命运起伏和生存处境。作者以平静的笔触，独特的视角，让历史与当下并行互文，勾画了一幅个体生命与混乱时代相互交融、激荡飘摇的风俗世情画卷。”</p><p>个体在大时代背景下，终究是小人物。他们的青春、热血、得意、失意、爱情、兄弟情、痛苦、悲伤，也终究在纸页上，化为清泪。</p>',1,0,432,50000,'static/images/book/1529928318108.jpg','2018-06-25 20:05:18',27,100),(9,'千江有水千江月','萧丽红','9787020139071',49,'人民文学出版社','2018-02-01','32开','<p>&nbsp;</p>','<p>千山同一月，万户尽皆春。</p><p>千江有水千江月，万里无云万里天。</p><p>生于世代以养殖渔业维生的大家庭，主角贞观遇到从台北初到布袋镇的表哥大信，两人开始了一场若有似无的爱恋。后来贞观上台北工作、大信到金门当兵，两人之间产生了误解，美好的情愫因此也产生了令人唏嘘的变化，一切就像镜中花、水中月，淡淡的，看似若有若无，却又萦绕心间，久久生挥之不去。故事以布袋的萧姓大家族为中心，叙述传统大家庭的习俗和人情琐碎，并探讨生死、亲情、爱情的冲突与矛盾。</p><p>在萧丽红的叙述中，充满了台湾民俗的瑰丽与趣味，而贞观与大信古典又含蓄的恋情，为这个时代逐渐失去的纯然恋歌，悠悠地低吟了一遍。</p>',1,0,452,100000,'static/images/book/1529928409300.jpg','2018-06-25 20:06:49',33,100),(10,'半小时漫画世界史1','陈磊1','3453453451',45.1,'大发光火人发的规划1','2018-07-11','31开','<p>复合肥大富大贵1</p>','<p>后就可以和健康1</p>',2,1,41,452341,'static/images/book/1530450663581.jpg','2018-07-02 19:32:50',5,51);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `orderNo` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`cost`,`createTime`,`orderNo`,`status`,`userId`) values (1,0,'2018-06-26 18:26:39','20180626062639',4,3),(2,0,'2018-06-26 18:41:05','20180626064105',2,3),(3,0,'2018-06-26 18:42:30','20180626064230',1,3),(4,0,'2018-06-26 18:45:12','20180626064512',1,3),(5,0,'2018-06-26 18:46:49','20180626064649',1,3),(6,108,'2018-06-28 14:09:09','20180628020909',3,3),(7,136,'2018-06-28 18:30:37','20180628063037',3,1),(8,200,'2018-07-01 21:05:46','20180701090546',1,3),(9,255,'2018-07-01 21:15:11','20180701091511',4,3),(10,267,'2018-07-07 11:07:44','20180707110744',1,3),(11,159,'2018-07-07 11:47:18','20180707114718',1,3),(12,202,'2018-07-09 22:10:59','20180709101058',1,12),(13,180,'2018-07-13 21:59:20','20180713095919',3,15),(14,138,'2018-07-14 22:51:07','20180714105106',3,17);

/*Table structure for table `t_order_book` */

DROP TABLE IF EXISTS `t_order_book`;

CREATE TABLE `t_order_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `t_order_book` */

insert  into `t_order_book`(`id`,`num`,`orderId`,`bookId`) values (1,2,1,4),(2,1,1,3),(3,1,2,6),(4,3,3,5),(5,2,4,3),(6,1,5,6),(7,1,6,5),(8,1,6,8),(9,1,7,5),(10,1,7,7),(11,1,7,3),(12,2,8,3),(13,2,8,9),(14,2,9,4),(15,1,9,6),(16,2,10,4),(17,1,10,3),(18,1,11,3),(19,1,11,4),(20,3,12,3),(21,1,12,5),(22,2,13,3),(23,2,13,6),(24,2,14,3),(25,1,14,7);

/*Table structure for table `t_smalltype` */

DROP TABLE IF EXISTS `t_smalltype`;

CREATE TABLE `t_smalltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `bigTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_smalltype` */

insert  into `t_smalltype`(`id`,`name`,`remarks`,`bigTypeId`) values (1,'小说22','<p>各种小说2</p>',1),(2,'计算机','<p>各种计算机书籍</p>',3),(3,'武器','<p>11</p>',2);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trueName` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `identityCode` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`trueName`,`userName`,`password`,`sex`,`birthday`,`identityCode`,`email`,`mobile`,`address`,`status`) values (1,'张三','admin','123456','男','2018-06-22','21010420180622','zs@sina.com','18888888888','火星',2),(3,'贾斌1','binbin','1231','女','2018-06-26','210104198205193711','kyu1@sina.com','15505258141','dfgds1',1),(4,'张三','小三','123','男','2018-06-26','123456789012345678','kyu@sina.com','12345678901','dfgds',1),(5,'李四','小四','123','男','2018-06-26','123456789012345678','kyu@sina.com','12345678901','dfgds',1),(6,'d','d','d','男','2018-06-12','123456789012345678','kyu@sina.com','12345678901','d',1),(7,'e','e','e','男','2018-06-12','123456789012345678','kyu@sina.com','12345678901','e',1),(11,'发给2','风格化2','342','女','2018-07-01','210104198205193712','2kyu@sina.com','234534532','添加对方国家和地方2',1),(12,'张三','zhangsan','123','男','2018-07-26','123456789034567890','232@qq.com','11111111111','23',1),(13,'32','32','32','男','2018-06-27','332','323a@qq.com','32','32',1),(14,'二小','abcd','1234','男','2018-07-11','123456789034567890','21312@qq.com','11111111111','safsad',1),(15,'牛牛','niuniu','123456','男','2018-07-13','123456789034567890','21423@qq.com','11111111111','safsad',1),(16,'32','32','32','男','2018-07-04','32','323a@qq.com','32','32',NULL),(17,'先111','qq1234','1234','男','2018-07-18','123456789034567890','21423@qq.com','11111111111','safsad',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
