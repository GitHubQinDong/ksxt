/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2018-05-30 22:55:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL auto_increment COMMENT '学号',
  `s_name` varchar(16) NOT NULL COMMENT '对应学生表的登陆名称',
  `sub_title` varchar(32) NOT NULL COMMENT '试题标题',
  `answer_c` text COMMENT '选择题答案以空格分割,未作答题目用x占位',
  `answer_f` text COMMENT '填空题答案，每题以;;分割',
  `answer_b` text COMMENT '简答题答案，每道题答案以;;分割',
  `ut` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新日期',
  `stat` varchar(4) default '0' COMMENT '状态位(默认0为启用，1为禁用)',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='答卷表(用途记录或统计分析)';

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('2', 'zs', '大学生学习情况问卷调查', 'b b x x x x x x x x x x x x x x bcd x x x x x x x x x x x x d ', null, 'asdf ;; ;; ;;大水法 ;;', '2018-05-08 22:59:24', '0');
INSERT INTO `answer` VALUES ('4', 'zs', '大学生学习情况问卷调查', 'b c a x x x x x x x x x x x x x bdf x x x x x x x x x x x x c ', null, 'asdf ;; ;; ;;adf大幅 ;;', '2018-05-08 23:07:43', '0');
INSERT INTO `answer` VALUES ('5', 'admin', '大学生学习情况问卷调查', 'a a d c a b b c b d c d c b b b be b a a d a a b b b b a c b ', null, ' ;; ;; ;; ;;', '2018-05-30 21:53:53', '0');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL auto_increment COMMENT '试题编号',
  `subh_id` int(11) NOT NULL COMMENT '对应试题头标题',
  `sub_sum` int(11) NOT NULL COMMENT '对应题型数量',
  `sub_type` varchar(4) default 'c' COMMENT '题目类型(c/choice b/brief f/fill)',
  `total_time` int(3) default '60' COMMENT '试卷总用时',
  `score` int(3) default '1' COMMENT '题目分值',
  `ut` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新日期',
  `stat` varchar(4) default '0' COMMENT '状态位(默认0为启用，1为禁用)',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题表';

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '1', '30', 'c', '60', '1', '2018-05-04 14:05:17', '0');
INSERT INTO `subject` VALUES ('2', '1', '4', 'b', '60', '1', '2018-05-04 14:05:38', '0');

-- ----------------------------
-- Table structure for subject_brief
-- ----------------------------
DROP TABLE IF EXISTS `subject_brief`;
CREATE TABLE `subject_brief` (
  `id` int(11) NOT NULL auto_increment COMMENT '题目编号',
  `title` varchar(256) NOT NULL COMMENT '题目标题',
  `tips` varchar(64) default NULL COMMENT '题目提示信息',
  `analysis` varchar(512) default NULL COMMENT '题目答案解析(简答题解析仅供参考)',
  `category` varchar(32) default NULL COMMENT '题目所属类别(暂时不单独设表)',
  `ut` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新日期',
  `stat` varchar(4) default '0' COMMENT '状态位(默认0为启用，1为禁用)',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简答题表';

-- ----------------------------
-- Records of subject_brief
-- ----------------------------
INSERT INTO `subject_brief` VALUES ('1', '你对学习结果感到满意么', null, null, null, '2018-05-04 14:42:55', '0');
INSERT INTO `subject_brief` VALUES ('2', '目前，你认为大学中最重要的任务是什么', null, null, null, '2018-05-04 14:43:18', '0');
INSERT INTO `subject_brief` VALUES ('3', '在大学中，除了自己的专业技能，还希望学到什么', null, null, null, '2018-05-04 14:43:47', '0');
INSERT INTO `subject_brief` VALUES ('4', '大学毕业后希望就业还是深造(希望就业的城市、岗位)', null, null, null, '2018-05-04 14:44:22', '0');

-- ----------------------------
-- Table structure for subject_choice
-- ----------------------------
DROP TABLE IF EXISTS `subject_choice`;
CREATE TABLE `subject_choice` (
  `id` int(11) NOT NULL auto_increment COMMENT '题目编号',
  `title` varchar(128) NOT NULL COMMENT '题目标题',
  `type` varchar(16) default '0' COMMENT '题目所属类型(目前类型分为0单选1多选)',
  `optionA` varchar(64) default NULL COMMENT '选项A',
  `optionB` varchar(64) default NULL COMMENT '选项B',
  `optionC` varchar(64) default NULL COMMENT '选项C',
  `optionD` varchar(64) default NULL COMMENT '选项D',
  `optionE` varchar(64) default NULL COMMENT '选项E',
  `optionF` varchar(64) default NULL COMMENT '选项F',
  `optionG` varchar(64) default NULL COMMENT '选项G',
  `analysis` varchar(512) default NULL COMMENT '题目答案解析',
  `ut` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新日期',
  `stat` varchar(4) default '0' COMMENT '状态位(默认0为启用，1为禁用)',
  `category` varchar(32) default NULL COMMENT '题目所属类别(暂时不单独设表)',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选择题表';

-- ----------------------------
-- Records of subject_choice
-- ----------------------------
INSERT INTO `subject_choice` VALUES ('1', '是否喜欢本专业学习', '0', '喜欢', '不喜欢', '还可以(一般)', '喜欢一科(或某两科)，其它不喜欢', null, null, null, null, '2018-05-04 14:12:55', '0', null);
INSERT INTO `subject_choice` VALUES ('2', '入学以来对自己的专业的了解', '0', '很了解', '大致了解', '了解', null, null, null, null, null, '2018-05-04 14:13:46', '0', null);
INSERT INTO `subject_choice` VALUES ('3', '影响你对本专业感兴趣的主要原因', '0', '专业发展前途', '个人兴趣，特长', '工作性质', '经济收入', '专业社会地位', '不感兴趣', null, null, '2018-05-04 14:14:54', '0', null);
INSERT INTO `subject_choice` VALUES ('4', '你平均每天的自习时间是多少', '0', '无', '1小时内', '1~2小时', '2小时以上', '有时间就学习', null, null, null, '2018-05-04 14:16:53', '0', null);
INSERT INTO `subject_choice` VALUES ('5', '你认为你的学习的主动性高么', '0', '很高', '较高', '一般', '不高', null, null, null, null, '2018-05-04 14:17:30', '0', null);
INSERT INTO `subject_choice` VALUES ('6', '上课时你记笔记么', '0', '必须记', '有时记', '偶尔记', '根本不记', null, null, null, null, '2018-05-04 14:18:19', '0', null);
INSERT INTO `subject_choice` VALUES ('7', '你在课堂上问老师问题么', '0', '经常', '有时', '偶尔', '根本不', null, null, null, null, '2018-05-04 14:18:56', '0', null);
INSERT INTO `subject_choice` VALUES ('8', '上课前你对有些课程进行预习么', '0', '经常', '有时', '偶尔', '不预习', null, null, null, null, '2018-05-04 14:19:40', '0', null);
INSERT INTO `subject_choice` VALUES ('9', '课后你进行复习么', '0', '经常', '有时', '偶尔', '不复习', null, null, null, null, '2018-05-04 14:20:26', '0', null);
INSERT INTO `subject_choice` VALUES ('10', '你在网上查阅资料么', '0', '经常', '有时', '偶尔', '不上网', null, null, null, null, '2018-05-04 14:20:52', '0', null);
INSERT INTO `subject_choice` VALUES ('11', '学习中你会吸收接纳别人的学习方法么', '0', '会', '只吸收最好', '不会', '看情况', null, null, null, null, '2018-05-04 14:22:02', '0', null);
INSERT INTO `subject_choice` VALUES ('12', '你和你的同学交流心得么', '0', '经常', '有时', '偶尔', '不交流', null, null, null, null, '2018-05-04 14:22:33', '0', null);
INSERT INTO `subject_choice` VALUES ('13', '上课时看其它课外书么', '0', '经常看', '有时', '偶尔', '根本不看', null, null, null, null, '2018-05-04 14:23:22', '0', null);
INSERT INTO `subject_choice` VALUES ('14', '是否严格按照作息时间进行学习', '0', '很严格', '较严格', '一般', '随自己', null, null, null, null, '2018-05-04 14:24:10', '0', null);
INSERT INTO `subject_choice` VALUES ('15', '对自己现在成绩不满意，有哪些改变现状的方法', '0', '制定明确的学习计划并严格执行', '会努力一段时间，但没有坚持到底', '循序渐进，慢慢调整', '我很满意，无需改变', '没想过', null, null, null, '2018-05-04 14:26:14', '0', null);
INSERT INTO `subject_choice` VALUES ('16', '逃课么', '0', '经常', '有时', '从不', null, null, null, null, null, '2018-05-04 14:26:26', '0', null);
INSERT INTO `subject_choice` VALUES ('17', '如果平时不去上课，主要原因是', '1', '不喜欢老师的讲课方式或对所学习的内容不感兴趣', '就是不想去上课', '喜欢自学', '有其他事情干', '个人兴趣', '老师对出勤率的要求程度', null, null, '2018-05-04 14:28:21', '0', null);
INSERT INTO `subject_choice` VALUES ('18', '对于老师布置的作业', '0', '能独立认真完成作业', '抄袭别人作业', '偶尔不交作业', '经常不交', null, null, null, null, '2018-05-04 14:29:27', '0', null);
INSERT INTO `subject_choice` VALUES ('19', '为学习上的事，你和同学闹矛盾么', '0', '经常', '有时', '偶尔', '不会', null, null, null, null, '2018-05-04 14:30:04', '0', null);
INSERT INTO `subject_choice` VALUES ('20', '你认为引发作弊的主要原因是', '0', '从众心理，大家都作弊', '没学好，但是想得个不错的分数', '纯粹应付考试', '其它', null, null, null, null, '2018-05-04 14:31:25', '0', null);
INSERT INTO `subject_choice` VALUES ('21', '你是如何对待考试的', '0', '平常勤于复习', '临阵磨枪', '平时积累加期末复习', '基本不复习', null, null, null, null, '2018-05-04 14:32:34', '0', null);
INSERT INTO `subject_choice` VALUES ('22', '大学阶段，你愿意时间花在什么上', '0', '专业学习', '基础课学习', '学习自己感兴趣的专业', '学习培养其他方面的能力，如社会工作、人际交往等', '听名师讲座', '玩耍、享乐', '其它', null, '2018-05-04 14:34:38', '0', null);
INSERT INTO `subject_choice` VALUES ('23', '喜欢的学习方式', '0', '老师讲授', '自学', '老师引导下的自主学习', null, null, null, null, null, '2018-05-04 14:35:22', '0', null);
INSERT INTO `subject_choice` VALUES ('24', '你与同学进行学习上的交流么', '0', '经常', '有时', '偶尔', '不交流', null, null, null, null, '2018-05-04 14:35:53', '0', null);
INSERT INTO `subject_choice` VALUES ('25', '你班的学习氛围浓厚么', '0', '很浓厚', '比较浓厚', '一般', '不浓厚', null, null, null, null, '2018-05-04 14:36:32', '0', null);
INSERT INTO `subject_choice` VALUES ('26', '你与任课老师交流学习方面的东西么', '0', '经常', '有时', '偶尔', '不交流', null, null, null, null, '2018-05-04 14:37:14', '0', null);
INSERT INTO `subject_choice` VALUES ('27', '你在记忆英语单词时感到困难么', '0', '很困难', '较困难', '一般', '根本不困难', null, null, null, null, '2018-05-04 14:38:14', '0', null);
INSERT INTO `subject_choice` VALUES ('28', '在学习中得到过别人的帮助么', '0', '经常', '有时', '偶尔', '得不到', null, null, null, null, '2018-05-04 14:38:59', '0', null);
INSERT INTO `subject_choice` VALUES ('29', '你有学习上的知心朋友么', '0', '很多', '少数', '极个别', '没有', null, null, null, null, '2018-05-04 14:39:36', '0', null);
INSERT INTO `subject_choice` VALUES ('30', '你和班级同学相处融洽么', '0', '很融洽', '比较融洽', '一般', '不融洽', null, null, null, null, '2018-05-04 14:41:21', '0', null);

-- ----------------------------
-- Table structure for subject_header
-- ----------------------------
DROP TABLE IF EXISTS `subject_header`;
CREATE TABLE `subject_header` (
  `id` int(11) NOT NULL auto_increment COMMENT '试题编号',
  `titile` varchar(128) NOT NULL COMMENT '试题标题',
  `tips` text COMMENT '试题提示信息',
  `score` int(3) default '100' COMMENT '试题分值',
  `category` varchar(32) default NULL COMMENT '试题所属类别(暂时不单独设表)',
  `ut` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新日期',
  `stat` varchar(4) default '0' COMMENT '状态位(默认0为启用，1为禁用)',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题表头表';

-- ----------------------------
-- Records of subject_header
-- ----------------------------
INSERT INTO `subject_header` VALUES ('1', '大学生学习情况问卷调查', '此次问卷的目的在于了解每一位大学生的学习状况，为大学教育体制改革提供参考。本问卷无所谓好坏对错，问卷结果只是作为调查研究获取信息,不作任何个别呈现。所以请您根据自己的看法，放心选择，谢谢合作', '100', '问卷调查', '2018-05-04 14:57:02', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(16) NOT NULL auto_increment COMMENT '学号',
  `name` varchar(16) default NULL COMMENT '学生姓名',
  `pwd` varchar(16) NOT NULL COMMENT '登陆系统密码(使用加密)',
  `role` varchar(16) default 'student' COMMENT '角色(student,teacher)',
  `ut` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新日期',
  `stat` varchar(4) default '0' COMMENT '状态位(默认0为启用,1为冻结,2为待审批)',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'student', '2018-05-30 20:44:46', '0');
INSERT INTO `user` VALUES ('2', 'admin', 'admin', 'teacher', '2018-05-30 20:44:55', '0');
INSERT INTO `user` VALUES ('3', 'zs', 'zs', 'student', '2018-05-30 22:49:40', '0');
