-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 06 月 08 日 08:44
-- 服务器版本: 5.5.44
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `vote`
--

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `account` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`account`, `username`, `password`, `phone`, `school`, `sex`, `id`) VALUES
('asd123', '张三', 'asd321', '18819258477', '华南农业大学', '男', 1),
('qwe123', '李四', 'qwe321', '83458274', '华南理工大学', '男', 2),
('iop123', '黄月英', 'iop321', '13450009687', '广东医学院', '女', 3),
('zxc123', '赵小云', 'zxc321', '83458741', '北京大学', '女', 4),
('admin', '小乔', 'admin', '83468719', '三国大学', '女', 9),
('qqq123', '张飞', 'qqq321', '18819256874', '华南农业大学', '男', 10),
('aaa', '王小莹', '123456', '18856422455', '华农', '女', 11),
('bbb', '啊黄', '123', '', '', '男', 12);

-- --------------------------------------------------------

--
-- 表的结构 `voteproject`
--

CREATE TABLE IF NOT EXISTS `voteproject` (
  `title` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `votetype` varchar(255) DEFAULT NULL,
  `votenumber` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ban` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `voteproject`
--

INSERT INTO `voteproject` (`title`, `username`, `time`, `votetype`, `votenumber`, `id`, `ban`) VALUES
('你最喜欢的科目', '黄月英', '2017-05-28', '1', '语文-9,数学-13,英语-9,', 3, 'yes'),
('你最喜欢的三国英雄', '小乔', '2017-09-09', '2', '张飞-2,关羽-2,赵云-3,曹操-3,黄忠-1,马超-1,', 14, 'no'),
('你喜欢的电影有？', '张飞', '2017-12-01', '1', '勇夺芳心-11,三傻-8,美女与野兽-3,', 15, 'no'),
('你喜欢的水果', '啊黄', '2017-06-03', '2', '苹果-1,香蕉-1,梨-0,西瓜-0,哈密瓜-0,', 16, 'yes'),
('你最喜欢的人', 'sandy', '2017-06-07', '1', '女人-0,男人-2,', 19, 'yes'),
('你喜欢的颜色', '王小莹', '2017-06-09', '2', '红色-0,黄色-0,黑色-0,白色-0,', 20, 'no');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
