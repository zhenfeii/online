/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : online

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2018-07-20 17:25:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) DEFAULT NULL,
  `subject_id` int(6) NOT NULL COMMENT '科目id',
  `release_time` date DEFAULT NULL COMMENT '发布时间',
  `score` varchar(255) DEFAULT NULL COMMENT '考试分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='考生成绩单';

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '1', '1', '2018-07-05', '92');
INSERT INTO `grade` VALUES ('2', '1', '2', '2018-07-05', '98');
INSERT INTO `grade` VALUES ('3', '1', '3', '2018-07-05', '50');
INSERT INTO `grade` VALUES ('4', '1', '4', '2018-07-05', '60');
INSERT INTO `grade` VALUES ('5', '1', '5', '2018-07-04', '23');
INSERT INTO `grade` VALUES ('6', '1', '6', '2018-07-18', '78');
INSERT INTO `grade` VALUES ('7', '1', '7', '2018-07-20', '56');
INSERT INTO `grade` VALUES ('8', '1', '9', '2018-07-24', '23');

-- ----------------------------
-- Table structure for kskm
-- ----------------------------
DROP TABLE IF EXISTS `kskm`;
CREATE TABLE `kskm` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `subject` varchar(10) DEFAULT NULL COMMENT '科目名称',
  `teacher` varchar(10) DEFAULT NULL COMMENT '监考老师',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='考试科目';

-- ----------------------------
-- Records of kskm
-- ----------------------------
INSERT INTO `kskm` VALUES ('1', '语文', '于老师');
INSERT INTO `kskm` VALUES ('2', '数学', '学老师');
INSERT INTO `kskm` VALUES ('3', '英语', '英老师');
INSERT INTO `kskm` VALUES ('4', '历史', '历老师');
INSERT INTO `kskm` VALUES ('5', '地理', '地老师');
INSERT INTO `kskm` VALUES ('6', '政治', '政老师');
INSERT INTO `kskm` VALUES ('7', '物理', '物老师');
INSERT INTO `kskm` VALUES ('8', '化学', '化老师');
INSERT INTO `kskm` VALUES ('9', '生物', '生老师');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int(6) NOT NULL,
  `subject_id` int(6) NOT NULL COMMENT '科目id',
  `name` varchar(20) DEFAULT NULL COMMENT '试卷名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷 列表';

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('1', '1', '2017年语文广州一模');
INSERT INTO `paper` VALUES ('2', '1', '2018年语文广州一模');
INSERT INTO `paper` VALUES ('3', '1', '2017年语文江门一模');
INSERT INTO `paper` VALUES ('4', '1', '2017年语文江门二模');
INSERT INTO `paper` VALUES ('5', '2', '2017年数学湛江一模');
INSERT INTO `paper` VALUES ('6', '2', '2017年数学广州一模');
INSERT INTO `paper` VALUES ('7', '2', '2017年数学广州二模');
INSERT INTO `paper` VALUES ('8', '2', '2017年数学广州三模');

-- ----------------------------
-- Table structure for paper_content
-- ----------------------------
DROP TABLE IF EXISTS `paper_content`;
CREATE TABLE `paper_content` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `paper_id` int(6) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT '题目',
  `option1` varchar(200) DEFAULT NULL COMMENT '选项',
  `option2` varchar(200) DEFAULT NULL,
  `option3` varchar(200) DEFAULT NULL,
  `option4` varchar(200) DEFAULT NULL,
  `answer` varchar(10) DEFAULT NULL COMMENT '答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='试卷具体内容';

-- ----------------------------
-- Records of paper_content
-- ----------------------------
INSERT INTO `paper_content` VALUES ('1', '1', '下面加点字注音正确的一项是(       )', '酝酿（liàng）        抖擞（sǒu）        蓑衣（suō）       高藐（miǎo）', '酝酿（liàng）        抖擞（sǒu）        蓑衣（suō）       高藐（miǎo）', '酝酿（liàng）        抖擞（sǒu）        蓑衣（suō）       高藐（miǎo）', '酝酿（liàng）        抖擞（sǒu）        蓑衣（suō）       高藐（miǎo）', 'A');
INSERT INTO `paper_content` VALUES ('2', '1', '下列语句中书写无误的一项是(       )', '半夜里听见繁杂的雨声，早起是浓荫的天，我觉得有些烦闷。', '乡下去，小路上，石桥边，有掌起伞慢慢走着的人。', '而夏天，就更是别有一番风情了。', '后来妹妹告诉我，她常常肝疼得整宿整宿翻来复去地睡不了觉。', 'B');
INSERT INTO `paper_content` VALUES ('3', '1', '下列各项中成语使用无误的一项是（      ）', '下列各项中成语使用无误的一项是（      ）', '动物园里有洁白优美的天鹅，威风凛凛的老虎，调皮可爱的猴子，栩栩如生的孔雀。', '翘首西望，苍山如屏，洱海如镜，真是巧夺天工。', '花园里，花儿争奇斗艳，蝴蝶轻飞曼舞，鸟儿欢快唱歌，一片生机盎然的景象。', 'B');
INSERT INTO `paper_content` VALUES ('4', '1', '下列句子没有语病的一句是（      ）', '为了防止酒驾事件不再发生，南溪区加大了整治力度。', '学校开展地震安全常识教育活动，可以增强同学们的安全自我保护。', '完善食品安全法规，规范食品安全监管机制，提高人们的食品安全意识，已经到了迫在眉睫的地步了。', '学生能够熟练而规范地书写正楷字，是衡量学生是否达到《语文课程标准》对汉字书写的要求。', 'C');
INSERT INTO `paper_content` VALUES ('5', '1', '下列句中加下划线的字的解释，不正确的一项是（       ）', '下列句中加下划线的字的解释，不正确的一项是（       ）', '去后乃至（才）', '友人惭（感到惭愧）', '元方入门不顾（照顾）', 'B');
INSERT INTO `paper_content` VALUES ('6', '1', '下列句中加点词的意义不相同的一组（       ）', '太丘舍去     待君久不至，已去', '下车引之      左将军王凝之妻也', '日中不至，则是无信 对子骂父，则是无礼', '君与家君期日中  与儿女讲论文义', 'A');
INSERT INTO `paper_content` VALUES ('7', '1', '下列各句的朗读节奏划分不正确的一项是（     ）', '期/日中，过中/不至。“期日中，过中不至”说明客人“无信”的表现，然而客人得知太丘已去，不但不反省自', '未若/柳絮/因风起。', '与儿女/讲论/文义。', '即/公大兄/无奕女，左将军/王凝/之妻也', 'C');
INSERT INTO `paper_content` VALUES ('8', '1', '下面是对文章的理解，不正确的一项是（       ）', '“期日中，过中不至”说明客人“无信”的表现，然而客人得知太丘已去，不但不反省自', '“期日中，过中不至”说明客人“无信”的表现，然而客人得知太丘已去，不但不反省自己，反而发怒，说明客人“无礼”的表现。', '客人以“下车引之”表示认错，说明客人有知错能改的精神。', '“君”表示有礼貌地称呼对方，相当于“您”；“尊君”表示谦词，对人称自己的父亲；“家君”表示对别人父亲的一种尊称。', 'B');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'test', 'test');
INSERT INTO `sys_user` VALUES ('2', 'test1', 'test1');
