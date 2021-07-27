-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2021 at 09:12 PM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gaxa-bot`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` int(11) NOT NULL,
  `add_on_name` varchar(255) NOT NULL,
  `unique_name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `installed_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `purchase_code` varchar(100) NOT NULL,
  `module_folder_name` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `add_ons`
--

INSERT INTO `add_ons` (`id`, `add_on_name`, `unique_name`, `version`, `installed_at`, `update_at`, `purchase_code`, `module_folder_name`, `project_id`) VALUES
(1, 'Facebook Poster', 'ultrapost', '1.0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'ultrapost', 19),
(2, 'Affiliate Manager', 'affiliate_system', '1.1', '2021-03-22 19:54:10', '0000-00-00 00:00:00', 'r0306211058160156058d', 'affiliate_system', 57),
(3, 'Facebook Group Poster', 'facebook_group_poster', '1.0', '2021-03-23 01:05:53', '0000-00-00 00:00:00', 'r03062185445456605922', 'facebook_group_poster', 32),
(4, 'Whatsapp Order Send', 'whatsapp_order_send', '1.1', '2021-07-27 01:19:13', '0000-00-00 00:00:00', 'r0306292628833360ff42', 'whatsapp_order_send', 58),
(5, 'E-commerce Related Products', 'ecommerce_related_products', '1.0', '2021-07-27 01:23:04', '0000-00-00 00:00:00', 'r03062123194079260ff4', 'ecommerce_related_products', 61);

-- --------------------------------------------------------

--
-- Table structure for table `ad_config`
--

CREATE TABLE `ad_config` (
  `id` int(11) NOT NULL,
  `section1_html` longtext,
  `section1_html_mobile` longtext,
  `section2_html` longtext,
  `section3_html` longtext,
  `section4_html` longtext,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_config`
--

INSERT INTO `ad_config` (`id`, `section1_html`, `section1_html_mobile`, `section2_html`, `section3_html`, `section4_html`, `status`) VALUES
(1, '&lt;img src=&quot;https://www.gaxa-bot.com/home/xit_load_files/images/ADS-14.jpg&quot; &gt;', '', '&lt;img src=&quot;https://www.gaxa-bot.com/home/xit_load_files/images/Doc.jpg&quot; &gt;', '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_earning_history`
--

CREATE TABLE `affiliate_earning_history` (
  `id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event` enum('signup','payment','recurring') NOT NULL,
  `amount` float NOT NULL,
  `event_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_forgot_password`
--

CREATE TABLE `affiliate_forgot_password` (
  `id` int(11) NOT NULL,
  `confirmation_code` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `success` int(11) NOT NULL DEFAULT '0',
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payment_settings`
--

CREATE TABLE `affiliate_payment_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `signup_commission` enum('0','1') NOT NULL DEFAULT '0',
  `payment_commission` enum('0','1') NOT NULL DEFAULT '0',
  `payment_type` varchar(50) NOT NULL,
  `sign_up_amount` varchar(255) NOT NULL,
  `percentage` varchar(255) NOT NULL,
  `fixed_amount` varchar(255) NOT NULL,
  `is_recurring` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `affiliate_payment_settings`
--

INSERT INTO `affiliate_payment_settings` (`id`, `user_id`, `signup_commission`, `payment_commission`, `payment_type`, `sign_up_amount`, `percentage`, `fixed_amount`, `is_recurring`) VALUES
(1, 0, '1', '1', 'fixed', '.0', '', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_users`
--

CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `profile_img` text NOT NULL,
  `activation_code` varchar(20) NOT NULL,
  `total_earn` double NOT NULL,
  `is_overwritten` enum('0','1') NOT NULL DEFAULT '0',
  `is_signup_commission` enum('0','1') NOT NULL DEFAULT '0',
  `signup_amount` varchar(100) NOT NULL,
  `is_payment` enum('0','1') NOT NULL DEFAULT '0',
  `payment_type` varchar(100) NOT NULL,
  `fixed_amount` varchar(255) NOT NULL,
  `percentage_amount` varchar(255) NOT NULL,
  `is_recurring` enum('0','1') NOT NULL DEFAULT '0',
  `last_login_at` datetime NOT NULL,
  `last_login_ip` varchar(30) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `affiliate_users`
--

INSERT INTO `affiliate_users` (`id`, `name`, `email`, `password`, `mobile`, `address`, `username`, `profile_img`, `activation_code`, `total_earn`, `is_overwritten`, `is_signup_commission`, `signup_amount`, `is_payment`, `payment_type`, `fixed_amount`, `percentage_amount`, `is_recurring`, `last_login_at`, `last_login_ip`, `add_date`, `status`) VALUES
(4, 'Gaxa_Affiliate', 'Info@gaxa-bot.com', '07fa63558df59ebfe357cabb0eed3e10', '0201118136665', '', 'Gaxa_Offical_Affiliate', '', '176666', 0, '0', '1', '.5', '1', 'fixed', '5', '', '0', '2021-04-17 00:23:20', '45.243.228.246', '2021-04-16 17:08:22', '1');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_visitors_action`
--

CREATE TABLE `affiliate_visitors_action` (
  `id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `type` enum('click','signup','payment') NOT NULL,
  `clicked_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'visitors sign up id',
  `ip_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_withdrawal_methods`
--

CREATE TABLE `affiliate_withdrawal_methods` (
  `id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `paypal_email` varchar(150) NOT NULL,
  `bank_acc_no` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_withdrawal_requests`
--

CREATE TABLE `affiliate_withdrawal_requests` (
  `id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `method_id` int(11) NOT NULL,
  `requested_amount` double NOT NULL,
  `request_status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0(pending),1(approved),2(canceled)',
  `created_at` datetime NOT NULL,
  `completed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 means all',
  `is_seen` enum('0','1') NOT NULL DEFAULT '0',
  `seen_by` text NOT NULL COMMENT 'if user_id = 0 then comma seperated user_ids',
  `last_seen_at` datetime NOT NULL,
  `color_class` varchar(50) NOT NULL DEFAULT 'primary',
  `icon` varchar(50) NOT NULL DEFAULT 'fas fa-bell',
  `status` enum('published','draft') NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `autoposting`
--

CREATE TABLE `autoposting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feed_name` varchar(100) NOT NULL,
  `feed_type` enum('rss','youtube','twitter','wordpress') NOT NULL DEFAULT 'rss',
  `feed_url` text NOT NULL,
  `youtube_channel_id` varchar(50) NOT NULL,
  `youtube_api_called_at` datetime DEFAULT NULL,
  `wordpress_blog_url` text,
  `page_ids` text NOT NULL COMMENT 'auto ids',
  `page_names` text NOT NULL COMMENT 'page names',
  `facebook_rx_fb_user_info_ids` text NOT NULL COMMENT 'page id => fb rx user id json',
  `twitter_accounts` text NOT NULL,
  `linkedin_accounts` text NOT NULL,
  `reddit_accounts` text NOT NULL,
  `subreddits` text NOT NULL,
  `posting_message` text CHARACTER SET utf8mb4 NOT NULL,
  `posting_start_time` varchar(25) NOT NULL,
  `posting_end_time` varchar(25) NOT NULL,
  `posting_timezone` varchar(75) NOT NULL,
  `page_id` int(11) NOT NULL COMMENT 'broadcast',
  `fb_page_id` varchar(75) NOT NULL COMMENT 'broadcast',
  `page_name` text NOT NULL COMMENT 'broadcast',
  `label_ids` text NOT NULL COMMENT 'broadcast',
  `excluded_label_ids` text NOT NULL COMMENT 'broadcast',
  `broadcast_start_time` varchar(50) NOT NULL,
  `broadcast_end_time` varchar(50) NOT NULL,
  `broadcast_timezone` varchar(50) NOT NULL,
  `broadcast_notification_type` varchar(100) NOT NULL DEFAULT 'REGULAR',
  `broadcast_display_unsubscribe` enum('0','1') NOT NULL DEFAULT '0',
  `last_pub_date` datetime NOT NULL,
  `last_pub_title` text NOT NULL,
  `last_pub_url` text NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT 'pending, processing, abandoned',
  `last_updated_at` datetime NOT NULL,
  `cron_status` enum('0','1') NOT NULL DEFAULT '0',
  `error_message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auto_comment_reply_info`
--

CREATE TABLE `auto_comment_reply_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `auto_comment_template_id` int(11) NOT NULL,
  `time_zone` varchar(255) NOT NULL,
  `schedule_time` datetime NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `post_id` varchar(200) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_name` mediumtext NOT NULL,
  `post_created_at` varchar(255) NOT NULL,
  `last_reply_time` datetime NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `auto_comment_count` int(11) NOT NULL,
  `periodic_time` varchar(255) NOT NULL,
  `schedule_type` varchar(255) NOT NULL,
  `auto_comment_type` varchar(255) NOT NULL,
  `campaign_start_time` datetime NOT NULL,
  `campaign_end_time` datetime NOT NULL,
  `comment_start_time` time NOT NULL,
  `comment_end_time` time NOT NULL,
  `auto_private_reply_status` enum('0','1','2') NOT NULL DEFAULT '0',
  `auto_reply_done_info` longtext NOT NULL,
  `periodic_serial_reply_count` int(11) NOT NULL,
  `error_message` mediumtext NOT NULL,
  `post_description` longtext NOT NULL,
  `post_thumb` text NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  `social_media_type` enum('Facebook','Instagram') NOT NULL DEFAULT 'Facebook',
  `insta_media_url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auto_comment_reply_info`
--

INSERT INTO `auto_comment_reply_info` (`id`, `user_id`, `auto_comment_template_id`, `time_zone`, `schedule_time`, `campaign_name`, `post_id`, `page_info_table_id`, `page_name`, `post_created_at`, `last_reply_time`, `last_updated_at`, `auto_comment_count`, `periodic_time`, `schedule_type`, `auto_comment_type`, `campaign_start_time`, `campaign_end_time`, `comment_start_time`, `comment_end_time`, `auto_private_reply_status`, `auto_reply_done_info`, `periodic_serial_reply_count`, `error_message`, `post_description`, `post_thumb`, `deleted`, `social_media_type`, `insta_media_url`) VALUES
(1, 1, 5, 'Africa/Cairo', '0000-00-00 00:00:00', 'GAXA Demo', '105940371572898_157928616374073', 19, 'Gaxa', '2021-06-12 16:40:53.000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '1440', 'periodic', 'random', '2021-06-15 19:23:16', '2021-06-30 19:23:11', '00:00:00', '23:59:00', '1', '', 0, '', '\'الاعلان دا ليك انت..عشان توفر وقت و مجهود و كمان عماله وتكاليف.\\n\\nمع جاكسا صفحتك او صفحات العملاء الخاصين بك هتبقا مختلفه و إدارتها و الرد على عملاءها بقا 24 ساعه بكل سهوله و كمان توفير فالعموله\\n\\nو دا لأن الخدمات الى بيقدمها البرنامج كالاتى:\\n\\n 1️⃣ الFacebook Posting و دا بيتضمن \\n- النشر التلقائي لـ RSS\\n- جدولة / النشر الفوري على جميع صفحات Facebook الخاصة بك بنقرة واحدة.\\n- القدرة على إعادة النشر الدوري\\n- تفعيل حملة الرد التلقائي على التعليق بالبريد.\\n- التقرير الكامل للنشر\\n2️⃣ الFacebook Comment BOT Tools والى بيتضمن : \\n-رد خاص تلقائي لنشر التعليق.\\n- رد خاص تلقائي برسالة تحتوى(صورة ، فيديو ، أزرار ، رد سريع ، رد عام)\\n- الرد التلقائي على التعليق\\n-الرد التلقائي للتعليق على التعليق.\\n-الإعجاب التلقائي بالتعليق\\n- تخصيص الي للرد الخاص التلقائي ونص الرد على التعليق.\\n- تصفية خيار الرد الخاص التلقائي المستند إلى الكلمات والرد على التعليق.\\n- التقرير الكامل للرد الخاص التلقائي والرد على التعليقات.\\n3️⃣ال Auto Comment Tools ودا بقا بيحتوى على:\\n-تعليق تلقائي على مشاركة الصفحة كصفحة لمرة واحدة والتعليق الدوري\\n- التعليق الدوري التسلسلي والعشوائي\\n-تعليق الرموز التعبيرية و spintax\\n- اختر الوقت والتاريخ الفاصل الزمني للتعليق\\n- زيادة مشاركة الصفحة\\n4️⃣ال Social Media Posting عشان نوقر عليك الوقت و المجهود:\\n-الضغط لمشاركة مجمعة على 8 وسائل التواصل الاجتماعي\\nFacebook و Twitter و LinkedIn و Reddit و Blogger و WordPress و Medium\\n- جدولة الحملة\\n- مخطط النشر المجمع من ملف CSV\\n5️⃣ ال  Messenger BOT والى معاه صفحتك هتبقا شغاله 24 ساعه:\\n-الرد بنص ، ملف ، صورة ، صوت ، فيديو ، GIF ردعام ، ردود دائري ، رد وسائط\\n- الرد ب أزرار النشر ، وأزرار الرد السريع\\n-الرد بزر URL ورقم الهاتف وعرض الويب وتاريخ ميلاد المستخدم\\n-الرد بزر الرد السريع للبريد الإلكتروني للمستخدم ورقم الهاتف\\n-رد مخصص بالاسم الأول واسم العائلة\\n-مزامنة العملاء المتوقعين الحاليين وترحيلهم كمشتركين في BOT\\n-ملف تعريف المشترك مع الجنس والمنطقة الزمنية والإعدادات المحلية\\n-اضافه تأخير مخصص في كل رد\\n- جمع رقم الهاتف و الرد السريع\\n-تنزيل البريد الإلكتروني ورقم الهاتف تامسجل للعميل بتنسيق CSV\\n 6️⃣ اما بقا بالنسبه ل ال E-commerce Store inside/outside Messenger\\n-تطبيق جوال \\n-متاجر متعددة\\n-قائمة QR بدون تلامس\\n-ادارة المنتج\\n-فئة وإدارة السماتCategories \\n-التسليم ، الدفع اليدوي / المصرفي\\n-إدارة الطلبات (الشحن والتسليم والرفض وقبول الطلب)\\n-إيصال تأكيد الطلب في Messenger والبريد الإلكتروني والرسائل القصيرة\\n -طباعة الإيصالات باستخدام طابعة حرارية   \\n- تكامل سهل ومرن مع Messenger Bot\\n ✅✅ مش بس كدا دا لسه ف خصائص تانيه كتييييير ✅✅\\n- ال Instagram Posting Tools\\n-ال Instagram Comment Bot Tools\\n-ال SMS Marketing \\n-ال Email Marketing \\n-ال Comparison & Search Marketing\\n\\nكده الإعلان خلص بس خدمات جاكسا لسه مخلصتش ادخل على الرابط التالى و جرب بنفسك مجانا\\nhttps://gaxa-bot.com/\\n\\n#GAXA_BOT\\n#socialmediamarketingtools\'', '', '0', 'Facebook', '');

-- --------------------------------------------------------

--
-- Table structure for table `auto_comment_reply_tb`
--

CREATE TABLE `auto_comment_reply_tb` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_reply_comment_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auto_comment_reply_tb`
--

INSERT INTO `auto_comment_reply_tb` (`id`, `user_id`, `template_name`, `auto_reply_comment_text`) VALUES
(1, 1, 'Our Delivered projects -Wesouria', '[\"One Of Our Delivered Project \\r\\n\\r\\nhttps:\\/\\/www.wesouria.com\\/\"]'),
(2, 1, 'Our Delivered projects- Learn Accademy', '[\"One Of Our Delivered Project \\r\\n\\r\\nhttps:\\/\\/www.onlinekitchenacademy.com\\/\"]'),
(3, 1, 'Our Delivered projects-Eventrix', '[\"One Of Our Delivered Project \\r\\n\\r\\nhttps:\\/\\/eventrex.net\\/\"]'),
(4, 1, 'Our Delivered projects-GAXA', '[\"One Of Our Delivered Project \\r\\n\\r\\nhttps:\\/\\/gaxa-bot.com\\/\\r\\n\"]'),
(5, 1, 'Try Fee GAXA Demo', '[\"\\u0633\\u062c\\u0644 \\u0627\\u0644\\u0627\\u0646 | \\u0644\\u0644\\u0646\\u0633\\u062e\\u0647 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\\u064a\\u0647\\r\\nhttps:\\/\\/gaxa-bot.com\\/home\\/sign_up\\r\\n\"]'),
(6, 39, 'moh', '[\"ls\"]');

-- --------------------------------------------------------

--
-- Table structure for table `blogger_blog_info`
--

CREATE TABLE `blogger_blog_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blogger_users_info_table_id` int(11) NOT NULL,
  `blog_id` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogger_users_info`
--

CREATE TABLE `blogger_users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_token` text NOT NULL,
  `refresh_token` text NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `picture` text NOT NULL,
  `blogger_id` varchar(200) NOT NULL,
  `blog_count` int(11) NOT NULL,
  `add_date` date NOT NULL,
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `body` longtext NOT NULL,
  `category_id` int(11) NOT NULL,
  `tags` text,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `title`, `slug`, `keywords`, `thumbnail`, `body`, `category_id`, `tags`, `status`, `views`, `user_id`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'How To build a Facebook Messenger bot', 'how-to-build-a-facebook-messenger-bot', 'Messenger-bot,Flow Builder', '1_blog_1624077637699989.png', '<p>To build a Facebook Messenger bot, Gaxa-bot has Flow Builder, an add-on, a visual drag and drop chatbot editor. With the Flow \r\nBuilder, you can build a Facebook Messenger bot very easily by dragging \r\nand dropping elements, adding data to the elements, and connecting the \r\nelements with each other.</p>\r\n\r\n\r\n<p>Recently, a new element has been presented to the GAXA-BOT Flow \r\nBuilder, the element that is called condition. With the condition \r\nelement, you can build a condition and rules based messenger bot that \r\ncan talk to people intelligently. For example, if the user is male, the \r\nbot will call him Mr. On the other hand, if the user is Female, the bot \r\nwill call her Miss/Mrs. And if the system already has the email number \r\nof a specific user, the bot will inform the user that the system already\r\n has the email number. Contrarily, if the system doesn’t have the email \r\nnumber of a specific user, the bot will ask for the email number from \r\nthe user.</p>\r\n\r\n\r\n<p>In this article, I will show you how to build condition and rules based messenger bot on the Flow Builder.</p>\r\n\r\n\r\n<p>To build a condition and rules based messenger bot, you have to use \r\nan element called condition that will work as the entry point of the \r\nconditional conversation.</p>\r\n\r\n\r\n\r\n<p>Let’s see how to build condition and rules based messenger bot.&nbsp;</p>\r\n\r\n\r\n\r\n<p>First, go to the editor of the visual Flow Builder. Now add the \r\ntrigger element to the editor. After that, double-click on the trigger \r\nelement to add data. Instantly, a form field will appear on the left \r\nside of the editor. Now enter ‘condition’ as the keyword for the bot we \r\nare going to build. Now click on the ok button. If a user writes \r\n‘condition’ in the messenger, the bot will start.</p>\r\n\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623056870488996.png\" alt=\"Trigger element\"></p>\r\n\r\n\r\n<p>Now connect the trigger element to the Start Bot Flow. Now \r\ndouble-click on the Start Bot Flow and a form field will appear on the \r\nleft side of the editor. Give a title for the bot in the title field. \r\nFor example, I write ‘condition demo’ in the title field. Others fields \r\nare optional. You can keep them blank. Now click on the ok button.</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623057016186209.png\" alt=\"Start bot Flow\"></p>\r\n\r\n\r\n\r\n<p>Now add the condition element by dragging and dropping and connect it\r\n with Start Bot Flow. Now double-click on the condition element. \r\nInstantly, a form field will appear on the left side of the editor. At \r\nthe top of the form field, you will see two radio buttons-- All Match \r\nand Any Match. And you have to select All Match or Any Match. Note that \r\nif you select All Match, all the conditions have to be true to evaluate \r\nthe expression. On the other hand, if you select Any Match, at least one\r\n condition has to be true to evaluate the expression.</p>\r\n\r\n\r\n<p>Since we will configure only one condition, you can select any of them.&nbsp;</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623057300103613.png\" alt=\"All match, any match\"></p>\r\n\r\n\r\n\r\n<p>Then you will see the system field and the custom field. Both the \r\nsystem field and the custom field contain initial fields to configure \r\nconditions. Of course, by clicking on the plus sign next to the system \r\nfield and custom field, you can add more fields to configure conditions \r\non them. Of course, you can remove extra condition by clicking remove \r\nbutton. &nbsp;</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623058495206128.png\" alt=\"add and remove condition\"></p>\r\n\r\n\r\n\r\n\r\n\r\n<p>Let\'s set a condition to check if the user is male or female and send messages accordingly:&nbsp;</p>\r\n\r\n\r\n\r\n<p>Click on the Variable field and a drop-down menu of the different \r\nvariables will appear. Now you have to select a variable. Likewise, you \r\nhave to select an operator from the operator field and a value from the \r\nvalue field.</p>\r\n\r\n\r\n\r\n<p>I select Gender as the variable, and Equal(=) as the operator, and \r\nMale as the value. Now I click on the ok button to insert data to the \r\ncondition element.</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623058638105784.png\" alt=\"configure a condition male and female\"></p>\r\n\r\n\r\n\r\n<p>On the condition element, you will see two sockets – True and False. \r\nIf the condition evaluates to true, the message connecting to the True \r\nsocket will be sent. Contrary, if the condition evaluates to false, the \r\nmessage connecting to the False socket will be sent.&nbsp;</p>\r\n\r\n\r\n<p>Well, now add a text element and connect it to the socket called \r\nTrue. Then write a message addressing the user as Mr. the message that \r\nwill be sent to the male users.&nbsp;</p>\r\n\r\n\r\n<p>Likewise, add another text element and connect it to the False socket\r\n and write a message, addressing the user as Miss/Mrs, the message that \r\nwill be sent to the female users.&nbsp;</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623058772162995.png\" alt=\"condition false or true male or female\"></p>\r\n\r\n\r\n\r\n<p>Now add a button element and connect it to both text elements. Well, \r\nwrite a button text and select new postback as the button type and click\r\n the ok button. Instantly, a new postback element connected to the \r\nbutton element will appear. Now give a title for the new postback.</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623059020349561.png\" alt=\"add button\"></p>\r\n\r\n\r\n<p> Now I will set another condition to see whether the system has the \r\nemail address of the user or not. If the system has the email address of\r\n a user, the bot will inform the user that the updated information will \r\nbe sent to the email address. On the other hand, if the system doesn’t \r\nhave the email address of a specific user, the bot will ask for the \r\nemail address from the user.</p>\r\n\r\n\r\n<p>Let’s set a condition to check if the system has the email address of a specific user or not and send messages accordingly:&nbsp;</p>\r\n\r\n\r\n\r\n<p>Add condition element and connect it to the new postback element. \r\nAfter that, click on the condition element to configure a condition. If \r\nyou configure one condition, it doesn’t matter whether you select All \r\nMatch or Any Match.&nbsp;</p>\r\n\r\n\r\n\r\n\r\n\r\n<p>Like before, select Email as the variable and Has Value as the \r\noperator. And click on the ok button. That’s all. The condition is set.</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623059145805182.png\" alt=\"first condition for email\"></p>\r\n\r\n\r\n\r\n<p>Now add two text element and connect them to the true and false \r\nsockets of the condition element. Now click on the text element \r\nconnecting to the true element and write a text message to inform the \r\nuser that the updated information will be emailed to the user.</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623059301769282.png\" alt=\"text message for true email\"></p>\r\n\r\n\r\n <p>Then click on the other text element connecting to the&nbsp; false socket\r\n and write a message to inform the user that the system doesn’t have the\r\n email address and tell the user to click on a quick reply button to \r\nsend the email address.</p>\r\n \r\n\r\n <p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623059506209552.png\" alt=\"text message for false email\"></p>\r\n \r\n\r\n <p>If the condition becomes true, the text message connecting to the \r\nTrue socket will be sent. On the other hand, if the condition becomes \r\nfalse, the text message connecting to the False socket will be sent. \r\nThat is if the system has the email address of a specific user, the bot \r\nwill inform the user that the updated information will be sent. And if \r\nthe system doesn’t have the email address of a user, the bot will ask \r\nfor the email user. </p>\r\n \r\n\r\n <p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623059646161029.png\" alt=\"condition becomes false or true\"></p>\r\n\r\n\r\n\r\n<p>Now add a quick reply button and connect it to the text element \r\nconnecting to the false socket. Double-click on the quick reply element,\r\n select email as the Quick Reply type and click on the ok button. With \r\nthe reply button, the bot will collect the email address from the user. </p>\r\n\r\n\r\n\r\n<p>Now click on the save button or press Ctrl + s on the keyboard to save your bot.&nbsp;</p>\r\n\r\n\r\n\r\n<p>If everything is ok, the bot will work accordingly. That is, if the \r\nuser is male, the bot will address him as Mr and if the user is female, \r\nthe bot will address her as Mrs/Miss. Moreover, if the system has the \r\nemail address of a user, the bot will inform the user that updated \r\ninformation will be emailed to the user and if the system doesn’t have \r\nthe email address of a specific user, the bot will ask for the email \r\naddress of the user.&nbsp;</p>\r\n\r\n\r\n<p>Now let’s see how the bot does work: &nbsp;</p>\r\n\r\n\r\n<p><img src=\"https://xeroneit.net/upload/blog/image_1602_1623131537524889.PNG\" alt=\"usage of the bot\"></p>\r\n\r\n\r\n<p> I write condition in the messenger. The message matches the keyword \r\nof the condition-based bot we have made and the first condition of the \r\nbot start. The condition checks if I am male or female. It finds out \r\nthat I am male and sends me the text message that addresses me as Mr. \r\nAfter that I click on the yes button, and the second condition starts. \r\nIt checks if the system has my email address and finds out that the \r\nsystem doesn’t have my email address. So it asks me for my email number.&nbsp; </p>', 1, 'Messenger-Bot', '1', 4, 1, '2021-06-19 13:40:40', '2021-06-19 13:40:40', '2021-06-19 13:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_categories`
--

CREATE TABLE `blog_post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_post_categories`
--

INSERT INTO `blog_post_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Chat-bot', 'chat-bot', '2021-06-19 13:39:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_comments`
--

CREATE TABLE `blog_post_comments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_tags`
--

CREATE TABLE `blog_post_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_post_tags`
--

INSERT INTO `blog_post_tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Messenger-Bot', '2021-06-19 13:38:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comboposter_campaigns`
--

CREATE TABLE `comboposter_campaigns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `campaign_type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `rich_content` longtext NOT NULL,
  `subreddits` varchar(255) NOT NULL,
  `wpsh_selected_category` text,
  `image_url` text NOT NULL,
  `privacy_type` enum('public','private','unlisted') CHARACTER SET latin1 NOT NULL DEFAULT 'public',
  `video_url` text NOT NULL,
  `thumbnail_url` text NOT NULL,
  `link_caption` varchar(255) NOT NULL,
  `link_description` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `is_child` enum('0','1') NOT NULL DEFAULT '0',
  `parent_campaign_id` int(11) DEFAULT NULL,
  `schedule_type` enum('now','later') CHARACTER SET latin1 NOT NULL DEFAULT 'now',
  `schedule_time` datetime NOT NULL,
  `schedule_timezone` varchar(255) CHARACTER SET latin1 NOT NULL,
  `repeat_times` int(11) NOT NULL,
  `time_interval` int(11) NOT NULL,
  `full_complete` enum('0','1') NOT NULL,
  `posting_medium` longtext CHARACTER SET latin1 NOT NULL,
  `posting_status` enum('pending','processing','completed') CHARACTER SET latin1 NOT NULL DEFAULT 'pending',
  `report` longtext CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_page_builder`
--

CREATE TABLE `custom_page_builder` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `page_description` longtext NOT NULL,
  `url` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_attribute`
--

CREATE TABLE `ecommerce_attribute` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `woocommerce_config_id` int(11) DEFAULT NULL,
  `woocommerce_attribute_id` int(11) DEFAULT NULL,
  `woocommerce_attribute_slug` text NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `attribute_values` text NOT NULL,
  `optional` enum('0','1') NOT NULL DEFAULT '0',
  `multiselect` enum('0','1') NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_cart`
--

CREATE TABLE `ecommerce_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `subscriber_id` varchar(50) NOT NULL COMMENT 'messenger_bot_subscriber.subscribe_id',
  `subtotal` float NOT NULL,
  `tax` float NOT NULL,
  `shipping` float NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_type` varchar(50) NOT NULL,
  `discount` float NOT NULL,
  `payment_amount` float NOT NULL,
  `currency` varchar(20) NOT NULL,
  `ordered_at` datetime NOT NULL,
  `buyer_first_name` varchar(150) NOT NULL,
  `buyer_last_name` varchar(150) NOT NULL,
  `buyer_email` varchar(75) NOT NULL,
  `buyer_mobile` varchar(50) NOT NULL,
  `buyer_country` varchar(20) NOT NULL,
  `buyer_city` varchar(50) NOT NULL,
  `buyer_state` varchar(50) NOT NULL,
  `buyer_address` text NOT NULL,
  `buyer_zip` varchar(10) NOT NULL,
  `bill_first_name` varchar(100) NOT NULL,
  `bill_last_name` varchar(150) NOT NULL,
  `bill_email` varchar(75) NOT NULL,
  `bill_mobile` varchar(20) NOT NULL,
  `bill_country` varchar(20) NOT NULL,
  `bill_city` varchar(50) NOT NULL,
  `bill_state` varchar(50) NOT NULL,
  `bill_address` text NOT NULL,
  `bill_zip` varchar(10) NOT NULL,
  `delivery_note` text NOT NULL,
  `store_pickup` enum('0','1') NOT NULL DEFAULT '0',
  `pickup_point_details` text NOT NULL,
  `transaction_id` varchar(25) NOT NULL,
  `card_ending` varchar(10) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `checkout_account_email` varchar(100) NOT NULL,
  `checkout_account_receiver_email` varchar(100) NOT NULL,
  `checkout_account_country` varchar(100) NOT NULL,
  `checkout_account_first_name` varchar(100) NOT NULL,
  `checkout_account_last_name` varchar(100) NOT NULL,
  `checkout_amount` varchar(20) NOT NULL,
  `checkout_currency` varchar(20) NOT NULL,
  `checkout_verify_status` varchar(100) NOT NULL,
  `checkout_timestamp` varchar(50) NOT NULL,
  `checkout_source_json` text NOT NULL,
  `manual_additional_info` longtext NOT NULL,
  `manual_filename` varchar(150) NOT NULL,
  `manual_currency` varchar(20) NOT NULL,
  `manual_amount` float NOT NULL,
  `paid_at` datetime NOT NULL,
  `status` enum('pending','approved','rejected','shipped','delivered','completed') NOT NULL COMMENT 'payment_status',
  `status_changed_at` datetime NOT NULL,
  `status_changed_note` text NOT NULL,
  `updated_at` datetime NOT NULL,
  `action_type` enum('add','remove','checkout') NOT NULL DEFAULT 'add',
  `confirmation_response` text NOT NULL,
  `last_completed_hour` int(11) NOT NULL,
  `is_totally_completed` enum('0','1') NOT NULL DEFAULT '0',
  `last_sent_at` datetime NOT NULL,
  `initial_date` datetime NOT NULL,
  `last_processing_started_at` datetime NOT NULL,
  `processing_status` enum('0','1') NOT NULL DEFAULT '0',
  `payment_temp_session` text NOT NULL,
  `delivery_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_cart`
--

INSERT INTO `ecommerce_cart` (`id`, `user_id`, `store_id`, `subscriber_id`, `subtotal`, `tax`, `shipping`, `coupon_code`, `coupon_type`, `discount`, `payment_amount`, `currency`, `ordered_at`, `buyer_first_name`, `buyer_last_name`, `buyer_email`, `buyer_mobile`, `buyer_country`, `buyer_city`, `buyer_state`, `buyer_address`, `buyer_zip`, `bill_first_name`, `bill_last_name`, `bill_email`, `bill_mobile`, `bill_country`, `bill_city`, `bill_state`, `bill_address`, `bill_zip`, `delivery_note`, `store_pickup`, `pickup_point_details`, `transaction_id`, `card_ending`, `payment_method`, `checkout_account_email`, `checkout_account_receiver_email`, `checkout_account_country`, `checkout_account_first_name`, `checkout_account_last_name`, `checkout_amount`, `checkout_currency`, `checkout_verify_status`, `checkout_timestamp`, `checkout_source_json`, `manual_additional_info`, `manual_filename`, `manual_currency`, `manual_amount`, `paid_at`, `status`, `status_changed_at`, `status_changed_note`, `updated_at`, `action_type`, `confirmation_response`, `last_completed_hour`, `is_totally_completed`, `last_sent_at`, `initial_date`, `last_processing_started_at`, `processing_status`, `payment_temp_session`, `delivery_time`) VALUES
(1, 1, 1, 'sys-1622140426878927', 550, 0, 0, '', '', 0, 550, 'USD', '2021-05-27 20:34:19', '', '', '', '', '', '', '', '', '', 'Teststore', 'Raashaf', 'parig32960@brayy.com', '', '', '', '', '', '', '', '1', 'Counter :  21-ST Associate / Haram-Giza, Cairo, Cairo, Egypt 12511  01118136665, info@proatcoding.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '0000-00-00 00:00:00', 'pending', '0000-00-00 00:00:00', '', '2021-05-27 20:36:20', 'add', '[]', 0, '1', '0000-00-00 00:00:00', '2021-05-27 20:34:19', '2021-06-02 09:25:02', '1', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_cart_address_saved`
--

CREATE TABLE `ecommerce_cart_address_saved` (
  `id` int(11) NOT NULL,
  `subscriber_id` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `country` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `zip` varchar(10) NOT NULL,
  `is_default` enum('0','1') NOT NULL DEFAULT '0',
  `profile_address` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_cart_address_saved`
--

INSERT INTO `ecommerce_cart_address_saved` (`id`, `subscriber_id`, `title`, `first_name`, `last_name`, `email`, `mobile`, `country`, `city`, `state`, `address`, `zip`, `is_default`, `profile_address`) VALUES
(1, 'sys-1622140426878927', 'Billing Address', 'Teststore', 'Raashaf', 'parig32960@brayy.com', '', '', '', '', '', '', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_cart_item`
--

CREATE TABLE `ecommerce_cart_item` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `coupon_info` varchar(255) NOT NULL,
  `quantity` float NOT NULL,
  `attribute_info` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_downloaded` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_cart_item`
--

INSERT INTO `ecommerce_cart_item` (`id`, `store_id`, `cart_id`, `product_id`, `unit_price`, `coupon_info`, `quantity`, `attribute_info`, `updated_at`, `is_downloaded`) VALUES
(1, 1, 1, 1, 550, '', 1, '[]', '2021-05-27 20:34:54', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_cart_pickup_points`
--

CREATE TABLE `ecommerce_cart_pickup_points` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `point_name` varchar(255) NOT NULL,
  `point_details` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_category`
--

CREATE TABLE `ecommerce_category` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `serial` int(11) NOT NULL,
  `woocommerce_config_id` int(11) DEFAULT NULL,
  `woocommerce_category_id` int(11) DEFAULT NULL,
  `woocommerce_category_slug` text NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_category`
--

INSERT INTO `ecommerce_category` (`id`, `user_id`, `store_id`, `thumbnail`, `serial`, `woocommerce_config_id`, `woocommerce_category_id`, `woocommerce_category_slug`, `category_name`, `status`, `updated_at`) VALUES
(1, 1, 1, '', 0, NULL, NULL, '', 'Mobile Applications', '1', '2021-05-26 19:08:20'),
(2, 1, 1, '', 0, NULL, NULL, '', 'Web Applications', '1', '2021-05-26 19:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_config`
--

CREATE TABLE `ecommerce_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `paypal_email` varchar(100) NOT NULL,
  `paypal_mode` enum('live','sandbox') NOT NULL DEFAULT 'live',
  `stripe_billing_address` enum('0','1') NOT NULL DEFAULT '0',
  `stripe_secret_key` text NOT NULL,
  `stripe_publishable_key` text NOT NULL,
  `paystack_secret_key` text NOT NULL,
  `paystack_public_key` text NOT NULL,
  `razorpay_key_id` text NOT NULL,
  `razorpay_key_secret` text NOT NULL,
  `mollie_api_key` text NOT NULL,
  `mercadopago_public_key` text NOT NULL,
  `mercadopago_access_token` text NOT NULL,
  `marcadopago_country` varchar(5) NOT NULL,
  `sslcommerz_store_id` text NOT NULL,
  `sslcommerz_store_password` text NOT NULL,
  `sslcommerz_mode` enum('sandbox','live') NOT NULL DEFAULT 'live',
  `senangpay_merchent_id` text NOT NULL,
  `senangpay_secret_key` text NOT NULL,
  `senangpay_mode` enum('sandbox','live') NOT NULL DEFAULT 'live',
  `instamojo_api_key` text NOT NULL,
  `instamojo_auth_token` text NOT NULL,
  `instamojo_mode` enum('sandbox','live') NOT NULL DEFAULT 'live',
  `xendit_secret_api_key` text NOT NULL,
  `manual_payment` enum('0','1') NOT NULL DEFAULT '0',
  `manual_payment_instruction` text NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `currency_position` enum('left','right') NOT NULL DEFAULT 'left',
  `decimal_point` tinyint(4) NOT NULL DEFAULT '2',
  `thousand_comma` enum('0','1') NOT NULL DEFAULT '0',
  `store_pickup_title` varchar(100) NOT NULL DEFAULT 'Store Pickup',
  `buy_button_title` varchar(100) NOT NULL DEFAULT 'Buy Now',
  `is_store_pickup` enum('0','1') NOT NULL DEFAULT '0',
  `is_home_delivery` enum('0','1') NOT NULL DEFAULT '1',
  `is_checkout_country` enum('0','1') NOT NULL DEFAULT '1',
  `is_checkout_state` enum('0','1') NOT NULL DEFAULT '1',
  `is_checkout_city` enum('0','1') NOT NULL DEFAULT '1',
  `is_checkout_zip` enum('0','1') NOT NULL DEFAULT '1',
  `is_checkout_email` enum('0','1') NOT NULL DEFAULT '1',
  `is_checkout_phone` enum('0','1') NOT NULL DEFAULT '1',
  `is_delivery_note` enum('0','1') NOT NULL DEFAULT '1',
  `is_preparation_time` enum('0','1') NOT NULL DEFAULT '0',
  `preparation_time` varchar(20) NOT NULL,
  `preparation_time_unit` enum('minutes','hours','days') NOT NULL,
  `is_order_schedule` enum('0','1') NOT NULL DEFAULT '0',
  `order_schedule` enum('today','tomorrow','week','any') NOT NULL DEFAULT 'any',
  `font` text NOT NULL,
  `is_category_wise_product_view` enum('0','1') NOT NULL DEFAULT '0',
  `product_sort` enum('name','new','price','sale','random') NOT NULL DEFAULT 'name',
  `product_sort_order` enum('asc','desc') NOT NULL DEFAULT 'asc',
  `product_listing` enum('list','grid') NOT NULL DEFAULT 'list',
  `theme_color` varchar(10) NOT NULL,
  `hide_add_to_cart` enum('0','1') NOT NULL DEFAULT '0',
  `hide_buy_now` enum('0','1') NOT NULL DEFAULT '0',
  `whatsapp_send_order_button` enum('0','1') NOT NULL DEFAULT '0',
  `whatsapp_phone_number` varchar(30) NOT NULL,
  `whatsapp_send_order_text` text NOT NULL,
  `is_guest_login` enum('0','1') NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `paymaya_public_key` text NOT NULL,
  `toyyibpay_secret_key` text NOT NULL,
  `paymaya_secret_key` varchar(100) NOT NULL,
  `paymaya_mode` varchar(30) NOT NULL,
  `toyyibpay_category_code` varchar(100) NOT NULL,
  `toyyibpay_mode` varchar(30) NOT NULL,
  `myfatoorah_api_key` text NOT NULL,
  `myfatoorah_mode` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_config`
--

INSERT INTO `ecommerce_config` (`id`, `user_id`, `store_id`, `paypal_email`, `paypal_mode`, `stripe_billing_address`, `stripe_secret_key`, `stripe_publishable_key`, `paystack_secret_key`, `paystack_public_key`, `razorpay_key_id`, `razorpay_key_secret`, `mollie_api_key`, `mercadopago_public_key`, `mercadopago_access_token`, `marcadopago_country`, `sslcommerz_store_id`, `sslcommerz_store_password`, `sslcommerz_mode`, `senangpay_merchent_id`, `senangpay_secret_key`, `senangpay_mode`, `instamojo_api_key`, `instamojo_auth_token`, `instamojo_mode`, `xendit_secret_api_key`, `manual_payment`, `manual_payment_instruction`, `currency`, `currency_position`, `decimal_point`, `thousand_comma`, `store_pickup_title`, `buy_button_title`, `is_store_pickup`, `is_home_delivery`, `is_checkout_country`, `is_checkout_state`, `is_checkout_city`, `is_checkout_zip`, `is_checkout_email`, `is_checkout_phone`, `is_delivery_note`, `is_preparation_time`, `preparation_time`, `preparation_time_unit`, `is_order_schedule`, `order_schedule`, `font`, `is_category_wise_product_view`, `product_sort`, `product_sort_order`, `product_listing`, `theme_color`, `hide_add_to_cart`, `hide_buy_now`, `whatsapp_send_order_button`, `whatsapp_phone_number`, `whatsapp_send_order_text`, `is_guest_login`, `updated_at`, `paymaya_public_key`, `toyyibpay_secret_key`, `paymaya_secret_key`, `paymaya_mode`, `toyyibpay_category_code`, `toyyibpay_mode`, `myfatoorah_api_key`, `myfatoorah_mode`) VALUES
(1, 1, 1, 'Rashad.m.tantawy@gmail.com', 'live', '0', '', '', '', '', '', '', '', '', '', 'ar', '', '', 'live', '', '', 'live', '', '', 'live', '', '1', '', 'USD', 'left', 2, '0', 'Store Pickup', 'Buy Now', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', 'any', 'Arial,sans-serif', '0', 'new', 'desc', 'list', '#1261a0', '0', '0', '0', '', '', '0', '2021-05-27 20:37:01', '', '', '', 'live', '', 'live', '', 'live'),
(2, 1, 2, '', 'live', '0', '', '', '', '', '', '', '', '', '', '', '', '', 'live', '', '', 'live', '', '', 'live', '', '0', '', 'USD', 'left', 2, '0', 'Store Pickup', 'Buy Now', '0', '1', '1', '1', '1', '1', '1', '1', '1', '0', '', 'minutes', '0', 'any', 'Arial,sans-serif', '0', 'name', 'asc', 'list', '#545096', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_coupon`
--

CREATE TABLE `ecommerce_coupon` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `coupon_type` enum('percent','fixed cart','fixed product') NOT NULL DEFAULT 'percent',
  `coupon_code` varchar(50) NOT NULL,
  `coupon_amount` float NOT NULL DEFAULT '0',
  `free_shipping_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `expiry_date` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `product_ids` text NOT NULL COMMENT 'comma separated ',
  `max_usage_limit` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_product`
--

CREATE TABLE `ecommerce_product` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `original_price` float NOT NULL,
  `sell_price` float NOT NULL,
  `taxable` enum('0','1') NOT NULL DEFAULT '0',
  `stock_item` int(11) NOT NULL,
  `stock_display` enum('0','1') NOT NULL DEFAULT '0',
  `stock_prevent_purchase` enum('0','1') NOT NULL DEFAULT '0',
  `attribute_ids` varchar(255) NOT NULL,
  `preparation_time` varchar(20) NOT NULL,
  `preparation_time_unit` enum('minutes','hours','days') NOT NULL,
  `purchase_note` text NOT NULL,
  `thumbnail` text NOT NULL,
  `featured_images` text NOT NULL,
  `digital_product_file` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `sales_count` int(11) NOT NULL,
  `visit_count` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `woocommerce_product_id` int(11) DEFAULT NULL,
  `woocommerce_price_html` text NOT NULL,
  `related_product_ids` varchar(255) NOT NULL,
  `upsell_product_id` int(11) NOT NULL,
  `downsell_product_id` int(11) NOT NULL,
  `is_featured` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_product`
--

INSERT INTO `ecommerce_product` (`id`, `user_id`, `store_id`, `product_name`, `product_description`, `original_price`, `sell_price`, `taxable`, `stock_item`, `stock_display`, `stock_prevent_purchase`, `attribute_ids`, `preparation_time`, `preparation_time_unit`, `purchase_note`, `thumbnail`, `featured_images`, `digital_product_file`, `category_id`, `sales_count`, `visit_count`, `updated_at`, `status`, `deleted`, `woocommerce_product_id`, `woocommerce_price_html`, `related_product_ids`, `upsell_product_id`, `downsell_product_id`, `is_featured`) VALUES
(1, 1, 1, 'E-commerce app for Multi-vendor', '<ul><li>It built on the IONIC framework. This is only a customer app and has no vendor/admin module integrated.</li><li><h4>Mobile App Key Features:</h4></li><li>- Beautiful and Modern UI design</li><li>- Change the theme to match your branding</li><li>- Customer account section</li><li>- Fuzzy search algorithm</li><li>- Guest Checkout</li><li>- Multiple Shopping cart</li><li>- Vendor lists</li><li>- All categories page</li><li>- Contact seller option</li><li>- Offer countdown timer</li><li>- Automated tax based on shipping zone</li><li>- Dynamic shipping options</li><li>- Packaging options</li><li>- Multiple payment options</li><li>- Dynamic product attributes</li><li>- Multiple listings for a single product</li><li>- Linked item- Primary Slider</li><li>- Banner Slider</li><li>- Shop and Brand profile page</li><li>- Shop listing page</li><li>- Brand listing page</li><li>- Verified badge for trusted shops</li><li>- Social Media share option</li><li>- Social login (Facebook and Google)</li><li>- Coupon</li><li>- Wishlist</li><li>- Product Review</li><li>- Shop Review</li><li>- Dispute order option</li><li>- Custom message seller on the order page</li><li>- Multiple addresses</li></ul>', 2001, 550, '0', 0, '0', '0', '', '', '', '<ul><li>-We deliver the source project source code after all handling and implementations -Project not supported online payments (Can be added based on customer requirements)</li><li><h4>Installation Services</h4></li><li><span xss=\"removed\">-Install Mobile builder</span></li><li><span xss=\"removed\">-Install the APP</span></li><li><span xss=\"removed\">-Config wp-config files</span></li><li><span xss=\"removed\">-Configure App name</span></li><li><span xss=\"removed\">-App Icon-Splash screen</span></li><li><span xss=\"removed\">-Package name</span></li><li><span xss=\"removed\">-Generate APK file</span></li><li><span xss=\"removed\">- Generate AAB File &#40;for Play store&#41;</span></li><li><span xss=\"removed\">-Uploading to app stores (Play store & App store)</span></li><li>Customization Services</li><li><span xss=\"removed\">-language customization</span></li><li><span xss=\"removed\">-Payment gateway customization</span></li></ul>', 'product_1_1622152787589988.jpg', 'fproduct_1_1622152797110294.jpg,fproduct_1_1622152798160426.png,fproduct_1_1622152798116295.jpg', '', 1, 0, 4, '2021-05-28 00:00:12', '1', '0', NULL, '', '', 0, 0, '0'),
(2, 1, 1, 'online food ordering app', '<ul><li>\r\nComplete solutions for your Restaurant and Food Delivery Business.Piping hot food at your doorstep is like a dream come true with the \r\nthis App. Build a user-friendly and appetizing Food Delivery \r\nmobile app for your cafe or restaurant business. </li><li><h4>Features of User App</h4></li><li>SignIn with Google / Email & password</li><li>-Dark & light mode</li><li>-Favorite Restaurant</li><li>-Order Place</li><li>-Track Order</li><li>-Multiple Address selection</li><li>-Add to cart</li><li>-Review</li><li><h4>Features Restaurant Manager</h4></li><li>-SignIn with Email/password</li><li>-manage all orders</li><li>-Favourite Restaurant</li><li>-manage restaurant’s menu items</li><li>-add/update own restaurant’s details</li><li>-Features Mighty Admin-Email & password</li><li>-Manage all restaurant</li><li>-Manage all food category</li><li>-Manage all menu item</li><li>-Manage all Order With all status</li><li><h4>Features of Delivery Boy App</h4></li><li>SignIn with Google / Email & password</li><li>-Dark & light mode</li><li>-Track Order</li><li>-Assign Order</li><li>-Review-History Order</li></ul>', 1200, 950, '1', 0, '0', '0', '', '', '', '<ul><li><h4>What will you get?</h4></li><li>Full dart source code for both iOS and Android</li><li>Well documentation help using product effective</li><li>4 in 1 Complete solutions of food delivery app</li><li>Clean Code & Well Structured</li><li>Simple UI & Ux</li><li>60 fps Support for both Android & iOS</li><li>Easy Integration to Your Project</li><li>Single Code base for both Android & iOS</li><li><h4><span class=\"js-item-sidebar-meta-attributes\">Installation Services</span></h4><h4><span class=\"js-item-sidebar-meta-attributes\"></span></h4></li><li><span class=\"js-item-sidebar-meta-attributes\"></span><span class=\"js-item-sidebar-meta-attributes\">Install Mobile builder</span></li><li><span class=\"js-item-sidebar-meta-attributes\">-Install the APP</span></li><li><span class=\"js-item-sidebar-meta-attributes\">-Config wp-config files</span></li><li><span class=\"js-item-sidebar-meta-attributes\">-Configure App name</span></li><li><span class=\"js-item-sidebar-meta-attributes\">-App Icon-Splash screen</span></li><li><span class=\"js-item-sidebar-meta-attributes\">-Package name</span></li><li><span class=\"js-item-sidebar-meta-attributes\">-Generate APK file</span></li><li><span class=\"js-item-sidebar-meta-attributes\">- Generate AAB File &#40;for Play store&#41;</span></li><li><span class=\"js-item-sidebar-meta-attributes\">-Uploading to app stores (Play store & App store)</span></li><li><h4><span class=\"js-item-sidebar-meta-attributes\"></span><span class=\"js-item-sidebar-meta-attributes\">Customization Services</span></h4></li><li><span class=\"js-item-sidebar-meta-attributes\"></span><span class=\"js-item-sidebar-meta-attributes\">language customization</span></li></ul>', 'product_1_1622151062173881.jpg', 'fproduct_1_1622151068149081.jpg,fproduct_1_1622151068179271.jpg,fproduct_1_1622151069183044.jpg', '', 1, 0, 2, '2021-05-27 23:44:17', '1', '0', NULL, '', '', 0, 0, '0'),
(3, 1, 1, 'Barbershop Booking App - Android', '<ul><li><p></p><h4 id=\"item-description__what-you-will-get\">Features & Services </h4>\r\n</li><li>Google Sign In\r\n</li><li>- Anonymous Sign In</li><li>\r\n- Cloud Firestore Integration\r\n</li><li>- Getx State Management</li><li>\r\n- Website Shortcut</li><li>\r\n- Phonecall Shortcut</li><li>\r\n- Direction Shortcut\r\n</li><li>- Gallery Pages</li><li>\r\n- Service List Pages\r\n</li><li>- About Pages</li><li>\r\n- Review Pages\r\n</li><li>- Sign In Pages\r\n</li><li>- Profile Pages\r\n</li><li>- Free updates forever</li><li><p></p><h4>New update</h4>\r\n</li><li>- Login as Barber Shop Manager</li><li>\r\n- Manage Services\r\n</li><li>- Manage Galleries\r\n</li><li>- Approve/Reject Order\r\n</li><li><div align=\"left\">- Booking Calendar View\r\n\r\n </div><p></p></li></ul>', 400, 280, '1', 0, '0', '0', '', '', '', '<ul><li><h4>Installation Services</h4></li><li>-Install Mobile builder</li><li>-Install the APP</li><li>-App Icon-Splash screen</li><li>-Package name</li><li>-Generate APK file</li><li>-Uploading to Play store</li><li><h4>Customization Services</h4></li><li>-language customization</li></ul>', 'product_1_1622150541128773.jpg', 'fproduct_1_1622150551136279.jpg,fproduct_1_1622150551825893.jpg,fproduct_1_1622150552147707.jpg', '', 1, 0, 2, '2021-05-27 23:27:00', '1', '0', NULL, '', '', 0, 0, '0'),
(4, 1, 1, 'Pets adoption  App - Android& IOS', '<ul><li><h4>Features & Services</h4></li></ul><p></p><ul><li>\r\n        <p> Users can upload adoption posts as well as they can adopt from the app. </p>\r\n    </li><li>\r\n        <p> The nearby location will be showcased when you are looking for the adoption.  </p>\r\n    </li><li>\r\n        <p> You can easily categorize the pet animals in terms of age, \r\nsex, and family of a pet animal. It becomes an easy process and you can \r\nget what you are looking for.  </p>\r\n    </li><li>\r\n        <p> The contact option will be directly linked amongst the \r\nusers, you can easily contact for further discussion regarding the \r\nadoption.  </p>\r\n    </li><li>\r\n        <p> In-app development and the facility of getting in touch with\r\n the person who is owning the pet you need to adopt or give away for the\r\n adoption.  </p><ul><li>\r\n        <p> There is an option available for becoming a pro where there will be a cut off of advertisements.  </p>\r\n    </li><li>\r\n        <p> Once as a user, if you have posted an ad for the adoption \r\nfor people you can always boost your ad by showcasing it frequently and \r\non an urgent based.  </p>\r\n    </li><li>\r\n        <p> You can always see the insights of your profile once you \r\nhave posted an ad for promotion and also can view the number of people \r\nvisiting your page.  </p>\r\n    </li><li>\r\n        <p> Advanced features available will tell you the ratio of pet \r\nshop owners and the owners of pet animals who are open for adoption. \r\nThis will make it easy for a user to find and adopt from the relevant \r\nsources.  </p>\r\n    </li></ul>\r\n    </li></ul>', 1000, 820, '1', 0, '0', '0', '', '', '', '<ul><li>We deliver the source project source code after all handling and implementations</li><li><h4>We support below survives: </h4></li><li>Installation Services</li><li>Install Mobile builder</li><li>Install the APP</li><li>Config wp-config files</li><li>Configure App name</li><li>App Icon</li><li>Splash screen</li><li>Package name</li><li>Generate APK file</li><li> Generate AAB File &#40;for Play store&#41;</li><li>Uploading to app stores (Play store & App store)</li><li><h4>Customization Services</h4><ul><li>-language customization</li><li>Payment gateway customization (based on customer requests)</li></ul></li></ul>', 'product_1_1622150173208016.jpg', 'fproduct_1_1622150183638504.jpg,fproduct_1_1622150184147281.jpg,fproduct_1_1622150184669350.jpg', '', 1, 0, 12, '2021-05-28 13:20:15', '1', '0', NULL, '', '', 0, 0, '0'),
(5, 1, 1, 'Laundry application', '<p id=\"item-description__rith-laundry-is-a-responsive-and-stylish-app-created-using-react-native-it-has\">a\r\n responsive and stylish app created using React Native. It has clean \r\nUser Interface created for laundry agency. It has optimized and well \r\nstructured code and customizable features.</p>', 1450, 1150, '1', 0, '0', '0', '', '', '', '<ul><li>-We deliver the source project source code after all handling and implementations</li><li><h4>Installation Services</h4></li><li>-Install Mobile builder</li><li>-Install the APP</li><li>-Config wp-config files</li><li>-Configure App name</li><li>-App Icon</li><li>-Splash screen</li><li>-Package name</li><li>-Generate APK file</li><li>- Generate AAB File &#40;for Play store&#41;</li><li>-Uploading to app stores (Play store & App store)</li><li><h4>Customization Services</h4></li><li>-language customization</li><li>-Payment gateway customization</li><li>Project supported PayPal online payments (Different Payments can be added based on customer requirements)</li></ul>', 'product_1_1622290968187348.png', 'fproduct_1_1622291359112017.jpg,fproduct_1_1622291359187322.jpg,fproduct_1_1622291359129730.jpg', '', 1, 0, 0, '2021-05-29 14:57:59', '1', '0', NULL, '', '', 0, 0, '0'),
(6, 1, 1, 'Resturant application - Android', '<p>Food Application for restaurant with Ingredients & delivery boy full \r\nandroid application is app for single restaurant who provide food \r\ndelivery to their clients, we can use this app for cafe, pizza, burger, \r\nfast-food, or any other restaurant products. with this app user can \r\ncheck all menu items, and ingredients (or toppings) of menu items, there\r\n are two types of ingredients free and paid,</p><ul><li><h4>Application features :</h4></li></ul>\r\n<ul><li>Restaurants menu items with ingredients(toppings)</li><li>User can choose Free ingredients (no extra cost on order)</li><li>User can choose Paid ingredients (extra cost add to order)</li><li>Home page with categorised menu</li><li>Cart details on same screen</li><li>Add multiple items on cart</li><li>Menu item details with </li><ul><li>Food item name</li><li>Food item description</li><li>Food Item Picture</li><li>Free toppings of Food Items</li><li>Paid toppings of Food Items</li></ul><li>Checkout from cart</li><li>Complete checkout process</li><ul><li>Add Name</li><li>Select address</li><li>phone number</li><li>Provide email id</li><li>provide comment</li><li>Payment type : by cash or by card swipe</li></ul><li>Use google map to share your location while place order, you don’t need to type address.</li><li>but you can edit location retrieve from google map</li><li>Complete detail of order </li><ul><li>Order time & delivery time,</li><li>Order amount & restaurant detail</li><li>Ordered item details</li></ul><li>total 4 Order status </li><ul><li>Order Placed</li><li>Order Processing</li><li>Out for delivery</li><li>Delivered order</li></ul><li>User order history</li><li>Order detail with status & item details</li><li>Favourite list of Menu items</li><li>Share app</li><li>Tearms & condition</li><li>About us page</li><li>Register user with mobile number</li><li>Push notification with firebase</li><li>Order status push notification </li><li>RTL support</li></ul>\r\n<ul><li><h4>Delivery Boy Features :</h4></li></ul>\r\n<ul><li>Login from same app</li><li>Set presence </li><li>Check new Orders</li><li>Order History</li><li>Order detail with name, address, contact no & item detail</li><li>Call customer or show route on map</li><li>Picked order & deliver order</li><li>Get notified on new order assigned </li></ul>\r\n<ul><li><h4>Admin Panel Features :</h4></li></ul>\r\n<ul><li>Add Restaurant Menu</li><li>Add menu categories</li><li>Add menu ingredients (toppings)</li><li>Check new orders and order details</li><li>Add delivery boy</li><li>Assign order to delivery boy</li><li>on dashboard check order report</li><li>Setup push notification from admin</li><li>send push notification </li></ul>', 800, 600, '1', 0, '0', '0', '', '', '', '<ul><li>-We deliver the source project source code after all handling and implementations</li><li><h4>Installation Services</h4></li><li>-Install Mobile builder</li><li>-Install the APP</li><li>-Config wp-config files</li><li>-Configure App name</li><li>-App Icon</li><li>-Splash screen</li><li>-Package name</li><li>-Generate APK file</li><li>-Uploading to app stores (Play store )</li><li><h4>Customization Services</h4></li><li>-language customization</li><li>-Payment gateway customization</li></ul>', 'product_1_1622293017129475.png', 'fproduct_1_1622293024150587.png,fproduct_1_1622293026123711.png,fproduct_1_1622293027113553.png', '', 1, 0, 0, '2021-05-29 14:57:46', '1', '0', NULL, '', '', 0, 0, '0'),
(7, 1, 1, 'Gym Master Mobile App for iOS & Android', '', 600, 350, '1', 0, '0', '0', '', '', '', '<ul><li>-We deliver the source project source code after all handling and implementations</li><li>Installation Services</li><li>-Install Mobile builder</li><li>-Install the APP</li><li>-Config wp-config files</li><li>-Configure App name</li><li>-App Icon</li><li>-Splash screen</li><li>-Package name</li><li>-Generate APK file</li><li>- Generate AAB File &#40;for Play store&#41;</li><li>-Uploading to app stores (Play store & App store)</li><li>Customization Services</li><li>-language customization</li><li>-Payment gateway customization</li><li>-Project not supported online payments (Can be added based on customer requirements)</li></ul>', 'product_1_1622295256113972.jpg', 'fproduct_1_1622295265193262.jpg,fproduct_1_1622295266908166.jpg,fproduct_1_1622295266582450.jpg', '', 1, 0, 0, '2021-05-29 15:34:42', '1', '0', NULL, '', '', 0, 0, '0'),
(8, 1, 1, 'Restaurant Food Ordering website', '<p>Restaurant Food Ordering With Ingredients In Laravel is website for \r\nsingle restaurant who provide food delivery to their clients, we can \r\nalso use this website for cafe, pizza, burger, fast-food, or any other \r\nrestaurant products. with this website user can check all menu items, \r\nand ingredients (or toppings) of menu items, there are two types of \r\ningredients free and paid</p><p></p><ul><li><h4>Website features :</h4></li></ul>\r\n<ul><li>Restaurants menu items with ingredients(toppings)</li><li>User can choose Free ingredients (no extra cost on order)</li><li>User can choose Paid ingredients (extra cost add to order)</li><li>Home page with categorised menu</li><li>Cart details Popup</li><li>Cart Page with add or remove items</li><li>Add multiple items on cart</li><li>Menu item details with \r\n    <ul><li>Food item name</li><li>Food item description</li><li>Food Item Picture</li><li>Free toppings of Food Items</li><li>Paid toppings of Food Items</li></ul>\r\n  </li><li>Checkout from cart</li><li>Complete checkout process\r\n    <ul><li>Add Name</li><li>Select address</li><li>phone number</li><li>Provide email id</li><li>provide comment</li><li>Payment type : PayPal, Stripe or Cash on Delivery</li></ul>\r\n  </li><li>Use google map to share your location while place order, you don’t need to type address.</li><li>but you can edit location retrieve from google map</li><li>Complete detail of order \r\n    <ul><li>Order time & delivery time,</li><li>Order amount & restaurant detail</li><li>Ordered item details</li></ul>\r\n  </li><li>total 4 Order status \r\n    <ul><li>Order Placed</li><li>Order Processing</li><li>Out for delivery</li><li>Delivered order</li></ul>\r\n  </li><li>User order history</li><li>Order detail with status & item details</li><li>Favourite list of Menu items</li><li>Share menu items</li><li>Tearms & condition</li><li>About us page</li><li>Register user with mobile number</li><li>Order status</li><li>RTL support</li></ul><ul><li><h4>Admin Panel Features :</h4></li></ul>\r\n<ul><li>Add Restaurant Menu</li><li>Add menu categories</li><li>Add menu ingredients (toppings)</li><li>Check new orders and order details</li><li>Add delivery boy</li><li>Assign order to delivery boy</li><li>on dashboard check order report</li><li>Setup Delivery charges from admin</li><li>Setup restaurant details </li><li>Set currency for website</li><li>Configure payment by PayPal & Stripe</li></ul>\r\n<ul><li><h4>Delivery Boy Features :</h4></li></ul>\r\n<ul><li>Login from same app</li><li>Set presence </li><li>Check new Orders</li><li>Order History</li><li>Order detail with name, address, contact no & item detail</li><li>Call customer or show route on map</li><li>Picked order & deliver order</li><li>Get notified on new order assigned </li></ul>', 300, 250, '1', 0, '0', '0', '', '', '', '<ul><li>-We deliver the source project source code after all handling and implementations</li><li>-Project supported PayPal online payments (Another payments Can be added based on customer requirements)</li><li><h4>Installation Services</h4></li><li>-Install Mobile builder</li><li>-Install the APP</li><li>-Config wp-config files</li><li>-Configure App name</li><li><h4>Customization Services</h4></li><li>-language customization</li><li>-Payment gateway customization (Another payments Can be added based on customer requirements)</li></ul>', 'product_1_1622296801120223.jpg', 'fproduct_1_1622296815549093.jpg,fproduct_1_1622296816146644.jpg,fproduct_1_1622296817189570.jpg', '', 2, 0, 0, '2021-05-29 16:00:28', '1', '0', NULL, '', '', 0, 0, '0'),
(9, 1, 1, 'eCommerce Website', '<p class=\"t-heading -color-inherit -size-l h-m0 is-hidden-phone\">eCommerce MVC is an extendable, adaptable eCommerce project developed \r\nwith C# ASP .Net MVC framework. It has all the features a fully \r\nfunctional online shopping website requires. You can even use eCommerce \r\nMVC’s existing clean written and quality code structure to include more \r\nfeatures.</p>', 1200, 850, '1', 0, '0', '0', '', '', '', '<ul><li>-We deliver the source project source code after all handling and implementations</li><li>-Project supported PayPal online payments (More payments can be added based on customer requirements)</li><li><h4>Installation Services</h4><ul><li>-Install Mobile builder</li><li>-Install the APP</li><li>-Config wp-config files</li><li>-Configure App name</li></ul></li><li><h4>Customization Services</h4><ul><li>-Payment gateway customization</li></ul>(More payments can be added based on customer requirements)</li></ul>', 'product_1_1622297502161297.jpg', 'fproduct_1_1622297508144000.jpg,fproduct_1_1622297509307778.jpg,fproduct_1_1622297510105161.jpg', '', 2, 0, 0, '2021-05-29 16:11:52', '1', '0', NULL, '', '', 0, 0, '0'),
(10, 1, 1, 'Online-Offline Event & Classes Ticket Selling & Management', '<p>an Event planning and management Laravel package. With Eventmie Pro, \r\nlaunch a self-hosted platform for Event management & selling on your\r\n own domain. Streamline the event planning process through automation. \r\nEventmie Pro is secure, scalable, production-read</p><p></p><p></p>', 800, 650, '1', 0, '0', '0', '', '', '', '<ul><li>-We deliver the source project source code after all handling and implementations</li><li>-Project not supported online payments (Can be added based on customer requirements)</li><li>Installation Services</li><li>-Install Mobile builder</li><li>-Install the APP</li><li>-Config wp-config files</li><li><h4>Customization Services</h4><ul><li>-language customization</li><li>-Payment gateway customization(Can be added based on customer requirements)</li></ul></li></ul>', 'product_1_1622298304173660.jpg', 'fproduct_1_1622298078120517.jpg,fproduct_1_1622298078810380.jpg,fproduct_1_1622298079560304.jpg', '', 2, 0, 0, '2021-05-29 16:25:05', '1', '0', NULL, '', '', 0, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_reminder_report`
--

CREATE TABLE `ecommerce_reminder_report` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscriber_id` varchar(250) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `last_completed_hour` int(11) NOT NULL,
  `is_sent` enum('0','1') NOT NULL DEFAULT '1',
  `is_opened` enum('0','1') NOT NULL DEFAULT '0',
  `is_delivered` enum('0','1') NOT NULL DEFAULT '0',
  `sent_at` datetime NOT NULL,
  `delivered_at` datetime NOT NULL,
  `opened_at` datetime NOT NULL,
  `sent_response` text NOT NULL,
  `delivered_response` tinytext NOT NULL,
  `last_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_store`
--

CREATE TABLE `ecommerce_store` (
  `id` int(11) NOT NULL,
  `store_unique_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `store_type` enum('physical','digital','service') NOT NULL DEFAULT 'physical',
  `store_name` text NOT NULL,
  `store_logo` varchar(50) NOT NULL,
  `store_favicon` varchar(50) NOT NULL,
  `store_email` varchar(75) NOT NULL,
  `store_phone` varchar(25) NOT NULL,
  `store_country` varchar(20) NOT NULL,
  `store_city` varchar(50) NOT NULL,
  `store_state` varchar(50) NOT NULL,
  `store_zip` varchar(20) NOT NULL,
  `store_address` text NOT NULL,
  `tax_percentage` float NOT NULL,
  `shipping_charge` float NOT NULL,
  `paypal_enabled` enum('0','1') DEFAULT '0',
  `stripe_enabled` enum('0','1') DEFAULT '0',
  `razorpay_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `paystack_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `mollie_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `mercadopago_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `sslcommerz_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `senangpay_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `instamojo_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `xendit_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `manual_enabled` enum('0','1') NOT NULL DEFAULT '1',
  `cod_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `messenger_content` text NOT NULL,
  `sms_content` text NOT NULL,
  `sms_api_id` int(11) NOT NULL,
  `email_content` longtext NOT NULL,
  `email_api_id` int(11) NOT NULL,
  `email_subject` text NOT NULL,
  `configure_email_table` varchar(100) NOT NULL,
  `notification_sms_api_id` int(11) NOT NULL,
  `notification_email_api_id` int(11) NOT NULL,
  `notification_email_subject` text NOT NULL,
  `notification_configure_email_table` varchar(100) NOT NULL,
  `notification_message` text NOT NULL,
  `label_ids` text NOT NULL,
  `last_sent_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `terms_use_link` text NOT NULL,
  `refund_policy_link` text NOT NULL,
  `store_locale` varchar(50) NOT NULL,
  `pixel_id` varchar(50) NOT NULL,
  `google_id` varchar(50) NOT NULL,
  `qr_code` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `paymaya_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `toyyibpay_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `myfatoorah_enabled` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecommerce_store`
--

INSERT INTO `ecommerce_store` (`id`, `store_unique_id`, `user_id`, `page_id`, `store_type`, `store_name`, `store_logo`, `store_favicon`, `store_email`, `store_phone`, `store_country`, `store_city`, `store_state`, `store_zip`, `store_address`, `tax_percentage`, `shipping_charge`, `paypal_enabled`, `stripe_enabled`, `razorpay_enabled`, `paystack_enabled`, `mollie_enabled`, `mercadopago_enabled`, `sslcommerz_enabled`, `senangpay_enabled`, `instamojo_enabled`, `xendit_enabled`, `manual_enabled`, `cod_enabled`, `messenger_content`, `sms_content`, `sms_api_id`, `email_content`, `email_api_id`, `email_subject`, `configure_email_table`, `notification_sms_api_id`, `notification_email_api_id`, `notification_email_subject`, `notification_configure_email_table`, `notification_message`, `label_ids`, `last_sent_at`, `created_at`, `terms_use_link`, `refund_policy_link`, `store_locale`, `pixel_id`, `google_id`, `qr_code`, `status`, `paymaya_enabled`, `toyyibpay_enabled`, `myfatoorah_enabled`) VALUES
(1, '11622048244', 1, 23, 'physical', 'ProAtCoding Store', 'storelogo_1_1622900060792328.png', 'storefavicon_1_1622153808434189.png', 'info@proatcoding.com', '01118136665', 'EG', 'Cairo', 'Cairo', '12511', '21-ST Associate / Haram-Giza', 0, 0, '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '{\"checkout\":{\"checkout_text\":\"Congratulations {{first_name}}!\\r\\n        Thanks for shopping from our store. You made the right choice. If you need any information, just leave us a message here.\",\"checkout_text_next\":\"You can see your order history and status here.\",\"checkout_btn_next\":\"MY ORDERS\"}}', '', 0, '', 0, '', '', 0, 0, '', '', '', '', '2021-06-02 09:25:03', '2021-05-26 18:57:24', '', '', 'english', '', '', '{\"msg_text\":\"Hi {{first_name}}, welcome to our store.\",\"msg_btn\":\"START\",\"msg_fore_color\":\"#ff0000\",\"msg_back_color\":\"#ffffff\",\"out_fore_color\":\"#004080\",\"out_back_color\":\"#ffffff\"}', '1', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_store_business_hours`
--

CREATE TABLE `ecommerce_store_business_hours` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `schedule_day` varchar(20) NOT NULL,
  `off_day` enum('0','1') NOT NULL DEFAULT '0',
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  `always_open` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_clickrate_links_backup`
--

CREATE TABLE `email_clickrate_links_backup` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `links` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `smtp_host` varchar(100) NOT NULL,
  `smtp_port` varchar(100) NOT NULL,
  `smtp_user` varchar(100) NOT NULL,
  `smtp_type` enum('Default','tls','ssl') NOT NULL DEFAULT 'Default',
  `smtp_password` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `user_id`, `email_address`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_type`, `smtp_password`, `status`, `deleted`) VALUES
(1, 0, 'support@gaxa-bot.com', 'mail.gaxa-bot.com', '587', 'support@gaxa-bot.com', 'Default', 'B!boM!sho123', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `email_mailgun_config`
--

CREATE TABLE `email_mailgun_config` (
  `id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `domain_name` varchar(200) NOT NULL,
  `api_key` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_mandrill_config`
--

CREATE TABLE `email_mandrill_config` (
  `id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `your_name` varchar(200) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `api_key` varchar(200) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_sendgrid_config`
--

CREATE TABLE `email_sendgrid_config` (
  `id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_sending_campaign`
--

CREATE TABLE `email_sending_campaign` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `configure_email_table` varchar(255) NOT NULL,
  `api_id` int(11) NOT NULL COMMENT 'configure_email_table_id',
  `page_id` int(11) NOT NULL,
  `fb_page_id` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `label_ids` text NOT NULL,
  `excluded_label_ids` text NOT NULL,
  `label_names` text NOT NULL,
  `user_gender` varchar(20) NOT NULL,
  `user_time_zone` varchar(20) NOT NULL,
  `user_locale` varchar(50) NOT NULL,
  `contact_ids` mediumtext NOT NULL,
  `contact_type_id` mediumtext NOT NULL COMMENT 'contact_group_table_id',
  `campaign_name` mediumtext NOT NULL,
  `email_subject` mediumtext NOT NULL,
  `email_message` longtext CHARACTER SET utf8mb4 NOT NULL,
  `email_template_id` int(11) DEFAULT NULL,
  `email_attachment` text NOT NULL,
  `posting_status` enum('0','1','2','3') NOT NULL,
  `schedule_time` datetime NOT NULL,
  `time_zone` mediumtext NOT NULL,
  `total_thread` int(11) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `completed_at` datetime NOT NULL,
  `is_try_again` enum('0','1') NOT NULL DEFAULT '1',
  `number_of_unique_open` int(11) NOT NULL,
  `number_of_total_open` int(11) NOT NULL,
  `number_of_unique_click` int(11) NOT NULL,
  `number_of_total_click` int(11) NOT NULL,
  `number_of_unique_clickers` int(11) NOT NULL,
  `last_opened_at` datetime NOT NULL,
  `last_clicked_at` datetime NOT NULL,
  `total_unsubscribed` int(11) NOT NULL,
  `last_unsubscribed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_sending_campaign_send`
--

CREATE TABLE `email_sending_campaign_send` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_table_name` varchar(255) NOT NULL COMMENT 'configure_email_table_name',
  `email_api_id` int(11) NOT NULL COMMENT 'configure_email_table_id',
  `campaign_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `contact_first_name` varchar(255) NOT NULL,
  `contact_last_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `is_open` int(11) NOT NULL,
  `number_of_time_open` int(11) NOT NULL,
  `number_of_clicked` int(11) NOT NULL,
  `delivery_id` varchar(255) NOT NULL,
  `sent_time` datetime NOT NULL,
  `processed` enum('0','1') NOT NULL DEFAULT '0',
  `is_clicked` enum('0','1') NOT NULL DEFAULT '0',
  `is_unsubscribed` enum('0','1') NOT NULL DEFAULT '0',
  `email_opened_at` datetime NOT NULL,
  `unsubscribed_at` datetime NOT NULL,
  `last_clicked_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_template`
--

CREATE TABLE `email_sms_template` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `template_type` enum('sms','email') NOT NULL,
  `editor_type` enum('rich_text_editor','drag_and_drop') DEFAULT 'rich_text_editor',
  `location_hash` varchar(50) DEFAULT NULL,
  `template_name` varchar(255) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_smtp_config`
--

CREATE TABLE `email_smtp_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `email_address` varchar(200) CHARACTER SET latin1 NOT NULL,
  `smtp_host` varchar(200) CHARACTER SET latin1 NOT NULL,
  `smtp_port` varchar(100) CHARACTER SET latin1 NOT NULL,
  `smtp_user` varchar(100) CHARACTER SET latin1 NOT NULL,
  `smtp_password` varchar(100) CHARACTER SET latin1 NOT NULL,
  `smtp_type` enum('Default','tls','ssl') CHARACTER SET latin1 NOT NULL DEFAULT 'Default',
  `status` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `deleted` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_template_management`
--

CREATE TABLE `email_template_management` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template_type` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'fas fa-folder-open',
  `tooltip` text NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_template_management`
--

INSERT INTO `email_template_management` (`id`, `title`, `template_type`, `subject`, `message`, `icon`, `tooltip`, `info`) VALUES
(1, 'Signup Activation', 'signup_activation', '#APP_NAME# | Account Activation', '<!doctype html>\r\n    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n      <head>\r\n        <title>\r\n          \r\n        </title>\r\n        <!--[if !mso]><!-- -->\r\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n        <!--<![endif]-->\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n        <style type=\"text/css\">\r\n          #outlook a { padding:0; }\r\n          .ReadMsgBody { width:100%; }\r\n          .ExternalClass { width:100%; }\r\n          .ExternalClass * { line-height:100%; }\r\n          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }\r\n          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }\r\n          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }\r\n          p { display:block;margin:13px 0; }\r\n        </style>\r\n        <!--[if !mso]><!-->\r\n        <style type=\"text/css\">\r\n          @media only screen and (max-width:480px) {\r\n            @-ms-viewport { width:320px; }\r\n            @viewport { width:320px; }\r\n          }\r\n        </style>\r\n        <!--<![endif]-->\r\n        <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n        <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n        \r\n      <!--[if !mso]><!-->\r\n        <link href=\"https://fonts.googleapis.com/css?family=Ubuntu:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Arial:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n        <style type=\"text/css\">\r\n          @import url(https://fonts.googleapis.com/css?family=Ubuntu:400,700);\r\n@import url(https://fonts.googleapis.com/css?family=Cabin:400,700);\r\n@import url(https://fonts.googleapis.com/css?family=Arial:400,700);\r\n        </style>\r\n      <!--<![endif]-->\r\n\r\n    \r\n        \r\n    <style type=\"text/css\">\r\n      @media only screen and (min-width:480px) {\r\n        .mj-column-per-100 { width:100% !important; max-width: 100%; }\r\n      }\r\n    </style>\r\n    \r\n  \r\n        <style type=\"text/css\">\r\n        \r\n        \r\n\r\n    @media only screen and (max-width:480px) {\r\n      table.full-width-mobile { width: 100% !important; }\r\n      td.full-width-mobile { width: auto !important; }\r\n    }\r\n  \r\n        </style>\r\n        <style type=\"text/css\">.hide_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_mobile { display: block !important;} }\r\n        .hide_section_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_mobile { display: table !important;} }\r\n        .hide_on_desktop { display: block !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_desktop { display: none !important;} }\r\n        .hide_section_on_desktop { display: table !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_desktop { display: none !important;} }\r\n        [owa] .mj-column-per-100 {\r\n            width: 100%!important;\r\n          }\r\n          [owa] .mj-column-per-50 {\r\n            width: 50%!important;\r\n          }\r\n          [owa] .mj-column-per-33 {\r\n            width: 33.333333333333336%!important;\r\n          }\r\n          p, h1, h2, h3 {\r\n              margin: 0px;\r\n          }\r\n        \r\n          @media only print and (min-width:480px) {\r\n            .mj-column-per-100 { width:100%!important; }\r\n            .mj-column-per-40 { width:40%!important; }\r\n            .mj-column-per-60 { width:60%!important; }\r\n            .mj-column-per-50 { width: 50%!important; }\r\n            mj-column-per-33 { width: 33.333333333333336%!important; }\r\n            }</style>\r\n        \r\n      </head>\r\n      <body style=\"background-color:#FFFFFF;\">\r\n        \r\n        \r\n      <div style=\"background-color:#FFFFFF;\">\r\n        \r\n      \r\n      <!--[if mso | IE]>\r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:276px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604e7832abdf9/1615755341.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"276\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:600px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604e7832abdf9/1615757084.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"600\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"color: #236fa1; font-size: 20px;\"><strong>Welcome to Gaxa-bot</strong></span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px; color: #7e8c8d;\"> Gaxa Is the world first bulk message sender to Facebook messanger subscriber. It`s the best alternative of email marketing which is more powerful.</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 20px;\">Your Activation code is :#ACCOUNT_ACTIVATION_CODE#</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" vertical-align=\"middle\" style=\"font-size:0px;padding:20px 20px 20px 20px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:separate;width:100%;line-height:100%;\">\r\n        <tr>\r\n          <td align=\"center\" bgcolor=\"#424EEB\" role=\"presentation\" style=\"border:0px solid #000;border-radius:5px;cursor:auto;mso-padding-alt:9px 26px 9px 26px;background:#424EEB;\" valign=\"middle\">\r\n            <a href=\"https://www.gaxa-bot.com/home/account_activation\" style=\"display:inline-block;background:#424EEB;color:#ffffff;font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:13px;font-weight:normal;line-height:100%;Margin:0;text-decoration:none;text-transform:none;padding:9px 26px 9px 26px;mso-padding-alt:0px;border-radius:5px;\" target=\"_blank\">\r\n              <span style=\"font-size: 16px; font-family: Arial, sans-serif;\">Login Now</span>\r\n            </a>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      <![endif]-->\r\n    \r\n    \r\n      </div>\r\n    \r\n      </body>\r\n    </html>', 'fas fa-skating', '#APP_NAME#,#ACTIVATION_URL#,#ACCOUNT_ACTIVATION_CODE#', 'When a new user open an account'),
(2, 'Reset Password', 'reset_password', '#APP_NAME# | Password Recovery', '<!doctype html>\r\n    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n      <head>\r\n        <title>\r\n          \r\n        </title>\r\n        <!--[if !mso]><!-- -->\r\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n        <!--<![endif]-->\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n        <style type=\"text/css\">\r\n          #outlook a { padding:0; }\r\n          .ReadMsgBody { width:100%; }\r\n          .ExternalClass { width:100%; }\r\n          .ExternalClass * { line-height:100%; }\r\n          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }\r\n          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }\r\n          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }\r\n          p { display:block;margin:13px 0; }\r\n        </style>\r\n        <!--[if !mso]><!-->\r\n        <style type=\"text/css\">\r\n          @media only screen and (max-width:480px) {\r\n            @-ms-viewport { width:320px; }\r\n            @viewport { width:320px; }\r\n          }\r\n        </style>\r\n        <!--<![endif]-->\r\n        <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n        <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n        \r\n      <!--[if !mso]><!-->\r\n        <link href=\"https://fonts.googleapis.com/css?family=Ubuntu:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n        <style type=\"text/css\">\r\n          @import url(https://fonts.googleapis.com/css?family=Ubuntu:400,700);\r\n@import url(https://fonts.googleapis.com/css?family=Cabin:400,700);\r\n        </style>\r\n      <!--<![endif]-->\r\n\r\n    \r\n        \r\n    <style type=\"text/css\">\r\n      @media only screen and (min-width:480px) {\r\n        .mj-column-per-100 { width:100% !important; max-width: 100%; }\r\n      }\r\n    </style>\r\n    \r\n  \r\n        <style type=\"text/css\">\r\n        \r\n        \r\n\r\n    @media only screen and (max-width:480px) {\r\n      table.full-width-mobile { width: 100% !important; }\r\n      td.full-width-mobile { width: auto !important; }\r\n    }\r\n  \r\n        </style>\r\n        <style type=\"text/css\">.hide_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_mobile { display: block !important;} }\r\n        .hide_section_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_mobile { display: table !important;} }\r\n        .hide_on_desktop { display: block !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_desktop { display: none !important;} }\r\n        .hide_section_on_desktop { display: table !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_desktop { display: none !important;} }\r\n        [owa] .mj-column-per-100 {\r\n            width: 100%!important;\r\n          }\r\n          [owa] .mj-column-per-50 {\r\n            width: 50%!important;\r\n          }\r\n          [owa] .mj-column-per-33 {\r\n            width: 33.333333333333336%!important;\r\n          }\r\n          p, h1, h2, h3 {\r\n              margin: 0px;\r\n          }\r\n        \r\n          @media only print and (min-width:480px) {\r\n            .mj-column-per-100 { width:100%!important; }\r\n            .mj-column-per-40 { width:40%!important; }\r\n            .mj-column-per-60 { width:60%!important; }\r\n            .mj-column-per-50 { width: 50%!important; }\r\n            mj-column-per-33 { width: 33.333333333333336%!important; }\r\n            }</style>\r\n        \r\n      </head>\r\n      <body style=\"background-color:#FFFFFF;\">\r\n        \r\n        \r\n      <div style=\"background-color:#FFFFFF;\">\r\n        \r\n      \r\n      <!--[if mso | IE]>\r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:288px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1615804058.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"288\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:600px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1615804081.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"600\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px; color: #7e8c8d;\"> Gaxa Is the world first bulk message sender to Facebook messanger subscriber. It`s the best alternative of email marketing which is more powerful.</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px;\">Your reset password code is :<strong><span style=\"color: #3598db;\">#PASSWORD_RESET_CODE#</span></strong></span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"center\" vertical-align=\"middle\" style=\"font-size:0px;padding:20px 20px 20px 20px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:separate;width:100%;line-height:100%;\">\r\n        <tr>\r\n          <td align=\"center\" bgcolor=\"#0061FF\" role=\"presentation\" style=\"border:0px solid #000;border-radius:5px;cursor:auto;mso-padding-alt:9px 26px 9px 26px;background:#0061FF;\" valign=\"middle\">\r\n            <a href=\"https://www.gaxa-bot.com/home/password_recovery\" style=\"display:inline-block;background:#0061FF;color:#ffffff;font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:13px;font-weight:normal;line-height:100%;Margin:0;text-decoration:none;text-transform:none;padding:9px 26px 9px 26px;mso-padding-alt:0px;border-radius:5px;\" target=\"_blank\">\r\n              <span style=\"font-size: 15px;\">Reset Your Password Now</span>\r\n            </a>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:left;color:#000000;\">\r\n        <p style=\"text-align: center;\"><span style=\"font-size: 15px; color: #e03e2d;\">Link and code will be expired after 24 hours</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      <![endif]-->\r\n    \r\n    \r\n      </div>\r\n    \r\n      </body>\r\n    </html>', 'fas fa-retweet', '#APP_NAME#,#PASSWORD_RESET_URL#,#PASSWORD_RESET_CODE#', 'When a user forget login password'),
(3, 'Change Password', 'change_password', 'Change Password Notification', '<!doctype html>\r\n    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n      <head>\r\n        <title>\r\n          \r\n        </title>\r\n        <!--[if !mso]><!-- -->\r\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n        <!--<![endif]-->\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n        <style type=\"text/css\">\r\n          #outlook a { padding:0; }\r\n          .ReadMsgBody { width:100%; }\r\n          .ExternalClass { width:100%; }\r\n          .ExternalClass * { line-height:100%; }\r\n          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }\r\n          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }\r\n          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }\r\n          p { display:block;margin:13px 0; }\r\n        </style>\r\n        <!--[if !mso]><!-->\r\n        <style type=\"text/css\">\r\n          @media only screen and (max-width:480px) {\r\n            @-ms-viewport { width:320px; }\r\n            @viewport { width:320px; }\r\n          }\r\n        </style>\r\n        <!--<![endif]-->\r\n        <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n        <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n        \r\n      <!--[if !mso]><!-->\r\n        <link href=\"https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n        <style type=\"text/css\">\r\n          @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);\r\n@import url(https://fonts.googleapis.com/css?family=Cabin:400,700);\r\n        </style>\r\n      <!--<![endif]-->\r\n\r\n    \r\n        \r\n    <style type=\"text/css\">\r\n      @media only screen and (min-width:480px) {\r\n        .mj-column-per-100 { width:100% !important; max-width: 100%; }\r\n      }\r\n    </style>\r\n    \r\n  \r\n        <style type=\"text/css\">\r\n        \r\n        \r\n\r\n    @media only screen and (max-width:480px) {\r\n      table.full-width-mobile { width: 100% !important; }\r\n      td.full-width-mobile { width: auto !important; }\r\n    }\r\n  \r\n        </style>\r\n        <style type=\"text/css\">.hide_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_mobile { display: block !important;} }\r\n        .hide_section_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_mobile { display: table !important;} }\r\n        .hide_on_desktop { display: block !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_desktop { display: none !important;} }\r\n        .hide_section_on_desktop { display: table !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_desktop { display: none !important;} }\r\n        [owa] .mj-column-per-100 {\r\n            width: 100%!important;\r\n          }\r\n          [owa] .mj-column-per-50 {\r\n            width: 50%!important;\r\n          }\r\n          [owa] .mj-column-per-33 {\r\n            width: 33.333333333333336%!important;\r\n          }\r\n          p, h1, h2, h3 {\r\n              margin: 0px;\r\n          }\r\n        \r\n          @media only print and (min-width:480px) {\r\n            .mj-column-per-100 { width:100%!important; }\r\n            .mj-column-per-40 { width:40%!important; }\r\n            .mj-column-per-60 { width:60%!important; }\r\n            .mj-column-per-50 { width: 50%!important; }\r\n            mj-column-per-33 { width: 33.333333333333336%!important; }\r\n            }</style>\r\n        \r\n      </head>\r\n      <body style=\"background-color:#FFFFFF;\">\r\n        \r\n        \r\n      <div style=\"background-color:#FFFFFF;\">\r\n        \r\n      \r\n      <!--[if mso | IE]>\r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:288px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1615804058.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"288\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:600px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1615804081.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"600\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px; color: #7e8c8d;\"> Gaxa Is the world first bulk message sender to Facebook messanger subscriber. It`s the best alternative of email marketing which is more powerful.</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px;\">Dear  #USERNAME#,<br>Your <strong><span style=\"color: #3598db;\">Gaxa</span> </strong>Password has been changed<br>Your new password is<strong>:<span style=\"color: #3598db;\"> #NEW_PASSWORD#.</span><br><br></strong>Thank you,<br>Gaxa Team<strong><br><br></strong></span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      <![endif]-->\r\n    \r\n    \r\n      </div>\r\n    \r\n      </body>\r\n    </html>', 'fas fa-key', '#APP_NAME#,#APP_URL#,#USERNAME#,#NEW_PASSWORD#', 'When admin reset password of any user');
INSERT INTO `email_template_management` (`id`, `title`, `template_type`, `subject`, `message`, `icon`, `tooltip`, `info`) VALUES
(4, 'Subscription Expiring Soon', 'membership_expiration_10_days_before', 'Payment Alert', '<!doctype html>\r\n    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n      <head>\r\n        <title>\r\n          \r\n        </title>\r\n        <!--[if !mso]><!-- -->\r\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n        <!--<![endif]-->\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n        <style type=\"text/css\">\r\n          #outlook a { padding:0; }\r\n          .ReadMsgBody { width:100%; }\r\n          .ExternalClass { width:100%; }\r\n          .ExternalClass * { line-height:100%; }\r\n          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }\r\n          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }\r\n          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }\r\n          p { display:block;margin:13px 0; }\r\n        </style>\r\n        <!--[if !mso]><!-->\r\n        <style type=\"text/css\">\r\n          @media only screen and (max-width:480px) {\r\n            @-ms-viewport { width:320px; }\r\n            @viewport { width:320px; }\r\n          }\r\n        </style>\r\n        <!--<![endif]-->\r\n        <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n        <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n        \r\n      <!--[if !mso]><!-->\r\n        <link href=\"https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n        <style type=\"text/css\">\r\n          @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);\r\n@import url(https://fonts.googleapis.com/css?family=Cabin:400,700);\r\n        </style>\r\n      <!--<![endif]-->\r\n\r\n    \r\n        \r\n    <style type=\"text/css\">\r\n      @media only screen and (min-width:480px) {\r\n        .mj-column-per-100 { width:100% !important; max-width: 100%; }\r\n      }\r\n    </style>\r\n    \r\n  \r\n        <style type=\"text/css\">\r\n        \r\n        \r\n\r\n    @media only screen and (max-width:480px) {\r\n      table.full-width-mobile { width: 100% !important; }\r\n      td.full-width-mobile { width: auto !important; }\r\n    }\r\n  \r\n        </style>\r\n        <style type=\"text/css\">.hide_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_mobile { display: block !important;} }\r\n        .hide_section_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_mobile { display: table !important;} }\r\n        .hide_on_desktop { display: block !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_desktop { display: none !important;} }\r\n        .hide_section_on_desktop { display: table !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_desktop { display: none !important;} }\r\n        [owa] .mj-column-per-100 {\r\n            width: 100%!important;\r\n          }\r\n          [owa] .mj-column-per-50 {\r\n            width: 50%!important;\r\n          }\r\n          [owa] .mj-column-per-33 {\r\n            width: 33.333333333333336%!important;\r\n          }\r\n          p, h1, h2, h3 {\r\n              margin: 0px;\r\n          }\r\n        \r\n          @media only print and (min-width:480px) {\r\n            .mj-column-per-100 { width:100%!important; }\r\n            .mj-column-per-40 { width:40%!important; }\r\n            .mj-column-per-60 { width:60%!important; }\r\n            .mj-column-per-50 { width: 50%!important; }\r\n            mj-column-per-33 { width: 33.333333333333336%!important; }\r\n            }</style>\r\n        \r\n      </head>\r\n      <body style=\"background-color:#FFFFFF;\">\r\n        \r\n        \r\n      <div style=\"background-color:#FFFFFF;\">\r\n        \r\n      \r\n      <!--[if mso | IE]>\r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:288px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1615804058.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"288\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:600px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/edited_images_by_manes/manes_1615823055.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"600\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px;\">Dear  #USERNAME#,<br><br>Your account will expire after <span style=\"color: #e03e2d;\"><strong>10 days</strong></span>, Please pay your fees<strong><br><br></strong>Thank you,<br>Gaxa Team<strong><br><br></strong></span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px; color: #7e8c8d;\"> Gaxa Is the world first bulk message sender to Facebook messanger subscriber. It`s the best alternative of email marketing which is more powerful.</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      <![endif]-->\r\n    \r\n    \r\n      </div>\r\n    \r\n      </body>\r\n    </html>', 'fas fa-clock', '#APP_NAME#,#APP_URL#,#USERNAME#', '10 days before user subscription expires'),
(5, 'Subscription Expiring Tomorrow', 'membership_expiration_1_day_before', 'Payment Alert', '<!doctype html>\r\n    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n      <head>\r\n        <title>\r\n          \r\n        </title>\r\n        <!--[if !mso]><!-- -->\r\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n        <!--<![endif]-->\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n        <style type=\"text/css\">\r\n          #outlook a { padding:0; }\r\n          .ReadMsgBody { width:100%; }\r\n          .ExternalClass { width:100%; }\r\n          .ExternalClass * { line-height:100%; }\r\n          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }\r\n          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }\r\n          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }\r\n          p { display:block;margin:13px 0; }\r\n        </style>\r\n        <!--[if !mso]><!-->\r\n        <style type=\"text/css\">\r\n          @media only screen and (max-width:480px) {\r\n            @-ms-viewport { width:320px; }\r\n            @viewport { width:320px; }\r\n          }\r\n        </style>\r\n        <!--<![endif]-->\r\n        <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n        <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n        \r\n      <!--[if !mso]><!-->\r\n        <link href=\"https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n        <style type=\"text/css\">\r\n          @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);\r\n@import url(https://fonts.googleapis.com/css?family=Cabin:400,700);\r\n        </style>\r\n      <!--<![endif]-->\r\n\r\n    \r\n        \r\n    <style type=\"text/css\">\r\n      @media only screen and (min-width:480px) {\r\n        .mj-column-per-100 { width:100% !important; max-width: 100%; }\r\n      }\r\n    </style>\r\n    \r\n  \r\n        <style type=\"text/css\">\r\n        \r\n        \r\n\r\n    @media only screen and (max-width:480px) {\r\n      table.full-width-mobile { width: 100% !important; }\r\n      td.full-width-mobile { width: auto !important; }\r\n    }\r\n  \r\n        </style>\r\n        <style type=\"text/css\">.hide_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_mobile { display: block !important;} }\r\n        .hide_section_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_mobile { display: table !important;} }\r\n        .hide_on_desktop { display: block !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_desktop { display: none !important;} }\r\n        .hide_section_on_desktop { display: table !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_desktop { display: none !important;} }\r\n        [owa] .mj-column-per-100 {\r\n            width: 100%!important;\r\n          }\r\n          [owa] .mj-column-per-50 {\r\n            width: 50%!important;\r\n          }\r\n          [owa] .mj-column-per-33 {\r\n            width: 33.333333333333336%!important;\r\n          }\r\n          p, h1, h2, h3 {\r\n              margin: 0px;\r\n          }\r\n        \r\n          @media only print and (min-width:480px) {\r\n            .mj-column-per-100 { width:100%!important; }\r\n            .mj-column-per-40 { width:40%!important; }\r\n            .mj-column-per-60 { width:60%!important; }\r\n            .mj-column-per-50 { width: 50%!important; }\r\n            mj-column-per-33 { width: 33.333333333333336%!important; }\r\n            }</style>\r\n        \r\n      </head>\r\n      <body style=\"background-color:#FFFFFF;\">\r\n        \r\n        \r\n      <div style=\"background-color:#FFFFFF;\">\r\n        \r\n      \r\n      <!--[if mso | IE]>\r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:288px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1615804058.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"288\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:600px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/edited_images_by_manes/manes_1615823055.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"600\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px;\">Dear  #USERNAME#,<br><br>Your account will expire <span style=\"color: #e03e2d;\"><strong>tomorrow</strong></span>, Please pay your fees<strong><br><br></strong>Thank you,<br>Gaxa Team<strong><br><br></strong></span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px; color: #7e8c8d;\"> Gaxa Is the world first bulk message sender to Facebook messanger subscriber. It`s the best alternative of email marketing which is more powerful.</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      <![endif]-->\r\n    \r\n    \r\n      </div>\r\n    \r\n      </body>\r\n    </html>', 'fas fa-stopwatch', '#APP_NAME#,#APP_URL#,#USERNAME#', '1 day before user subscription expires'),
(6, 'Subscription Expired', 'membership_expiration_1_day_after', 'Subscription Expired', 'Dear #USERNAME#,<br/>\r\nYour account has been expired, Please pay your fees for continuity.<br/><br/>\r\nThank you,<br/>\r\n<a href=\"#APP_URL#\">#APP_NAME#</a> Team', 'fas fa-user-clock', '#APP_NAME#,#APP_URL#,#USERNAME#', 'Subscription is already expired of a user'),
(7, 'Paypal Payment Confirmation', 'paypal_payment', 'Payment Confirmation', '<!doctype html>\r\n    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n      <head>\r\n        <title>\r\n          \r\n        </title>\r\n        <!--[if !mso]><!-- -->\r\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n        <!--<![endif]-->\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n        <style type=\"text/css\">\r\n          #outlook a { padding:0; }\r\n          .ReadMsgBody { width:100%; }\r\n          .ExternalClass { width:100%; }\r\n          .ExternalClass * { line-height:100%; }\r\n          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }\r\n          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }\r\n          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }\r\n          p { display:block;margin:13px 0; }\r\n        </style>\r\n        <!--[if !mso]><!-->\r\n        <style type=\"text/css\">\r\n          @media only screen and (max-width:480px) {\r\n            @-ms-viewport { width:320px; }\r\n            @viewport { width:320px; }\r\n          }\r\n        </style>\r\n        <!--<![endif]-->\r\n        <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n        <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n        \r\n      <!--[if !mso]><!-->\r\n        <link href=\"https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n        <style type=\"text/css\">\r\n          @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);\r\n@import url(https://fonts.googleapis.com/css?family=Cabin:400,700);\r\n        </style>\r\n      <!--<![endif]-->\r\n\r\n    \r\n        \r\n    <style type=\"text/css\">\r\n      @media only screen and (min-width:480px) {\r\n        .mj-column-per-100 { width:100% !important; max-width: 100%; }\r\n.mj-column-per-40 { width:40% !important; max-width: 40%; }\r\n.mj-column-per-60 { width:60% !important; max-width: 60%; }\r\n      }\r\n    </style>\r\n    \r\n  \r\n        <style type=\"text/css\">\r\n        \r\n        \r\n\r\n    @media only screen and (max-width:480px) {\r\n      table.full-width-mobile { width: 100% !important; }\r\n      td.full-width-mobile { width: auto !important; }\r\n    }\r\n  \r\n        </style>\r\n        <style type=\"text/css\">.hide_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_mobile { display: block !important;} }\r\n        .hide_section_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_mobile { display: table !important;} }\r\n        .hide_on_desktop { display: block !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_desktop { display: none !important;} }\r\n        .hide_section_on_desktop { display: table !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_desktop { display: none !important;} }\r\n        [owa] .mj-column-per-100 {\r\n            width: 100%!important;\r\n          }\r\n          [owa] .mj-column-per-50 {\r\n            width: 50%!important;\r\n          }\r\n          [owa] .mj-column-per-33 {\r\n            width: 33.333333333333336%!important;\r\n          }\r\n          p, h1, h2, h3 {\r\n              margin: 0px;\r\n          }\r\n        \r\n          @media only print and (min-width:480px) {\r\n            .mj-column-per-100 { width:100%!important; }\r\n            .mj-column-per-40 { width:40%!important; }\r\n            .mj-column-per-60 { width:60%!important; }\r\n            .mj-column-per-50 { width: 50%!important; }\r\n            mj-column-per-33 { width: 33.333333333333336%!important; }\r\n            }</style>\r\n        \r\n      </head>\r\n      <body style=\"background-color:#FFFFFF;\">\r\n        \r\n        \r\n      <div style=\"background-color:#FFFFFF;\">\r\n        \r\n      \r\n      <!--[if mso | IE]>\r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:288px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1615804058.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"288\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:240px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-40 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><strong><span style=\"color: #2dc26b; font-size: 17px;\">Congratulations <span style=\"color: #000000; font-size: 16px;\">#USERNAME#</span><br></span></strong></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 15px;\">We have received your payment successfully.<br></span><br><span style=\"font-size: 15px;\">Now you are able to use <span style=\"color: #3598db;\"><strong>#PRODUCT_SHORT_NAME#</strong></span> system till <strong>#CYCLE_EXPIRED_DATE#</strong>.<br></span><br><span style=\"font-size: 15px;\">Thank you,</span><br><span style=\"font-size: 15px;\">GAXA Team</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:360px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-60 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:360px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1616273469.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"360\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 14px; color: #7e8c8d;\">Gaxa Is the world first bulk message sender to Facebook messanger subscriber. It`s the best alternative of email marketing which is more powerful.</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:600px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604f33b698f98/1616274124.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"600\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      <![endif]-->\r\n    \r\n    \r\n      </div>\r\n    \r\n      </body>\r\n    </html>', 'fab fa-paypal', '#APP_NAME#,#CYCLE_EXPIRED_DATE#,#PRODUCT_SHORT_NAME#,#SITE_URL#', 'User pay through Paypal & gets confirmation'),
(8, 'Paypal New Payment', 'paypal_new_payment_made', 'New Payment Made', 'New payment has been made by #PAID_USER_NAME#', 'fab fa-cc-paypal', '#PAID_USER_NAME#', 'User pay through Paypal & admin gets notified'),
(9, 'Stripe Payment Confirmation', 'stripe_payment', 'Payment Confirmation', 'Congratulations,<br/>\r\nWe have received your payment successfully.<br/>\r\nNow you are able to use #APP_SHORT_NAME# system till #CYCLE_EXPIRED_DATE#.<br/><br/>\r\nThank you,<br/>\r\n<a href=\"#APP_URL#\">#APP_NAME#</a> Team', 'fab fa-stripe-s', '#APP_NAME#,#CYCLE_EXPIRED_DATE#,#PRODUCT_SHORT_NAME#,#SITE_URL#', 'User pay through Stripe & gets confirmation'),
(10, 'Stripe New Payment', 'stripe_new_payment_made', 'New Payment Made', 'New payment has been made by #PAID_USER_NAME#', 'fab fa-cc-stripe', '#PAID_USER_NAME#', 'User pay through Stripe & admin gets notified'),
(11, 'Ecommerce Order Received', 'emcommerce_sale_admin', '#STORE_NAME# | A New Order Has Been Submitted', 'Congratulations,<br/>\r\nYou have got an new order on your store #STORE_NAME#.<br>\r\nInvoice : #INVOICE_URL# <br/><br/>\r\n\r\nThank you,<br/>\r\n<a href=\"#APP_URL#\">#APP_NAME#</a> Team', 'fas fa-dollar-sign', '#STORE_NAME#,#APP_URL#,#APP_NAME#,#INVOICE_URL#', 'You have got an new order on your store'),
(13, 'New Webview Form Submission Alert', 'webview_form_submit_admin', '#FORM_TITLE# | #SUBSCRIBER_NAME# Has Submitted Form', '#SUBSCRIBER_NAME# has just submitted your form #FORM_TITLE# with below data. <br/><br/>\r\n#FORM_DATA#\r\n<br/><br/>\r\nThank you,<br/>\r\n<a href=\"#APP_URL#\">#APP_NAME#</a> Team', 'fas fa-digital-tachograph', '#FORM_TITLE#,#SUBSCRIBER_NAME#,#SUBSCRIBER_NAME#,#FORM_TITLE#,#APP_URL#,#APP_NAME#', 'Subscriber information received');
INSERT INTO `email_template_management` (`id`, `title`, `template_type`, `subject`, `message`, `icon`, `tooltip`, `info`) VALUES
(14, 'Affiliate Signup Activation', 'affiliate_signup_activation', '#APP_NAME# | Affiliate Account Activation', '<!doctype html>\r\n    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n      <head>\r\n        <title>\r\n          \r\n        </title>\r\n        <!--[if !mso]><!-- -->\r\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n        <!--<![endif]-->\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n        <style type=\"text/css\">\r\n          #outlook a { padding:0; }\r\n          .ReadMsgBody { width:100%; }\r\n          .ExternalClass { width:100%; }\r\n          .ExternalClass * { line-height:100%; }\r\n          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }\r\n          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }\r\n          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }\r\n          p { display:block;margin:13px 0; }\r\n        </style>\r\n        <!--[if !mso]><!-->\r\n        <style type=\"text/css\">\r\n          @media only screen and (max-width:480px) {\r\n            @-ms-viewport { width:320px; }\r\n            @viewport { width:320px; }\r\n          }\r\n        </style>\r\n        <!--<![endif]-->\r\n        <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n        <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n        \r\n      <!--[if !mso]><!-->\r\n        <link href=\"https://fonts.googleapis.com/css?family=Ubuntu:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Arial:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n        <style type=\"text/css\">\r\n          @import url(https://fonts.googleapis.com/css?family=Ubuntu:400,700);\r\n@import url(https://fonts.googleapis.com/css?family=Cabin:400,700);\r\n@import url(https://fonts.googleapis.com/css?family=Arial:400,700);\r\n        </style>\r\n      <!--<![endif]-->\r\n\r\n    \r\n        \r\n    <style type=\"text/css\">\r\n      @media only screen and (min-width:480px) {\r\n        .mj-column-per-100 { width:100% !important; max-width: 100%; }\r\n      }\r\n    </style>\r\n    \r\n  \r\n        <style type=\"text/css\">\r\n        \r\n        \r\n\r\n    @media only screen and (max-width:480px) {\r\n      table.full-width-mobile { width: 100% !important; }\r\n      td.full-width-mobile { width: auto !important; }\r\n    }\r\n  \r\n        </style>\r\n        <style type=\"text/css\">.hide_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_mobile { display: block !important;} }\r\n        .hide_section_on_mobile { display: none !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_mobile { display: table !important;} }\r\n        .hide_on_desktop { display: block !important;} \r\n        @media only screen and (min-width: 480px) { .hide_on_desktop { display: none !important;} }\r\n        .hide_section_on_desktop { display: table !important;} \r\n        @media only screen and (min-width: 480px) { .hide_section_on_desktop { display: none !important;} }\r\n        [owa] .mj-column-per-100 {\r\n            width: 100%!important;\r\n          }\r\n          [owa] .mj-column-per-50 {\r\n            width: 50%!important;\r\n          }\r\n          [owa] .mj-column-per-33 {\r\n            width: 33.333333333333336%!important;\r\n          }\r\n          p, h1, h2, h3 {\r\n              margin: 0px;\r\n          }\r\n        \r\n          @media only print and (min-width:480px) {\r\n            .mj-column-per-100 { width:100%!important; }\r\n            .mj-column-per-40 { width:40%!important; }\r\n            .mj-column-per-60 { width:60%!important; }\r\n            .mj-column-per-50 { width: 50%!important; }\r\n            mj-column-per-33 { width: 33.333333333333336%!important; }\r\n            }</style>\r\n        \r\n      </head>\r\n      <body style=\"background-color:#FFFFFF;\">\r\n        \r\n        \r\n      <div style=\"background-color:#FFFFFF;\">\r\n        \r\n      \r\n      <!--[if mso | IE]>\r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:276px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604e7832abdf9/1615755341.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"276\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" style=\"font-size:0px;padding:0px 0px 0px 0px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n        <tbody>\r\n          <tr>\r\n            <td style=\"width:600px;\">\r\n              \r\n      <img height=\"auto\" src=\"https://s3-eu-west-1.amazonaws.com/topolio/uploads/604e7832abdf9/1615757084.jpg\" style=\"border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;\" width=\"600\">\r\n    \r\n            </td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"color: #236fa1; font-size: 20px;\"><strong>Welcome to Gaxa-bot</strong></span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 16px; color: #7e8c8d;\"> Gaxa Is the world first bulk message sender to Facebook messanger subscriber. It`s the best alternative of email marketing which is more powerful.</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"left\" style=\"font-size:0px;padding:15px 15px 15px 15px;word-break:break-word;\">\r\n                \r\n      <div style=\"font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.2;text-align:left;color:#000000;\">\r\n        <p><span style=\"font-size: 20px;\">Your Activation code is :#ACCOUNT_ACTIVATION_CODE#</span></p>\r\n      </div>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <table\r\n         align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\"\r\n      >\r\n        <tr>\r\n          <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n      <![endif]-->\r\n    \r\n      \r\n      <div style=\"Margin:0px auto;max-width:600px;\">\r\n        \r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n          <tbody>\r\n            <tr>\r\n              <td style=\"direction:ltr;font-size:0px;padding:9px 0px 9px 0px;text-align:center;vertical-align:top;\">\r\n                <!--[if mso | IE]>\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                \r\n        <tr>\r\n      \r\n            <td\r\n               class=\"\" style=\"vertical-align:top;width:600px;\"\r\n            >\r\n          <![endif]-->\r\n            \r\n      <div class=\"mj-column-per-100 outlook-group-fix\" style=\"font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n        \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">\r\n        \r\n            <tr>\r\n              <td align=\"center\" vertical-align=\"middle\" style=\"font-size:0px;padding:20px 20px 20px 20px;word-break:break-word;\">\r\n                \r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:separate;width:100%;line-height:100%;\">\r\n        <tr>\r\n          <td align=\"center\" bgcolor=\"#424EEB\" role=\"presentation\" style=\"border:0px solid #000;border-radius:5px;cursor:auto;mso-padding-alt:9px 26px 9px 26px;background:#424EEB;\" valign=\"middle\">\r\n            <a href=\"https://www.gaxa-bot.com/affiliate_system/affiliate_account_activation\" style=\"display:inline-block;background:#424EEB;color:#ffffff;font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:13px;font-weight:normal;line-height:100%;Margin:0;text-decoration:none;text-transform:none;padding:9px 26px 9px 26px;mso-padding-alt:0px;border-radius:5px;\" target=\"_blank\">\r\n              <span style=\"font-size: 16px; font-family: Arial, sans-serif;\">Login Now</span>\r\n            </a>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    \r\n              </td>\r\n            </tr>\r\n          \r\n      </table>\r\n    \r\n      </div>\r\n    \r\n          <!--[if mso | IE]>\r\n            </td>\r\n          \r\n        </tr>\r\n      \r\n                  </table>\r\n                <![endif]-->\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n      </div>\r\n    \r\n      \r\n      <!--[if mso | IE]>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n      <![endif]-->\r\n    \r\n    \r\n      </div>\r\n    \r\n      </body>\r\n    </html>', 'fas fa-hands-helping', '#APP_NAME#,#ACTIVATION_URL#,#ACCOUNT_ACTIVATION_CODE#', 'When affiliate account open'),
(15, 'Affiliate Withdrawal Request Approval', 'affiliate_withdrawal_request_approval', '#APP_NAME# | Affiliate Withdrawal Request Approval', '<p>Dear #USERNAME#,<br/>\r\n We have reviewed your withdrawal Request and the below is your withdrawal request update.</p>\r\n<ul>\r\n<li>Requested Amount : #AMOUNT#</li>\r\n<li>Request Status : #REQUEST_STATUS#</li>\r\n</ul>\r\n<p>If you have any queries on this, please contact the #APP_NAME# admin with this #ADMIN_EMAIL#.</p>\r\n<br></br>\r\nThank you<br>\r\n<a href=\"#APP_URL#\">#APP_NAME#</a> Team', 'fas fa-vote-yea', '#USERNAME#,#AMOUNT#,#REQUEST_STATUS#,#ADMIN_EMAIL#,#APP_URL#,#APP_NAME#', 'When affiliate withdrawal request approved'),
(16, 'Affiliate Withdrawal Request Cancelation', 'affiliate_withdrawal_request_cancel', '#APP_NAME# | Affiliate Withdrawal Request Cancelation', '<p>Dear #USERNAME#,<br/>\r\n We have reviewed your withdrawal Request and the below is your withdrawal request update.</p>\r\n<ul>\r\n<li>Requested Amount : #AMOUNT#</li>\r\n<li>Request Status : #REQUEST_STATUS#</li>\r\n<li>Reason Of cancelation : #CANCEL_MESSAGE#</li>\r\n</ul>\r\n<p>If you have any queries on this, please contact the #APP_NAME# admin with this #ADMIN_EMAIL#.</p>\r\n<br></br>\r\nThank you<br>\r\n<a href=\"#APP_URL#\">#APP_NAME#</a> Team', 'fas fa-vote-yea', '#USERNAME#,#AMOUNT#,#REQUEST_STATUS#,#CANCEL_MESSAGE#,#ADMIN_EMAIL#,#APP_URL#,#APP_NAME#', 'When affiliate withdrawal request cancel'),
(17, 'New Withdrawal Request', 'new_withdrawal_request', '#APP_NAME# | New Withdrawal Request', '<p>Dear Admin,<br>\r\nA withdrawal request has been made by an affiliate. Please check the below information of the request.</p>\r\n<ul>\r\n<li>Affiliator Name : #AFFILIATOR_NAME#</li>\r\n<li>Affiliator Email : #AFFILIATOR_EMAIL#</li>\r\n<li>Requested Amount : #REQUESTED_AMOUNT#</li>\r\n</ul>\r\n', 'fas fa-ankh', '#AFFILIATOR_NAME#,#AFFILIATOR_EMAIL#,#REQUESTED_AMOUNT#', 'When new withdrawal Request create');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_ex_autoreply`
--

CREATE TABLE `facebook_ex_autoreply` (
  `id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `auto_reply_campaign_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_name` mediumtext COLLATE utf8mb4_unicode_ci,
  `post_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_permalink` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_created_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_description` longtext COLLATE utf8mb4_unicode_ci,
  `post_thumb` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_like_comment` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `multiple_reply` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_reply_enabled` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nofilter_word_found_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_reply_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_private_reply_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_private_reply_count` int(11) NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `last_reply_time` datetime NOT NULL,
  `error_message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_comment_after_comment_reply` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete_offensive` enum('hide','delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `offensive_words` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_message_offensive_words` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden_comment_count` int(11) NOT NULL,
  `deleted_comment_count` int(11) NOT NULL,
  `auto_comment_reply_count` int(11) NOT NULL,
  `template_manager_table_id` int(11) NOT NULL,
  `broadcaster_labels` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'auto_id of labels comma separated',
  `structured_message` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facebook_ex_autoreply`
--

INSERT INTO `facebook_ex_autoreply` (`id`, `facebook_rx_fb_user_info_id`, `auto_reply_campaign_name`, `user_id`, `page_info_table_id`, `page_name`, `post_id`, `post_permalink`, `post_created_at`, `post_description`, `post_thumb`, `reply_type`, `auto_like_comment`, `multiple_reply`, `comment_reply_enabled`, `nofilter_word_found_text`, `auto_reply_text`, `auto_private_reply_status`, `auto_private_reply_count`, `last_updated_at`, `last_reply_time`, `error_message`, `hide_comment_after_comment_reply`, `is_delete_offensive`, `offensive_words`, `private_message_offensive_words`, `hidden_comment_count`, `deleted_comment_count`, `auto_comment_reply_count`, `template_manager_table_id`, `broadcaster_labels`, `structured_message`) VALUES
(46, 7, 'General ProAtCoding Response', 1, 23, 'Pro At Coding', '2085064648484866_2965194187138570', 'https://www.facebook.com/2085064648484866/posts/2965194187138570/', '2021-06-05T16:30:31+0000', 'احصل الان على الموبايل أبلكيشن المناسب لمجال شغلك فى أسرع وقت و اقل تكاليف\n\n#Mobile_Applications\n#Web_Applications\n#ProAtCoding', 'https://scontent-ams4-1.xx.fbcdn.net/v/t1.6435-0/s130x130/197687799_2965194010471921_3695284873811585742_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=8024bb&_nc_eui2=AeHqGii9heK5mZEBGk9MgQ8j1dl9iXk6b63V2X2JeTpvrTiEafApPWemEhBu1v_wvSHNGWry58oiyeJa-UbvUhB9&_nc_ohc=KosmfhZ83pYAX_kALx5&_nc_ht=scontent-ams4-1.xx&tp=7&oh=ec42d5b035be388786222193610a4a2e&oe=60EF2650', 'generic', 'yes', 'yes', 'yes', '[{\"comment_reply\":\"\",\"private_reply\":\"\",\"image_link\":\"\",\"video_link\":\"\"}]', '[{\"comment_reply\":\"Thanks, #LEAD_USER_FIRST_NAME#  to contact us.\\r\\nPlease check your inbox\",\"private_reply\":\"176\",\"image_link\":\"\",\"video_link\":\"\"}]', '0', 0, '2021-07-10 22:22:33', '0000-00-00 00:00:00', '', 'no', 'hide', '', '', 0, 0, 0, 7, '', 'yes'),
(47, 7, 'Generic Comment replay for gaxa', 1, 19, 'Gaxa', '105940371572898_174614464705488', 'https://www.facebook.com/105940371572898/posts/174614464705488/', '2021-07-06T20:35:19+0000', 'Finally, the Best Value providers are offering Complete Management Tool For Facebook and other social networks. Get started for free. Divide your load, avail our service of:\n✅ Email Marketing\n✅SMS Marketing\n✅ Messenger Marketing\n✅ Ecommerce\n✅ Social Media Automation and many more.', 'https://scontent-amt2-1.xx.fbcdn.net/v/t45.1600-4/p130x130/212919773_6245857833789_1305247074961431384_n.png.jpg?_nc_cat=101&ccb=1-3&_nc_sid=67cdda&_nc_eui2=AeHBZ228f3T3dbVIoOihpCD6TiK0Fx_qngFOIrQXH-qeAcai28zbSqE5hwogXzJFcu-o9rRAm7W59VmVIJdm4jyo&_nc_ohc=F-H1Gx8Y7_AAX8JnfSb&_nc_ht=scontent-amt2-1.xx&edm=AJfPMC4EAAAA&oh=bf461ad8d314a923f5d0fa353b3a87e1&oe=60EE91D1', 'generic', 'yes', 'yes', 'yes', '[{\"comment_reply\":\"\",\"private_reply\":\"\",\"image_link\":\"\",\"video_link\":\"\"}]', '[{\"comment_reply\":\"Hello  #LEAD_USER_FIRST_NAME# Thank you for contact GAXA , Please Check your Inbox\",\"private_reply\":\"177\",\"image_link\":\"\",\"video_link\":\"\"}]', '0', 0, '2021-07-10 23:19:40', '0000-00-00 00:00:00', '', 'no', 'hide', '', '', 0, 0, 0, 8, '', 'yes'),
(48, 7, 'Generic Comment replay for gaxa', 1, 19, 'Gaxa', '105940371572898_2872679783005338', 'https://www.facebook.com/GaxaBot/videos/2872679783005338/', '2021-04-23T23:16:07+0000', 'صفحتك هيا متجرك الالكترونى \nمع جاكسا تقدر تعمل متجر الكترونى من خلال الماسنجر وتعرض فيه كل منتجاتك و اسعارك \nو كمااان مش هتحتاج وقت ولا مجهود فالرد على كل عملائك لان بكل بساطه الرد هيبقا تلقائى على كل عملائك \n#GAXA\n#GAXA_Bot\n#Full_Powered_ChatBot', 'https://scontent-ams4-1.xx.fbcdn.net/v/t15.5256-10/p118x90/135779808_2872680233005293_1454938338741061678_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=ad6a45&_nc_eui2=AeHQASfh9_5h4-hzf4-cfc3Ax0DmasQsac_HQOZqxCxpz41PFRc4aCoRr0C5Enlef502Kydyj1Mtn88cUuHeOHi_&_nc_ohc=TfSyOfzADEsAX8kXGTk&_nc_ht=scontent-ams4-1.xx&oh=e626990a8a24973f3aad3bfb21d38f0b&oe=6101BBD1', 'generic', 'yes', 'yes', 'yes', '[{\"comment_reply\":\"\",\"private_reply\":\"\",\"image_link\":\"\",\"video_link\":\"\"}]', '[{\"comment_reply\":\"\\u0627\\u0647\\u0644\\u0627\\u064b  #LEAD_USER_FIRST_NAME# \\r\\n\\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645\\u0643 , \\u062a\\u0645 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644\",\"private_reply\":\"177\",\"image_link\":\"\",\"video_link\":\"\"}]', '0', 0, '2021-07-25 03:20:08', '0000-00-00 00:00:00', '', 'no', 'hide', '', '', 0, 0, 0, 8, '', 'yes'),
(49, 7, 'Generic Comment replay for gaxa', 1, 19, 'Gaxa', '105940371572898_542700523551138', 'https://www.facebook.com/GaxaBot/videos/542700523551138/', '2021-07-24T23:10:42+0000', 'مجاناً \n-------\nلو بتبيع اونلاين علي الفيس بوك او انستجرام او لينكدان او اي موقع تواصل اجتماعي ؟ \nو مش ملاحق علي العملاء سواء في الرد علي التعليقات  👈يبقا البوست دا ليك \nدلوقتى هتنجز في الرد علي العملاء  و تعمل اعادة استهداف للعملاء بتوعك GAXA BOTS هتوفر عليك كتير جدا هتوفر وقت و مجهود \nلانها هترد علي الكومينتات و تعمل لايك للكومينت و منشن للعميل \nو كمان هتبعت للعميل رسالة علي ماسنجر و تتابع معاه في الرسايل لحد عمل الاردر كل دا واكتر بدون استهلاك وقت او مجهود  \n--------------------------------------------\nGAXA BOTS مميزات \nاولا ماسنجر  😍\n✅الرد علي العملاء برسائل معدة مسبقا \n✅ارسال رسائل للعملاء و اعادة استهدافهم في اي توقيت \n✅علشان تعالي نسبة الاردرات بتاعتك  Sales Funnel عمل \n✅عمل ماتجر متكامل علي ماسنجر بمنتاجات مختلفه اتوماتيكي\n✅عمل فورم للعميل لتسجيل بياناته علي ماسنجر \n✅عمل فورم لتجميع بيانات العملاء  اتوماتيك علي ماسنجر \n✅تقسيم العملاء داخل ماسنجر علشان تقدر تستهدفهم كل واحد بلاهتمامات بتاعته\n✅الرد علي التعليقات رد تلقائي علي حسب الكلمات المفتاحية ال بيكتبها العميل او تعليقات  موحده للكل او الاتنين مع بعض  \n✅ عمل منشن للعميل في التعليقات اتوماتيك\n✅ اخفاء التعليقات بعد الرد عليها علشان المنافسين \n✅ ارسال رسالة لكل العملاء حسب كل كلمة بيكتبها العميل \n✅ تقدر تشغل البوت علي كل البوستات الي علي الصفحة \n✅ يمكنك جدولة البوستات و نشرها علي جميع مواق التواصل الاجتماعي \n✅ و ارسال رسالة لكل الي عمل اضف الي العربة و مكملش الطلب  woocommerce ربط مباشرمع \n⬅️ اغتم الفرصه و دلوقتي واستخدم جاكسا مجانا ايوه ببلاااااش \nhttps://www.gaxa-bot.com\nhttps://www.gaxa-bot.com/Documentation/', 'https://scontent-amt2-1.xx.fbcdn.net/v/t15.5256-10/s130x130/212853815_542701270217730_2648854618426996017_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=ad6a45&_nc_eui2=AeEfttBKYDesJ8hc5XLh6mV9imRvP-cXP_yKZG8_5xc__H5Y-QrPWZ1EjgkXVPbRZaE3tvpsE_w4wHXYppjruyH9&_nc_ohc=B9wn37K8QtAAX9oCopU&_nc_ht=scontent-amt2-1.xx&edm=AJfPMC4EAAAA&oh=ccf435c6e1ba2d040cf9a3255c0acde5&oe=61016CC0', 'generic', 'yes', 'yes', 'yes', '[{\"comment_reply\":\"\",\"private_reply\":\"\",\"image_link\":\"\",\"video_link\":\"\"}]', '[{\"comment_reply\":\"\\u0627\\u0647\\u0644\\u0627\\u064b  #LEAD_USER_FIRST_NAME# \\r\\n\\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645\\u0643 , \\u062a\\u0645 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644\",\"private_reply\":\"177\",\"image_link\":\"\",\"video_link\":\"\"}]', '0', 0, '2021-07-25 03:20:37', '0000-00-00 00:00:00', '', 'no', 'hide', '', '', 0, 0, 0, 8, '', 'yes'),
(50, 7, 'Generic Comment replay for gaxa', 1, 19, 'Gaxa', '105940371572898_187319413434993', 'https://www.facebook.com/105940371572898/posts/187319413434993/', '2021-07-24T23:25:01+0000', 'Finally, the Best Value providers are offering Complete Management Tool For Facebook and other social networks. \nGet started for👉FREE👈.\n Divide your load, avail our service of:\n✅ Email Marketing\n✅SMS Marketing\n✅ Messenger Marketing\n✅ Ecommerce\n✅ Social Media Automations and many more.\n\nhttps://www.gaxa-bot.com/\nhttps://www.gaxa-bot.com/Documentation/', 'https://scontent-amt2-1.xx.fbcdn.net/v/t1.6435-9/p130x130/223666681_187318796768388_3264105317955309179_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=8024bb&_nc_eui2=AeGinVhw0ttHtV-5U5xpL5b4AIXj3GQyjoMAhePcZDKOgyAv7rL6CiTNSX7efYHhuR8e9ER_BTgW0TDS6PuyCVvq&_nc_ohc=NqIaOMLwq7UAX8qHq5t&_nc_ht=scontent-amt2-1.xx&oh=a887511596e647ea360b636d27f51a73&oe=61228B63', 'generic', 'yes', 'yes', 'yes', '[{\"comment_reply\":\"\",\"private_reply\":\"\",\"image_link\":\"\",\"video_link\":\"\"}]', '[{\"comment_reply\":\"\\u0627\\u0647\\u0644\\u0627\\u064b  #LEAD_USER_FIRST_NAME# \\r\\n\\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645\\u0643 , \\u062a\\u0645 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644\",\"private_reply\":\"177\",\"image_link\":\"\",\"video_link\":\"\"}]', '0', 0, '2021-07-25 03:21:14', '2021-07-25 03:32:15', '', 'no', 'hide', '', '', 0, 0, 1, 8, '', 'yes'),
(51, 7, 'Generic Comment replay for gaxa', 1, 19, 'Gaxa Bots', '105940371572898_187936863373248', 'https://www.facebook.com/105940371572898/posts/187936863373248/', '2021-07-25T20:07:14+0000', 'لكل ادمن الصفحات و اصحاب الاعمال على السوشيال ميديا سواء فيس بوك او انستجرام \nمع جاكسا بوت كل مشاكلك محلوله😉😉\nدلوقت تقدر تستخدم جاكسا لاداره صفحتك يعنى هتعين روبوت  يدير صفحتك بشكل مميز و مختلف علشان هو هيقوم بالرد التلقائى على تعليقات العملاء وعلى المنشورات وارسال رسائل خاصه باستفسارات العملاء على الخاص \nمش بس كده كمان هيرد على العملاء من خلال الماسنجر بكل التفاصيل الى محتاجنها و كمان هيطلب منهم بياناتهم زى ارقام التليفونات و يجمعلك الداتا الى انت محتاجها عشان تتواصل معاهم تانى \n جاكسا بيقدم خدمات تانيه كتييييير\n👈اغتنم الفرصه و سجل الان واستمتع بخدمات جاكسا مجاناً لمده 30 ايام 👉', 'https://scontent-ams4-1.xx.fbcdn.net/v/t1.6435-9/s130x130/225343920_187936766706591_2457664382405483026_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8024bb&_nc_eui2=AeEtIC67VV_pzz2blT9oBh3sXdA19c1hAtJd0DX1zWEC0tsYbm90Su0oehY46au7KgA1IdjWw46CgDMLQdABSBWB&_nc_ohc=AHp8EfbshNsAX-3bKWK&_nc_ht=scontent-ams4-1.xx&edm=AJfPMC4EAAAA&oh=06a29e1be3f571510a927351e3a70fb3&oe=6122DF4A', 'generic', 'yes', 'yes', 'yes', '[{\"comment_reply\":\"\",\"private_reply\":\"\",\"image_link\":\"\",\"video_link\":\"\"}]', '[{\"comment_reply\":\"\\u0627\\u0647\\u0644\\u0627\\u064b  #LEAD_USER_FIRST_NAME# \\r\\n\\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645\\u0643 , \\u062a\\u0645 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644\",\"private_reply\":\"177\",\"image_link\":\"\",\"video_link\":\"\"}]', '0', 0, '2021-07-26 00:45:03', '2021-07-27 00:00:52', '', 'no', 'hide', '', '', 0, 0, 1, 8, '', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_ex_autoreply_report`
--

CREATE TABLE `facebook_ex_autoreply_report` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `autoreply_table_id` int(11) NOT NULL,
  `comment_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `comment_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenter_name` varchar(120) CHARACTER SET utf8 NOT NULL,
  `commenter_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `comment_time` datetime NOT NULL,
  `reply_time` datetime NOT NULL,
  `comment_reply_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_status_comment` text CHARACTER SET utf8 NOT NULL,
  `reply_status` text CHARACTER SET utf8 NOT NULL,
  `reply_id` varchar(200) CHARACTER SET utf8 NOT NULL,
  `comment_reply_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'comment reply id',
  `is_deleted` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `is_hidden` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `reply_type` enum('post_by_id','full_page_response') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post_by_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facebook_ex_autoreply_report`
--

INSERT INTO `facebook_ex_autoreply_report` (`id`, `user_id`, `autoreply_table_id`, `comment_id`, `comment_text`, `commenter_name`, `commenter_id`, `comment_time`, `reply_time`, `comment_reply_text`, `reply_text`, `reply_status_comment`, `reply_status`, `reply_id`, `comment_reply_id`, `is_deleted`, `is_hidden`, `reply_type`) VALUES
(1, 1, 50, '187319413434993_187368370096764', '.👌👌👌👌👌👌👏👏👏👏👏👏', 'Marwa Wageah', '4125462800873202', '2021-07-25 03:31:58', '2021-07-25 03:32:04', 'اهلاً  Marwa \r\nشكراً لاهتمامك , تم التواصل', '[\"177\",\"177\"]', 'success', '[\"success\",\"success\"]', '[\"m_fE5PK6pLc-PwmtfBanm7IhRzPdD9olsUrUhp7jIzVi8zvEgILl83LnpgKUiXt8uZbvACmAa7t0-_aZoTSvAIcQ\",\"m_ky7sr4lUGDjoiugzpy7XoBRzPdD9olsUrUhp7jIzVi975jH8ehs5svU7hFpSkUYB_TF1MffQNjagRxXmlM4yUQ\"]', '187319413434993_187368420096759', '0', '0', 'post_by_id'),
(2, 1, 51, '187936863373248_188687176631550', 'تفاصيل🔥', 'Ziad Farouk', '4160388034058481', '2021-07-27 00:00:36', '2021-07-27 00:00:42', 'اهلاً  Ziad \r\nشكراً لاهتمامك , تم التواصل', '[\"177\",\"177\"]', 'success', '[\"success\",\"success\"]', '[\"m_1FRMiMYy0INBOrhdnQD4klh2xu-4tlo4mX4W0Lt0fVOtd6GFoA-6Hvn9cplZcLApragWbLqKGWOYpcAveuN5WQ\",\"m_IfGzRbH9rxg9L3v5eEfgdVh2xu-4tlo4mX4W0Lt0fVP1i4U1cNtbb3kvcyH6RLQchcPFXB1u2jzNPcoINHlk_w\"]', '187936863373248_188687226631545', '0', '0', 'post_by_id');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_ex_conversation_campaign`
--

CREATE TABLE `facebook_ex_conversation_campaign` (
  `id` int(11) NOT NULL,
  `user_id` int(20) NOT NULL,
  `page_id` int(11) NOT NULL,
  `fb_page_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `excluded_label_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_names` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_time_zone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_locale` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_type` enum('page-wise','lead-wise','group-wise') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page-wise',
  `campaign_message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_time` datetime NOT NULL,
  `time_zone` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `posting_status` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '4=hold(Stopped for Error count >)',
  `is_try_again` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `last_try_error_count` int(11) NOT NULL,
  `is_spam_caught` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `error_message` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_thread` int(11) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `added_at` datetime NOT NULL,
  `completed_at` datetime NOT NULL,
  `delay_time` int(11) NOT NULL DEFAULT '0' COMMENT '0 means random'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facebook_ex_conversation_campaign_send`
--

CREATE TABLE `facebook_ex_conversation_campaign_send` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `client_thread_id` varchar(255) NOT NULL,
  `client_username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `message_sent_id` varchar(255) NOT NULL,
  `sent_time` datetime NOT NULL,
  `lead_id` int(11) NOT NULL,
  `processed` enum('0','1') NOT NULL DEFAULT '0',
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `facebook_rx_auto_post`
--

CREATE TABLE `facebook_rx_auto_post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `post_type` enum('text_submit','link_submit','image_submit','video_submit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text_submit',
  `campaign_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_group_user_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_or_group_or_user` enum('page','group','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_or_group_or_user_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_preview_image` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_caption` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_thumb_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `og_action_type_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `og_object_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_share_post` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_share_this_post_by_pages` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_share_to_profile` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_like_post` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_private_reply` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_private_reply_text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_private_reply_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'taken by cronjob or not',
  `auto_private_reply_count` int(11) NOT NULL,
  `auto_private_reply_done_ids` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_comment` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_comment_text` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posting_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'pending,processing,completed',
  `post_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'fb post id',
  `post_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `schedule_time` datetime NOT NULL,
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_auto_comment_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'post''s auto comment is done by cron job',
  `post_auto_like_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'post''s auto like is done by cron job',
  `post_auto_share_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'post''s auto share is done by cron job',
  `error_mesage` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_child` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `parent_campaign_id` int(11) NOT NULL,
  `page_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultrapost_auto_reply_table_id` int(11) NOT NULL,
  `is_autopost` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `repeat_times` int(11) NOT NULL,
  `time_interval` int(11) NOT NULL,
  `full_complete` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_type` enum('now','later') COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` enum('facebook','instagram') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'facebook'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facebook_rx_auto_post`
--

INSERT INTO `facebook_rx_auto_post` (`id`, `user_id`, `facebook_rx_fb_user_info_id`, `post_type`, `campaign_name`, `page_group_user_id`, `page_or_group_or_user`, `page_or_group_or_user_name`, `message`, `link`, `link_preview_image`, `link_caption`, `link_description`, `image_url`, `video_title`, `video_url`, `video_thumb_url`, `og_action_type_id`, `og_object_id`, `auto_share_post`, `auto_share_this_post_by_pages`, `auto_share_to_profile`, `auto_like_post`, `auto_private_reply`, `auto_private_reply_text`, `auto_private_reply_status`, `auto_private_reply_count`, `auto_private_reply_done_ids`, `auto_comment`, `auto_comment_text`, `posting_status`, `post_id`, `post_url`, `last_updated_at`, `schedule_time`, `time_zone`, `post_auto_comment_cron_jon_status`, `post_auto_like_cron_jon_status`, `post_auto_share_cron_jon_status`, `error_mesage`, `is_child`, `parent_campaign_id`, `page_ids`, `group_ids`, `ultrapost_auto_reply_table_id`, `is_autopost`, `repeat_times`, `time_interval`, `full_complete`, `schedule_type`, `media_type`) VALUES
(4, 1, 7, 'image_submit', 'Gaxa Preview', '19', 'page', 'Gaxa', 'Gaxa Is a very new and surprising invention for internet marketing. Facebook is providing some techniques for marketing that are hidden and nobody knows yet. Facebook doesn’t provide any front-end interface to use this powerful feature. It`s possible by using some good programming knowledge only. The most interesting part is, it`s totally free marketing that is 50 times better than email marketing. We have made tools for our own business and got the massive success that you can`t imagine. Gaxa Is the world\'s first bulk message sender to Facebook messenger subscriber. It`s the best alternative to email marketing which is more powerful.', '', '', '', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1616095474111525.png', '', '', '', '', '', '0', '', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '105940371572898_117080913792177', 'https://www.facebook.com/GaxaBot/photos/a.117080930458842/117080913792177/?type=3', '2021-03-30 15:05:10', '2021-03-30 15:00:45', 'Africa/Cairo', '0', '0', '0', '', '0', 0, '19', '', 3, '0', 1, 4320, '1', 'later', 'facebook'),
(5, 1, 7, 'image_submit', 'Gaxa Preview', '19', 'page', 'Gaxa', 'Gaxa Is a very new and surprising invention for internet marketing. Facebook is providing some techniques for marketing that are hidden and nobody knows yet. Facebook doesn’t provide any front-end interface to use this powerful feature. It`s possible by using some good programming knowledge only. The most interesting part is, it`s totally free marketing that is 50 times better than email marketing. We have made tools for our own business and got the massive success that you can`t imagine. Gaxa Is the world\'s first bulk message sender to Facebook messenger subscriber. It`s the best alternative to email marketing which is more powerful.', '', '', '', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1616095474111525.png', '', '', '', '', '', '0', '', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '105940371572898_118335143666754', 'https://www.facebook.com/GaxaBot/photos/a.117080930458842/118335143666754/?type=3', '2021-04-02 15:05:08', '2021-04-02 15:00:45', 'Africa/Cairo', '0', '0', '0', '', '1', 4, '19', '', 3, '0', 1, 4320, '1', 'later', 'facebook'),
(6, 1, 7, 'image_submit', 'Gaxa Freautre AR', '19', 'page', 'Gaxa', 'عندك مشكله ف اداره صفحتك على الفيس بوك😞\r\nعاوز صفحتك تبقا شغاله 24 ساعه باقل مجهود و اقل تكلفه😉\r\nمحتاج حد يرد على عملائك اى وقت ويتابع استفساراتهم🧐\r\n دلوقتى تقدر تحقق كل الى نفسك ف و تدير صفحتك بشكل احترافى على مدار 24 😃\r\n💪انت تقدر تحدد مواعيد اطلاق حملاتك التسويقيه\r\nتقدر تحدد الرد التلقائى على منشوراتك سواء الرد خاص او على المنشور نفسه\r\nتقدر تحدد مواعيد للمنشورات التلقائيه 💪\r\nتقدر تفعل خاصيه الرد التلقائى على كل اسئله عملائك المتوقعه من خلال المحادثات💪\r\nتقدر تحلل مقدرا تقدمك مع المنافسين ليك على الفيس بوك😵\r\n👌و بغطه واحده تقدر تعمل منشور ليك على كل صفحاتك سواء على انستجرام فيس بوك لينكدان\r\n\r\nمع جاكسا تقدر تحقق حلمك\r\n🤖🤖🤖🤖\r\n', 'https://www.gaxa-bot.com/', '', 'Gaxa | #1 Multichannel Marketing Solution', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1616530570169142.png,https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1616530586187166.png', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '105940371572898_117638910403044', 'https://www.facebook.com/105940371572898/posts/117638910403044/', '2021-03-31 19:05:14', '2021-03-31 19:00:42', 'Africa/Cairo', '0', '0', '0', '', '0', 0, '19', '', 3, '0', 1, 43200, '1', 'later', 'facebook'),
(7, 1, 7, 'image_submit', 'Gaxa Freautre AR', '19', 'page', 'Gaxa', 'عندك مشكله ف اداره صفحتك على الفيس بوك😞\r\nعاوز صفحتك تبقا شغاله 24 ساعه باقل مجهود و اقل تكلفه😉\r\nمحتاج حد يرد على عملائك اى وقت ويتابع استفساراتهم🧐\r\n دلوقتى تقدر تحقق كل الى نفسك ف و تدير صفحتك بشكل احترافى على مدار 24 😃\r\n💪انت تقدر تحدد مواعيد اطلاق حملاتك التسويقيه\r\nتقدر تحدد الرد التلقائى على منشوراتك سواء الرد خاص او على المنشور نفسه\r\nتقدر تحدد مواعيد للمنشورات التلقائيه 💪\r\nتقدر تفعل خاصيه الرد التلقائى على كل اسئله عملائك المتوقعه من خلال المحادثات💪\r\nتقدر تحلل مقدرا تقدمك مع المنافسين ليك على الفيس بوك😵\r\n👌و بغطه واحده تقدر تعمل منشور ليك على كل صفحاتك سواء على انستجرام فيس بوك لينكدان\r\n\r\nمع جاكسا تقدر تحقق حلمك\r\n🤖🤖🤖🤖\r\n', 'https://www.gaxa-bot.com/', '', 'Gaxa | #1 Multichannel Marketing Solution', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1616530570169142.png,https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1616530586187166.png', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '105940371572898_128643902635878', 'https://www.facebook.com/105940371572898/posts/128643902635878/', '2021-04-30 19:05:13', '2021-04-30 19:00:42', 'Africa/Cairo', '0', '0', '0', '', '1', 6, '', '', 3, '0', 1, 43200, '1', 'later', 'facebook'),
(10, 1, 7, 'image_submit', 'GAXA_For_Pages-Admin', '19', 'page', 'Gaxa', '!!!!!لو انت مش صاحب صفحه على الفيسبوك او انستجرام او على السوشال ميديا فالاعلان دا مش ليك \r\nعاوز صفحتك تظهر بشكل مميز | تعالا معايا احكيلك القصه\r\nصفحتك هتقدر تديرها باقل تكاليف و اقل مجهود يعنى شغل شهر كامل هتعمله فى يومين طب ازاى الكلام دا ؟؟\r\nتخيل كدا لما تقدر تعمل كل منشوراتك ف يوم واحد و تحدد ميعاد نشر كل منشور لوحده \r\nتخيل لما صفحتك شغاله 24 ساعه لوحدهااا  منغير ماتوظف حد يرد على اسئله العملاه وكومنتاتهم و مش اى رد دا رد على المنشور و رد على العميل فى الخاص لان انت هتقدر تحدد كل الردور الى انت محتاجها على منتجاتك و تحدد انهى رد هيبقا على المنشور و انهى فالخاص\r\nطب بلاش كل داااا تخيل ان الماسنجر هيكلم العملاء بكل تفاصيل انت محتاجها و يطلب ارقام تليفوناتهم و يسجلها عنك عشان وقت متحب ترجعلهم \r\nكل دا واكتر تقدر تحققه مع\r\nGAXA🤖🤖\r\nتقدر تجرب بنفسك مجانا لمده 5 ايام \r\n\r\n#GAXA_Bot\r\n', '', '', '', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1618775580853024.jpg', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '105940371572898_124387659728169', 'https://www.facebook.com/GaxaBot/photos/a.117080930458842/124387659728169/?type=3', '2021-04-18 22:00:11', '2021-04-18 21:00:53', 'Africa/Cairo', '0', '0', '0', '', '0', 0, '19,23', '', 3, '0', 3, 86400, '1', 'later', 'facebook'),
(11, 1, 7, 'image_submit', 'GAXA_For_Pages-Admin', '19', 'page', 'Gaxa', '!!!!!لو انت مش صاحب صفحه على الفيسبوك او انستجرام او على السوشال ميديا فالاعلان دا مش ليك \r\nعاوز صفحتك تظهر بشكل مميز | تعالا معايا احكيلك القصه\r\nصفحتك هتقدر تديرها باقل تكاليف و اقل مجهود يعنى شغل شهر كامل هتعمله فى يومين طب ازاى الكلام دا ؟؟\r\nتخيل كدا لما تقدر تعمل كل منشوراتك ف يوم واحد و تحدد ميعاد نشر كل منشور لوحده \r\nتخيل لما صفحتك شغاله 24 ساعه لوحدهااا  منغير ماتوظف حد يرد على اسئله العملاه وكومنتاتهم و مش اى رد دا رد على المنشور و رد على العميل فى الخاص لان انت هتقدر تحدد كل الردور الى انت محتاجها على منتجاتك و تحدد انهى رد هيبقا على المنشور و انهى فالخاص\r\nطب بلاش كل داااا تخيل ان الماسنجر هيكلم العملاء بكل تفاصيل انت محتاجها و يطلب ارقام تليفوناتهم و يسجلها عنك عشان وقت متحب ترجعلهم \r\nكل دا واكتر تقدر تحققه مع\r\nGAXA🤖🤖\r\nتقدر تجرب بنفسك مجانا لمده 5 ايام \r\n\r\n#GAXA_Bot\r\n', '', '', '', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1618775580853024.jpg', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '105940371572898_161376422695959', 'https://www.facebook.com/GaxaBot/photos/a.117080930458842/161376422695959/?type=3', '2021-06-17 21:05:12', '2021-06-17 21:00:53', 'Africa/Cairo', '0', '0', '0', '', '1', 10, '', '', 3, '0', 3, 86400, '1', 'later', 'facebook'),
(12, 1, 7, 'image_submit', 'GAXA_For_Pages-Admin', '19', 'page', 'Gaxa', '!!!!!لو انت مش صاحب صفحه على الفيسبوك او انستجرام او على السوشال ميديا فالاعلان دا مش ليك \r\nعاوز صفحتك تظهر بشكل مميز | تعالا معايا احكيلك القصه\r\nصفحتك هتقدر تديرها باقل تكاليف و اقل مجهود يعنى شغل شهر كامل هتعمله فى يومين طب ازاى الكلام دا ؟؟\r\nتخيل كدا لما تقدر تعمل كل منشوراتك ف يوم واحد و تحدد ميعاد نشر كل منشور لوحده \r\nتخيل لما صفحتك شغاله 24 ساعه لوحدهااا  منغير ماتوظف حد يرد على اسئله العملاه وكومنتاتهم و مش اى رد دا رد على المنشور و رد على العميل فى الخاص لان انت هتقدر تحدد كل الردور الى انت محتاجها على منتجاتك و تحدد انهى رد هيبقا على المنشور و انهى فالخاص\r\nطب بلاش كل داااا تخيل ان الماسنجر هيكلم العملاء بكل تفاصيل انت محتاجها و يطلب ارقام تليفوناتهم و يسجلها عنك عشان وقت متحب ترجعلهم \r\nكل دا واكتر تقدر تحققه مع\r\nGAXA🤖🤖\r\nتقدر تجرب بنفسك مجانا لمده 5 ايام \r\n\r\n#GAXA_Bot\r\n', '', '', '', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1618775580853024.jpg', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '0', '', '', '0000-00-00 00:00:00', '2021-08-16 21:00:53', 'Africa/Cairo', '0', '0', '0', '', '1', 10, '', '', 3, '0', 3, 86400, '0', 'later', 'facebook'),
(13, 1, 7, 'image_submit', 'GAXA_For_Pages-Admin', '19', 'page', 'Gaxa', '!!!!!لو انت مش صاحب صفحه على الفيسبوك او انستجرام او على السوشال ميديا فالاعلان دا مش ليك \r\nعاوز صفحتك تظهر بشكل مميز | تعالا معايا احكيلك القصه\r\nصفحتك هتقدر تديرها باقل تكاليف و اقل مجهود يعنى شغل شهر كامل هتعمله فى يومين طب ازاى الكلام دا ؟؟\r\nتخيل كدا لما تقدر تعمل كل منشوراتك ف يوم واحد و تحدد ميعاد نشر كل منشور لوحده \r\nتخيل لما صفحتك شغاله 24 ساعه لوحدهااا  منغير ماتوظف حد يرد على اسئله العملاه وكومنتاتهم و مش اى رد دا رد على المنشور و رد على العميل فى الخاص لان انت هتقدر تحدد كل الردور الى انت محتاجها على منتجاتك و تحدد انهى رد هيبقا على المنشور و انهى فالخاص\r\nطب بلاش كل داااا تخيل ان الماسنجر هيكلم العملاء بكل تفاصيل انت محتاجها و يطلب ارقام تليفوناتهم و يسجلها عنك عشان وقت متحب ترجعلهم \r\nكل دا واكتر تقدر تحققه مع\r\nGAXA🤖🤖\r\nتقدر تجرب بنفسك مجانا لمده 5 ايام \r\n\r\n#GAXA_Bot\r\n', '', '', '', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1618775580853024.jpg', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '0', '', '', '0000-00-00 00:00:00', '2021-10-15 21:00:53', 'Africa/Cairo', '0', '0', '0', '', '1', 10, '', '', 3, '0', 3, 86400, '0', 'later', 'facebook'),
(15, 1, 7, 'image_submit', 'Campaign 30/4', '19', 'page', 'Gaxa', 'لكل اصحاب الصفحات على السوشيال ميديا سواء فيس بوك او انستجرام \r\nمع جاكسا كل مشاكلك محلوله\r\nدلوقت تقدر تستخدم جاكسا مع خاصيه ال AI لاداره صفحته يعنى هتعين روبوت  يدير سفحتك بشكل مميز و مختلف علشان هو هيقوم بالردب التلقائى على تعليفات العملاء وعلى المنشورات وارسال رسائل خاصه باستفسارات العملاء على الخاص \r\nهيرد على العملاء من خلال الماسنجر بكل التفاصيل الى محتاجنها و مش بس كدا دا هيطلب منهم بياناتهم زى ارقام التليفونات و يجمعلك الداتا الى انت محتاجها عشان تتواصل معاهم تانى ز\r\nمش بس كدا جاكسا بيقدم خدمات تانيه كتييييير\r\nسجل الان واستمتع بخدمات جاكسا مجاناً لمده 5 ايام \r\n#GAXA\r\n#GAXA_BOT\r\n#Free_ 5 Dayes\r\n\r\n', '', '', '', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1619810945499780.jpg', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '105940371572898_128693455964256', 'https://www.facebook.com/GaxaBot/photos/a.117080930458842/128693455964256/?type=3', '2021-04-30 21:29:16', '0000-00-00 00:00:00', 'Africa/Cairo', '0', '0', '0', '', '0', 0, '19', '', 3, '0', 0, 0, '1', 'now', 'facebook'),
(16, 1, 7, 'image_submit', 'E-commerce Web & App', '23', 'page', 'Pro At Coding', 'يمكنك الآن امتلاك متجرك الإلكترونية متعدد البائعين الخاص بك مثل سوق ,جوميا, اى باى\r\nدلوقت تقدر تمتلك متجر الكترونى للويب و كمان تطبيق موبايل مع مميزات و خصائص كتير \r\n\r\nراسلنا على الصفحه او الواتس اب و اطلب نسخه تجريبيه الان\r\nhttp://www.proatcoding.com/products/E-Commerce Application.html\r\n', '', '', '', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1620436358304702.jpg,https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1620436637100481.jpg', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '2085064648484866_2949367462054576', 'https://www.facebook.com/2085064648484866/posts/2949367462054576/', '2021-05-15 03:20:15', '2021-05-15 03:17:49', 'Africa/Cairo', '0', '0', '0', '', '0', 0, '23', '', 0, '0', 0, 0, '1', 'later', 'facebook'),
(17, 1, 7, 'image_submit', 'E-commerce Web & App', '23', 'page', 'Pro At Coding', 'يمكنك الآن امتلاك متجرك الإلكترونية متعدد البائعين الخاص بك مثل سوق ,جوميا, اى باى\r\nدلوقت تقدر تمتلك متجر الكترونى للويب و كمان تطبيق موبايل مع مميزات و خصائص كتير \r\n\r\nراسلنا على الصفحه او الواتس اب و اطلب نسخه تجريبيه الان\r\nhttp://www.proatcoding.com/products/E-Commerce Application.html\r\n', '', '', 'E-Commerce Application', '', 'https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1620436358304702.jpg,https://www.gaxa-bot.com/upload_caster/text_image_link_video/image_1_1620436637100481.jpg', '', '', '', '', '', '0', '[]', '0', '0', '0', '', '0', 0, '[]', '0', '', '2', '2085064648484866_2944165432574779', 'https://www.facebook.com/2085064648484866/posts/2944165432574779/', '2021-05-08 03:20:45', '0000-00-00 00:00:00', '', '0', '0', '0', '', '0', 0, '23', '', 0, '0', 0, 0, '1', 'now', 'facebook');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_rx_config`
--

CREATE TABLE `facebook_rx_config` (
  `id` int(11) NOT NULL,
  `app_name` varchar(100) DEFAULT NULL,
  `api_id` varchar(250) DEFAULT NULL,
  `api_secret` varchar(250) DEFAULT NULL,
  `numeric_id` varchar(250) NOT NULL,
  `user_access_token` varchar(500) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `use_by` enum('only_me','everyone') NOT NULL DEFAULT 'only_me',
  `developer_access` enum('0','1') NOT NULL DEFAULT '0',
  `facebook_id` varchar(50) NOT NULL,
  `secret_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facebook_rx_config`
--

INSERT INTO `facebook_rx_config` (`id`, `app_name`, `api_id`, `api_secret`, `numeric_id`, `user_access_token`, `status`, `deleted`, `user_id`, `use_by`, `developer_access`, `facebook_id`, `secret_code`) VALUES
(1, 'Gaxa-bot', '911953566257982', 'f1ad6c6c89ef9eb74e8683fc8b0b927f', '', 'EAAM9arxeUz4BALFTJhZBk8mJZAgoX2gZCRQhc39UfZBox3iZC60PW2T1gJPdW87ThLRHn0z5CnVl0IfYoZAexwCYtIBe0ma4B3gzlUHRBN8ExmUBOFqbKVZCVC3U7JSC8fG6lhrnzvTD0SxZBqZCUdSH6c0HMA36aCWHvpwUVOQAVVwZDZD', '1', '0', 1, 'everyone', '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_rx_cta_post`
--

CREATE TABLE `facebook_rx_cta_post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `campaign_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_group_user_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'auto_like_post_comment',
  `page_or_group_or_user` enum('page') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cta post is only available for page',
  `page_or_group_or_user_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cta_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cta_value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_preview_image` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_caption` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `og_action_type_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `og_object_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_share_post` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_share_this_post_by_pages` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_share_to_profile` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_like_post` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_private_reply` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_private_reply_text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_private_reply_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'taken by cronjob or not',
  `auto_private_reply_count` int(11) NOT NULL,
  `auto_private_reply_done_ids` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_comment` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_comment_text` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posting_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'pending,processing,completed',
  `post_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'fb post id',
  `post_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `schedule_time` datetime NOT NULL,
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_auto_comment_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'post''s auto comment is done by cron job',
  `post_auto_like_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'post''s auto like is done by cron job',
  `post_auto_share_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'post''s auto share is done by cron job',
  `error_mesage` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_child` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `parent_campaign_id` int(11) NOT NULL,
  `page_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultrapost_auto_reply_table_id` int(11) NOT NULL,
  `repeat_times` int(11) NOT NULL,
  `time_interval` int(11) NOT NULL,
  `schedule_type` enum('now','later') COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_complete` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facebook_rx_cta_post`
--

INSERT INTO `facebook_rx_cta_post` (`id`, `user_id`, `facebook_rx_fb_user_info_id`, `campaign_name`, `page_group_user_id`, `page_or_group_or_user`, `page_or_group_or_user_name`, `cta_type`, `cta_value`, `message`, `link`, `link_preview_image`, `link_caption`, `link_description`, `og_action_type_id`, `og_object_id`, `auto_share_post`, `auto_share_this_post_by_pages`, `auto_share_to_profile`, `auto_like_post`, `auto_private_reply`, `auto_private_reply_text`, `auto_private_reply_status`, `auto_private_reply_count`, `auto_private_reply_done_ids`, `auto_comment`, `auto_comment_text`, `posting_status`, `post_id`, `post_url`, `last_updated_at`, `schedule_time`, `time_zone`, `post_auto_comment_cron_jon_status`, `post_auto_like_cron_jon_status`, `post_auto_share_cron_jon_status`, `error_mesage`, `is_child`, `parent_campaign_id`, `page_ids`, `ultrapost_auto_reply_table_id`, `repeat_times`, `time_interval`, `schedule_type`, `full_complete`) VALUES
(13, 1, 7, 'GAXA-Signup now', '19', 'page', '', 'SIGN_UP', 'https://www.gaxa-bot.com/home/sign_up', 'Heeey ! 👇👇\r\nThis post is not for you if you don\'t manage any kind of business\r\nBUT?? IF YOU A BUSINESS OWNER OR MARKETING AGENCY👇👇\r\n\r\nNow with GAXA you can manage all your social media account so easily \r\n(Facebook Pages, Instagram, Linkedin)\r\n👉Automate and schedule your posts👈\r\n👉Engage with your customers 24/7 with the fully completed chatbot 👈\r\n👉Setup your Facebook E-commerce 👈\r\n👉Set your auto comment replay👈\r\n👉It\'s one click to post to all your managed pages on Facebook, Instagram, or Linkedin👈\r\n✊5 DAYES FREE✊\r\n🤖🤖GAXA🤖🤖', 'https://www.gaxa-bot.com/home/sign_up', '', 'Gaxa | Sign up', '', '', '', '0', '', '0', '0', '0', '0', '0', 0, '', '0', '0', '2', '105940371572898_117662853733983', 'https://www.facebook.com/105940371572898/posts/117662853733983/', '2021-03-31 20:05:09', '2021-03-31 20:00:30', 'Africa/Cairo', '0', '0', '0', '', '0', 0, '19,23', 3, 1, 10080, 'later', '1'),
(14, 1, 7, 'GAXA-Signup now', '19', 'page', '', 'SIGN_UP', 'https://www.gaxa-bot.com/home/sign_up', 'Heeey ! 👇👇\r\nThis post is not for you if you don\'t manage any kind of business\r\nBUT?? IF YOU A BUSINESS OWNER OR MARKETING AGENCY👇👇\r\n\r\nNow with GAXA you can manage all your social media account so easily \r\n(Facebook Pages, Instagram, Linkedin)\r\n👉Automate and schedule your posts👈\r\n👉Engage with your customers 24/7 with the fully completed chatbot 👈\r\n👉Setup your Facebook E-commerce 👈\r\n👉Set your auto comment replay👈\r\n👉It\'s one click to post to all your managed pages on Facebook, Instagram, or Linkedin👈\r\n✊5 DAYES FREE✊\r\n🤖🤖GAXA🤖🤖', 'https://www.gaxa-bot.com/home/sign_up', '', 'Gaxa | Sign up', '', '', '', '0', '', '0', '0', '0', '0', '0', 0, '', '0', '0', '2', '105940371572898_120292990137636', 'https://www.facebook.com/105940371572898/posts/120292990137636/', '2021-04-07 20:05:10', '2021-04-07 20:00:30', 'Africa/Cairo', '0', '0', '0', '', '1', 13, '19,23', 3, 1, 10080, 'later', '1');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_rx_fb_group_info`
--

CREATE TABLE `facebook_rx_fb_group_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `group_id` varchar(200) NOT NULL,
  `group_cover` text,
  `group_profile` text,
  `group_name` varchar(200) DEFAULT NULL,
  `group_access_token` text NOT NULL,
  `add_date` date NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `facebook_rx_fb_page_info`
--

CREATE TABLE `facebook_rx_fb_page_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `page_id` varchar(200) NOT NULL,
  `page_cover` text,
  `page_profile` text,
  `page_name` text,
  `username` varchar(255) NOT NULL,
  `page_access_token` text NOT NULL,
  `page_email` varchar(200) DEFAULT NULL,
  `add_date` date NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `auto_sync_lead` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '0=disabled,1=enabled,2=processing,3=completed',
  `last_lead_sync` datetime NOT NULL,
  `next_scan_url` text NOT NULL,
  `current_lead_count` int(11) NOT NULL,
  `current_subscribed_lead_count` int(11) NOT NULL,
  `current_unsubscribed_lead_count` int(11) NOT NULL,
  `msg_manager` enum('0','1') NOT NULL DEFAULT '0',
  `bot_enabled` enum('0','1','2') NOT NULL DEFAULT '0',
  `started_button_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `welcome_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_human_email` varchar(250) NOT NULL,
  `no_match_found_reply` enum('enabled','disabled') NOT NULL DEFAULT 'disabled',
  `persistent_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `enable_mark_seen` enum('0','1') NOT NULL DEFAULT '0',
  `enbale_type_on` enum('0','1') NOT NULL DEFAULT '0',
  `estimated_reach` varchar(50) NOT NULL,
  `last_estimaed_at` datetime NOT NULL,
  `review_status` enum('NOT SUBMITTED','PENDING','REJECTED','APPROVED','LIMITED') NOT NULL DEFAULT 'NOT SUBMITTED',
  `review_status_last_checked` datetime NOT NULL,
  `reply_delay_time` int(11) NOT NULL,
  `mail_service_id` text NOT NULL,
  `sms_api_id` int(11) NOT NULL,
  `sms_reply_message` text NOT NULL,
  `ice_breaker_status` enum('0','1') NOT NULL DEFAULT '0',
  `ice_breaker_questions` text NOT NULL,
  `email_api_id` varchar(100) NOT NULL,
  `email_reply_message` text NOT NULL,
  `email_reply_subject` text NOT NULL,
  `sequence_sms_api_id` int(11) NOT NULL,
  `sequence_sms_campaign_id` int(11) NOT NULL,
  `sequence_email_api_id` varchar(100) NOT NULL,
  `sequence_email_campaign_id` int(11) NOT NULL,
  `has_instagram` enum('0','1') NOT NULL DEFAULT '0',
  `instagram_business_account_id` varchar(100) NOT NULL,
  `insta_username` varchar(200) NOT NULL,
  `insta_followers_count` int(11) NOT NULL,
  `insta_media_count` int(11) NOT NULL,
  `insta_website` varchar(250) NOT NULL,
  `insta_biography` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facebook_rx_fb_page_info`
--

INSERT INTO `facebook_rx_fb_page_info` (`id`, `user_id`, `facebook_rx_fb_user_info_id`, `page_id`, `page_cover`, `page_profile`, `page_name`, `username`, `page_access_token`, `page_email`, `add_date`, `deleted`, `auto_sync_lead`, `last_lead_sync`, `next_scan_url`, `current_lead_count`, `current_subscribed_lead_count`, `current_unsubscribed_lead_count`, `msg_manager`, `bot_enabled`, `started_button_enabled`, `welcome_message`, `chat_human_email`, `no_match_found_reply`, `persistent_enabled`, `enable_mark_seen`, `enbale_type_on`, `estimated_reach`, `last_estimaed_at`, `review_status`, `review_status_last_checked`, `reply_delay_time`, `mail_service_id`, `sms_api_id`, `sms_reply_message`, `ice_breaker_status`, `ice_breaker_questions`, `email_api_id`, `email_reply_message`, `email_reply_subject`, `sequence_sms_api_id`, `sequence_sms_campaign_id`, `sequence_email_api_id`, `sequence_email_campaign_id`, `has_instagram`, `instagram_business_account_id`, `insta_username`, `insta_followers_count`, `insta_media_count`, `insta_website`, `insta_biography`) VALUES
(19, 1, 7, '105940371572898', 'https://scontent-amt2-1.xx.fbcdn.net/v/t1.6435-9/202436421_162759512557650_1128646305081963262_n.png?_nc_cat=106&ccb=1-3&_nc_sid=1091cb&_nc_eui2=AeHfENDTAfrm8CQfpgb4OaYlxFHsdISQJRjEUex0hJAlGF30WRNrTR44rGsnvcd8NuPgQnbKJd-0lowc6ThuKTOq&_nc_ohc=AG8EUgow07QAX8KsZyJ&_nc_ht=scontent-amt2-1.xx&oh=d2a2a72e990c6fb93aa69c72667a49e0&oe=6121D2DC', 'https://scontent-ams4-1.xx.fbcdn.net/v/t1.6435-1/cp0/c5.5.197.198a/s50x50/159793767_105948021572133_1992215284752939721_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=dbb9e7&_nc_eui2=AeEq_NOcs0dj3R-JcvYCVytJTMhukyjih61MyG6TKOKHrWq7Ag__7ffztn7_n-afptgZEwpBjMAzmGa725O4MOGL&_nc_ohc=SmzmJpKsqZkAX9_WEDS&_nc_ht=scontent-ams4-1.xx&edm=AGaHXAAEAAAA&oh=7dff3f8281cf39e4502e6af8a060423d&oe=61241A90', 'Gaxa Bots', 'GaxaBot', 'EAAM9arxeUz4BABIVaUyJkFjVAyo87ax5so7fLqNidByx9D2yZAo29xqa0goCnD4XVZBlE7iihspTG5JfvDJSCVx2LwRB0lM8ZBdVm3g1jZB8peG8ZCMY4fCxgkor5hZA8PSpBkcn5nsKss5Qk5SluZBrMVYXDO1HPF5iEGQDN3yBxG0cwOkzzqC01pyZAMYQg14S4z4OCf4VQgZDZD', 'info@gaxa-bot.com', '2021-07-25', '0', '3', '2021-07-27 00:12:50', '', 51, 51, 0, '0', '1', '1', '', '', 'disabled', '0', '0', '0', '', '0000-00-00 00:00:00', 'APPROVED', '2021-07-17 02:45:37', 0, '{\"mailchimp\":[],\"sendinblue\":[],\"activecampaign\":[],\"mautic\":[],\"acelle\":[]}', 0, '', '0', '[]', '', '', '', 0, 0, '', 0, '0', '', '', 0, 0, '', ''),
(22, 1, 7, '100414768535163', 'https://scontent-ams4-1.xx.fbcdn.net/v/t1.6435-9/133996049_165251182051521_5840403022488579565_n.png?_nc_cat=110&ccb=1-3&_nc_sid=1091cb&_nc_eui2=AeGoSgcy0Gd3lU7dwnppgsNBUTW89b_9169RNbz1v_3Xr1qe9tPW-baSULRvQ4ZUTnsYMVnLBSuRc1D43pbCbWdx&_nc_ohc=emeV9p0uhksAX-NjeIi&_nc_ht=scontent-ams4-1.xx&oh=17ab9a8ed3574ee0068e0ffbefbc94af&oe=61236108', 'https://scontent-ams4-1.xx.fbcdn.net/v/t1.6435-1/cp0/p50x50/127962424_141064104470229_7930847531339942886_n.png?_nc_cat=100&ccb=1-3&_nc_sid=dbb9e7&_nc_eui2=AeGmImlT2V9O6_g_f-BJ7oLY82HduerDYFHzYd256sNgUUCsEL2jxqbuM8PWbRzrKrVTrs0NnBQ3ndHsNf67Ngnf&_nc_ohc=qC4v_h8bE4AAX-Sda8z&_nc_ht=scontent-ams4-1.xx&edm=AGaHXAAEAAAA&oh=410147de4402b96cb4e0fadcade9ebd0&oe=612142C4', 'Eventrex', 'EVENTREXEG', 'EAAM9arxeUz4BAM9exfiapYRzsJHgyhCem0sO7hE2hAuI6tzWiDspn6auedS7W9Q1Iuvtg9f6JDmZCMQhcNFnMQ6AUKwVAhmgZBHpFFeI9KcyF5lOriLSRmtYdB4Lb7VbC1bqIPBEXZCa5hB1ArnBgVrgpmTVbZBkN6n7J4rSAW6lOD7l57eMfvZC9ZCsZAANNddoKWjDK5JEQZDZD', 'info@eventrex.net', '2021-07-25', '0', '0', '2021-04-19 00:00:34', '', 12, 12, 0, '0', '0', '1', '', '', 'disabled', '0', '0', '0', '', '0000-00-00 00:00:00', 'NOT SUBMITTED', '2021-03-18 18:23:00', 0, '', 0, '', '0', '', '', '', '', 0, 0, '', 0, '0', '', '', 0, 0, '', ''),
(23, 1, 7, '2085064648484866', 'https://scontent-amt2-1.xx.fbcdn.net/v/t1.6435-9/184056324_2944074075917248_3074572657114047773_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=1091cb&_nc_eui2=AeGIg000nbXrYlW8dFW0mjUNHbE3WvDW3vgdsTda8Nbe-KZgDKGmZP7OJ9PMd9pgsY6-PVRPbUr1TsRdT2iWb8vj&_nc_ohc=id2clF0lojAAX8-_KD0&_nc_ht=scontent-amt2-1.xx&oh=003e5444e3ac219f85c4a687eec11108&oe=61235E4B', 'https://scontent-amt2-1.xx.fbcdn.net/v/t1.6435-1/cp0/p50x50/160211387_2901393700185286_6534210040118702850_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=dbb9e7&_nc_eui2=AeEQaSmBstYVGY_L-cSr48Rs77ssTJSpSNnvuyxMlKlI2ccbnMZS9B0pe2WeGTQcrUcszRhKZaAmwOz0YI76hOTV&_nc_ohc=FyolRK33y_YAX_rmUSq&_nc_ht=scontent-amt2-1.xx&oh=ba9ef806b6a9bd16bcfab92e1a29f730&oe=61211EE4', 'Pro At Coding', 'Proatcoding', 'EAAM9arxeUz4BAEZCYDygirIQ8qKPygyZBkNu5QZAflFVk8QuhUBT4vY0wNjyOHxO726rdSZBEPVvxy0DD9BfdAc1APp1XhyIBpKCyhrDxv9ldUvPiE0rhtYKzY6GsUk6uc4aVoUZBDISc0HLIDA1g2QfMiEQL3KLwZB3TkZCghNLLtuHOL4excW4VZBEiHoIZAZBoI1axb88sh6gZDZD', 'info@proatcoding.com', '2021-07-25', '0', '0', '2021-07-11 22:00:36', '', 169, 169, 0, '0', '1', '1', '', '', 'disabled', '0', '0', '0', '', '0000-00-00 00:00:00', 'NOT SUBMITTED', '2021-07-17 03:58:12', 0, '', 0, '', '0', '', '', '', '', 0, 0, '', 0, '0', '', '', 0, 0, '', ''),
(24, 39, 25, '106275574983574', '', 'https://scontent-amt2-1.xx.fbcdn.net/v/t1.6435-1/cp0/p50x50/188084264_106275624983569_8978338200777182145_n.png?_nc_cat=109&ccb=1-3&_nc_sid=dbb9e7&_nc_ohc=Xy4axQ2iOUcAX9ApuRZ&_nc_ht=scontent-amt2-1.xx&tp=30&oh=aecd3a71902b83c594486055b57061be&oe=60D12F25', 'Hi', '', 'EAAM9arxeUz4BAK6ZCzjTmjMqlP3w0tSplqgbhnDiUvOADFM73oXu9UEE8Iq6CajaiooMrOZAvw6kyPUZC7dy28p2r6lZCFpxByyqhiGYapfbTa2uLmRAgF00HrDocW23GLZC5ZBKDZBJEdHkSh5t7D7VkQpsReDeAAvnXGUDpVoqkvBQPHWpshQ', '', '2021-06-18', '0', '0', '0000-00-00 00:00:00', '', 0, 0, 0, '0', '2', '0', ' {{user_first_name}}fuk', '', 'disabled', '0', '0', '0', '', '0000-00-00 00:00:00', 'NOT SUBMITTED', '2021-06-18 22:27:27', 0, '', 0, '', '0', '[]', '', '', '', 0, 0, '', 0, '0', '', '', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_rx_fb_user_info`
--

CREATE TABLE `facebook_rx_fb_user_info` (
  `id` int(11) NOT NULL,
  `facebook_rx_config_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_token` text NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `fb_id` varchar(200) NOT NULL,
  `add_date` date NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  `need_to_delete` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facebook_rx_fb_user_info`
--

INSERT INTO `facebook_rx_fb_user_info` (`id`, `facebook_rx_config_id`, `user_id`, `access_token`, `name`, `email`, `fb_id`, `add_date`, `deleted`, `need_to_delete`) VALUES
(7, 1, 1, 'EAAM9arxeUz4BAOOnIMfdorUTkCNqzOa3GXgexq9tZAwRsPkX64wodU49lksMZCcQ3jLvjW6ayqdlvERGfduRLXe5xY4eIadFXQZB53nNBpkiQEwFY5HFLr3kelYc5Px9C9x7nFBF3VSqZCVXBW7zRGZCGfPAEivFQ05r8KDjwQSUo6X3AhkYLr2ZADverZBhwAZD', 'Rashad M. Tantawy', NULL, '4712214892138418', '2021-07-25', '0', '0'),
(24, 1, 21, 'EAAM9arxeUz4BAJrLTb3r4NZBJOfYkBpXADcIBkQ8lXh9gniFgEDFfGHtHZCeTIXzX3jJpsz7fTr22ppZCyWVtaahKJS4S2r3jZBuYI93dIdZBek4cZAyGH7X3S6WN19aKa4UNuBoj8OIV8F69hjNSsZBE9KDzE602egsvxQnj8rD2WVvkIRi37b', 'Hanan Said', NULL, '10157500442931256', '2021-03-27', '0', '0'),
(25, 1, 39, 'EAAM9arxeUz4BAAJFjuZAfuqwKsoHZCpdZAXnEiaiWyhmqhbv0rvHTXeK475MZBwS6m0aeTQcGH93TAueaeR3UldPbGUE7fFRHZBvTFSrzGgqkDpC1hw4QwWdMM8Hh7TfFdIYxOnYyAMwo0kvofImZAmCYAX4TZAY88Uayib22FZCCDPROLW7Nn5Y', 'Ana Victoria Pinzón Cuadros', NULL, '301513978352678', '2021-06-18', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_rx_slider_post`
--

CREATE TABLE `facebook_rx_slider_post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `post_type` enum('slider_post','carousel_post') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'slider_post',
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `carousel_content` longtext COLLATE utf8mb4_unicode_ci,
  `carousel_link` mediumtext COLLATE utf8mb4_unicode_ci,
  `slider_images` longtext COLLATE utf8mb4_unicode_ci,
  `slider_image_duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_transition_duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_group_user_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_or_group_or_user` enum('page','group','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_or_group_or_user_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_share_post` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_share_this_post_by_pages` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_share_to_profile` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_like_post` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_private_reply` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_private_reply_text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_private_reply_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'taken by cronjob or not',
  `auto_private_reply_count` int(11) NOT NULL,
  `auto_private_reply_done_ids` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_comment` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_comment_text` mediumtext COLLATE utf8mb4_unicode_ci,
  `posting_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pending,processing,completed',
  `post_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `schedule_time` datetime NOT NULL,
  `time_zone` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_auto_comment_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `post_auto_like_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `post_auto_share_cron_jon_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `error_mesage` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_child` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `parent_campaign_id` int(11) NOT NULL,
  `page_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultrapost_auto_reply_table_id` int(11) NOT NULL,
  `repeat_times` int(11) NOT NULL,
  `time_interval` int(11) NOT NULL,
  `schedule_type` enum('now','later') COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_complete` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facebook_rx_slider_post`
--

INSERT INTO `facebook_rx_slider_post` (`id`, `user_id`, `facebook_rx_fb_user_info_id`, `post_type`, `message`, `carousel_content`, `carousel_link`, `slider_images`, `slider_image_duration`, `slider_transition_duration`, `campaign_name`, `page_group_user_id`, `page_or_group_or_user`, `page_or_group_or_user_name`, `auto_share_post`, `auto_share_this_post_by_pages`, `auto_share_to_profile`, `auto_like_post`, `auto_private_reply`, `auto_private_reply_text`, `auto_private_reply_status`, `auto_private_reply_count`, `auto_private_reply_done_ids`, `auto_comment`, `auto_comment_text`, `posting_status`, `post_id`, `post_url`, `last_updated_at`, `schedule_time`, `time_zone`, `post_auto_comment_cron_jon_status`, `post_auto_like_cron_jon_status`, `post_auto_share_cron_jon_status`, `error_mesage`, `is_child`, `parent_campaign_id`, `page_ids`, `ultrapost_auto_reply_table_id`, `repeat_times`, `time_interval`, `schedule_type`, `full_complete`) VALUES
(5, 1, 7, 'carousel_post', 'WOOW!!!! ,😲😲\r\nIt\'s really amazing. Now you can manage all your social media pages by \"\"GAXA\"\"\r\n1-Post now / schedule your Facebook, Instagram, Linkedin post\r\n2-Auto Comment / Reply\r\n3-Auto private replay\r\n4-Full completed chatbot (reply with text-img-vid, button, and more)\r\n5-Subscribers messages\r\n7-Facebook pages comparison\r\n8-SMS & email Campaign \r\nMore extra features all in one place \r\nSave money and time now with GAXA🤖🤖\r\n', '[{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"Full Featured Messenger Bot\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1616097345614715.png\",\"description\":\"Setup Messenger bot for replying 24\\/7\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"Auto reply\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1616097382825535.png\",\"description\":\"Allows you to set comment auto reply and comment private reply.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"Bulk message sending\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1616097412656489.png\",\"description\":\"Send bulk message to your Messenger subscribers.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"Complete Facebook poster\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1616097443150597.png\",\"description\":\"You can post text, image, link, video, or carousel\\/video to your Facebook pages & groups.\"}]', 'https://www.gaxa-bot.com', NULL, NULL, NULL, 'Gaxa Features-Carousel', '19', 'page', 'Gaxa', '', '[]', '0', '', '', '0', '0', 0, '', '', '0', '2', '105940371572898_117257317107870', 'https://www.facebook.com/105940371572898/posts/117257317107870/', '2021-03-30 21:05:14', '2021-03-30 21:00:39', 'Africa/Cairo', '0', '0', '0', '', '0', 0, '19,23', 0, 1, 10080, 'later', '1'),
(6, 1, 7, 'carousel_post', 'WOOW!!!! ,😲😲\r\nIt\'s really amazing. Now you can manage all your social media pages by \"\"GAXA\"\"\r\n1-Post now / schedule your Facebook, Instagram, Linkedin post\r\n2-Auto Comment / Reply\r\n3-Auto private replay\r\n4-Full completed chatbot (reply with text-img-vid, button, and more)\r\n5-Subscribers messages\r\n7-Facebook pages comparison\r\n8-SMS & email Campaign \r\nMore extra features all in one place \r\nSave money and time now with GAXA🤖🤖\r\n', '[{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"Full Featured Messenger Bot\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1616097345614715.png\",\"description\":\"Setup Messenger bot for replying 24\\/7\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"Auto reply\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1616097382825535.png\",\"description\":\"Allows you to set comment auto reply and comment private reply.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"Bulk message sending\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1616097412656489.png\",\"description\":\"Send bulk message to your Messenger subscribers.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"Complete Facebook poster\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1616097443150597.png\",\"description\":\"You can post text, image, link, video, or carousel\\/video to your Facebook pages & groups.\"}]', 'https://www.gaxa-bot.com', NULL, NULL, NULL, 'Gaxa Features-Carousel', '19', 'page', 'Gaxa', '', '[]', '0', '', '', '0', '0', 0, '', '', '0', '2', '105940371572898_119922853507983', 'https://www.facebook.com/105940371572898/posts/119922853507983/', '2021-04-06 21:05:08', '2021-04-06 21:00:39', 'Africa/Cairo', '0', '0', '0', '', '1', 5, '19,23', 0, 1, 10080, 'later', '1'),
(9, 1, 7, 'carousel_post', ' اظهر صفحتك على الفيس بوك بشكل مميز و محتلف\r\n                 -----عاوز توظف حد يرد على العملاء ------\r\n      ---محتاج حد يرد بشكل فعال وسريع على التعليقات---\r\n--  جاوب على اسئله العملاء فرساله على الخاص فى اى وقت---\r\n- خدمات تانيه كتيييير هتخلى صفحتك تبقا مختلفه و بتنافس ديما-\r\n                             (🤖👇😍🤩👇🤖)\r\n#GAXA\r\n#GAXA_BOT\r\n#Scoial_Media_Marketing_Tool\r\n\r\n\r\n', '[{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u0645\\u0632\\u0627\\u0645\\u0646\\u0629 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0627\\u0644\\u0645\\u062a\\u0648\\u0642\\u0639\\u064a\\u0646 \\u0644\\u0644\\u0635\\u0641\\u062d\\u0629\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193409192008.jpg\",\"description\":\"\\u064a\\u0645\\u0643\\u0646\\u0643 \\u0645\\u0632\\u0627\\u0645\\u0646\\u0629 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0627\\u0644\\u0645\\u062a\\u0648\\u0642\\u0639\\u064a\\u0646 \\u0627\\u0644\\u0630\\u064a\\u0646 \\u064a\\u0634\\u0627\\u0631\\u0643\\u0648\\u0646 \\u0628\\u0627\\u0644\\u0641\\u0639\\u0644 \\u0641\\u064a \\u0645\\u062d\\u0627\\u062f\\u062b\\u0629 \\u0645\\u0639 \\u0635\\u0641\\u062d\\u062a\\u0643 \\u0623\\u0648 \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u0642\\u062f \\u0623\\u0631\\u0633\\u0644\\u062a \\u0631\\u062f\\u064b\\u0627 \\u062e\\u0627\\u0635\\u064b\\u0627.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u062a\\u0642\\u0627\\u0631\\u064a\\u0631 \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u0643\\u0627\\u0645\\u0644\\u0629\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193457665899.jpg\",\"description\":\"\\u0633\\u062a\\u062a\\u0645\\u0643\\u0646 \\u0645\\u0646 \\u0631\\u0624\\u064a\\u0629 \\u062a\\u0642\\u0627\\u0631\\u064a\\u0631 \\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u062d\\u0645\\u0644\\u0629 \\u0627\\u0644\\u0643\\u0627\\u0645\\u0644\\u0629 \\u060c \\u062d\\u064a\\u062b \\u0633\\u062a\\u062c\\u062f \\u0627\\u0644\\u062a\\u0642\\u0631\\u064a\\u0631 \\u0627\\u0644\\u0646\\u0647\\u0627\\u0626\\u064a.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u062f\\u0639\\u0645 \\u0642\\u0646\\u0648\\u0627\\u062a \\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u0629 \\u0645\\u062a\\u0639\\u062f\\u062f\\u0629\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193495186455.jpg\",\"description\":\"\\u062f\\u0639\\u0645 \\u0627\\u0644\\u0643\\u062b\\u064a\\u0631 \\u0645\\u0646 \\u0627\\u0644\\u0642\\u0646\\u0648\\u0627\\u062a \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u0629 \\u0645\\u062b\\u0644 Facebook \\u0648 insetegram \\u0648 youtube \\u0648 LinkedIn \\u0648\\u0627\\u0644\\u0645\\u0632\\u064a\\u062f\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u0627\\u0644\\u0631\\u062f \\u0627\\u0644\\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0644\\u0644\\u0628\\u0631\\u064a\\u062f \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193534645484.jpg\",\"description\":\"\\u0644\\u062f\\u064a\\u0647 \\u0645\\u064a\\u0632\\u0629 \\u0625\\u0631\\u0633\\u0627\\u0644 \\u0627\\u0644\\u0631\\u062f \\u0627\\u0644\\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0639\\u0644\\u0649 \\u0628\\u0631\\u064a\\u062f\\u0643 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628 \\u0627\\u0644\\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0644\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193575132033.jpg\",\"description\":\"\\u0644\\u062f\\u064a\\u0647 \\u0645\\u064a\\u0632\\u0629 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628 \\u0627\\u0644\\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0644\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642\\u0627\\u062a \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0647 \\u0644\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643.\"}]', 'https://www.gaxa-bot.com/', NULL, NULL, NULL, 'Gaxa services new design carousel ', '19', 'page', 'Gaxa', '', '[]', '0', '', '', '0', '0', 0, '', '', '0', '2', '105940371572898_126243436209258', 'https://www.facebook.com/105940371572898/posts/126243436209258/', '2021-04-23 22:05:08', '2021-04-23 22:00:07', 'Africa/Cairo', '0', '0', '0', '', '0', 0, '19', 0, 1, 86400, 'later', '1'),
(10, 1, 7, 'carousel_post', ' اظهر صفحتك على الفيس بوك بشكل مميز و محتلف\r\n                 -----عاوز توظف حد يرد على العملاء ------\r\n      ---محتاج حد يرد بشكل فعال وسريع على التعليقات---\r\n--  جاوب على اسئله العملاء فرساله على الخاص فى اى وقت---\r\n- خدمات تانيه كتيييير هتخلى صفحتك تبقا مختلفه و بتنافس ديما-\r\n                             (🤖👇😍🤩👇🤖)\r\n#GAXA\r\n#GAXA_BOT\r\n#Scoial_Media_Marketing_Tool\r\n\r\n\r\n', '[{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u0645\\u0632\\u0627\\u0645\\u0646\\u0629 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0627\\u0644\\u0645\\u062a\\u0648\\u0642\\u0639\\u064a\\u0646 \\u0644\\u0644\\u0635\\u0641\\u062d\\u0629\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193409192008.jpg\",\"description\":\"\\u064a\\u0645\\u0643\\u0646\\u0643 \\u0645\\u0632\\u0627\\u0645\\u0646\\u0629 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0627\\u0644\\u0645\\u062a\\u0648\\u0642\\u0639\\u064a\\u0646 \\u0627\\u0644\\u0630\\u064a\\u0646 \\u064a\\u0634\\u0627\\u0631\\u0643\\u0648\\u0646 \\u0628\\u0627\\u0644\\u0641\\u0639\\u0644 \\u0641\\u064a \\u0645\\u062d\\u0627\\u062f\\u062b\\u0629 \\u0645\\u0639 \\u0635\\u0641\\u062d\\u062a\\u0643 \\u0623\\u0648 \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u0642\\u062f \\u0623\\u0631\\u0633\\u0644\\u062a \\u0631\\u062f\\u064b\\u0627 \\u062e\\u0627\\u0635\\u064b\\u0627.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u062a\\u0642\\u0627\\u0631\\u064a\\u0631 \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u0643\\u0627\\u0645\\u0644\\u0629\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193457665899.jpg\",\"description\":\"\\u0633\\u062a\\u062a\\u0645\\u0643\\u0646 \\u0645\\u0646 \\u0631\\u0624\\u064a\\u0629 \\u062a\\u0642\\u0627\\u0631\\u064a\\u0631 \\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u062d\\u0645\\u0644\\u0629 \\u0627\\u0644\\u0643\\u0627\\u0645\\u0644\\u0629 \\u060c \\u062d\\u064a\\u062b \\u0633\\u062a\\u062c\\u062f \\u0627\\u0644\\u062a\\u0642\\u0631\\u064a\\u0631 \\u0627\\u0644\\u0646\\u0647\\u0627\\u0626\\u064a.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u062f\\u0639\\u0645 \\u0642\\u0646\\u0648\\u0627\\u062a \\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u0629 \\u0645\\u062a\\u0639\\u062f\\u062f\\u0629\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193495186455.jpg\",\"description\":\"\\u062f\\u0639\\u0645 \\u0627\\u0644\\u0643\\u062b\\u064a\\u0631 \\u0645\\u0646 \\u0627\\u0644\\u0642\\u0646\\u0648\\u0627\\u062a \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u0629 \\u0645\\u062b\\u0644 Facebook \\u0648 insetegram \\u0648 youtube \\u0648 LinkedIn \\u0648\\u0627\\u0644\\u0645\\u0632\\u064a\\u062f\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u0627\\u0644\\u0631\\u062f \\u0627\\u0644\\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0644\\u0644\\u0628\\u0631\\u064a\\u062f \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193534645484.jpg\",\"description\":\"\\u0644\\u062f\\u064a\\u0647 \\u0645\\u064a\\u0632\\u0629 \\u0625\\u0631\\u0633\\u0627\\u0644 \\u0627\\u0644\\u0631\\u062f \\u0627\\u0644\\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0639\\u0644\\u0649 \\u0628\\u0631\\u064a\\u062f\\u0643 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a.\"},{\"link\":\"https:\\/\\/www.gaxa-bot.com\\/\",\"name\":\"\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628 \\u0627\\u0644\\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0644\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642\",\"picture\":\"https:\\/\\/www.gaxa-bot.com\\/upload_caster\\/carousel_slider\\/image_1_1619193575132033.jpg\",\"description\":\"\\u0644\\u062f\\u064a\\u0647 \\u0645\\u064a\\u0632\\u0629 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628 \\u0627\\u0644\\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0644\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642\\u0627\\u062a \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0647 \\u0644\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643.\"}]', 'https://www.gaxa-bot.com/', NULL, NULL, NULL, 'Gaxa services new design carousel ', '19', 'page', 'Gaxa', '', '[]', '0', '', '', '0', '0', 0, '', '', '0', '2', '105940371572898_164746559025612', 'https://www.facebook.com/105940371572898/posts/164746559025612/', '2021-06-22 22:05:15', '2021-06-22 22:00:07', 'Africa/Cairo', '0', '0', '0', '', '1', 9, '19', 0, 1, 86400, 'later', '1');

-- --------------------------------------------------------

--
-- Table structure for table `fb_msg_manager`
--

CREATE TABLE `fb_msg_manager` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `page_table_id` int(12) NOT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  `from_user_id` varchar(255) DEFAULT NULL,
  `last_snippet` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_count` varchar(255) DEFAULT NULL,
  `thread_id` varchar(255) NOT NULL,
  `inbox_link` text NOT NULL,
  `unread_count` varchar(255) DEFAULT NULL,
  `sync_time` datetime NOT NULL,
  `last_update_time` varchar(100) NOT NULL COMMENT 'this time in +00 UTC format, We need to convert it to the user time zone'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fb_msg_manager`
--

INSERT INTO `fb_msg_manager` (`id`, `user_id`, `facebook_rx_fb_user_info_id`, `page_table_id`, `from_user`, `from_user_id`, `last_snippet`, `message_count`, `thread_id`, `inbox_link`, `unread_count`, `sync_time`, `last_update_time`) VALUES
(1, 1, 1, 2, 'Rashad M. Tantawy', '3991235264335270', 'Pro At Coding: pets Mobile app', '9', 't_4706444826048758', '/2085064648484866/inbox/2900660946925228/', '0', '2021-03-15 18:00:24', '2021-03-11T13:56:43+0000'),
(2, 1, 1, 2, 'Ahmed M. Khalil', '3782139508473315', 'You sent a photo.', '7', 't_2668274220149788', '/2085064648484866/inbox/2852916295033027/', '0', '2021-03-15 18:00:24', '2021-01-03T11:47:07+0000'),
(3, 1, 1, 2, 'Ahmed Henish', '3633763383339830', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_222177829444255', '/2085064648484866/inbox/2853318224992834/', '0', '2021-03-15 18:00:24', '2021-01-03T09:25:03+0000'),
(4, 1, 1, 2, 'Mostafa Khalil', '3445238325581282', 'خالص شكري وتقديري للأستاذ رشاد', '40', 't_3404807502981819', '/2085064648484866/inbox/2852647605059896/', '0', '2021-03-15 18:00:24', '2021-01-02T14:25:18+0000'),
(5, 1, 1, 2, 'Walid Mohamed', '2464242090366771', 'You sent a photo.', '3', 't_1500062120340692', '/2085064648484866/inbox/2852644801726843/', '0', '2021-03-15 18:00:24', '2021-01-02T11:22:28+0000'),
(6, 1, 1, 2, 'Mohamed A Saber', '5122119304495970', 'https://envatogrocery.amtechnology.info/\nمتحر الكترونى يناسب الهايبر ماركت و المحلات الكبرى والمتوسطه \n(بعد الانتهاء من البرمجه بيكون للمالك حريه التصرف ف الكود)\n١-عدد لا نهائى من المنتجات\n٢-دفع اونلاين \n٣-لوحه تحكم عشان تقدر تتحكم ف ادخال و اداره منتجاتك \n—————\nالسعر شامل  9 الاف جنية\n-بدء تطبيق وبناء قاعدة البيانات\n-دعم الاستضافة وإعداد الخادم\n-دعم إعداد بوابة الدفع\n- تغير اللوجو والبراند\nوهذا السعر بدون تعريب اللغة العريبة فى حالة اضافة التعريب يتم اضافة 2000ج على اجمالى المبلغ', '10', 't_10158580873386690', '/2085064648484866/inbox/2851259905198666/', '0', '2021-03-15 18:00:24', '2020-12-31T19:32:33+0000'),
(7, 1, 1, 2, 'Mio Moi', '4418738598155424', 'You sent a photo.', '3', 't_2837514849904936', '/2085064648484866/inbox/2851014025223254/', '0', '2021-03-15 18:00:24', '2020-12-31T13:41:48+0000'),
(8, 1, 1, 2, 'Ahmed Gamal', '3737092126400920', '01065816569', '8', 't_1897897250357901', '/2085064648484866/inbox/2850870431904280/', '0', '2021-03-15 18:00:24', '2020-12-31T13:36:56+0000'),
(9, 1, 1, 2, 'Mustapha AboulSoud', '5514809815211804', 'You sent a photo.', '6', 't_10225184965151002', '/2085064648484866/inbox/2850858888572101/', '0', '2021-03-15 18:00:24', '2020-12-31T09:35:33+0000'),
(10, 1, 1, 2, 'Ahmed El-kholy', '3735431636523211', '󰀀', '16', 't_2428120474152440', '/2085064648484866/inbox/2722433098081348/', '0', '2021-03-15 18:00:24', '2020-12-31T09:21:43+0000'),
(11, 1, 1, 2, 'Abd Elrahman Galal', '3515390298558977', 'You sent a photo.', '6', 't_10158799696891203', '/2085064648484866/inbox/2846027609055229/', '0', '2021-03-15 18:00:24', '2020-12-24T21:56:36+0000'),
(12, 1, 1, 2, 'Abdelrahman Sharaf', '4028401087181789', 'You sent a photo.', '15', 't_10225214884579526', '/2085064648484866/inbox/2839835106341146/', '0', '2021-03-15 18:00:24', '2020-12-24T10:30:29+0000'),
(13, 1, 1, 2, 'Ahmed Meda', '3588243134627192', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '5', 't_3373559849419526', '/2085064648484866/inbox/2840735652917758/', '0', '2021-03-15 18:00:24', '2020-12-17T18:45:47+0000'),
(14, 1, 1, 2, 'Amr Hebåh', '3671149752954246', '21-ST Associate / Haram-Giza', '2', 't_10164447461235057', '/2085064648484866/inbox/2840530899604900/', '0', '2021-03-15 18:00:24', '2020-12-17T13:00:57+0000'),
(15, 1, 1, 2, 'Hesham Farrag', '4883111695095635', 'You sent a photo.', '6', 't_10224555255094826', '/2085064648484866/inbox/2840160892975234/', '0', '2021-03-15 18:00:24', '2020-12-17T00:33:52+0000'),
(16, 1, 1, 2, 'Islam Ashraf', '5269615196412865', 'فى خدمتك  يا فندم اى وقت', '7', 't_10159560451778488', '/2085064648484866/inbox/2839932709664719/', '0', '2021-03-15 18:00:24', '2020-12-16T17:04:49+0000'),
(17, 1, 1, 2, 'Amr Amin', '5933242616693195', 'Delivery Boy Application (Android/IOS) \n+ Web AdminPanel\nتطبيق توصيل الطلبات\n\nTotal Package= 5000 EPG - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server Setting\n-Support payment Getaway Setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps', '1', 't_394578591917929', '/2085064648484866/inbox/2790185944639396/', '0', '2021-03-15 18:00:24', '2020-10-21T19:09:43+0000'),
(18, 1, 1, 2, 'Hesham ElGhonemy', '3898719890187781', 'نظام نقاط البيع الشامل للشركات التجارية الصغيرة ومحلات السوبر ماركت\nوالمطاعم.قدّم خدمة عملائك بشكل أفضل من خلال معرفة المنتجات المتوفرة في المخزون.وسهولة إنشاء ملصقات على الفور لتتبع المخزون\n\n سعر البرنامج = 1280ج\n\n  السعر شامل الخدمات التالي \n\n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free\nالاستلام بيكون ف خلال 48 ساعه شكرا للاتصال ب ProAtCoding 01118136665', '1', 't_10221213960431168', '/2085064648484866/inbox/2790180504639940/', '0', '2021-03-15 18:00:24', '2020-10-21T19:00:58+0000'),
(19, 1, 1, 2, 'Ahmed Said', '3700446290062632', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1575000999351438', '/2085064648484866/inbox/2789076174750373/', '0', '2021-03-15 18:00:24', '2020-10-20T15:03:13+0000'),
(20, 1, 1, 2, 'Omar Osama', '3859310777472045', 'السلام عليكم يا فندم \nKing Burger - Restaurant Food Ordering web Application\nwith admin Panel \n\nTotal Package = 4000 EGP- Without the server fees\n\nServices includes \ninstallation services \nSetting support \nPayment gateway Setting \nLaunching to the LIVE servers \n\n==============\nDemo Link : https://freaktemplate.com/new_kingscript/home\nAdmin Panel Link: https://freaktemplate.com/new_kingscript/admin\n\nUsername : admin@gmail.com\nPassword : 123\n---------------------------\nThank you for contact with ProAtCoding \nFollow our Facebook Page for more Applications\nMobile:0118136665', '2', 't_2438698916432831', '/2085064648484866/inbox/2788372698154054/', '0', '2021-03-15 18:00:24', '2020-10-19T20:24:36+0000'),
(21, 1, 1, 2, 'Walled Osman', '4168406249850912', 'السلام عليكم يافندم \nالنسخ التجريبيه غير متوفر لبرامج Desktop لاكن ف فيديو توضيحى لو حضرتك مهتم \nشكرا لاستفسار حضرتك', '2', 't_10158287011824230', '/2085064648484866/inbox/2788358528155471/', '0', '2021-03-15 18:00:24', '2020-10-19T20:02:16+0000'),
(22, 1, 1, 2, 'Heba Mostafa', '4216148428396728', 'Info@proatcoding.com', '8', 't_3241535192593029', '/2085064648484866/inbox/2740224539635537/', '0', '2021-03-15 18:00:24', '2020-10-04T19:36:23+0000'),
(23, 1, 1, 2, 'Osama Hassan', '3895744860516748', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1939910129479844', '/2085064648484866/inbox/2746726632318661/', '0', '2021-03-15 18:00:24', '2020-09-03T19:13:32+0000'),
(24, 1, 1, 2, 'Abdelrahman Bl', '5106466166061312', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1422361787975117', '/2085064648484866/inbox/2746123299045661/', '0', '2021-03-15 18:00:24', '2020-09-03T03:17:41+0000'),
(25, 1, 1, 2, 'Mohanad Atef', '3878621492194120', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10158011453723778', '/2085064648484866/inbox/2744551789202812/', '0', '2021-03-15 18:00:24', '2020-09-01T11:45:26+0000'),
(26, 1, 1, 2, 'Rwida Osama', '3751113178271628', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1702301463256281', '/2085064648484866/inbox/2743743432616981/', '0', '2021-03-15 18:00:24', '2020-08-31T13:19:47+0000'),
(27, 1, 1, 2, 'Mahmoud Saber', '3745573772177820', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1683940401761477', '/2085064648484866/inbox/2743630659294925/', '0', '2021-03-15 18:00:24', '2020-08-31T10:26:25+0000'),
(28, 1, 1, 2, 'Ebraam Boshra Shokry', '5237079146364522', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2692065654341402', '/2085064648484866/inbox/2742222496102408/', '0', '2021-03-15 18:00:24', '2020-08-29T20:16:20+0000'),
(29, 1, 1, 2, 'Abdelrahman Bonna', '3754511041253006', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3482101178480531', '/2085064648484866/inbox/2742184712772853/', '0', '2021-03-15 18:00:24', '2020-08-29T19:13:29+0000'),
(30, 1, 1, 2, 'Medhat Gamal', '4132894590068277', 'Medhat sent 3 photos.', '4', 't_1435841563472325', '/2085064648484866/inbox/2742010822790242/', '0', '2021-03-15 18:00:24', '2020-08-29T15:14:09+0000'),
(31, 1, 1, 2, 'Shaza Aly', '4150380121641874', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10158471567200210', '/2085064648484866/inbox/2741963996128258/', '0', '2021-03-15 18:00:24', '2020-08-29T14:07:57+0000'),
(32, 1, 1, 2, 'Taher Abd Elhady', '3751567114921482', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3143426195706273', '/2085064648484866/inbox/2741886256136032/', '0', '2021-03-15 18:00:24', '2020-08-29T12:18:43+0000'),
(33, 1, 1, 2, 'Huda Said', '4381872918508073', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3277130862370045', '/2085064648484866/inbox/2741821399475851/', '0', '2021-03-15 18:00:24', '2020-08-29T10:41:18+0000'),
(34, 1, 1, 2, 'Sayed Yousef', '3690050361042860', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3310949088991162', '/2085064648484866/inbox/2740938769564114/', '0', '2021-03-15 18:00:24', '2020-08-28T11:07:29+0000'),
(35, 1, 1, 2, 'Michael Anwar', '3699195693521791', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10220512991806900', '/2085064648484866/inbox/2739474496377208/', '0', '2021-03-15 18:00:24', '2020-08-26T18:19:37+0000'),
(36, 1, 1, 2, 'Mohamed Osama', '3443363315775421', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3390027074382990', '/2085064648484866/inbox/2738650759792915/', '0', '2021-03-15 18:00:24', '2020-08-25T21:06:30+0000'),
(37, 1, 1, 2, 'Ahmed Šåmîř', '3563045017139067', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2612732635656513', '/2085064648484866/inbox/2738003836524274/', '0', '2021-03-15 18:00:24', '2020-08-25T03:40:20+0000'),
(38, 1, 1, 2, 'Mohamed Ezat', '3948526008542342', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2047431392068126', '/2085064648484866/inbox/2737365673254757/', '0', '2021-03-15 18:00:24', '2020-08-24T09:31:21+0000'),
(39, 1, 1, 2, 'Mai Taher', '4013382675373423', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2906175316154863', '/2085064648484866/inbox/2736075063383818/', '0', '2021-03-15 18:00:24', '2020-08-22T20:33:04+0000'),
(40, 1, 1, 2, 'Maram Abd Elmageed', '3890293924423420', 'https://docs.google.com/document/d/16MjE4h8UNtwAQTm87NQAgCY-uKQCPhpewCvbc_iiitA/edit?usp=drivesdk', '5', 't_3225925820821794', '/2085064648484866/inbox/2735187056805952/', '0', '2021-03-15 18:00:24', '2020-08-21T19:52:41+0000'),
(41, 1, 1, 2, 'Mohab Mahmoud', '3258864307550325', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_786744192152460', '/2085064648484866/inbox/2734473790210612/', '0', '2021-03-15 18:00:24', '2020-08-21T02:57:33+0000'),
(42, 1, 1, 2, 'Mohamed Salah', '3878927575496714', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '6', 't_3208217642557596', '/2085064648484866/inbox/2734345960223395/', '0', '2021-03-15 18:00:24', '2020-08-20T23:06:31+0000'),
(43, 1, 1, 2, 'Kamel Mohamed', '5372487572776403', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10157097237291442', '/2085064648484866/inbox/2734208740237117/', '0', '2021-03-15 18:00:24', '2020-08-20T19:16:53+0000'),
(44, 1, 1, 2, 'Amr Soltan', '5084799234927692', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10213555264235413', '/2085064648484866/inbox/2733664103624914/', '0', '2021-03-15 18:00:24', '2020-08-20T05:26:00+0000'),
(45, 1, 1, 2, 'Mostafa Mohamad', '3566227403488962', '01065820252', '4', 't_10207686465756049', '/2085064648484866/inbox/2733335860324405/', '0', '2021-03-15 18:00:24', '2020-08-19T20:11:55+0000'),
(46, 1, 1, 2, 'Ahmed Ashraf', '3807855765988825', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3037071956420394', '/2085064648484866/inbox/2733013753689949/', '0', '2021-03-15 18:00:24', '2020-08-19T12:31:23+0000'),
(47, 1, 1, 2, 'Muhamed Youssef', '3785206294890405', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3083346125108576', '/2085064648484866/inbox/2732893770368614/', '0', '2021-03-15 18:00:24', '2020-08-19T09:26:49+0000'),
(48, 1, 1, 2, 'Omar Hamed', '2766592773465521', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1572231796285302', '/2085064648484866/inbox/2732610197063638/', '0', '2021-03-15 18:00:24', '2020-08-19T01:10:53+0000'),
(49, 1, 1, 2, 'Eman Atef', '3159111697524734', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1221078794895268', '/2085064648484866/inbox/2732509067073751/', '0', '2021-03-15 18:00:24', '2020-08-18T22:06:20+0000'),
(50, 1, 1, 2, 'Hosam Rashwan', '3865046476921325', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1796241430545210', '/2085064648484866/inbox/2732377393753585/', '0', '2021-03-15 18:00:24', '2020-08-18T18:32:32+0000'),
(51, 1, 1, 2, 'Alaa A. Farag', '3532100260233545', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10218494025049731', '/2085064648484866/inbox/2732370643754260/', '0', '2021-03-15 18:00:24', '2020-08-18T18:23:48+0000'),
(52, 1, 1, 2, 'Mohamed Elmancy', '3657788877668280', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3854788561204065', '/2085064648484866/inbox/2732350977089560/', '0', '2021-03-15 18:00:24', '2020-08-18T17:53:37+0000'),
(53, 1, 1, 2, 'Hesham Hafez', '3395310287240230', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2795509337349670', '/2085064648484866/inbox/2732117867112871/', '0', '2021-03-15 18:00:24', '2020-08-18T12:20:41+0000'),
(54, 1, 1, 2, 'Shaimaa Kamel', '5111239792280793', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1740882569422367', '/2085064648484866/inbox/2732082033783121/', '0', '2021-03-15 18:00:24', '2020-08-18T11:28:42+0000'),
(55, 1, 1, 2, 'Doaa Saeed', '4086648174702741', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3559208237431502', '/2085064648484866/inbox/2732034190454572/', '0', '2021-03-15 18:00:24', '2020-08-18T10:08:33+0000'),
(56, 1, 1, 2, 'Mohamed Sayed', '5198224870248687', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2682285918680882', '/2085064648484866/inbox/2732028397121818/', '0', '2021-03-15 18:00:24', '2020-08-18T09:59:56+0000'),
(57, 1, 1, 2, 'Mohamed Abdalkarem', '3778712845515303', 'Thank you', '3', 't_3118670341585607', '/2085064648484866/inbox/2731992247125433/', '0', '2021-03-15 18:00:24', '2020-08-18T09:40:14+0000'),
(58, 1, 1, 2, 'Khaled Tareq', '3743813538988463', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1247817802228172', '/2085064648484866/inbox/2732004403790884/', '0', '2021-03-15 18:00:24', '2020-08-18T09:20:49+0000'),
(59, 1, 1, 2, 'Mohamed Ahmed', '5155982484474601', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '4', 't_1773947176088795', '/2085064648484866/inbox/2725862997738358/', '0', '2021-03-15 18:00:24', '2020-08-11T12:35:32+0000'),
(60, 1, 1, 2, 'Ahmed Mamdouh', '4276998628996627', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '2', 't_1396046697252271', '/2085064648484866/inbox/2726017437722914/', '0', '2021-03-15 18:00:24', '2020-08-11T12:34:36+0000'),
(61, 1, 1, 2, 'Taha Shref Mizo', '4088609081215289', 'شكرا يا فندم', '5', 't_10217686171328029', '/2085064648484866/inbox/2725486791109312/', '0', '2021-03-15 18:00:24', '2020-08-11T05:32:49+0000'),
(62, 1, 1, 2, 'Abood Hawa', '3353806041349508', 'شكرا هيتم ارسال النسخه التجريبيه لحضرتك فورا', '24', 't_2755596248003829', '/2085064648484866/inbox/2724053551252636/', '0', '2021-03-15 18:00:24', '2020-08-09T12:17:24+0000'),
(63, 1, 1, 2, 'Ahmed El Nagdy', '3841820419197223', '+96565607675', '8', 't_2768859790012548', '/2085064648484866/inbox/2724061817918476/', '0', '2021-03-15 18:00:24', '2020-08-09T12:06:46+0000'),
(64, 1, 1, 2, 'Khaled Elabd', '3376660882437973', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه   \n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '27', 't_10163887328105057', '/2085064648484866/inbox/2723699877954670/', '0', '2021-03-15 18:00:24', '2020-08-09T09:40:05+0000'),
(65, 1, 1, 2, 'Tareq Adnan Alkadri', '3630903073675679', 'محتاج تعملو لي تطبيق Android iOS', '7', 't_4779304518762419', '/2085064648484866/inbox/2723838907940767/', '0', '2021-03-15 18:00:24', '2020-08-09T09:19:42+0000'),
(66, 1, 1, 2, 'Mahmoud Attia', '3760178054067488', 'اجمالي  التكلفه  220$', '4', 't_10220899441528695', '/2085064648484866/inbox/2724060774585247/', '0', '2021-03-15 18:00:24', '2020-08-09T07:58:58+0000'),
(67, 1, 1, 2, 'Abdallh Abdul Rassol', '3515177735255187', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_3312258315497935', '/2085064648484866/inbox/2724061247918533/', '0', '2021-03-15 18:00:24', '2020-08-09T07:34:46+0000'),
(68, 1, 1, 2, 'Nourddine Assmar Ait Bendra', '3673941382643129', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_2664683180414331', '/2085064648484866/inbox/2724060257918632/', '0', '2021-03-15 18:00:24', '2020-08-09T07:33:41+0000'),
(69, 1, 1, 2, 'Eslam Fawzy', '5141375069270362', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_1624468877711786', '/2085064648484866/inbox/2724059844585340/', '0', '2021-03-15 18:00:24', '2020-08-09T07:32:59+0000'),
(70, 1, 1, 2, 'Eng Ahmed Abdelfattah', '3925734400806585', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '2', 't_1170896596622377', '/2085064648484866/inbox/2724050387919619/', '0', '2021-03-15 18:00:24', '2020-08-09T07:16:04+0000'),
(71, 1, 1, 2, 'Amir Ragaei', '3102282339878592', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '6', 't_10157944439391773', '/2085064648484866/inbox/2723758124615512/', '0', '2021-03-15 18:00:24', '2020-08-09T07:11:34+0000'),
(72, 1, 1, 2, 'Ahmed Leo', '3497075280323504', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '6', 't_630928874505154', '/2085064648484866/inbox/2723772897947368/', '0', '2021-03-15 18:00:24', '2020-08-09T07:11:23+0000'),
(73, 1, 1, 2, 'Abdelalim Allam', '3950040401723914', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '3', 't_10160185657394745', '/2085064648484866/inbox/2723847514606573/', '0', '2021-03-15 18:00:24', '2020-08-09T07:09:07+0000'),
(74, 1, 1, 2, 'Medhat Fathi Khedr', '4394909133883131', 'تحت امرك يافندم سعيد بخدمتك', '27', 't_10223250696554817', '/2085064648484866/inbox/2718193121838679/', '0', '2021-03-15 18:00:24', '2020-08-08T21:01:04+0000'),
(75, 1, 1, 2, 'Ahmed Youssif', '4159858504025617', '٠٠٩٦٥٩٩٥٤٨٥٩٣', '35', 't_775453403221948', '/2085064648484866/inbox/2723622127962445/', '0', '2021-03-15 18:00:24', '2020-08-08T20:42:12+0000'),
(76, 1, 1, 2, 'شدوان القرشي', '3541784452520627', 'اه يافندم يدعم العربيه', '7', 't_2624327254482694', '/2085064648484866/inbox/2723644637960194/', '0', '2021-03-15 18:00:24', '2020-08-08T20:37:06+0000'),
(77, 1, 1, 2, 'Precise Delivery', '3347816435240161', 'للاسف لانقوم بانشاء برامج جديدة حاليا', '8', 't_319464625871044', '/2085064648484866/inbox/2723612184630106/', '0', '2021-03-15 18:00:24', '2020-08-08T20:05:02+0000'),
(78, 1, 1, 2, 'Ahmed Rezk', '3149131398489121', 'Special for you will get 20% discount for PetAppLovers\nand also 10% discount for  Online Grocery Shop', '32', 't_10215631267448915', '/2085064648484866/inbox/2717750835216241/', '0', '2021-03-15 18:00:24', '2020-08-08T19:53:06+0000'),
(79, 1, 1, 2, 'Raed Abu Hammad', '3796564767077853', 'تمام  استاذنك هرجع للادارة واشوف ردهم ايه وارد علي حضرتك', '5', 't_10219980780083091', '/2085064648484866/inbox/2723609867963671/', '0', '2021-03-15 18:00:24', '2020-08-08T19:28:10+0000'),
(80, 1, 1, 2, 'Islam Jamal', '3991692254184486', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_10157015769815728', '/2085064648484866/inbox/2723584424632882/', '0', '2021-03-15 18:00:24', '2020-08-08T18:46:54+0000'),
(81, 1, 1, 2, 'خالد السلامه المريحي', '3771304002958433', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_3117357441665732', '/2085064648484866/inbox/2723584157966242/', '0', '2021-03-15 18:00:24', '2020-08-08T18:46:28+0000'),
(82, 1, 1, 2, 'Ahmed Elqadi', '3116145291821879', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_1222729728073275', '/2085064648484866/inbox/2723583847966273/', '0', '2021-03-15 18:00:24', '2020-08-08T18:45:57+0000'),
(83, 1, 1, 2, 'Hany Refaat', '3777238059029113', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_3144279518987554', '/2085064648484866/inbox/2723583517966306/', '0', '2021-03-15 18:00:24', '2020-08-08T18:45:20+0000'),
(84, 1, 1, 2, 'Facebook User', '3778281162253641', 'Food delivery Application (Android/IOS) -with complete admin Panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB and build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_3711073528921134', '/2085064648484866/inbox/2723498971308094/', '0', '2021-03-15 18:00:24', '2020-08-08T16:34:00+0000'),
(85, 1, 1, 2, 'Moatasem Osam', '3660443157406723', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '2', 't_10157675632393443', '/2085064648484866/inbox/2723414734649851/', '0', '2021-03-15 18:00:24', '2020-08-08T14:34:58+0000'),
(86, 1, 1, 2, 'باسم الحجري ابو محمد', '3915731288449513', 'هذا موجود codeanay', '3', 't_10158752261059756', '/2085064648484866/inbox/2723400814651243/', '0', '2021-03-15 18:00:24', '2020-08-08T14:19:27+0000'),
(87, 1, 1, 2, 'Abdullah Genidy', '5088127487895000', 'نظام نقاط البيع الشامل للشركات التجارية الصغيرة ومحلات السوبر ماركت\nوالمطاعم.قدّم خدمة عملائك بشكل أفضل من خلال معرفة المنتجات المتوفرة في المخزون.وسهولة إنشاء ملصقات على الفور لتتبع المخزون\n\n سعر البرنامج = 1280ج\n\n  السعر شامل الخدمات التالي \n\n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free\n\n  \nالاستلام بيكون ف خلال 48 ساعه و فى خصم 10% خلال فتره العيد\nشكرا للاتصال ب ProAtCoding +2-01118136665', '1', 't_1954050591402035', '/2085064648484866/inbox/2722588328065825/', '0', '2021-03-15 18:00:24', '2020-08-07T17:10:59+0000'),
(88, 1, 1, 2, 'Waled Lelo', '3312263395498209', '󰀀', '17', 't_650814192510644', '/2085064648484866/inbox/2722552324736092/', '0', '2021-03-15 18:00:24', '2020-08-07T17:08:04+0000'),
(89, 1, 1, 2, 'Ashmawi Hashim', '3101819079932583', '00965 66631854', '9', 't_1055428821541905', '/2085064648484866/inbox/2722560764735248/', '0', '2021-03-15 18:00:24', '2020-08-07T16:38:24+0000'),
(90, 1, 1, 2, 'Amir Code', '3309060775798985', 'اوك', '8', 't_3842613325754051', '/2085064648484866/inbox/2722562758068382/', '0', '2021-03-15 18:00:24', '2020-08-07T16:37:24+0000'),
(91, 1, 1, 2, 'Hatem Genidy', '3818929978191853', 'الاجمالي ٣٢٣٠ جنية مصري \nدون مصاريف التشغيل', '30', 't_1758352647582903', '/2085064648484866/inbox/2085332915124706/', '0', '2021-03-15 18:00:25', '2020-08-07T16:34:39+0000'),
(92, 1, 1, 2, 'Abdallah Soaody', '3707289969320501', '01001826629', '10', 't_10223335743604348', '/2085064648484866/inbox/2722513014740023/', '0', '2021-03-15 18:00:25', '2020-08-07T15:53:56+0000'),
(93, 1, 1, 2, 'أبو يوسف المصري', '4044569372221052', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '2', 't_10223681613615181', '/2085064648484866/inbox/2722516384739686/', '0', '2021-03-15 18:00:25', '2020-08-07T15:20:25+0000'),
(94, 1, 1, 2, 'Mohamed Aboushady', '3708522559184061', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '3', 't_3043663969090454', '/2085064648484866/inbox/2722484738076184/', '0', '2021-03-15 18:00:25', '2020-08-07T14:36:26+0000'),
(95, 1, 1, 2, 'Facebook User', '5441049392579341', 'No sorry we don’t provide white labels apps we pay the full source application', '4', 't_10111023476227096', '/2085064648484866/inbox/2720660421591949/', '0', '2021-03-15 18:00:25', '2020-08-05T15:25:18+0000'),
(96, 1, 1, 2, 'Safwan Hashim', '4174720195883523', 'القاهره يافندم', '10', 't_3132935813470085', '/2085064648484866/inbox/2719223068402351/', '0', '2021-03-15 18:00:25', '2020-08-03T23:03:19+0000'),
(97, 1, 1, 2, 'ĪŤ Omar FaTħī', '4101338929897024', 'حضرتك  احنا متوفر فقط البرامج المعروضة لو حضرتك عندك اي افكار ممكن ننفذها لحضرتك', '18', 't_288478898914351', '/2085064648484866/inbox/2718079488516709/', '0', '2021-03-15 18:00:25', '2020-08-03T20:08:13+0000'),
(98, 1, 1, 2, 'Mahmoud Seoudi', '3925764970815049', 'حضرتك ممكن تتواصل معنا عن طريق  الواتساب او ابعتلنا رقم التلفون وهيتم التواصل بحضوتك', '5', 't_10160549459547715', '/2085064648484866/inbox/2718983821759609/', '0', '2021-03-15 18:00:25', '2020-08-03T16:01:28+0000'),
(99, 1, 1, 2, 'Wasiq Zahid', '3578194825612898', 'Food Delivery Application (Android/IOS) With complete admin panel  Total Package= 185 $ - Without servers and hosting fees  Service includes -Installation service -support for setting your server or flutter environment in your device (iOS or Android)  -Payment Gateway services/language setting   Free technical support for 1 month   10% off if order it within 2 days delivered in 48 hours.     Welcome to Pro At Coding    Don’t hesitate to contact us at +2-01118136665', '1', 't_1666883843476276', '/2085064648484866/inbox/2718868428437815/', '0', '2021-03-15 18:00:25', '2020-08-03T13:09:56+0000'),
(100, 1, 1, 2, 'Ana Ana', '5168677709872782', '󰀀', '48', 't_1699595940192906', '/2085064648484866/inbox/2717797751878216/', '0', '2021-03-15 18:00:25', '2020-08-03T12:59:11+0000'),
(101, 1, 1, 2, 'Essam Lotfy', '3877543258997008', '+2-01118136665', '4', 't_3124318470955286', '/2085064648484866/inbox/2718446065146718/', '0', '2021-03-15 18:00:25', '2020-08-03T04:01:31+0000'),
(102, 1, 1, 2, 'عبد الرحمن العكيزي', '3698415206880008', '00966562009030', '5', 't_1951120745020326', '/2085064648484866/inbox/2718366655154659/', '0', '2021-03-15 18:00:25', '2020-08-03T00:33:02+0000'),
(103, 1, 1, 2, 'Omar Sameh Attia', '4375798339127487', 'https://www.mediafire.com/file/ce7fsldwi0wlm64/EsyPOS+-+Update+Version.mp4/file', '7', 't_10219895195705116', '/2085064648484866/inbox/2718446265146698/', '0', '2021-03-15 18:00:25', '2020-08-03T00:23:15+0000'),
(104, 1, 1, 2, 'Mohamed Abdulrahman', '3794945543959868', 'تمام يافندم', '18', 't_10157177516076960', '/2085064648484866/inbox/2718380888486569/', '0', '2021-03-15 18:00:25', '2020-08-02T23:47:35+0000'),
(105, 1, 1, 2, 'Ahmed Eltaher', '3837326409627302', 'يوجد فيديو توضيحى يافندم على الرابط التالى\nhttps://www.mediafire.com/file/ce7fsldwi0wlm64/EsyPOS+-+Update+Version.mp4/file', '7', 't_10163949161605052', '/2085064648484866/inbox/2718408225150502/', '0', '2021-03-15 18:00:25', '2020-08-02T23:46:38+0000'),
(106, 1, 1, 2, 'Danish Agha', '3169268819828053', 'Did you send the email as requested?', '46', 't_10163935002495504', '/2085064648484866/inbox/2717532398571418/', '0', '2021-03-15 18:00:25', '2020-08-02T23:33:46+0000'),
(107, 1, 1, 2, 'Ashraf Nabil', '5402351623140413', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_2576062012644569', '/2085064648484866/inbox/2718387425152582/', '0', '2021-03-15 18:00:25', '2020-08-02T22:17:54+0000'),
(108, 1, 1, 2, 'Waleed Gomaa', '3607143982747934', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_10157570767912469', '/2085064648484866/inbox/2718369345154390/', '0', '2021-03-15 18:00:25', '2020-08-02T21:47:46+0000'),
(109, 1, 1, 2, 'محمود السيد خليفة', '4130233940361928', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3139844346097043', '/2085064648484866/inbox/2718368965154428/', '0', '2021-03-15 18:00:25', '2020-08-02T21:46:44+0000'),
(110, 1, 1, 2, 'Hasan Ali', '3975294835863214', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3679186865443650', '/2085064648484866/inbox/2718367615154563/', '0', '2021-03-15 18:00:25', '2020-08-02T21:43:45+0000'),
(111, 1, 1, 2, 'محمد فتحى', '4357851594244136', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_1654130361405726', '/2085064648484866/inbox/2718366365154688/', '0', '2021-03-15 18:00:25', '2020-08-02T21:41:00+0000'),
(112, 1, 1, 2, 'عبدالرحمن القعاري', '3623431921068021', '󰀀', '3', 't_3512775288734145', '/2085064648484866/inbox/2718366031821388/', '0', '2021-03-15 18:00:25', '2020-08-02T21:40:46+0000'),
(113, 1, 1, 2, 'Facebook User', '3601754713266584', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_2839911399605974', '/2085064648484866/inbox/2718364698488188/', '0', '2021-03-15 18:00:25', '2020-08-02T21:37:18+0000'),
(114, 1, 1, 2, 'سليمان ابوعائشة', '5149527508422909', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_2800126670220778', '/2085064648484866/inbox/2718364581821533/', '0', '2021-03-15 18:00:25', '2020-08-02T21:37:03+0000'),
(115, 1, 1, 2, 'Youssef Essam El-Din', '3703424599672230', 'sorry i mean, if you order it within 2 days', '12', 't_10217116802449204', '/2085064648484866/inbox/2718226495168675/', '0', '2021-03-15 18:00:25', '2020-08-02T18:02:31+0000'),
(116, 1, 1, 2, 'Young Shehata', '5809341349083411', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n \n  Total Package: 80 $ \n\n The price including the following:\n \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3297326866990113', '/2085064648484866/inbox/2718196138505044/', '0', '2021-03-15 18:00:25', '2020-08-02T16:42:22+0000'),
(117, 1, 1, 2, 'Ahmad Hamad', '3750625611688757', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3386669081356736', '/2085064648484866/inbox/2718194581838533/', '0', '2021-03-15 18:00:25', '2020-08-02T16:40:04+0000'),
(118, 1, 1, 2, 'Ahmad Al Hafez', '4013799585326529', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_10223992600944858', '/2085064648484866/inbox/2718123235179001/', '0', '2021-03-15 18:00:25', '2020-08-02T14:56:15+0000'),
(119, 1, 1, 2, 'Ahmed Elkaffass', '3111621838892209', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n \n  Total Package: 80 $ \n\n The price including the following:\n \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n \n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '7', 't_2733316980237623', '/2085064648484866/inbox/2718038715187453/', '0', '2021-03-15 18:00:25', '2020-08-02T14:51:15+0000'),
(120, 1, 1, 2, 'Yassin Ahmed', '3177689638993507', 'رجاء ارسال رقم التليفون خاص بحضرتك', '20', 't_3392297397468328', '/2085064648484866/inbox/2718065468518111/', '0', '2021-03-15 18:00:25', '2020-08-02T14:48:57+0000'),
(121, 1, 1, 2, 'Jalal A. Elhaj', '3765004193606959', 'موجود يافندم متجر الكترونى على صفحتنا ممكن حضرتك تطلع على تفاصيله', '9', 't_2740711406149043', '/2085064648484866/inbox/2718047441853247/', '0', '2021-03-15 18:00:25', '2020-08-02T14:45:47+0000'),
(122, 1, 1, 2, 'السفير.هاني الجمال', '3871185876273876', 'نظام نقاط البيع الشامل للشركات التجارية الصغيرة ومحلات السوبر ماركت\nوالمطاعم.قدّم خدمة عملائك بشكل أفضل من خلال معرفة المنتجات المتوفرة في المخزون.وسهولة إنشاء ملصقات على الفور لتتبع المخزون\n\n سعر البرنامج = 1280ج\n\n  السعر شامل الخدمات التالي \n\n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free\n\n  \nالاستلام بيكون ف خلال 48 ساعه و فى خصم 10% خلال فتره العيد\nشكرا للاتصال ب ProAtCoding +2-01118136665', '1', 't_3572371056130950', '/2085064648484866/inbox/2718092931848698/', '0', '2021-03-15 18:00:25', '2020-08-02T14:24:00+0000'),
(123, 1, 1, 2, 'Anvar Tk', '5041632012578316', '00966557872432', '16', 't_3084597334909814', '/2085064648484866/inbox/2717818385209486/', '0', '2021-03-15 18:00:25', '2020-08-02T14:09:30+0000'),
(124, 1, 1, 2, 'Ahmed El Masry', '5203777263028316', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '3', 't_3157938164316480', '/2085064648484866/inbox/2718042398520418/', '0', '2021-03-15 18:00:25', '2020-08-02T13:23:56+0000'),
(125, 1, 1, 2, 'AZ Aldean Alulbe', '3003390153122484', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_3138020419612221', '/2085064648484866/inbox/2717985645192760/', '0', '2021-03-15 18:00:25', '2020-08-02T11:56:59+0000'),
(126, 1, 1, 2, 'Walid Abdelmoniem Selim', '3267472793310629', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '7', 't_3285826781439536', '/2085064648484866/inbox/2717967615194563/', '0', '2021-03-15 18:00:25', '2020-08-02T11:26:26+0000'),
(127, 1, 1, 2, 'Amr Moorsi', '3120433341403212', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_3637542469606646', '/2085064648484866/inbox/2717966148528043/', '0', '2021-03-15 18:00:25', '2020-08-02T11:24:58+0000'),
(128, 1, 1, 2, 'Seif El Din Hegab', '3649298041834053', 'We Have an online eCommerce too but it is separated from This Application', '4', 't_10163967442160022', '/2085064648484866/inbox/2717859331872058/', '0', '2021-03-15 18:00:25', '2020-08-02T11:22:57+0000'),
(129, 1, 1, 2, 'Mujahed Kamal Yousif', '3895967820423561', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665\nMahmoud Mohamed Mahmoud\nMahmoud', '2', 't_1560279490817566', '/2085064648484866/inbox/2717955461862445/', '0', '2021-03-15 18:00:25', '2020-08-02T11:08:43+0000'),
(130, 1, 1, 2, 'Rabea Alnajjar', '5641085439266854', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '5', 't_674851766434778', '/2085064648484866/inbox/2717935165197808/', '0', '2021-03-15 18:00:25', '2020-08-02T10:41:43+0000'),
(131, 1, 1, 2, 'Amr Hassan El-Gamal', '3445664062205056', '01223703752', '12', 't_10163959276105319', '/2085064648484866/inbox/2717795175211807/', '0', '2021-03-15 18:00:25', '2020-08-02T10:41:22+0000'),
(132, 1, 1, 2, 'Mahmoud Mohamed Mahmoud', '4104759956235675', 'فى اى وقت يافندم تشرفنا', '13', 't_10158341932015993', '/2085064648484866/inbox/2717933465197978/', '0', '2021-03-15 18:00:25', '2020-08-02T10:40:33+0000'),
(133, 1, 1, 2, 'Mohamed Elfakharany', '5273569322684057', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '2', 't_2711516765758378', '/2085064648484866/inbox/2717861431871848/', '0', '2021-03-15 18:00:25', '2020-08-02T09:15:03+0000');
INSERT INTO `fb_msg_manager` (`id`, `user_id`, `facebook_rx_fb_user_info_id`, `page_table_id`, `from_user`, `from_user_id`, `last_snippet`, `message_count`, `thread_id`, `inbox_link`, `unread_count`, `sync_time`, `last_update_time`) VALUES
(134, 1, 1, 2, 'Hamada Gamel', '3534274496683794', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) \n-Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3453039464730026', '/2085064648484866/inbox/2717851755206149/', '0', '2021-03-15 18:00:25', '2020-08-02T08:56:39+0000'),
(135, 1, 1, 2, 'خميس جاد', '4067763843254274', '󰀀', '4', 't_2784326085182402', '/2085064648484866/inbox/2717823345208990/', '0', '2021-03-15 18:00:25', '2020-08-02T08:52:04+0000'),
(136, 1, 1, 2, 'Hany Sherif', '3792891654159213', 'نظام نقاط البيع الشامل للشركات التجارية الصغيرة ومحلات السوبر ماركت\nوالمطاعم.قدّم خدمة عملائك بشكل أفضل من خلال معرفة المنتجات المتوفرة في المخزون.وسهولة إنشاء ملصقات على الفور لتتبع المخزون\n\n سعر البرنامج = 1280ج\n\n  السعر شامل الخدمات التالي \n\n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free\n\n  \nالاستلام بيكون ف خلال 48 ساعه و فى خصم 10% خلال فتره العيد\nشكرا للاتصال ب ProAtCoding +2-01118136665', '2', 't_3325217994211046', '/2085064648484866/inbox/2717816128543045/', '0', '2021-03-15 18:00:25', '2020-08-02T07:52:04+0000'),
(137, 1, 1, 2, 'Sawsan Flower', '4084855311565107', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '2', 't_326818678503133', '/2085064648484866/inbox/2717811015210223/', '0', '2021-03-15 18:00:25', '2020-08-02T07:41:17+0000'),
(138, 1, 1, 2, 'Ibrahim Osama Ibrahim', '3742078949204013', '01110171960', '5', 't_2932524880352406', '/2085064648484866/inbox/2717804831877508/', '0', '2021-03-15 18:00:25', '2020-08-02T07:30:35+0000'),
(139, 1, 1, 2, 'Jonathan Jody', '4456162634400584', 'Full eCommerce Website Project in ASP .Net\n\nOur Service includes\n\n1-Installation service\n2-Setting your server on MVC/ set your \n3-Payment gateway services/language settings\n\nSupport for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\n delivered in 48 hours.\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us at +2-01118136665', '4', 't_3135800206498565', '/2085064648484866/inbox/2717417905249534/', '0', '2021-03-15 18:00:25', '2020-08-02T07:24:06+0000'),
(140, 1, 1, 2, 'Fady Ahmed', '3830247170388248', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '3', 't_2680005048947687', '/2085064648484866/inbox/2717796808544977/', '0', '2021-03-15 18:00:25', '2020-08-02T07:12:31+0000'),
(141, 1, 1, 2, 'Sayed Ashraf', '5152123444857781', 'تمام', '11', 't_3105497249558352', '/2085064648484866/inbox/2717671265224198/', '0', '2021-03-15 18:00:25', '2020-08-02T07:11:55+0000'),
(142, 1, 1, 2, 'Mohamed Eissa', '3115961458516113', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_4658756050832653', '/2085064648484866/inbox/2717764461881545/', '0', '2021-03-15 18:00:25', '2020-08-02T06:52:33+0000'),
(143, 1, 1, 2, 'Ahmed Gamal', '3257117194355342', 'للأسف ، لا يتوفر إصدار تجريبي', '9', 't_4834063589952579', '/2085064648484866/inbox/2717589611899030/', '0', '2021-03-15 18:00:25', '2020-08-02T01:05:43+0000'),
(144, 1, 1, 2, 'Hedra Esam', '4197890196911693', '󰀀', '3', 't_3400419080010362', '/2085064648484866/inbox/2717551148569543/', '0', '2021-03-15 18:00:25', '2020-08-01T23:36:40+0000'),
(145, 1, 1, 2, 'Tamer Zedan', '3482138971914804', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '2', 't_10158856388714396', '/2085064648484866/inbox/2717517285239596/', '0', '2021-03-15 18:00:25', '2020-08-01T22:23:32+0000'),
(146, 1, 1, 2, 'بوب بيزنس', '3429196020437616', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكالمل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us at +2-01118136665', '2', 't_325982218782484', '/2085064648484866/inbox/2717510145240310/', '0', '2021-03-15 18:00:25', '2020-08-01T22:07:43+0000'),
(147, 1, 1, 2, 'محمد عبده', '4923285607696588', 'سعر البرنامج 185 $ غير شامل تكاليف الاستضافه \nالسعر يشمل الخدمات التاليه\n-تحميل و تنصيب البرنامج و لوحه التحكم \n-دعم الخصائص و الاستضافه\n-ضبط خصائص  الدفع على حسابكم الخاص \n-النشر \n\nيوجد خصم 10 % عند طلب البرنامج خلال فتره العيد\nشكرا للتواصل ب ProAtCoding', '14', 't_1534003633457021', '/2085064648484866/inbox/2717461031911888/', '0', '2021-03-15 18:00:25', '2020-08-01T22:02:26+0000'),
(148, 1, 1, 2, 'Micheal Soiral', '3082953501818868', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '8', 't_726735131497428', '/2085064648484866/inbox/2717492795242045/', '0', '2021-03-15 18:00:25', '2020-08-01T21:52:31+0000'),
(149, 1, 1, 2, 'Mohammad Subhan Abid', '3540586832618723', 'This software total package=80$ \nService include\n-installation services \n-initiate your local database\n-setting support \n And also 1 month free technical support \n\nYou will get discount 10% if you order today', '8', 't_2586708584977363', '/2085064648484866/inbox/2717422485249076/', '0', '2021-03-15 18:00:25', '2020-08-01T19:33:59+0000'),
(150, 1, 1, 2, 'Michal S Thomas', '5443421709031085', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n \n  Total Package: 80 $ \n\n The price including the following:\n \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '1', 't_10164031887355437', '/2085064648484866/inbox/2717418311916160/', '0', '2021-03-15 18:00:25', '2020-08-01T19:19:03+0000'),
(151, 1, 1, 2, 'Abdelrahman Essam', '3884620058295737', 'طيب تمام جدا، شكرا جدا لحضرتك', '4', 't_3099798223482225', '/2085064648484866/inbox/2717062731951718/', '0', '2021-03-15 18:00:25', '2020-08-01T13:46:13+0000'),
(152, 1, 1, 2, 'Mutwakil Othman', '3137683209655263', 'تشرف يافندم و شكرا لاتصالك ب ProAtCoding', '22', 't_3617822101583459', '/2085064648484866/inbox/2716803645310960/', '0', '2021-03-15 18:00:25', '2020-08-01T10:51:12+0000'),
(153, 1, 1, 2, 'Benedic Lat', '3070925489642424', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_10222454544089913', '/2085064648484866/inbox/2716987885292536/', '0', '2021-03-15 18:00:25', '2020-08-01T10:16:24+0000'),
(154, 1, 1, 2, 'Anjum Shahzad', '3182845518429690', 'Thank you to contact ProAtCoding family don\'t hesitate to contact us again for any questions.', '21', 't_3131553893587206', '/2085064648484866/inbox/2716853611972630/', '0', '2021-03-15 18:00:25', '2020-08-01T10:15:30+0000'),
(155, 1, 1, 2, 'Eileen Maturan', '2962462767210141', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_10157816462459072', '/2085064648484866/inbox/2716953095296015/', '0', '2021-03-15 18:00:25', '2020-08-01T09:49:35+0000'),
(156, 1, 1, 2, 'Amr Arbi', '3505762339527689', 'thank you for contacting us.\nProatcoding.', '5', 't_3049995855049089', '/2085064648484866/inbox/2716793385311986/', '0', '2021-03-15 18:00:25', '2020-08-01T06:02:16+0000'),
(157, 1, 1, 2, 'Christopher Gargar', '2446207495504523', 'Thank you for contacting us.\nProatcoding.', '5', 't_3214008151981536', '/2085064648484866/inbox/2716865728638085/', '0', '2021-03-15 18:00:25', '2020-08-01T05:58:30+0000'),
(158, 1, 1, 2, 'Ahmed Sarwar', '3805873802834210', 'Just Pc and printer if you want print a receipt', '6', 't_734042057373090', '/2085064648484866/inbox/2716860885305236/', '0', '2021-03-15 18:00:25', '2020-08-01T05:55:06+0000'),
(159, 1, 1, 2, 'Rana Sohail', '5438386416179229', 'السلام عليكم يافندم \n \nسعر البرنامج ١٢٨٠ ج\nخصم خلال فتره العيد ١٠٪؜ \n\nالسعر يشمل الخدمات \n\nInstallation service\ninitiate database on your local device \nSetting support \n\nFree support for 1 month \n\nالاستلام خلال ٤٨ ساعه', '2', 't_2694681290820106', '/2085064648484866/inbox/2716668355324489/', '0', '2021-03-15 18:00:25', '2020-07-31T23:55:47+0000'),
(160, 1, 1, 2, 'Sameh Samir Atalla', '4464419963584432', 'السلام عليكم يافندم \n\nسعر البرنامج ١٢٨٠ج \n\nالسعل يشمل \ninstallation service / initiate your local database on your device and support 1 month for free\n\nالاستلام خلال 48 ساعه و يوجد خصم ١٠٪؜ خلال فتره العيد \n\nالنسخه التجريبيه غير جاهزه فالوقت الحالى ولاكن الشركه تضمن لك استلام البرنامج خالى من العيوب', '2', 't_10162966504173504', '/2085064648484866/inbox/2716540535337271/', '0', '2021-03-15 18:00:25', '2020-07-31T20:37:03+0000'),
(161, 1, 1, 2, 'Ehab Enan', '3805039622937541', '󰀀', '6', 't_10223615969929649', '/2085064648484866/inbox/2716493338675324/', '0', '2021-03-15 18:00:25', '2020-07-31T19:56:44+0000'),
(162, 1, 1, 2, 'Anand Giri', '3262652270458368', 'Hello how can we serve you?', '6', 't_3275661475812923', '/2085064648484866/inbox/2715959902062001/', '0', '2021-03-15 18:00:25', '2020-07-31T13:44:09+0000'),
(163, 1, 1, 2, 'Gias Uddin Khokon', '3064009793718741', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n \nThe price including the following:\n \n 1-Installation service \n 2-Setting support/initiate Database in your local machine  \n 3-Support for 1 month is free  \n \n Total Package: 80 $ \n contract support for 1 y: 20$ monthly (if required).\n\ndelivered in 48 hours.\n \n Welcome to Pro At Coding \n Don’t hesitate to contact us at +2-01118136665', '11', 't_4923652020994002', '/2085064648484866/inbox/2716249965366328/', '0', '2021-03-15 18:00:25', '2020-07-31T13:43:33+0000'),
(164, 1, 1, 2, 'Mohamed Abd Alrahman Aldarame', '3715778198520701', 'اهلا وسهلا يافندم', '3', 't_10223590623610805', '/2085064648484866/inbox/2716114895379835/', '0', '2021-03-15 18:00:25', '2020-07-31T09:50:23+0000'),
(165, 1, 1, 2, 'Mahmoud Shahat', '3984541148235533', 'السلام عليكم يافندم \nEsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n\nسعر المنتج شامل الخدمات التاليه \n1-Installation service\n2-Setting support / initate Database in your local machine \n3-Support for 1 month is free \nTotal Backage : 80 $\ncontract support for 1 y : 20$ monthly\n\nالاستلام خلال 48 ساعه \nWelcome to Pro At Coding\nDon’t hesitate to contact us at +2-01118136665', '2', 't_1015287122238431', '/2085064648484866/inbox/2716052202052771/', '0', '2021-03-15 18:00:25', '2020-07-31T07:54:07+0000'),
(166, 1, 1, 2, 'Mahmoud S ElMahdy', '3979031498801604', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server on MVC/ set your Payment gateway services/language settings\n3-Support for 1 month for free\nTotal backage= 190 $ + Without hosting fees\nِAnnually support = 50$ Monthly (If required)\nالاستلام خلال 48 ساعه\nWelcome to Pro At Coding\nDon\'t hesitate to contact us at +2-01118136665', '1', 't_2707965132774242', '/2085064648484866/inbox/2715837638740894/', '0', '2021-03-15 18:00:25', '2020-07-31T01:12:23+0000'),
(167, 1, 1, 2, 'Bassam Hussien', '5024193527650666', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nالسعر شامل الخدمات التاليه \n1-Installation service\n2-Setting your server on MVC/ set your Payment gateway services/language settings\n3-Support for 1 month for free\n\nTotal backage= 190 $ + Without hosting fees\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه\nWelcome to Pro At Coding \nDon\'t hesitate to contact us at +2-01118136665', '1', 't_3301725576533281', '/2085064648484866/inbox/2715836928740965/', '0', '2021-03-15 18:00:25', '2020-07-31T01:11:59+0000'),
(168, 1, 1, 2, 'Marco Nagy Farag', '4136012733099567', 'السلام عليكم يافندم \nEsyPos : The project is written in vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\nسعر المنتج شامل الخدمات التاليه \n1-Installation service\n2-Setting support / initate Database in your local machine \n3-Support for 1 month is free \nTotal Backage : 80 $\ncontract support for 1 y : 20$ monthly\nالاستلام خلال 48 ساعه \nWelcome to Pro At Coding', '2', 't_3190627524318225', '/2085064648484866/inbox/2715344522123539/', '0', '2021-03-15 18:00:25', '2020-07-30T12:00:38+0000'),
(174, 1, 7, 19, 'Gaxa Gaxa-bot', '4050810498320143', 'يمكنك أيضًا ترك رقم هاتفك المحمول وسيقوم احد ممثلى خدمه العملاء بالاتصال بك', '8', 't_119093143614118', '/105940371572898/inbox/125364599630475/', '6', '2021-04-21 15:55:24', '2021-04-21T13:49:15+0000'),
(175, 1, 7, 19, 'Ageeb Ameen', '3669687986489952', 'Gaxa: ‎مزامنة العملاء المتوقعين للصفحة ‎', '2', 't_1380173152342419', '/105940371572898/inbox/125352166298385/', '0', '2021-04-21 15:55:24', '2021-04-21T13:10:22+0000'),
(176, 1, 7, 19, 'مومن ابراهيم', '5725923957432567', 'يمكنك أيضًا ترك رقم هاتفك المحمول وسيقوم احد ممثلى خدمه العملاء بالاتصال بك', '18', 't_2917678485147642', '/105940371572898/inbox/125316572968611/', '0', '2021-04-21 15:55:24', '2021-04-21T11:32:35+0000'),
(177, 1, 7, 19, 'Mohamed Fathy', '3913791952039817', 'شكرا! إنه لمن دواعي سروري التحدث معك. سيرد عليك أحد أعضاء فريقنا قريبًا. إذا كنت تريد الدردشة معي(جاكسا) مرة أخرى ، فقط انقر فوق الزر أدناه.', '11', 't_840588416803192', '/105940371572898/inbox/125304916303110/', '0', '2021-04-21 15:55:24', '2021-04-21T10:49:34+0000'),
(178, 1, 7, 19, 'Ahmed Bassam', '4300242663340251', 'يمكنك أيضًا ترك رقم هاتفك المحمول وسيقوم فريق الدعم لدينا بالاتصال بك', '21', 't_986512785418148', '/105940371572898/inbox/125262972973971/', '0', '2021-04-21 15:55:24', '2021-04-21T07:28:45+0000'),
(179, 1, 7, 19, 'Ahmed Aboulfetouh', '4068136509909987', 'Gaxa: ‎Get notified: اضغط زر متابعه ليصلك كل جديد من جاكسا‎', '13', 't_10158025732118461', '/105940371572898/inbox/125258042974464/', '0', '2021-04-21 15:55:24', '2021-04-21T07:09:41+0000'),
(180, 1, 7, 19, 'رضا عوض', '5301248796616348', 'يمكنك أيضًا ترك رقم هاتفك المحمول وسيقوم فريق الدعم لدينا بالاتصال بك', '5', 't_2789755054606994', '/105940371572898/inbox/125220602978208/', '0', '2021-04-21 15:55:24', '2021-04-21T04:09:17+0000'),
(181, 1, 7, 19, 'Hoda Anbar', '4293501417334932', 'Gaxa: Sync page leads', '2', 't_488699972561030', '/105940371572898/inbox/125210842979184/', '0', '2021-04-21 15:55:24', '2021-04-21T03:27:01+0000'),
(182, 1, 7, 19, 'Mohammed Khalil', '4140547479338654', 'Also you could leave your mobile number and our support team will contact you', '5', 't_1225204784548904', '/105940371572898/inbox/125186642981604/', '0', '2021-04-21 15:55:24', '2021-04-21T01:57:04+0000'),
(183, 1, 7, 19, 'Hassan Alsony', '5616306515046976', 'Also you could leave your mobile number and our support team will contact you', '21', 't_2902229716666757', '/105940371572898/inbox/125171889649746/', '0', '2021-04-21 15:55:24', '2021-04-21T01:23:33+0000'),
(184, 1, 7, 19, 'Waheed Elshaer', '3835267853224967', 'Gaxa: Sync page leads', '2', 't_2317822618350761', '/105940371572898/inbox/125169922983276/', '0', '2021-04-21 15:55:24', '2021-04-21T00:46:32+0000'),
(185, 1, 7, 19, 'Hatem Eldandrawi', '4230239540360463', 'Gaxa: Sync page leads', '4', 't_2026618074144259', '/105940371572898/inbox/125145462985722/', '0', '2021-04-21 15:55:24', '2021-04-20T22:57:55+0000'),
(186, 1, 7, 19, 'Nour Said Baker', '4120865594632271', 'Thanks for contact GAXA', '7', 't_1893047864179104', '/105940371572898/inbox/125117339655201/', '0', '2021-04-21 15:55:24', '2021-04-20T22:21:18+0000'),
(187, 1, 7, 19, 'Âmř Ķhăļĕđ', '4531962266850972', 'Gaxa: Sync page leads', '2', 't_1496156437383204', '/105940371572898/inbox/125105802989688/', '0', '2021-04-21 15:55:24', '2021-04-20T19:57:56+0000'),
(188, 1, 7, 19, 'May Fayed', '4454716371255849', 'Gaxa: Lite ', '10', 't_2975068172768138', '/105940371572898/inbox/124031909763744/', '0', '2021-04-21 15:55:24', '2021-04-17T19:06:32+0000'),
(189, 1, 7, 19, 'Hajar Mohamed', '4183691548328926', 'Hello !  Hajar \r\nI\'m GAXA ,I will answer your inquires if i clearly understanding you .\r\nHow can i help you ?', '4', 't_4002881339733993', '/105940371572898/inbox/107870034713265/', '0', '2021-04-21 15:55:24', '2021-04-14T18:36:11+0000'),
(190, 1, 7, 19, 'Garzali Bello', '5330655253673615', 'Hi #LEAD_USER_FIRST_NAME#, Welcome to our page.', '2', 't_302844321271479', '/105940371572898/inbox/119965480170387/', '0', '2021-04-21 15:55:24', '2021-04-06T22:35:35+0000'),
(191, 1, 7, 19, 'Grace Lwandeh', '3964281183592132', 'Hi #LEAD_USER_FIRST_NAME#, Welcome to our page.', '2', 't_288512702653743', '/105940371572898/inbox/114173700749565/', '0', '2021-04-21 15:55:24', '2021-03-23T17:15:10+0000'),
(192, 1, 7, 19, 'Ben Smith', '3716734655071230', 'Hi, How can we help you?', '4', 't_10150000686525267', '/105940371572898/inbox/107956864704582/', '0', '2021-04-21 15:55:24', '2021-03-16T04:20:04+0000'),
(193, 1, 7, 23, 'Rashad M. Tantawy', '3991235264335270', 'Hi Rashad, welcome to our store.', '30', 't_4706444826048758', '/2085064648484866/inbox/2900660946925228/', '0', '2021-07-11 22:01:19', '2021-06-05T16:31:40+0000'),
(194, 1, 7, 23, 'Sageda Abdallah', '3998478866934687', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_4010565982358506', '/2085064648484866/inbox/2959198061071516/', '0', '2021-07-11 22:01:19', '2021-05-28T11:34:23+0000'),
(195, 1, 7, 23, 'Nabil Abdel Hamid', '3906719592698116', 'منتظر', '10', 't_10225377698020245', '/2085064648484866/inbox/2952997785024877/', '0', '2021-07-11 22:01:19', '2021-05-19T22:11:38+0000'),
(196, 1, 7, 23, 'Yazan Badr', '4245440272144508', 'تمام', '35', 't_10224390854054929', '/2085064648484866/inbox/2953037391687583/', '0', '2021-07-11 22:01:19', '2021-05-19T21:58:16+0000'),
(197, 1, 7, 23, 'Youssef Essam El-Din', '3703424599672230', 'مع حضرتك يافندم اتفضل', '19', 't_10217116802449204', '/2085064648484866/inbox/2718226495168675/', '0', '2021-07-11 22:01:19', '2021-05-18T18:00:23+0000'),
(198, 1, 7, 23, 'Saif Elmoterey', '5557351737671806', 'وعليكم السلام ورحمه الله وبركاته', '5', 't_580819409560837', '/2085064648484866/inbox/2949954948662494/', '0', '2021-07-11 22:01:19', '2021-05-16T00:30:38+0000'),
(199, 1, 7, 23, 'Yassin Ahmed', '3177689638993507', 'شكرا للتواصل مع برو ات كودنج  تشرفنا بخدمة حضرتك', '33', 't_3392297397468328', '/2085064648484866/inbox/2718065468518111/', '0', '2021-07-11 22:01:19', '2021-05-06T20:12:33+0000'),
(200, 1, 7, 23, 'Ahmed M. Khalil', '3782139508473315', 'You sent a photo.', '7', 't_2668274220149788', '/2085064648484866/inbox/2852916295033027/', '0', '2021-07-11 22:01:19', '2021-01-03T11:47:07+0000'),
(201, 1, 7, 23, 'Ahmed Henish', '3633763383339830', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_222177829444255', '/2085064648484866/inbox/2853318224992834/', '0', '2021-07-11 22:01:19', '2021-01-03T09:25:03+0000'),
(202, 1, 7, 23, 'Mostafa Khalil', '3445238325581282', 'خالص شكري وتقديري للأستاذ رشاد', '40', 't_3404807502981819', '/2085064648484866/inbox/2852647605059896/', '0', '2021-07-11 22:01:19', '2021-01-02T14:25:18+0000'),
(203, 1, 7, 23, 'Walid Mohamed', '2464242090366771', 'You sent a photo.', '3', 't_1500062120340692', '/2085064648484866/inbox/2852644801726843/', '0', '2021-07-11 22:01:19', '2021-01-02T11:22:28+0000'),
(204, 1, 7, 23, 'Mohamed A Saber', '5122119304495970', 'https://envatogrocery.amtechnology.info/\nمتحر الكترونى يناسب الهايبر ماركت و المحلات الكبرى والمتوسطه \n(بعد الانتهاء من البرمجه بيكون للمالك حريه التصرف ف الكود)\n١-عدد لا نهائى من المنتجات\n٢-دفع اونلاين \n٣-لوحه تحكم عشان تقدر تتحكم ف ادخال و اداره منتجاتك \n—————\nالسعر شامل  9 الاف جنية\n-بدء تطبيق وبناء قاعدة البيانات\n-دعم الاستضافة وإعداد الخادم\n-دعم إعداد بوابة الدفع\n- تغير اللوجو والبراند\nوهذا السعر بدون تعريب اللغة العريبة فى حالة اضافة التعريب يتم اضافة 2000ج على اجمالى المبلغ', '10', 't_10158580873386690', '/2085064648484866/inbox/2851259905198666/', '0', '2021-07-11 22:01:19', '2020-12-31T19:32:33+0000'),
(205, 1, 7, 23, 'Mio Moi', '4418738598155424', 'You sent a photo.', '3', 't_2837514849904936', '/2085064648484866/inbox/2851014025223254/', '0', '2021-07-11 22:01:19', '2020-12-31T13:41:48+0000'),
(206, 1, 7, 23, 'Ahmed Gamal', '3737092126400920', '01065816569', '8', 't_1897897250357901', '/2085064648484866/inbox/2850870431904280/', '0', '2021-07-11 22:01:19', '2020-12-31T13:36:56+0000'),
(207, 1, 7, 23, 'Mustapha AboulSoud', '5514809815211804', 'You sent a photo.', '6', 't_10225184965151002', '/2085064648484866/inbox/2850858888572101/', '0', '2021-07-11 22:01:19', '2020-12-31T09:35:33+0000'),
(208, 1, 7, 23, 'Ahmed El-kholy', '3735431636523211', '󰀀', '16', 't_2428120474152440', '/2085064648484866/inbox/2722433098081348/', '0', '2021-07-11 22:01:19', '2020-12-31T09:21:43+0000'),
(209, 1, 7, 23, 'Abd Elrahman Galal', '3515390298558977', 'You sent a photo.', '6', 't_10158799696891203', '/2085064648484866/inbox/2846027609055229/', '0', '2021-07-11 22:01:19', '2020-12-24T21:56:36+0000'),
(210, 1, 7, 23, 'Abdelrahman Sharaf', '4028401087181789', 'You sent a photo.', '15', 't_10225214884579526', '/2085064648484866/inbox/2839835106341146/', '0', '2021-07-11 22:01:19', '2020-12-24T10:30:29+0000'),
(211, 1, 7, 23, 'Ahmed Meda', '3588243134627192', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '5', 't_3373559849419526', '/2085064648484866/inbox/2840735652917758/', '0', '2021-07-11 22:01:19', '2020-12-17T18:45:47+0000'),
(212, 1, 7, 23, 'Amr Hebåh', '3671149752954246', '21-ST Associate / Haram-Giza', '2', 't_10164447461235057', '/2085064648484866/inbox/2840530899604900/', '0', '2021-07-11 22:01:19', '2020-12-17T13:00:57+0000'),
(213, 1, 7, 23, 'Hesham Farrag', '4883111695095635', 'You sent a photo.', '6', 't_10224555255094826', '/2085064648484866/inbox/2840160892975234/', '0', '2021-07-11 22:01:19', '2020-12-17T00:33:52+0000'),
(214, 1, 7, 23, 'Islam Ashraf', '5269615196412865', 'فى خدمتك  يا فندم اى وقت', '7', 't_10159560451778488', '/2085064648484866/inbox/2839932709664719/', '0', '2021-07-11 22:01:19', '2020-12-16T17:04:49+0000'),
(215, 1, 7, 23, 'Amr Amin', '5933242616693195', 'Delivery Boy Application (Android/IOS) \n+ Web AdminPanel\nتطبيق توصيل الطلبات\n\nTotal Package= 5000 EPG - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server Setting\n-Support payment Getaway Setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps', '1', 't_394578591917929', '/2085064648484866/inbox/2790185944639396/', '0', '2021-07-11 22:01:19', '2020-10-21T19:09:43+0000'),
(216, 1, 7, 23, 'Hesham ElGhonemy', '3898719890187781', 'نظام نقاط البيع الشامل للشركات التجارية الصغيرة ومحلات السوبر ماركت\nوالمطاعم.قدّم خدمة عملائك بشكل أفضل من خلال معرفة المنتجات المتوفرة في المخزون.وسهولة إنشاء ملصقات على الفور لتتبع المخزون\n\n سعر البرنامج = 1280ج\n\n  السعر شامل الخدمات التالي \n\n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free\nالاستلام بيكون ف خلال 48 ساعه شكرا للاتصال ب ProAtCoding 01118136665', '1', 't_10221213960431168', '/2085064648484866/inbox/2790180504639940/', '0', '2021-07-11 22:01:19', '2020-10-21T19:00:58+0000'),
(217, 1, 7, 23, 'Ahmed Said', '3700446290062632', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1575000999351438', '/2085064648484866/inbox/2789076174750373/', '0', '2021-07-11 22:01:19', '2020-10-20T15:03:13+0000'),
(218, 1, 7, 23, 'Omar Osama', '3859310777472045', 'السلام عليكم يا فندم \nKing Burger - Restaurant Food Ordering web Application\nwith admin Panel \n\nTotal Package = 4000 EGP- Without the server fees\n\nServices includes \ninstallation services \nSetting support \nPayment gateway Setting \nLaunching to the LIVE servers \n\n==============\nDemo Link : https://freaktemplate.com/new_kingscript/home\nAdmin Panel Link: https://freaktemplate.com/new_kingscript/admin\n\nUsername : admin@gmail.com\nPassword : 123\n---------------------------\nThank you for contact with ProAtCoding \nFollow our Facebook Page for more Applications\nMobile:0118136665', '2', 't_2438698916432831', '/2085064648484866/inbox/2788372698154054/', '0', '2021-07-11 22:01:19', '2020-10-19T20:24:36+0000'),
(219, 1, 7, 23, 'Walled Osman', '4168406249850912', 'السلام عليكم يافندم \nالنسخ التجريبيه غير متوفر لبرامج Desktop لاكن ف فيديو توضيحى لو حضرتك مهتم \nشكرا لاستفسار حضرتك', '2', 't_10158287011824230', '/2085064648484866/inbox/2788358528155471/', '0', '2021-07-11 22:01:19', '2020-10-19T20:02:16+0000'),
(220, 1, 7, 23, 'Heba Mostafa', '4216148428396728', 'Info@proatcoding.com', '8', 't_3241535192593029', '/2085064648484866/inbox/2740224539635537/', '0', '2021-07-11 22:01:19', '2020-10-04T19:36:23+0000'),
(221, 1, 7, 23, 'Osama Hassan', '3895744860516748', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1939910129479844', '/2085064648484866/inbox/2746726632318661/', '0', '2021-07-11 22:01:19', '2020-09-03T19:13:32+0000'),
(222, 1, 7, 23, 'Abdelrahman Bl', '5106466166061312', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1422361787975117', '/2085064648484866/inbox/2746123299045661/', '0', '2021-07-11 22:01:19', '2020-09-03T03:17:41+0000'),
(223, 1, 7, 23, 'Mohanad Atef', '3878621492194120', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10158011453723778', '/2085064648484866/inbox/2744551789202812/', '0', '2021-07-11 22:01:19', '2020-09-01T11:45:26+0000'),
(224, 1, 7, 23, 'Rwida Osama', '3751113178271628', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1702301463256281', '/2085064648484866/inbox/2743743432616981/', '0', '2021-07-11 22:01:19', '2020-08-31T13:19:47+0000'),
(225, 1, 7, 23, 'Mahmoud Saber', '3745573772177820', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1683940401761477', '/2085064648484866/inbox/2743630659294925/', '0', '2021-07-11 22:01:19', '2020-08-31T10:26:25+0000'),
(226, 1, 7, 23, 'Ebraam Boshra Shokry', '5237079146364522', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2692065654341402', '/2085064648484866/inbox/2742222496102408/', '0', '2021-07-11 22:01:19', '2020-08-29T20:16:20+0000'),
(227, 1, 7, 23, 'Abdelrahman Bonna', '3754511041253006', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3482101178480531', '/2085064648484866/inbox/2742184712772853/', '0', '2021-07-11 22:01:19', '2020-08-29T19:13:29+0000'),
(228, 1, 7, 23, 'Medhat Gamal', '4132894590068277', 'Medhat sent 3 photos.', '4', 't_1435841563472325', '/2085064648484866/inbox/2742010822790242/', '0', '2021-07-11 22:01:19', '2020-08-29T15:14:09+0000'),
(229, 1, 7, 23, 'Shaza Aly', '4150380121641874', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10158471567200210', '/2085064648484866/inbox/2741963996128258/', '0', '2021-07-11 22:01:19', '2020-08-29T14:07:57+0000'),
(230, 1, 7, 23, 'Taher Abd Elhady', '3751567114921482', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3143426195706273', '/2085064648484866/inbox/2741886256136032/', '0', '2021-07-11 22:01:19', '2020-08-29T12:18:43+0000'),
(231, 1, 7, 23, 'Huda Said', '4381872918508073', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3277130862370045', '/2085064648484866/inbox/2741821399475851/', '0', '2021-07-11 22:01:19', '2020-08-29T10:41:18+0000'),
(232, 1, 7, 23, 'Sayed Yousef', '3690050361042860', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3310949088991162', '/2085064648484866/inbox/2740938769564114/', '0', '2021-07-11 22:01:19', '2020-08-28T11:07:29+0000'),
(233, 1, 7, 23, 'Michael Anwar', '3699195693521791', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10220512991806900', '/2085064648484866/inbox/2739474496377208/', '0', '2021-07-11 22:01:19', '2020-08-26T18:19:37+0000'),
(234, 1, 7, 23, 'Mohamed Osama', '3443363315775421', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3390027074382990', '/2085064648484866/inbox/2738650759792915/', '0', '2021-07-11 22:01:19', '2020-08-25T21:06:30+0000'),
(235, 1, 7, 23, 'Ahmed Šåmîř', '3563045017139067', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2612732635656513', '/2085064648484866/inbox/2738003836524274/', '0', '2021-07-11 22:01:19', '2020-08-25T03:40:20+0000'),
(236, 1, 7, 23, 'Mohamed Ezat', '3948526008542342', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2047431392068126', '/2085064648484866/inbox/2737365673254757/', '0', '2021-07-11 22:01:19', '2020-08-24T09:31:21+0000'),
(237, 1, 7, 23, 'Mai Taher', '4013382675373423', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2906175316154863', '/2085064648484866/inbox/2736075063383818/', '0', '2021-07-11 22:01:19', '2020-08-22T20:33:04+0000'),
(238, 1, 7, 23, 'Maram Abd Elmageed', '3890293924423420', 'https://docs.google.com/document/d/16MjE4h8UNtwAQTm87NQAgCY-uKQCPhpewCvbc_iiitA/edit?usp=drivesdk', '5', 't_3225925820821794', '/2085064648484866/inbox/2735187056805952/', '0', '2021-07-11 22:01:19', '2020-08-21T19:52:41+0000'),
(239, 1, 7, 23, 'Mohab Mahmoud', '3258864307550325', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_786744192152460', '/2085064648484866/inbox/2734473790210612/', '0', '2021-07-11 22:01:19', '2020-08-21T02:57:33+0000'),
(240, 1, 7, 23, 'Mohamed Salah', '3878927575496714', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '6', 't_3208217642557596', '/2085064648484866/inbox/2734345960223395/', '0', '2021-07-11 22:01:19', '2020-08-20T23:06:31+0000'),
(241, 1, 7, 23, 'Kamel Mohamed', '5372487572776403', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10157097237291442', '/2085064648484866/inbox/2734208740237117/', '0', '2021-07-11 22:01:19', '2020-08-20T19:16:53+0000'),
(242, 1, 7, 23, 'Amr Soltan', '5084799234927692', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10213555264235413', '/2085064648484866/inbox/2733664103624914/', '0', '2021-07-11 22:01:19', '2020-08-20T05:26:00+0000'),
(243, 1, 7, 23, 'Mostafa Mohamad', '3566227403488962', '01065820252', '4', 't_10207686465756049', '/2085064648484866/inbox/2733335860324405/', '0', '2021-07-11 22:01:19', '2020-08-19T20:11:55+0000'),
(244, 1, 7, 23, 'Ahmed Ashraf', '3807855765988825', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3037071956420394', '/2085064648484866/inbox/2733013753689949/', '0', '2021-07-11 22:01:19', '2020-08-19T12:31:23+0000'),
(245, 1, 7, 23, 'Muhamed Youssef', '3785206294890405', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3083346125108576', '/2085064648484866/inbox/2732893770368614/', '0', '2021-07-11 22:01:19', '2020-08-19T09:26:49+0000'),
(246, 1, 7, 23, 'Omar Hamed', '2766592773465521', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1572231796285302', '/2085064648484866/inbox/2732610197063638/', '0', '2021-07-11 22:01:19', '2020-08-19T01:10:53+0000'),
(247, 1, 7, 23, 'Eman Atef', '3159111697524734', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1221078794895268', '/2085064648484866/inbox/2732509067073751/', '0', '2021-07-11 22:01:19', '2020-08-18T22:06:20+0000'),
(248, 1, 7, 23, 'Hosam Rashwan', '3865046476921325', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1796241430545210', '/2085064648484866/inbox/2732377393753585/', '0', '2021-07-11 22:01:19', '2020-08-18T18:32:32+0000'),
(249, 1, 7, 23, 'Alaa A. Farag', '3532100260233545', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_10218494025049731', '/2085064648484866/inbox/2732370643754260/', '0', '2021-07-11 22:01:19', '2020-08-18T18:23:48+0000'),
(250, 1, 7, 23, 'Mohamed Elmancy', '3657788877668280', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3854788561204065', '/2085064648484866/inbox/2732350977089560/', '0', '2021-07-11 22:01:19', '2020-08-18T17:53:37+0000'),
(251, 1, 7, 23, 'Hesham Hafez', '3395310287240230', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2795509337349670', '/2085064648484866/inbox/2732117867112871/', '0', '2021-07-11 22:01:19', '2020-08-18T12:20:41+0000'),
(252, 1, 7, 23, 'Shaimaa Kamel', '5111239792280793', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1740882569422367', '/2085064648484866/inbox/2732082033783121/', '0', '2021-07-11 22:01:19', '2020-08-18T11:28:42+0000'),
(253, 1, 7, 23, 'Doaa Saeed', '4086648174702741', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_3559208237431502', '/2085064648484866/inbox/2732034190454572/', '0', '2021-07-11 22:01:19', '2020-08-18T10:08:33+0000'),
(254, 1, 7, 23, 'Mohamed Sayed', '5198224870248687', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_2682285918680882', '/2085064648484866/inbox/2732028397121818/', '0', '2021-07-11 22:01:19', '2020-08-18T09:59:56+0000'),
(255, 1, 7, 23, 'Mohamed Abdalkarem', '3778712845515303', 'Thank you', '3', 't_3118670341585607', '/2085064648484866/inbox/2731992247125433/', '0', '2021-07-11 22:01:19', '2020-08-18T09:40:14+0000'),
(256, 1, 7, 23, 'Khaled Tareq', '3743813538988463', 'Thanks for messaging us. We try to be as responsive as possible. We\'ll get back to you soon.', '2', 't_1247817802228172', '/2085064648484866/inbox/2732004403790884/', '0', '2021-07-11 22:01:19', '2020-08-18T09:20:49+0000'),
(257, 1, 7, 23, 'Mohamed Ahmed', '5155982484474601', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '4', 't_1773947176088795', '/2085064648484866/inbox/2725862997738358/', '0', '2021-07-11 22:01:19', '2020-08-11T12:35:32+0000'),
(258, 1, 7, 23, 'Ahmed Mamdouh', '4276998628996627', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '2', 't_1396046697252271', '/2085064648484866/inbox/2726017437722914/', '0', '2021-07-11 22:01:19', '2020-08-11T12:34:36+0000'),
(259, 1, 7, 23, 'Taha Shref Mizo', '4088609081215289', 'شكرا يا فندم', '5', 't_10217686171328029', '/2085064648484866/inbox/2725486791109312/', '0', '2021-07-11 22:01:19', '2020-08-11T05:32:49+0000'),
(260, 1, 7, 23, 'Abood Hawa', '3353806041349508', 'شكرا هيتم ارسال النسخه التجريبيه لحضرتك فورا', '24', 't_2755596248003829', '/2085064648484866/inbox/2724053551252636/', '0', '2021-07-11 22:01:19', '2020-08-09T12:17:24+0000'),
(261, 1, 7, 23, 'Ahmed El Nagdy', '3841820419197223', '+96565607675', '8', 't_2768859790012548', '/2085064648484866/inbox/2724061817918476/', '0', '2021-07-11 22:01:19', '2020-08-09T12:06:46+0000'),
(262, 1, 7, 23, 'Khaled Elabd', '3376660882437973', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه   \n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '27', 't_10163887328105057', '/2085064648484866/inbox/2723699877954670/', '0', '2021-07-11 22:01:19', '2020-08-09T09:40:05+0000'),
(263, 1, 7, 23, 'Tareq Adnan Alkadri', '3630903073675679', 'محتاج تعملو لي تطبيق Android iOS', '7', 't_4779304518762419', '/2085064648484866/inbox/2723838907940767/', '0', '2021-07-11 22:01:19', '2020-08-09T09:19:42+0000'),
(264, 1, 7, 23, 'Mahmoud Attia', '3760178054067488', 'اجمالي  التكلفه  220$', '4', 't_10220899441528695', '/2085064648484866/inbox/2724060774585247/', '0', '2021-07-11 22:01:19', '2020-08-09T07:58:58+0000'),
(265, 1, 7, 23, 'Abdallh Abdul Rassol', '3515177735255187', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_3312258315497935', '/2085064648484866/inbox/2724061247918533/', '0', '2021-07-11 22:01:19', '2020-08-09T07:34:46+0000'),
(266, 1, 7, 23, 'Nourddine Assmar Ait Bendra', '3673941382643129', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_2664683180414331', '/2085064648484866/inbox/2724060257918632/', '0', '2021-07-11 22:01:19', '2020-08-09T07:33:41+0000'),
(267, 1, 7, 23, 'Eslam Fawzy', '5141375069270362', 'Food delivery Application (Android/IOS) with complete admin panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_1624468877711786', '/2085064648484866/inbox/2724059844585340/', '0', '2021-07-11 22:01:19', '2020-08-09T07:32:59+0000'),
(268, 1, 7, 23, 'Eng Ahmed Abdelfattah', '3925734400806585', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '2', 't_1170896596622377', '/2085064648484866/inbox/2724050387919619/', '0', '2021-07-11 22:01:19', '2020-08-09T07:16:04+0000'),
(269, 1, 7, 23, 'Amir Ragaei', '3102282339878592', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '6', 't_10157944439391773', '/2085064648484866/inbox/2723758124615512/', '0', '2021-07-11 22:01:19', '2020-08-09T07:11:34+0000'),
(270, 1, 7, 23, 'Ahmed Leo', '3497075280323504', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '6', 't_630928874505154', '/2085064648484866/inbox/2723772897947368/', '0', '2021-07-11 22:01:19', '2020-08-09T07:11:23+0000'),
(271, 1, 7, 23, 'Abdelalim Allam', '3950040401723914', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '3', 't_10160185657394745', '/2085064648484866/inbox/2723847514606573/', '0', '2021-07-11 22:01:19', '2020-08-09T07:09:07+0000'),
(272, 1, 7, 23, 'Medhat Fathi Khedr', '4394909133883131', 'تحت امرك يافندم سعيد بخدمتك', '27', 't_10223250696554817', '/2085064648484866/inbox/2718193121838679/', '0', '2021-07-11 22:01:19', '2020-08-08T21:01:04+0000'),
(273, 1, 7, 23, 'Ahmed Youssif', '4159858504025617', '٠٠٩٦٥٩٩٥٤٨٥٩٣', '35', 't_775453403221948', '/2085064648484866/inbox/2723622127962445/', '0', '2021-07-11 22:01:19', '2020-08-08T20:42:12+0000'),
(274, 1, 7, 23, 'شدوان القرشي', '3541784452520627', 'اه يافندم يدعم العربيه', '7', 't_2624327254482694', '/2085064648484866/inbox/2723644637960194/', '0', '2021-07-11 22:01:19', '2020-08-08T20:37:06+0000'),
(275, 1, 7, 23, 'Smzo Delivery', '3347816435240161', 'للاسف لانقوم بانشاء برامج جديدة حاليا', '8', 't_319464625871044', '/2085064648484866/inbox/2723612184630106/', '0', '2021-07-11 22:01:19', '2020-08-08T20:05:02+0000'),
(276, 1, 7, 23, 'Ahmed Rezk', '3149131398489121', 'Special for you will get 20% discount for PetAppLovers\nand also 10% discount for  Online Grocery Shop', '32', 't_10215631267448915', '/2085064648484866/inbox/2717750835216241/', '0', '2021-07-11 22:01:19', '2020-08-08T19:53:06+0000'),
(277, 1, 7, 23, 'Raed Abu Hammad', '3796564767077853', 'تمام  استاذنك هرجع للادارة واشوف ردهم ايه وارد علي حضرتك', '5', 't_10219980780083091', '/2085064648484866/inbox/2723609867963671/', '0', '2021-07-11 22:01:19', '2020-08-08T19:28:10+0000'),
(278, 1, 7, 23, 'Islam Jamal', '3991692254184486', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_10157015769815728', '/2085064648484866/inbox/2723584424632882/', '0', '2021-07-11 22:01:19', '2020-08-08T18:46:54+0000'),
(279, 1, 7, 23, 'خالد السلامه المريحي', '3771304002958433', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_3117357441665732', '/2085064648484866/inbox/2723584157966242/', '0', '2021-07-11 22:01:19', '2020-08-08T18:46:28+0000'),
(280, 1, 7, 23, 'Ahmed Elqadi', '3116145291821879', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_1222729728073275', '/2085064648484866/inbox/2723583847966273/', '0', '2021-07-11 22:01:19', '2020-08-08T18:45:57+0000'),
(281, 1, 7, 23, 'Hany Refaat', '3777238059029113', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_3144279518987554', '/2085064648484866/inbox/2723583517966306/', '0', '2021-07-11 22:01:19', '2020-08-08T18:45:20+0000'),
(282, 1, 7, 23, 'Facebook User', '3778281162253641', 'Food delivery Application (Android/IOS) -with complete admin Panel \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB and build the application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to receive more apps \nhttps://www.facebook.com/Proatcoding', '1', 't_3711073528921134', '/2085064648484866/inbox/2723498971308094/', '0', '2021-07-11 22:01:19', '2020-08-08T16:34:00+0000');
INSERT INTO `fb_msg_manager` (`id`, `user_id`, `facebook_rx_fb_user_info_id`, `page_table_id`, `from_user`, `from_user_id`, `last_snippet`, `message_count`, `thread_id`, `inbox_link`, `unread_count`, `sync_time`, `last_update_time`) VALUES
(283, 1, 7, 23, 'Moatasem Osam', '3660443157406723', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '2', 't_10157675632393443', '/2085064648484866/inbox/2723414734649851/', '0', '2021-07-11 22:01:19', '2020-08-08T14:34:58+0000'),
(284, 1, 7, 23, 'باسم الحجري ابو محمد', '3915731288449513', 'هذا موجود codeanay', '3', 't_10158752261059756', '/2085064648484866/inbox/2723400814651243/', '0', '2021-07-11 22:01:19', '2020-08-08T14:19:27+0000'),
(285, 1, 7, 23, 'Abdullah Genidy', '5088127487895000', 'نظام نقاط البيع الشامل للشركات التجارية الصغيرة ومحلات السوبر ماركت\nوالمطاعم.قدّم خدمة عملائك بشكل أفضل من خلال معرفة المنتجات المتوفرة في المخزون.وسهولة إنشاء ملصقات على الفور لتتبع المخزون\n\n سعر البرنامج = 1280ج\n\n  السعر شامل الخدمات التالي \n\n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free\n\n  \nالاستلام بيكون ف خلال 48 ساعه و فى خصم 10% خلال فتره العيد\nشكرا للاتصال ب ProAtCoding +2-01118136665', '1', 't_1954050591402035', '/2085064648484866/inbox/2722588328065825/', '0', '2021-07-11 22:01:19', '2020-08-07T17:10:59+0000'),
(286, 1, 7, 23, 'Waled Lelo', '3312263395498209', '󰀀', '17', 't_650814192510644', '/2085064648484866/inbox/2722552324736092/', '0', '2021-07-11 22:01:19', '2020-08-07T17:08:04+0000'),
(287, 1, 7, 23, 'Ashmawi Hashim', '3101819079932583', '00965 66631854', '9', 't_1055428821541905', '/2085064648484866/inbox/2722560764735248/', '0', '2021-07-11 22:01:19', '2020-08-07T16:38:24+0000'),
(288, 1, 7, 23, 'Amir Code', '3309060775798985', 'اوك', '8', 't_3842613325754051', '/2085064648484866/inbox/2722562758068382/', '0', '2021-07-11 22:01:19', '2020-08-07T16:37:24+0000'),
(289, 1, 7, 23, 'Hatem Genidy', '3818929978191853', 'الاجمالي ٣٢٣٠ جنية مصري \nدون مصاريف التشغيل', '30', 't_1758352647582903', '/2085064648484866/inbox/2085332915124706/', '0', '2021-07-11 22:01:19', '2020-08-07T16:34:39+0000'),
(290, 1, 7, 23, 'Abdallah Soaody', '3707289969320501', '01001826629', '10', 't_10223335743604348', '/2085064648484866/inbox/2722513014740023/', '0', '2021-07-11 22:01:19', '2020-08-07T15:53:56+0000'),
(291, 1, 7, 23, 'أبو يوسف المصري', '4044569372221052', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '2', 't_10223681613615181', '/2085064648484866/inbox/2722516384739686/', '0', '2021-07-11 22:01:19', '2020-08-07T15:20:25+0000'),
(292, 1, 7, 23, 'Mohamed Aboushady', '3708522559184061', 'Food delivery Application (Android/IOS) \n\nTotal Package= 220 $ - Without servers and hosting fees\n------\nservice includes \n-Installation services \n-initiate DB build application\n-Support hosting and server setting \n-Support payment Getaway setting \n----------------------------------\nThanks to contact ProAtCoding +2-01118136665\nFollow us to recive more apps \nhttps://www.facebook.com/Proatcoding', '3', 't_3043663969090454', '/2085064648484866/inbox/2722484738076184/', '0', '2021-07-11 22:01:19', '2020-08-07T14:36:26+0000'),
(293, 1, 7, 23, 'Facebook User', '5441049392579341', 'No sorry we don’t provide white labels apps we pay the full source application', '4', 't_10111023476227096', '/2085064648484866/inbox/2720660421591949/', '0', '2021-07-11 22:01:19', '2020-08-05T15:25:18+0000'),
(294, 1, 7, 23, 'Safwan Hashim', '4174720195883523', 'القاهره يافندم', '10', 't_3132935813470085', '/2085064648484866/inbox/2719223068402351/', '0', '2021-07-11 22:01:19', '2020-08-03T23:03:19+0000'),
(295, 1, 7, 23, 'ĪŤ Omar FaTħī', '4101338929897024', 'حضرتك  احنا متوفر فقط البرامج المعروضة لو حضرتك عندك اي افكار ممكن ننفذها لحضرتك', '18', 't_288478898914351', '/2085064648484866/inbox/2718079488516709/', '0', '2021-07-11 22:01:19', '2020-08-03T20:08:13+0000'),
(296, 1, 7, 23, 'Mahmoud Seoudi', '3925764970815049', 'حضرتك ممكن تتواصل معنا عن طريق  الواتساب او ابعتلنا رقم التلفون وهيتم التواصل بحضوتك', '5', 't_10160549459547715', '/2085064648484866/inbox/2718983821759609/', '0', '2021-07-11 22:01:19', '2020-08-03T16:01:28+0000'),
(297, 1, 7, 23, 'Wasiq Zahid', '3578194825612898', 'Food Delivery Application (Android/IOS) With complete admin panel  Total Package= 185 $ - Without servers and hosting fees  Service includes -Installation service -support for setting your server or flutter environment in your device (iOS or Android)  -Payment Gateway services/language setting   Free technical support for 1 month   10% off if order it within 2 days delivered in 48 hours.     Welcome to Pro At Coding    Don’t hesitate to contact us at +2-01118136665', '1', 't_1666883843476276', '/2085064648484866/inbox/2718868428437815/', '0', '2021-07-11 22:01:19', '2020-08-03T13:09:56+0000'),
(298, 1, 7, 23, 'Azpark Villa', '5168677709872782', '󰀀', '48', 't_1699595940192906', '/2085064648484866/inbox/2717797751878216/', '0', '2021-07-11 22:01:19', '2020-08-03T12:59:11+0000'),
(299, 1, 7, 23, 'Essam Lotfy', '3877543258997008', '+2-01118136665', '4', 't_3124318470955286', '/2085064648484866/inbox/2718446065146718/', '0', '2021-07-11 22:01:19', '2020-08-03T04:01:31+0000'),
(300, 1, 7, 23, 'عبد الرحمن العكيزي', '3698415206880008', '00966562009030', '5', 't_1951120745020326', '/2085064648484866/inbox/2718366655154659/', '0', '2021-07-11 22:01:19', '2020-08-03T00:33:02+0000'),
(301, 1, 7, 23, 'Omar Sameh Attia', '4375798339127487', 'https://www.mediafire.com/file/ce7fsldwi0wlm64/EsyPOS+-+Update+Version.mp4/file', '7', 't_10219895195705116', '/2085064648484866/inbox/2718446265146698/', '0', '2021-07-11 22:01:19', '2020-08-03T00:23:15+0000'),
(302, 1, 7, 23, 'Mohamed Abdulrahman', '3794945543959868', 'تمام يافندم', '18', 't_10157177516076960', '/2085064648484866/inbox/2718380888486569/', '0', '2021-07-11 22:01:19', '2020-08-02T23:47:35+0000'),
(303, 1, 7, 23, 'Ahmed Eltaher', '3837326409627302', 'يوجد فيديو توضيحى يافندم على الرابط التالى\nhttps://www.mediafire.com/file/ce7fsldwi0wlm64/EsyPOS+-+Update+Version.mp4/file', '7', 't_10163949161605052', '/2085064648484866/inbox/2718408225150502/', '0', '2021-07-11 22:01:19', '2020-08-02T23:46:38+0000'),
(304, 1, 7, 23, 'Danish Agha', '3169268819828053', 'Did you send the email as requested?', '46', 't_10163935002495504', '/2085064648484866/inbox/2717532398571418/', '0', '2021-07-11 22:01:19', '2020-08-02T23:33:46+0000'),
(305, 1, 7, 23, 'Ashraf Nabil', '5402351623140413', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_2576062012644569', '/2085064648484866/inbox/2718387425152582/', '0', '2021-07-11 22:01:19', '2020-08-02T22:17:54+0000'),
(306, 1, 7, 23, 'Waleed Gomaa', '3607143982747934', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_10157570767912469', '/2085064648484866/inbox/2718369345154390/', '0', '2021-07-11 22:01:19', '2020-08-02T21:47:46+0000'),
(307, 1, 7, 23, 'محمود السيد خليفة', '4130233940361928', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3139844346097043', '/2085064648484866/inbox/2718368965154428/', '0', '2021-07-11 22:01:19', '2020-08-02T21:46:44+0000'),
(308, 1, 7, 23, 'Hasan Ali', '3975294835863214', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3679186865443650', '/2085064648484866/inbox/2718367615154563/', '0', '2021-07-11 22:01:19', '2020-08-02T21:43:45+0000'),
(309, 1, 7, 23, 'محمد فتحى', '4357851594244136', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_1654130361405726', '/2085064648484866/inbox/2718366365154688/', '0', '2021-07-11 22:01:19', '2020-08-02T21:41:00+0000'),
(310, 1, 7, 23, 'عبدالرحمن القعاري', '3623431921068021', '󰀀', '3', 't_3512775288734145', '/2085064648484866/inbox/2718366031821388/', '0', '2021-07-11 22:01:19', '2020-08-02T21:40:46+0000'),
(311, 1, 7, 23, 'Facebook User', '3601754713266584', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_2839911399605974', '/2085064648484866/inbox/2718364698488188/', '0', '2021-07-11 22:01:19', '2020-08-02T21:37:18+0000'),
(312, 1, 7, 23, 'سليمان ابوعائشة', '5149527508422909', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_2800126670220778', '/2085064648484866/inbox/2718364581821533/', '0', '2021-07-11 22:01:19', '2020-08-02T21:37:03+0000'),
(313, 1, 7, 23, 'Young Shehata', '5809341349083411', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n \n  Total Package: 80 $ \n\n The price including the following:\n \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3297326866990113', '/2085064648484866/inbox/2718196138505044/', '0', '2021-07-11 22:01:19', '2020-08-02T16:42:22+0000'),
(314, 1, 7, 23, 'Ahmad Hamad', '3750625611688757', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3386669081356736', '/2085064648484866/inbox/2718194581838533/', '0', '2021-07-11 22:01:19', '2020-08-02T16:40:04+0000'),
(315, 1, 7, 23, 'Ahmad Al Hafez', '4013799585326529', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_10223992600944858', '/2085064648484866/inbox/2718123235179001/', '0', '2021-07-11 22:01:19', '2020-08-02T14:56:15+0000'),
(316, 1, 7, 23, 'Ahmed Elkaffass', '3111621838892209', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n \n  Total Package: 80 $ \n\n The price including the following:\n \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n \n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '7', 't_2733316980237623', '/2085064648484866/inbox/2718038715187453/', '0', '2021-07-11 22:01:19', '2020-08-02T14:51:15+0000'),
(317, 1, 7, 23, 'Jalal A. Elhaj', '3765004193606959', 'موجود يافندم متجر الكترونى على صفحتنا ممكن حضرتك تطلع على تفاصيله', '9', 't_2740711406149043', '/2085064648484866/inbox/2718047441853247/', '0', '2021-07-11 22:01:19', '2020-08-02T14:45:47+0000'),
(318, 1, 7, 23, 'السفير.هاني الجمال', '3871185876273876', 'نظام نقاط البيع الشامل للشركات التجارية الصغيرة ومحلات السوبر ماركت\nوالمطاعم.قدّم خدمة عملائك بشكل أفضل من خلال معرفة المنتجات المتوفرة في المخزون.وسهولة إنشاء ملصقات على الفور لتتبع المخزون\n\n سعر البرنامج = 1280ج\n\n  السعر شامل الخدمات التالي \n\n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free\n\n  \nالاستلام بيكون ف خلال 48 ساعه و فى خصم 10% خلال فتره العيد\nشكرا للاتصال ب ProAtCoding +2-01118136665', '1', 't_3572371056130950', '/2085064648484866/inbox/2718092931848698/', '0', '2021-07-11 22:01:19', '2020-08-02T14:24:00+0000'),
(319, 1, 7, 23, 'Anvar Tk', '5041632012578316', '00966557872432', '16', 't_3084597334909814', '/2085064648484866/inbox/2717818385209486/', '0', '2021-07-11 22:01:19', '2020-08-02T14:09:30+0000'),
(320, 1, 7, 23, 'Ahmed El Masry', '5203777263028316', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '3', 't_3157938164316480', '/2085064648484866/inbox/2718042398520418/', '0', '2021-07-11 22:01:19', '2020-08-02T13:23:56+0000'),
(321, 1, 7, 23, 'AZ Aldean Alulbe', '3003390153122484', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_3138020419612221', '/2085064648484866/inbox/2717985645192760/', '0', '2021-07-11 22:01:19', '2020-08-02T11:56:59+0000'),
(322, 1, 7, 23, 'Walid Abdelmoniem Selim', '3267472793310629', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '7', 't_3285826781439536', '/2085064648484866/inbox/2717967615194563/', '0', '2021-07-11 22:01:19', '2020-08-02T11:26:26+0000'),
(323, 1, 7, 23, 'Amr Moorsi', '3120433341403212', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_3637542469606646', '/2085064648484866/inbox/2717966148528043/', '0', '2021-07-11 22:01:19', '2020-08-02T11:24:58+0000'),
(324, 1, 7, 23, 'Seif El Din Hegab', '3649298041834053', 'We Have an online eCommerce too but it is separated from This Application', '4', 't_10163967442160022', '/2085064648484866/inbox/2717859331872058/', '0', '2021-07-11 22:01:19', '2020-08-02T11:22:57+0000'),
(325, 1, 7, 23, 'Mujahed Kamal Yousif', '3895967820423561', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665\nMahmoud Mohamed Mahmoud\nMahmoud', '2', 't_1560279490817566', '/2085064648484866/inbox/2717955461862445/', '0', '2021-07-11 22:01:19', '2020-08-02T11:08:43+0000'),
(326, 1, 7, 23, 'Rabea Alnajjar', '5641085439266854', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '5', 't_674851766434778', '/2085064648484866/inbox/2717935165197808/', '0', '2021-07-11 22:01:19', '2020-08-02T10:41:43+0000'),
(327, 1, 7, 23, 'Amr Hassan El-Gamal', '3445664062205056', '01223703752', '12', 't_10163959276105319', '/2085064648484866/inbox/2717795175211807/', '0', '2021-07-11 22:01:19', '2020-08-02T10:41:22+0000'),
(328, 1, 7, 23, 'Mahmoud Mohamed Mahmoud', '4104759956235675', 'فى اى وقت يافندم تشرفنا', '13', 't_10158341932015993', '/2085064648484866/inbox/2717933465197978/', '0', '2021-07-11 22:01:19', '2020-08-02T10:40:33+0000'),
(329, 1, 7, 23, 'Mohamed Elfakharany', '5273569322684057', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '2', 't_2711516765758378', '/2085064648484866/inbox/2717861431871848/', '0', '2021-07-11 22:01:19', '2020-08-02T09:15:03+0000'),
(330, 1, 7, 23, 'Hamada Gamel', '3534274496683794', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) \n-Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '2', 't_3453039464730026', '/2085064648484866/inbox/2717851755206149/', '0', '2021-07-11 22:01:19', '2020-08-02T08:56:39+0000'),
(331, 1, 7, 23, 'خميس جاد', '4067763843254274', '󰀀', '4', 't_2784326085182402', '/2085064648484866/inbox/2717823345208990/', '0', '2021-07-11 22:01:19', '2020-08-02T08:52:04+0000'),
(332, 1, 7, 23, 'Hany Sherif', '3792891654159213', 'نظام نقاط البيع الشامل للشركات التجارية الصغيرة ومحلات السوبر ماركت\nوالمطاعم.قدّم خدمة عملائك بشكل أفضل من خلال معرفة المنتجات المتوفرة في المخزون.وسهولة إنشاء ملصقات على الفور لتتبع المخزون\n\n سعر البرنامج = 1280ج\n\n  السعر شامل الخدمات التالي \n\n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free\n\n  \nالاستلام بيكون ف خلال 48 ساعه و فى خصم 10% خلال فتره العيد\nشكرا للاتصال ب ProAtCoding +2-01118136665', '2', 't_3325217994211046', '/2085064648484866/inbox/2717816128543045/', '0', '2021-07-11 22:01:19', '2020-08-02T07:52:04+0000'),
(333, 1, 7, 23, 'Sawsan Flower', '4084855311565107', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '2', 't_326818678503133', '/2085064648484866/inbox/2717811015210223/', '0', '2021-07-11 22:01:19', '2020-08-02T07:41:17+0000'),
(334, 1, 7, 23, 'Ibrahim Osama Ibrahim', '3742078949204013', '01110171960', '5', 't_2932524880352406', '/2085064648484866/inbox/2717804831877508/', '0', '2021-07-11 22:01:19', '2020-08-02T07:30:35+0000'),
(335, 1, 7, 23, 'Jonathan Jody', '4456162634400584', 'Full eCommerce Website Project in ASP .Net\n\nOur Service includes\n\n1-Installation service\n2-Setting your server on MVC/ set your \n3-Payment gateway services/language settings\n\nSupport for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\n delivered in 48 hours.\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us at +2-01118136665', '4', 't_3135800206498565', '/2085064648484866/inbox/2717417905249534/', '0', '2021-07-11 22:01:19', '2020-08-02T07:24:06+0000'),
(336, 1, 7, 23, 'Fady Ahmed', '3830247170388248', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '3', 't_2680005048947687', '/2085064648484866/inbox/2717796808544977/', '0', '2021-07-11 22:01:19', '2020-08-02T07:12:31+0000'),
(337, 1, 7, 23, 'Sayed Ashraf', '5152123444857781', 'تمام', '11', 't_3105497249558352', '/2085064648484866/inbox/2717671265224198/', '0', '2021-07-11 22:01:19', '2020-08-02T07:11:55+0000'),
(338, 1, 7, 23, 'Mohamed Eissa', '3115961458516113', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android)\n -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_4658756050832653', '/2085064648484866/inbox/2717764461881545/', '0', '2021-07-11 22:01:19', '2020-08-02T06:52:33+0000'),
(339, 1, 7, 23, 'Ahmed Gamal', '3257117194355342', 'للأسف ، لا يتوفر إصدار تجريبي', '9', 't_4834063589952579', '/2085064648484866/inbox/2717589611899030/', '0', '2021-07-11 22:01:19', '2020-08-02T01:05:43+0000'),
(340, 1, 7, 23, 'Hedra Esam', '4197890196911693', '󰀀', '3', 't_3400419080010362', '/2085064648484866/inbox/2717551148569543/', '0', '2021-07-11 22:01:19', '2020-08-01T23:36:40+0000'),
(341, 1, 7, 23, 'Tamer Zedan', '3482138971914804', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكامل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us  +2-01118136665', '2', 't_10158856388714396', '/2085064648484866/inbox/2717517285239596/', '0', '2021-07-11 22:01:19', '2020-08-01T22:23:32+0000'),
(342, 1, 7, 23, 'بوب بيزنس', '3429196020437616', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nمتجر الكترونى متكالمل مع لوحه تحكم كامله \nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server \n3-set your Payment gateway services/language settings\n4-Support for 1 month for free\n\nTotal package= 190 $ + Without hosting fees\n\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه و يوجد خصم 10% عند الطلب خلال فتره العيد\n\nWelcome to Pro At Coding\nDon\'t hesitate to contact us at +2-01118136665', '2', 't_325982218782484', '/2085064648484866/inbox/2717510145240310/', '0', '2021-07-11 22:01:19', '2020-08-01T22:07:43+0000'),
(343, 1, 7, 23, 'محمد عبده', '4923285607696588', 'سعر البرنامج 185 $ غير شامل تكاليف الاستضافه \nالسعر يشمل الخدمات التاليه\n-تحميل و تنصيب البرنامج و لوحه التحكم \n-دعم الخصائص و الاستضافه\n-ضبط خصائص  الدفع على حسابكم الخاص \n-النشر \n\nيوجد خصم 10 % عند طلب البرنامج خلال فتره العيد\nشكرا للتواصل ب ProAtCoding', '14', 't_1534003633457021', '/2085064648484866/inbox/2717461031911888/', '0', '2021-07-11 22:01:19', '2020-08-01T22:02:26+0000'),
(344, 1, 7, 23, 'Micheal Soiral', '3082953501818868', 'Food Delivery Application (Android/IOS) With complete admin panel\n\nTotal Package= 185 $ - Without servers and hosting fees\n\nService includes\n-Installation service\n-support for setting your server or flutter environment in your device (iOS or Android) -Payment Getway services / language setting \n\nFree technical support for 1 month \n\n10% off if order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '8', 't_726735131497428', '/2085064648484866/inbox/2717492795242045/', '0', '2021-07-11 22:01:19', '2020-08-01T21:52:31+0000'),
(345, 1, 7, 23, 'Mohammad Subhan Abid', '3540586832618723', 'This software total package=80$ \nService include\n-installation services \n-initiate your local database\n-setting support \n And also 1 month free technical support \n\nYou will get discount 10% if you order today', '8', 't_2586708584977363', '/2085064648484866/inbox/2717422485249076/', '0', '2021-07-11 22:01:19', '2020-08-01T19:33:59+0000'),
(346, 1, 7, 23, 'Michal S Thomas', '5443421709031085', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n \n  Total Package: 80 $ \n\n The price including the following:\n \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '1', 't_10164031887355437', '/2085064648484866/inbox/2717418311916160/', '0', '2021-07-11 22:01:19', '2020-08-01T19:19:03+0000'),
(347, 1, 7, 23, 'Abdelrahman Essam', '3884620058295737', 'طيب تمام جدا، شكرا جدا لحضرتك', '4', 't_3099798223482225', '/2085064648484866/inbox/2717062731951718/', '0', '2021-07-11 22:01:19', '2020-08-01T13:46:13+0000'),
(348, 1, 7, 23, 'Mutwakil Othman', '3137683209655263', 'تشرف يافندم و شكرا لاتصالك ب ProAtCoding', '22', 't_3617822101583459', '/2085064648484866/inbox/2716803645310960/', '0', '2021-07-11 22:01:19', '2020-08-01T10:51:12+0000'),
(349, 1, 7, 23, 'Benedic Lat', '3070925489642424', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_10222454544089913', '/2085064648484866/inbox/2716987885292536/', '0', '2021-07-11 22:01:19', '2020-08-01T10:16:24+0000'),
(350, 1, 7, 23, 'Anjum Shahzad', '3182845518429690', 'Thank you to contact ProAtCoding family don\'t hesitate to contact us again for any questions.', '21', 't_3131553893587206', '/2085064648484866/inbox/2716853611972630/', '0', '2021-07-11 22:01:19', '2020-08-01T10:15:30+0000'),
(351, 1, 7, 23, 'Eileen Maturan', '2962462767210141', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n  \n  Total Package: 80 $ \n\n The price including the following:\n  \n  1-Installation service \n  2-Setting support/initiate Database in your local machine  \n  3-Support for 1 month is free  \n  \n\n  contract support for 1 y: 20$ monthly (if required).\n \n10% off when order it within 2 days \n\n delivered in 48 hours.\n  \n  Welcome to Pro At Coding \n  Don’t hesitate to contact us at +2-01118136665', '6', 't_10157816462459072', '/2085064648484866/inbox/2716953095296015/', '0', '2021-07-11 22:01:19', '2020-08-01T09:49:35+0000'),
(352, 1, 7, 23, 'Amr Arbi', '3505762339527689', 'thank you for contacting us.\nProatcoding.', '5', 't_3049995855049089', '/2085064648484866/inbox/2716793385311986/', '0', '2021-07-11 22:01:19', '2020-08-01T06:02:16+0000'),
(353, 1, 7, 23, 'Christopher Gargar', '2446207495504523', 'Thank you for contacting us.\nProatcoding.', '5', 't_3214008151981536', '/2085064648484866/inbox/2716865728638085/', '0', '2021-07-11 22:01:19', '2020-08-01T05:58:30+0000'),
(354, 1, 7, 23, 'Ahmed Sarwar', '3805873802834210', 'Just Pc and printer if you want print a receipt', '6', 't_734042057373090', '/2085064648484866/inbox/2716860885305236/', '0', '2021-07-11 22:01:19', '2020-08-01T05:55:06+0000'),
(355, 1, 7, 23, 'Rana Sohail', '5438386416179229', 'السلام عليكم يافندم \n \nسعر البرنامج ١٢٨٠ ج\nخصم خلال فتره العيد ١٠٪؜ \n\nالسعر يشمل الخدمات \n\nInstallation service\ninitiate database on your local device \nSetting support \n\nFree support for 1 month \n\nالاستلام خلال ٤٨ ساعه', '2', 't_2694681290820106', '/2085064648484866/inbox/2716668355324489/', '0', '2021-07-11 22:01:19', '2020-07-31T23:55:47+0000'),
(356, 1, 7, 23, 'Sameh Samir Atalla', '4464419963584432', 'السلام عليكم يافندم \n\nسعر البرنامج ١٢٨٠ج \n\nالسعل يشمل \ninstallation service / initiate your local database on your device and support 1 month for free\n\nالاستلام خلال 48 ساعه و يوجد خصم ١٠٪؜ خلال فتره العيد \n\nالنسخه التجريبيه غير جاهزه فالوقت الحالى ولاكن الشركه تضمن لك استلام البرنامج خالى من العيوب', '2', 't_10162966504173504', '/2085064648484866/inbox/2716540535337271/', '0', '2021-07-11 22:01:19', '2020-07-31T20:37:03+0000'),
(357, 1, 7, 23, 'Ehab Enan', '3805039622937541', '󰀀', '6', 't_10223615969929649', '/2085064648484866/inbox/2716493338675324/', '0', '2021-07-11 22:01:19', '2020-07-31T19:56:44+0000'),
(358, 1, 7, 23, 'Anand Giri', '3262652270458368', 'Hello how can we serve you?', '6', 't_3275661475812923', '/2085064648484866/inbox/2715959902062001/', '0', '2021-07-11 22:01:19', '2020-07-31T13:44:09+0000'),
(359, 1, 7, 23, 'Gias Uddin Khokon', '3064009793718741', 'EsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n \nThe price including the following:\n \n 1-Installation service \n 2-Setting support/initiate Database in your local machine  \n 3-Support for 1 month is free  \n \n Total Package: 80 $ \n contract support for 1 y: 20$ monthly (if required).\n\ndelivered in 48 hours.\n \n Welcome to Pro At Coding \n Don’t hesitate to contact us at +2-01118136665', '11', 't_4923652020994002', '/2085064648484866/inbox/2716249965366328/', '0', '2021-07-11 22:01:19', '2020-07-31T13:43:33+0000'),
(360, 1, 7, 23, 'Mohamed Abd Alrahman Aldarame', '3715778198520701', 'اهلا وسهلا يافندم', '3', 't_10223590623610805', '/2085064648484866/inbox/2716114895379835/', '0', '2021-07-11 22:01:19', '2020-07-31T09:50:23+0000'),
(361, 1, 7, 23, 'Mahmoud Shahat', '3984541148235533', 'السلام عليكم يافندم \nEsyPos : The project is written in  vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\n\nسعر المنتج شامل الخدمات التاليه \n1-Installation service\n2-Setting support / initate Database in your local machine \n3-Support for 1 month is free \nTotal Backage : 80 $\ncontract support for 1 y : 20$ monthly\n\nالاستلام خلال 48 ساعه \nWelcome to Pro At Coding\nDon’t hesitate to contact us at +2-01118136665', '2', 't_1015287122238431', '/2085064648484866/inbox/2716052202052771/', '0', '2021-07-11 22:01:19', '2020-07-31T07:54:07+0000'),
(362, 1, 7, 23, 'Mahmoud Elmahdy', '3979031498801604', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nالسعر شامل الخدمات التاليه\n1-Installation service\n2-Setting your server on MVC/ set your Payment gateway services/language settings\n3-Support for 1 month for free\nTotal backage= 190 $ + Without hosting fees\nِAnnually support = 50$ Monthly (If required)\nالاستلام خلال 48 ساعه\nWelcome to Pro At Coding\nDon\'t hesitate to contact us at +2-01118136665', '1', 't_2707965132774242', '/2085064648484866/inbox/2715837638740894/', '0', '2021-07-11 22:01:19', '2020-07-31T01:12:23+0000'),
(363, 1, 7, 23, 'Bassam Hussien', '5024193527650666', 'السلام عليكم يافندم\nFull eCommerce Website Project in ASP .Net\nالسعر شامل الخدمات التاليه \n1-Installation service\n2-Setting your server on MVC/ set your Payment gateway services/language settings\n3-Support for 1 month for free\n\nTotal backage= 190 $ + Without hosting fees\nِAnnually support = 50$ Monthly (If required)\n\nالاستلام خلال 48 ساعه\nWelcome to Pro At Coding \nDon\'t hesitate to contact us at +2-01118136665', '1', 't_3301725576533281', '/2085064648484866/inbox/2715836928740965/', '0', '2021-07-11 22:01:19', '2020-07-31T01:11:59+0000'),
(364, 1, 7, 23, 'Marco Nagy Farag', '4136012733099567', 'السلام عليكم يافندم \nEsyPos : The project is written in vb.net 2015 as front end, SQL Server Compact database as back end with crystal report\nسعر المنتج شامل الخدمات التاليه \n1-Installation service\n2-Setting support / initate Database in your local machine \n3-Support for 1 month is free \nTotal Backage : 80 $\ncontract support for 1 y : 20$ monthly\nالاستلام خلال 48 ساعه \nWelcome to Pro At Coding', '2', 't_3190627524318225', '/2085064648484866/inbox/2715344522123539/', '0', '2021-07-11 22:01:19', '2020-07-30T12:00:38+0000');

-- --------------------------------------------------------

--
-- Table structure for table `fb_msg_manager_notification_settings`
--

CREATE TABLE `fb_msg_manager_notification_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) NOT NULL,
  `time_interval` varchar(100) DEFAULT NULL,
  `is_enabled` enum('yes','no') NOT NULL,
  `has_business_account` enum('yes','no') NOT NULL DEFAULT 'no',
  `last_email_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fb_simple_support_desk`
--

CREATE TABLE `fb_simple_support_desk` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_title` text NOT NULL,
  `ticket_text` longtext NOT NULL,
  `ticket_status` enum('1','2','3') CHARACTER SET latin1 NOT NULL DEFAULT '1' COMMENT '1=> Open. 2 => Closed, 3 => Resolved',
  `display` enum('0','1') NOT NULL DEFAULT '1',
  `support_category` int(11) NOT NULL,
  `last_replied_by` int(11) NOT NULL,
  `last_replied_at` datetime NOT NULL,
  `last_action_at` datetime NOT NULL COMMENT 'close resolve reopen etc',
  `ticket_open_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fb_support_category`
--

CREATE TABLE `fb_support_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fb_support_category`
--

INSERT INTO `fb_support_category` (`id`, `category_name`, `user_id`, `deleted`) VALUES
(1, 'Billing', 1, '0'),
(2, 'Technical', 1, '0'),
(3, 'Query', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `fb_support_desk_reply`
--

CREATE TABLE `fb_support_desk_reply` (
  `id` int(11) NOT NULL,
  `ticket_reply_text` longtext NOT NULL,
  `ticket_reply_time` datetime NOT NULL,
  `reply_id` int(11) NOT NULL COMMENT 'ticket_id',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forget_password`
--

CREATE TABLE `forget_password` (
  `id` int(12) NOT NULL,
  `confirmation_code` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `success` int(11) NOT NULL DEFAULT '0',
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forget_password`
--

INSERT INTO `forget_password` (`id`, `confirmation_code`, `email`, `success`, `expiration`) VALUES
(1, '203603', 'bebodeath@gmail.com', 0, '2021-03-15 07:34:52'),
(2, '565994', 'bebodeath@gmail.com', 0, '2021-03-16 19:25:34'),
(3, '108429', 'bebodeath@gmail.com', 1, '2021-03-15 10:36:46'),
(4, '168210', 'yecede3613@vreagles.com', 0, '2021-04-17 12:29:24'),
(5, '310429', 'wessamazab@yahoo.com', 0, '2021-05-05 18:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `instagram_autoreply_report`
--

CREATE TABLE `instagram_autoreply_report` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `autoreply_table_id` int(11) NOT NULL,
  `post_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `reply_type` enum('post','full','mention') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `comment_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `comment_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenter_name` varchar(120) CHARACTER SET utf8 NOT NULL,
  `commenter_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `comment_time` datetime NOT NULL,
  `reply_time` datetime NOT NULL,
  `comment_reply_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_status_comment` text CHARACTER SET utf8 NOT NULL,
  `post_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden_comment_count` int(11) NOT NULL,
  `deleted_comment_count` int(11) NOT NULL,
  `auto_comment_reply_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instagram_reply_autoreply`
--

CREATE TABLE `instagram_reply_autoreply` (
  `id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `autoreply_type` enum('post_autoreply','account_autoreply','mentions_autoreply') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post_autoreply',
  `post_pause_play` enum('play','pause') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'play',
  `full_pause_play` enum('play','pause') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mentions_pause_play` enum('play','pause') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'play',
  `auto_reply_campaign_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_name` text COLLATE utf8mb4_unicode_ci,
  `post_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_created_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_description` longtext COLLATE utf8mb4_unicode_ci,
  `reply_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_type` enum('full','mention','post') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `multiple_reply` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nofilter_word_found_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_reply_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `last_reply_time` datetime NOT NULL,
  `error_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_comment_after_comment_reply` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete_offensive` enum('hide','delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `offensive_words` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden_comment_count` int(11) NOT NULL,
  `deleted_comment_count` int(11) NOT NULL,
  `auto_comment_reply_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instagram_reply_template`
--

CREATE TABLE `instagram_reply_template` (
  `id` int(11) NOT NULL,
  `auto_reply_campaign_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `reply_type` varchar(200) NOT NULL,
  `multiple_reply` enum('no','yes') NOT NULL,
  `nofilter_word_found_text` longtext NOT NULL,
  `auto_reply_text` longtext NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `error_message` text NOT NULL,
  `hide_comment_after_comment_reply` enum('no','yes') NOT NULL,
  `is_delete_offensive` enum('hide','delete') NOT NULL,
  `offensive_words` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linkedin_config`
--

CREATE TABLE `linkedin_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `linkedin_config`
--

INSERT INTO `linkedin_config` (`id`, `user_id`, `app_name`, `client_id`, `client_secret`, `status`, `deleted`) VALUES
(1, 1, 'Gaxa-bot', '7754oxnu3a14v6', '4RiovydoBtEYUVmZ', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `linkedin_users_info`
--

CREATE TABLE `linkedin_users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `linkedin_id` varchar(200) NOT NULL,
  `access_token` text NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `profile_pic` text NOT NULL,
  `add_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `linkedin_users_info`
--

INSERT INTO `linkedin_users_info` (`id`, `user_id`, `linkedin_id`, `access_token`, `name`, `profile_pic`, `add_date`) VALUES
(1, 1, 'qv32aqgDhe', 'AQXR-SP8d5e1S8oUFphjfn5kxJ5xFNR2s-miurIBVoN8_2kguP2deOAnm62TC6Hb7qcNEMBiLMYK-OgZo8jBgRLu8jv99hR8qFNt35ID3zUFT0zClQiAULO53md2uZB3T2-KT4fvvUC49JnVQDwYp98zQHYsKgnySAXzhuFMt7wArcvngeU2vh5BkiCSn5xJvAJQqnEC2IySl9c_ii7RV4RRQnZhesEir9uEsJePS6COVpylAw-3Khrj7M2zL4xzeh7kC73GfFobHTbYyDCWVDaAEb2gmwoSQG7OcMzBCFsnYKzcYscB_M3GipTrPwZ0zmzST0wGA9wXSuAeLd0XNp6mLxk8lw', 'ProAtCoding Company', 'https://media-exp1.licdn.com/dms/image/C4D03AQH0BQdD8oVX2A/profile-displayphoto-shrink_100_100/0/1615648865334?e=1620864000&v=beta&t=0zsnx8zSahUctGjzHtrzO3fvT5HWuCdefSjbcBxhULA', '2021-03-13');

-- --------------------------------------------------------

--
-- Table structure for table `login_config`
--

CREATE TABLE `login_config` (
  `id` int(11) NOT NULL,
  `app_name` varchar(100) DEFAULT NULL,
  `api_key` varchar(250) DEFAULT NULL,
  `google_client_id` text,
  `google_client_secret` varchar(250) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_config`
--

INSERT INTO `login_config` (`id`, `app_name`, `api_key`, `google_client_id`, `google_client_secret`, `status`, `deleted`) VALUES
(1, 'Gaxa-bot', 'AIzaSyBe2s2N5f35ByLLzoNtmlcuMYF8KnaKGgQ', '765779507753-kd8j1c3mr3kmfb98e9hugcdm4gmrubs2.apps.googleusercontent.com', 'zRnllNtY4oha3gj-rsLxGyoq', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mailchimp_config`
--

CREATE TABLE `mailchimp_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tracking_name` varchar(200) NOT NULL,
  `service_type` enum('mailchimp','sendinblue','activecampaign','mautic','acelle') NOT NULL DEFAULT 'mailchimp',
  `api_url` text NOT NULL,
  `api_key` varchar(200) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `inserted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mailchimp_list`
--

CREATE TABLE `mailchimp_list` (
  `id` int(11) NOT NULL,
  `mailchimp_config_id` int(11) NOT NULL,
  `list_name` varchar(255) NOT NULL,
  `list_id` varchar(255) NOT NULL,
  `string_id` varchar(255) NOT NULL,
  `list_folder_id` int(11) NOT NULL,
  `list_total_subscribers` int(11) NOT NULL,
  `list_total_blacklisted` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `inserted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medium_users_info`
--

CREATE TABLE `medium_users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `medium_id` varchar(200) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `profile_pic` text NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `serial` int(11) NOT NULL,
  `module_access` varchar(255) NOT NULL,
  `have_child` enum('1','0') NOT NULL DEFAULT '0',
  `only_admin` enum('1','0') NOT NULL DEFAULT '1',
  `only_member` enum('1','0') NOT NULL DEFAULT '0',
  `add_ons_id` int(11) NOT NULL,
  `is_external` enum('0','1') NOT NULL DEFAULT '0',
  `header_text` varchar(255) NOT NULL,
  `is_menu_manager` enum('0','1') NOT NULL DEFAULT '0',
  `custom_page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `icon`, `url`, `serial`, `module_access`, `have_child`, `only_admin`, `only_member`, `add_ons_id`, `is_external`, `header_text`, `is_menu_manager`, `custom_page_id`) VALUES
(1, 'Dashboard', 'fa fa-fire', 'dashboard', 1, '', '0', '0', '0', 0, '0', '', '0', 0),
(2, 'System', 'fas fa-laptop-code', '', 9, '', '1', '1', '0', 0, '0', 'Administration', '0', 0),
(3, 'Subscription', 'fas fa-coins', '', 13, '', '1', '1', '0', 0, '0', '', '0', 0),
(4, 'Import Account', 'fa fa-cloud-download-alt', 'social_accounts/index', 5, '65', '0', '0', '0', 0, '0', '', '0', 0),
(6, 'Subscriber Manager', 'fas fa-address-book', 'subscriber_manager', 21, '', '0', '0', '0', 0, '0', 'Messenger Tools', '0', 0),
(7, 'Broadcasting', 'fas fa-paper-plane', 'messenger_bot_broadcast', 29, '79,210,211,262,263,264', '0', '0', '0', 0, '0', '', '0', 0),
(8, 'Messenger Bot', 'fas fa-robot', 'messenger_bot', 25, '197,198,199,211,213,214,215,217,218,219,257,258,260,261,262,265,266', '0', '0', '0', 0, '0', '', '0', 0),
(9, 'Social Posting', 'fa fa-share-square', 'ultrapost', 33, '220,222,223,256,100', '0', '0', '0', 0, '0', 'Posting Feature', '0', 0),
(10, 'Ecommerce Store', 'fa fa-store', 'ecommerce', 30, '268', '0', '0', '0', 0, '0', 'Ecommerce', '0', 0),
(11, 'Social Apps', 'fas fa-hands-helping', 'social_apps/index', 3, '', '0', '0', '1', 0, '0', '', '0', 0),
(13, 'Search Tools', 'fas fa-search', 'search_tools', 37, '267', '0', '0', '0', 0, '0', 'Utility Tools', '0', 0),
(16, 'Visual Flow Builder', 'fas fa-project-diagram', 'visual_flow_builder/flowbuilder_manager', 25, '315', '0', '0', '0', 0, '0', '', '0', 0),
(17, 'Affiliate System', 'fas fa-people-carry', '', 13, '0', '1', '1', '0', 0, '0', '', '0', 0),
(18, 'Comment Growth Tools', 'fas fa-layer-group', 'comment_automation/comment_growth_tools', 13, '80,201,202,204,206,220,222,223,251,256,278,279', '0', '0', '0', 0, '0', 'Comment Feature', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_child_1`
--

CREATE TABLE `menu_child_1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `serial` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `module_access` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `have_child` enum('1','0') NOT NULL DEFAULT '0',
  `only_admin` enum('1','0') NOT NULL DEFAULT '1',
  `only_member` enum('1','0') NOT NULL DEFAULT '0',
  `is_external` enum('0','1') NOT NULL DEFAULT '0',
  `is_menu_manager` enum('0','1') NOT NULL DEFAULT '0',
  `custom_page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_child_1`
--

INSERT INTO `menu_child_1` (`id`, `name`, `url`, `serial`, `icon`, `module_access`, `parent_id`, `have_child`, `only_admin`, `only_member`, `is_external`, `is_menu_manager`, `custom_page_id`) VALUES
(1, 'Settings', 'admin/settings', 1, 'fas fa-sliders-h', '', 2, '0', '1', '0', '0', '0', 0),
(2, 'Social Apps', 'social_apps/index', 5, 'fas fa-hands-helping', '', 2, '0', '1', '0', '0', '0', 0),
(3, 'Cron Job', 'cron_job/index', 9, 'fas fa-clipboard-list', '', 2, '0', '1', '0', '0', '0', 0),
(4, 'Language Editor', 'multi_language/index', 13, 'fas fa-language', '', 2, '0', '1', '0', '0', '0', 0),
(5, 'Add-on Manager', 'addons/lists', 17, 'fas fa-plug', '', 2, '0', '1', '0', '0', '0', 0),
(6, 'Check Update', 'update_system/index', 21, 'fas fa-leaf', '', 2, '0', '1', '0', '0', '0', 0),
(7, 'Package Manager', 'payment/package_manager', 1, 'fas fa-shopping-bag', '', 3, '0', '1', '0', '0', '0', 0),
(8, 'User Manager', 'admin/user_manager', 5, 'fas fa-users', '', 3, '0', '1', '0', '0', '0', 0),
(9, 'Announcement', 'announcement/full_list', 9, 'far fa-bell', '', 3, '0', '1', '0', '0', '0', 0),
(10, 'Payment Accounts', 'payment/accounts', 13, 'far fa-credit-card', '', 3, '0', '1', '0', '0', '0', 0),
(11, 'Earning Summary', 'payment/earning_summary', 17, 'fas fa-tachometer-alt', '', 3, '0', '1', '0', '0', '0', 0),
(12, 'Transaction Log', 'payment/transaction_log', 27, 'fas fa-history', '', 3, '0', '1', '0', '0', '0', 0),
(46, 'Theme Manager', 'themes/lists', 19, 'fas fa-palette', '', 2, '0', '1', '0', '0', '0', 0),
(47, 'Blog Manager', 'blog/posts', 20, 'fas fa-newspaper', '', 2, '0', '1', '0', '0', '0', 0),
(48, 'Menu Manager', 'menu_manager/index', 20, 'fas fa-bars', '', 2, '0', '1', '0', '0', '0', 0),
(51, 'Check Update v2', 'update_system/update_list_v2', 21, 'fas fa-leaf', '', 2, '0', '1', '0', '0', '0', 0),
(54, 'Affiliate Users', 'affiliate_system/affiliate_users', 1, 'fas fa-users', '', 17, '0', '1', '0', '0', '0', 0),
(55, 'Commission Settings', 'affiliate_system/affiliate_payment_settings', 5, 'fas fa-money-check-alt', '', 17, '0', '1', '0', '0', '0', 0),
(56, 'Withdrawal Requests', 'affiliate_system/all_withdrawal_requests', 9, 'fas fa-hands-helping', '', 17, '0', '1', '0', '0', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_child_2`
--

CREATE TABLE `menu_child_2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `serial` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `module_access` varchar(255) NOT NULL,
  `parent_child` int(11) NOT NULL,
  `only_admin` enum('1','0') NOT NULL DEFAULT '1',
  `only_member` enum('1','0') NOT NULL DEFAULT '0',
  `is_external` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot`
--

CREATE TABLE `messenger_bot` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `fb_page_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` enum('text','image','audio','video','file','quick reply','text with buttons','generic template','carousel','media','One Time Notification','User Input Flow','Ecommerce') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `bot_type` enum('generic','keyword') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'generic',
  `keyword_type` enum('reply','post-back','no match','get-started','email-quick-reply','phone-quick-reply','location-quick-reply','birthday-quick-reply') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'reply',
  `keywords` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_condition_false` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `buttons` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `bot_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `postback_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_replied_at` datetime NOT NULL,
  `is_template` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `broadcaster_labels` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'comma separated',
  `drip_campaign_id` int(11) NOT NULL,
  `visual_flow_type` enum('flow','general') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `visual_flow_campaign_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messenger_bot`
--

INSERT INTO `messenger_bot` (`id`, `user_id`, `page_id`, `fb_page_id`, `template_type`, `bot_type`, `keyword_type`, `keywords`, `message`, `conditions`, `message_condition_false`, `buttons`, `images`, `audio`, `video`, `file`, `status`, `bot_name`, `postback_id`, `last_replied_at`, `is_template`, `broadcaster_labels`, `drip_campaign_id`, `visual_flow_type`, `visual_flow_campaign_id`) VALUES
(130, 1, 19, '105940371572898', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0644\\u0642\\u062f \\u062a\\u0645 \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\\u0643 \\u0628\\u0646\\u062c\\u0627\\u062d \\u0645\\u0646 \\u0642\\u0627\\u0626\\u0645\\u062a\\u0646\\u0627. \\u0645\\u0646 \\u0627\\u0644\\u0645\\u062d\\u0632\\u0646 \\u0623\\u0646 \\u0623\\u0631\\u0627\\u0643 \\u062a\\u0630\\u0647\\u0628. \\u0627\\u0644\\u0623\\u0645\\u0631 \\u0644\\u064a\\u0633 \\u0647\\u0648 \\u0646\\u0641\\u0633\\u0647 \\u0628\\u062f\\u0648\\u0646\\u0643! \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0627\\u0644\\u0627\\u0646\\u0636\\u0645\\u0627\\u0645 \\u0645\\u0631\\u0629 \\u0623\\u062e\\u0631\\u0649 \\u0639\\u0646 \\u0637\\u0631\\u064a\\u0642 \\u0627\\u0644\\u0646\\u0642\\u0631 \\u0641\\u0648\\u0642 \\u0627\\u0644\\u0632\\u0631 \\u0623\\u062f\\u0646\\u0627\\u0647.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"RESUBSCRIBE_QUICK_BOXER\",\"title\":\"\\u0645\\u062a\\u0627\\u0628\\u0639\\u0647\"}]}},\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'UNSUBSCRIBE TEMPLATE', 'UNSUBSCRIBE_QUICK_BOXER', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(131, 1, 19, '105940371572898', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0639\\u0648\\u062f\\u062a\\u0643 ! \\u0644\\u0645 \\u0646\\u0631\\u0627\\u0643 \\u0645\\u0646\\u0630 \\u0641\\u062a\\u0631\\u0629. \\u0644\\u0646 \\u062a\\u0641\\u0648\\u062a\\u0643 \\u062a\\u062d\\u062f\\u064a\\u062b\\u0627\\u062a\\u0646\\u0627 \\u0627\\u0644\\u0645\\u0647\\u0645\\u0629 \\u0628\\u0639\\u062f \\u0627\\u0644\\u0622\\u0646.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"UNSUBSCRIBE_QUICK_BOXER\",\"title\":\"\\u0627\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0644\\u0645\\u062a\\u0627\\u0628\\u0639\\u0647\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'RESUBSCRIBE TEMPLATE', 'RESUBSCRIBE_QUICK_BOXER', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(132, 1, 19, '105940371572898', 'text', 'generic', 'email-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your email. We will keep you updated. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY EMAIL REPLY', 'QUICK_REPLY_EMAIL_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(133, 1, 19, '105940371572898', 'text', 'generic', 'phone-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"text\":\"\\u0634\\u0643\\u0631\\u0627 \\u060c \\u0644\\u0642\\u062f \\u062a\\u0644\\u0642\\u064a\\u0646\\u0627 \\u0647\\u0627\\u062a\\u0641\\u0643. \\u0634\\u0643\\u0631\\u0627 \\u0644\\u0643 \\u0639\\u0644\\u0649 \\u0648\\u062c\\u0648\\u062f\\u0643 \\u0645\\u0639\\u0646\\u0627.\",\"typing_on_settings\":\"on\",\"delay_in_reply\":\"1\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY PHONE REPLY', 'QUICK_REPLY_PHONE_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(134, 1, 19, '105940371572898', 'text', 'generic', 'location-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your location. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY LOCATION REPLY', 'QUICK_REPLY_LOCATION_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(135, 1, 19, '105940371572898', 'text', 'generic', 'birthday-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your birthday. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY BIRTHDAY REPLY', 'QUICK_REPLY_BIRTHDAY_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(136, 1, 19, '105940371572898', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0634\\u0643\\u0631\\u0627! \\u0625\\u0646\\u0647 \\u0644\\u0645\\u0646 \\u062f\\u0648\\u0627\\u0639\\u064a \\u0633\\u0631\\u0648\\u0631\\u064a \\u0627\\u0644\\u062a\\u062d\\u062f\\u062b \\u0645\\u0639\\u0643. \\u0633\\u064a\\u0631\\u062f \\u0639\\u0644\\u064a\\u0643 \\u0623\\u062d\\u062f \\u0623\\u0639\\u0636\\u0627\\u0621 \\u0641\\u0631\\u064a\\u0642\\u0646\\u0627 \\u0642\\u0631\\u064a\\u0628\\u064b\\u0627. \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u062a\\u0631\\u064a\\u062f \\u0627\\u0644\\u062f\\u0631\\u062f\\u0634\\u0629 \\u0645\\u0639\\u064a(\\u062c\\u0627\\u0643\\u0633\\u0627) \\u0645\\u0631\\u0629 \\u0623\\u062e\\u0631\\u0649 \\u060c \\u0641\\u0642\\u0637 \\u0627\\u0646\\u0642\\u0631 \\u0641\\u0648\\u0642 \\u0627\\u0644\\u0632\\u0631 \\u0623\\u062f\\u0646\\u0627\\u0647.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_BOT\",\"title\":\"\\u062a\\u062d\\u062f\\u062b \\u0645\\u0639 \\u062c\\u0627\\u0643\\u0633\\u0627\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}},\"2\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0627\\u0644\\u0631\\u062c\\u0627\\u0621 \\u0627\\u0644\\u0636\\u063a\\u0637 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0632\\u0631 \\u0627\\u0633\\u0641\\u0644 \\u0627\\u0644\\u0631\\u0633\\u0627\\u0644\\u0647 \\u0648 \\u062a\\u0631\\u0643 \\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641\\u0643 \\u0627\\u0644\\u0645\\u062d\\u0645\\u0648\\u0644 \\u0648 \\u0633\\u0648\\u0641 \\u064a\\u0642\\u0648\\u0645 \\u0627\\u062d\\u062f \\u0645\\u0645\\u062b\\u0644\\u0649 \\u062e\\u062f\\u0645\\u0647 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0628\\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0643 \\r\\n\\r\\n\",\"buttons\":[{\"type\":\"web_url\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/webview_builder\\/get_phone?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0636\\u063a\\u0637 \\u0647\\u0646\\u0627-\\u0627\\u062f\\u062e\\u0644 \\u0631\\u0642\\u0645 \\u0627\\u0644\\u0647\\u0627\\u062a\\u0641\"}]}},\"typing_on_settings\":\"off\",\"delay_in_reply\":\"10\"}}}', '', '', '', '', '', '', '', '1', 'CHAT WITH HUMAN TEMPLATE', 'YES_START_CHAT_WITH_HUMAN', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(137, 1, 19, '105940371572898', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0623\\u0646\\u0627 \\u0633\\u0639\\u064a\\u062f \\u0644\\u0639\\u0648\\u062f\\u062a\\u0643. \\u0633\\u0623\\u0628\\u0630\\u0644 \\u0642\\u0635\\u0627\\u0631\\u0649 \\u062c\\u0647\\u062f\\u064a \\u0644\\u0644\\u0625\\u062c\\u0627\\u0628\\u0629 \\u0639\\u0644\\u0649 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0623\\u0633\\u0626\\u0644\\u0629. \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u062a\\u0631\\u063a\\u0628 \\u0641\\u064a \\u0628\\u062f\\u0621 \\u0627\\u0644\\u062f\\u0631\\u062f\\u0634\\u0629 \\u0645\\u0639 \\u0639\\u0645\\u064a\\u0644 \\u0645\\u0631\\u0629 \\u0623\\u062e\\u0631\\u0649 \\u060c \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0628\\u0628\\u0633\\u0627\\u0637\\u0629 \\u0627\\u0644\\u0646\\u0642\\u0631 \\u0641\\u0648\\u0642 \\u0627\\u0644\\u0632\\u0631 \\u0623\\u062f\\u0646\\u0627\\u0647.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_HUMAN\",\"title\":\"\\u0627\\u0644\\u062f\\u0631\\u062f\\u0634\\u0629 \\u0645\\u0639 \\u0639\\u0645\\u064a\\u0644\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'CHAT WITH BOT TEMPLATE', 'YES_START_CHAT_WITH_BOT', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(138, 1, 19, '105940371572898', 'text', 'generic', 'get-started', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"generic_template\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"elements\":[{\"title\":\"\\u0627\\u0647\\u0644\\u0627 \\u0628\\u064a\\u0643 \\u0641\\u0649 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0628\\u0648\\u062a\",\"subtitle\":\"\\u0627\\u062e\\u062a\\u064a\\u0627\\u0631\\u0643 \\u0627\\u0644\\u0627\\u0645\\u062b\\u0644 \\u0644\\u0627\\u062f\\u0627\\u0631\\u0647 \\u0627\\u0639\\u0645\\u0627\\u0644\\u0643 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0633\\u0648\\u0634\\u064a\\u0627\\u0644 \\u0645\\u064a\\u062f\\u064a\\u0627\",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627241412178510.jpg\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0631\\u0633\\u0645\\u0649\"},{\"type\":\"postback\",\"payload\":\"GAXA Prices\",\"title\":\"\\u0627\\u0644\\u062e\\u0637\\u0637 \\u0648 \\u0627\\u0644\\u0627\\u0633\\u0639\\u0627\\u0631\"},{\"type\":\"postback\",\"payload\":\"Service and Details\",\"title\":\"\\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0648 \\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\"}]}],\"image_aspect_ratio\":\"square\"}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'GET STARTED', '', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(187, 1, 19, '105940371572898', 'text', 'generic', 'reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"quick_reply\",\"text\":\"Sorry!  #LEAD_USER_FIRST_NAME# I didn\'t get your meaning ,\\r\\nplease leave your phone number and our agent will call you \\r\\n\",\"quick_replies\":[{\"content_type\":\"user_phone_number\"}],\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'Comment not identified ', 'Comment not identified', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(207, 1, 19, '105940371572898', 'text', 'generic', 'reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"text\":\"Thank you  #LEAD_USER_FIRST_NAME# , Now you will recive our all new campaigns and offers\\r\\n\\r\\n\",\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'Subscirbe | Thank you', 'Subscirbe_Thank_you', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(210, 1, 19, '105940371572898', 'text', 'generic', 'reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Thanks! It is a pleasure talking you. One of our team member will reply you soon. If you want to chat with me again, just click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_HUMAN\",\"title\":\"Resume Chat with Bot\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'Chat with human', 'Chat with human', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(231, 1, 19, '105940371572898', 'text', 'generic', 'no match', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"generic_template\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"elements\":[{\"title\":\"Thanks to Contact GAXA\",\"subtitle\":\"GAXA team in your service\",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1620490823579638.jpg\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/gaxa-bot.com\"},\"buttons\":[{\"type\":\"phone_number\",\"payload\":\"+201021786576\",\"title\":\"Contact US\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/gaxa-bot.com?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"Official Website\"},{\"type\":\"web_url\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/webview_builder\\/get_phone?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"Leave Your Number\"}]}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'NO MATCH FOUND', '', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(233, 1, 23, '2085064648484866', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"You have been successfully unsubscribed from our list. It sad to see you go. It is not the same without you ! You can join back by clicking the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"RESUBSCRIBE_QUICK_BOXER\",\"title\":\"Resubscribe\"}]}}}}}', '', '', '', '', '', '', '', '1', 'UNSUBSCRIBE BOT', 'UNSUBSCRIBE_QUICK_BOXER', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(234, 1, 23, '2085064648484866', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Welcome back ! We have not seen you for a while. You will no longer miss our important updates.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"UNSUBSCRIBE_QUICK_BOXER\",\"title\":\"Unsubscribe\"}]}}}}}', '', '', '', '', '', '', '', '1', 'RESUBSCRIBE BOT', 'RESUBSCRIBE_QUICK_BOXER', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(235, 1, 23, '2085064648484866', 'text', 'generic', 'email-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your email. We will keep you updated. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY EMAIL REPLY', 'QUICK_REPLY_EMAIL_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(236, 1, 23, '2085064648484866', 'text', 'generic', 'phone-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your phone. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY PHONE REPLY', 'QUICK_REPLY_PHONE_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(237, 1, 23, '2085064648484866', 'text', 'generic', 'location-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your location. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY LOCATION REPLY', 'QUICK_REPLY_LOCATION_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(238, 1, 23, '2085064648484866', 'text', 'generic', 'birthday-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your birthday. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY BIRTHDAY REPLY', 'QUICK_REPLY_BIRTHDAY_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(239, 1, 23, '2085064648484866', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Thanks! It is a pleasure talking you. One of our team member will reply you soon. If you want to chat with me again, just click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_BOT\",\"title\":\"Resume Chat with Bot\"}]}}}}}', '', '', '', '', '', '', '', '1', 'CHAT WITH HUMAN', 'YES_START_CHAT_WITH_HUMAN', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(240, 1, 23, '2085064648484866', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"I am gald to have you back. I will try my best to answer all questions. If you want to start chat with human again you can simply click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_HUMAN\",\"title\":\"Chat with human\"}]}}}}}', '', '', '', '', '', '', '', '1', 'CHAT WITH BOT', 'YES_START_CHAT_WITH_BOT', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(241, 1, 23, '2085064648484866', 'text', 'generic', 'get-started', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Hi #LEAD_USER_FIRST_NAME#, Welcome to our page.\"}}}', '', '', '', '', '', '', '', '1', 'GET STARTED', '', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(242, 1, 23, '2085064648484866', 'text', 'generic', 'no match', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Sorry, we could not find any content to show. One of our team member will reply you soon.\"}}}', '', '', '', '', '', '', '', '1', 'NO MATCH FOUND', '', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(244, 1, 23, '2085064648484866', 'text', 'generic', 'reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"generic_template\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"elements\":[{\"title\":\"Thanks to contact us \",\"subtitle\":\"ProAtCoding Team in your service\",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1620440870139592.jpg\",\"default_action\":{\"type\":\"web_url\",\"url\":\"www.proatcoding.com\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"www.proatcoding.com?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"Official Website \"},{\"type\":\"phone_number\",\"payload\":\"+2-01118136665\",\"title\":\"Contact US\"},{\"type\":\"web_url\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/webview_builder\\/get_phone?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"Leave Your Number\"}]}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'General Pro at coding response', 'General Pro at coding response', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(245, 1, 19, '105940371572898', 'text', 'generic', 'reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"generic_template\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"elements\":[{\"title\":\"\\u0623\\u0647\\u0644\\u0627 \\u0628\\u064a\\u0643 \\u0641\\u0649 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0628\\u0648\\u062a \",\"subtitle\":\"\\u0641\\u0631\\u064a\\u0642 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0628\\u0648\\u062a \\u0641\\u062e\\u062f\\u0645\\u062a\\u0643 \",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627172534171427.png\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0631\\u0633\\u0645\\u0649\"},{\"type\":\"postback\",\"payload\":\"GAXA Prices\",\"title\":\"\\u0627\\u0644\\u062e\\u0637\\u0637 \\u0648 \\u0627\\u0644\\u0627\\u0633\\u0639\\u0627\\u0631\"},{\"type\":\"phone_number\",\"payload\":\"+20 1021786576\",\"title\":\"\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0646\\u0627 \"}]}],\"image_aspect_ratio\":\"square\"}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"1\"}},\"2\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0627\\u0634\\u062a\\u0631\\u0643 \\u0648 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0645\\u062c\\u0627\\u0646\\u0627 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0645\\u062c\\u0627\\u0646\\u064a\\u0647 \\r\\n\\ud83d\\udc49 \\u0628\\u0645\\u062c\\u0631\\u062f \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0628\\u064a\\u062a\\u0645 \\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\\u0643 \\u0641\\u0627\\u0644\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0645\\u062c\\u0627\\u0646\\u064a\\u0647\\ud83d\\udc48\\r\\n\\r\\n\\r\\n\",\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646-\\u0645\\u062c\\u0627\\u0646\\u0627\\u064b\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/Documentation\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0634\\u0631\\u062d \\u0643\\u064a\\u0641\\u064a\\u0647 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\"},{\"type\":\"phone_number\",\"payload\":\"+20 1021786576\",\"title\":\"\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0646\\u0627\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"5\"}}}', '', '', '', '', '', '', '', '1', 'Generic comment replay for GAXA', 'Generic comment replay for GAXA', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(246, 39, 24, '106275574983574', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"You have been successfully unsubscribed from our list. It sad to see you go. It is not the same without you ! You can join back by clicking the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"RESUBSCRIBE_QUICK_BOXER\",\"title\":\"Resubscribe\"}]}}}}}', '', '', '', '', '', '', '', '1', 'UNSUBSCRIBE BOT', 'UNSUBSCRIBE_QUICK_BOXER', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(247, 39, 24, '106275574983574', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Welcome back ! We have not seen you for a while. You will no longer miss our important updates.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"UNSUBSCRIBE_QUICK_BOXER\",\"title\":\"Unsubscribe\"}]}}}}}', '', '', '', '', '', '', '', '1', 'RESUBSCRIBE BOT', 'RESUBSCRIBE_QUICK_BOXER', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(248, 39, 24, '106275574983574', 'text', 'generic', 'email-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your email. We will keep you updated. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY EMAIL REPLY', 'QUICK_REPLY_EMAIL_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(249, 39, 24, '106275574983574', 'text', 'generic', 'phone-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your phone. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY PHONE REPLY', 'QUICK_REPLY_PHONE_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(250, 39, 24, '106275574983574', 'text', 'generic', 'location-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your location. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY LOCATION REPLY', 'QUICK_REPLY_LOCATION_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(251, 39, 24, '106275574983574', 'text', 'generic', 'birthday-quick-reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your birthday. Thank you for being with us.\"}}}', '', '', '', '', '', '', '', '1', 'QUICK REPLY BIRTHDAY REPLY', 'QUICK_REPLY_BIRTHDAY_REPLY_BOT', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(252, 39, 24, '106275574983574', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Thanks! It is a pleasure talking you. One of our team member will reply you soon. If you want to chat with me again, just click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_BOT\",\"title\":\"Resume Chat with Bot\"}]}}}}}', '', '', '', '', '', '', '', '1', 'CHAT WITH HUMAN', 'YES_START_CHAT_WITH_HUMAN', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(253, 39, 24, '106275574983574', 'text', 'generic', 'post-back', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"I am gald to have you back. I will try my best to answer all questions. If you want to start chat with human again you can simply click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_HUMAN\",\"title\":\"Chat with human\"}]}}}}}', '', '', '', '', '', '', '', '1', 'CHAT WITH BOT', 'YES_START_CHAT_WITH_BOT', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(254, 39, 24, '106275574983574', 'text', 'generic', 'get-started', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Hi #LEAD_USER_FIRST_NAME#, Welcome to our page.\"}}}', '', '', '', '', '', '', '', '1', 'GET STARTED', '', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(255, 39, 24, '106275574983574', 'text', 'generic', 'no match', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Sorry, we could not find any content to show. One of our team member will reply you soon.\"}}}', '', '', '', '', '', '', '', '1', 'NO MATCH FOUND', '', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(256, 39, 24, '106275574983574', 'text', 'generic', 'reply', 'wqewq', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"text\":\"dwq\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'wed', '', '0000-00-00 00:00:00', '0', '', 0, 'general', 0),
(257, 1, 19, '105940371572898', 'text', 'generic', 'reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"carousel\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"elements\":[{\"title\":\"Free\",\"subtitle\":\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0645\\u062c\\u0627\\u0646\\u0627 \",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627175822133625.jpg\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646\"}]},{\"title\":\"Lite\",\"subtitle\":\"\\u062e\\u0637\\u0647 \\u0627\\u0635\\u062d\\u0627\\u0628 \\u0627\\u0644\\u0639\\u0645\\u0627\\u0644 \\u0627\\u0644\\u0645\\u062a\\u0648\\u0633\\u0637\\u0647 \\u0648 \\u0627\\u0644\\u0645\\u0633\\u0648\\u0642\\u064a\\u0646 \",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627174287154293.png\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\"}]},{\"title\":\"Plus\",\"subtitle\":\"\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0645\\u0633\\u0648\\u0642\\u064a\\u0646 \\u0627\\u0644\\u0645\\u062d\\u062a\\u0631\\u0641\\u064a\\u0646 \",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627174446109203.jpg\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\"}]},{\"title\":\"Premium\",\"subtitle\":\"\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0627\\u062a \\u0648 \\u0627\\u0644\\u0627\\u0639\\u0645\\u0627\\u0644 \\u0627\\u0644\\u0636\\u062e\\u0645\\u0647\",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627174530291021.jpg\",\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0623\\u0644\\u0627\\u0646\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\"}]}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'GAXA Prices ', 'GAXA Prices', '0000-00-00 00:00:00', '1', '', 0, 'general', 0),
(258, 1, 19, '105940371572898', 'text', 'generic', 'reply', '', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0645\\u0645\\u064a\\u0632\\u0627\\u062a Gaxa Bots\\r\\n\\u2705\\u0627\\u0644\\u0631\\u062f \\u0639\\u0644\\u064a \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0628\\u0631\\u0633\\u0627\\u0626\\u0644 \\u0645\\u0639\\u062f\\u0629 \\u0645\\u0633\\u0628\\u0642\\u0627\\r\\n\\u2705\\u0639\\u0645\\u0644 \\u0645\\u0627\\u062a\\u062c\\u0631 \\u0645\\u062a\\u0643\\u0627\\u0645\\u0644 \\u0639\\u0644\\u064a \\u0645\\u0627\\u0633\\u0646\\u062c\\u0631 \\u0628\\u0645\\u0646\\u062a\\u0627\\u062c\\u0627\\u062a \\u0645\\u062e\\u062a\\u0644\\u0641\\u0647 \\u0627\\u062a\\u0648\\u0645\\u0627\\u062a\\u064a\\u0643\\u064a\\r\\n\\u2705\\u0639\\u0645\\u0644 \\u0641\\u0648\\u0631\\u0645 \\u0644\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0644\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0628\\u064a\\u0627\\u0646\\u0627\\u062a\\u0647 \\u0639\\u0644\\u064a \\u0645\\u0627\\u0633\\u0646\\u062c\\u0631\\r\\n\\u2705\\u0627\\u0644\\u0631\\u062f \\u0639\\u0644\\u064a \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642\\u0627\\u062a \\u0631\\u062f \\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0639\\u0644\\u064a \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0643\\u0644\\u0645\\u0627\\u062a \\u0627\\u0644\\u0645\\u0641\\u062a\\u0627\\u062d\\u064a\\u0629 \\u0627\\u0644 \\u0628\\u064a\\u0643\\u062a\\u0628\\u0647\\u0627 \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0627\\u0648 \\u062a\\u0639\\u0644\\u064a\\u0642\\u0627\\u062a  \\u0645\\u0648\\u062d\\u062f\\u0647 \\u0644\\u0644\\u0643\\u0644 \\u0627\\u0648 \\u0627\\u0644\\u0627\\u062a\\u0646\\u064a\\u0646 \\u0645\\u0639 \\u0628\\u0639\\u0636\\r\\n\\u2705 \\u0639\\u0645\\u0644 \\u0645\\u0646\\u0634\\u0646 \\u0644\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0641\\u064a \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642\\u0627\\u062a \\u0627\\u062a\\u0648\\u0645\\u0627\\u062a\\u064a\\u0643\\r\\n\\u2705 \\u0627\\u0631\\u0633\\u0627\\u0644 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u0644\\u0643\\u0644 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u062d\\u0633\\u0628 \\u0643\\u0644 \\u0643\\u0644\\u0645\\u0629 \\u0628\\u064a\\u0643\\u062a\\u0628\\u0647\\u0627 \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644\\r\\n\\u2705 \\u062a\\u0642\\u062f\\u0631 \\u062a\\u0634\\u063a\\u0644 \\u0627\\u0644\\u0628\\u0648\\u062a \\u0639\\u0644\\u064a \\u0643\\u0644 \\u0627\\u0644\\u0628\\u0648\\u0633\\u062a\\u0627\\u062a \\u0627\\u0644\\u064a \\u0639\\u0644\\u064a \\u0627\\u0644\\u0635\\u0641\\u062d\\u0629\\r\\n\\u2705 \\u064a\\u0645\\u0643\\u0646\\u0643 \\u062c\\u062f\\u0648\\u0644\\u0629 \\u0627\\u0644\\u0628\\u0648\\u0633\\u062a\\u0627\\u062a \\u0648 \\u0646\\u0634\\u0631\\u0647\\u0627 \\u0639\\u0644\\u064a \\u062c\\u0645\\u064a\\u0639 \\u0645\\u0648\\u0627\\u0642 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\r\\n\\ud83d\\udc49 \\u0627\\u063a\\u062a\\u0645 \\u0627\\u0644\\u0641\\u0631\\u0635\\u0647 \\u0648 \\u062f\\u0644\\u0648\\u0642\\u062a\\u064a \\u0648\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0645\\u062c\\u0627\\u0646\\u0627 \\u0627\\u064a\\u0648\\u0647 \\u0628\\u0628\\u0644\\u0627\\u0627\\u0627\\u0627\\u0627\\u0634\\u0628\\u0645\\u062c\\u0631 \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0628\\u064a\\u062a\\u0645 \\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\\u0643 \\u0641\\u0627\\u0644\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0645\\u062c\\u0627\\u0646\\u064a\\u0647\\r\\n\\r\\n\",\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646-\\u0645\\u062c\\u0627\\u0646\\u0627\\u064b\"}]}},\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\"}}}', '', '', '', '', '', '', '', '1', 'Service and Details', 'Service and Details', '0000-00-00 00:00:00', '1', '', 0, 'general', 0);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_broadcast_contact_group`
--

CREATE TABLE `messenger_bot_broadcast_contact_group` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `label_id` varchar(250) NOT NULL,
  `deleted` enum('0','1') DEFAULT '0',
  `unsubscribe` enum('0','1') NOT NULL DEFAULT '0',
  `invisible` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messenger_bot_broadcast_contact_group`
--

INSERT INTO `messenger_bot_broadcast_contact_group` (`id`, `page_id`, `group_name`, `user_id`, `label_id`, `deleted`, `unsubscribe`, `invisible`) VALUES
(27, 19, 'SystemInvisible01', 1, '3881177071931233', '0', '0', '1'),
(28, 19, 'Unsubscribe', 1, '3901533493240258', '0', '1', '0'),
(29, 23, 'Unsubscribe', 1, '3975637079146386', '0', '1', '0'),
(30, 23, 'SystemInvisible01', 1, '3711398192311965', '0', '0', '1'),
(31, 24, 'Unsubscribe', 39, '4302783046448271', '0', '1', '0'),
(32, 24, 'SystemInvisible01', 39, '4142062542525481', '0', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_broadcast_serial`
--

CREATE TABLE `messenger_bot_broadcast_serial` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `broadcast_type` enum('Non Promo','24H Promo','OTN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Non Promo',
  `message_tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NON_PROMOTIONAL_SUBSCRIPTION',
  `page_id` int(11) NOT NULL,
  `fb_page_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `excluded_label_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_names` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_time_zone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_locale` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` enum('text','image','audio','video','file','quick reply','text with buttons','generic template','carousel','list','media') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `buttons` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postback_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otn_postback_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'otn_postback table id',
  `created_at` datetime NOT NULL,
  `schedule_type` enum('now','later') COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_time` datetime NOT NULL,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_count` int(11) NOT NULL,
  `posting_status` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_try_again` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `last_try_error_count` int(11) NOT NULL,
  `total_thread` int(11) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `successfully_delivered` int(11) NOT NULL,
  `successfully_opened` int(11) NOT NULL,
  `successfully_clicked` int(11) NOT NULL,
  `completed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_broadcast_serial_send`
--

CREATE TABLE `messenger_bot_broadcast_serial_send` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `subscribe_id` varchar(255) NOT NULL,
  `otn_token` varchar(255) NOT NULL,
  `subscriber_auto_id` int(11) NOT NULL,
  `subscriber_name` varchar(255) NOT NULL,
  `subscriber_lastname` varchar(200) NOT NULL,
  `sent_time` datetime NOT NULL,
  `delivered` enum('0','1') NOT NULL DEFAULT '0',
  `delivery_time` datetime NOT NULL,
  `opened` enum('0','1') NOT NULL DEFAULT '0',
  `open_time` datetime NOT NULL,
  `clicked` enum('0','1') NOT NULL DEFAULT '0',
  `click_ref` varchar(200) NOT NULL,
  `click_time` datetime NOT NULL,
  `processed` enum('0','1') NOT NULL DEFAULT '0',
  `error_message` tinytext NOT NULL,
  `message_sent_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_domain_whitelist`
--

CREATE TABLE `messenger_bot_domain_whitelist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `messenger_bot_user_info_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `domain` tinytext NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messenger_bot_domain_whitelist`
--

INSERT INTO `messenger_bot_domain_whitelist` (`id`, `user_id`, `messenger_bot_user_info_id`, `page_id`, `domain`, `created_at`) VALUES
(1, 1, 7, 19, 'https://www.gaxa-bot.com', '2021-03-18 18:53:20'),
(2, 1, 7, 19, 'https://www.gaxa-bot.com', '2021-03-18 18:53:20'),
(3, 1, 7, 19, 'https://www.gaxa-bot.com', '2021-03-18 18:53:21'),
(4, 1, 7, 19, 'https://www.gaxa-bot.com/#pricing', '2021-03-18 23:28:55'),
(6, 1, 7, 19, 'https://www.facebook.com', '2021-04-20 00:29:15'),
(7, 1, 7, 19, 'https://gaxa-bot.com?subscriber_id=#SUBSCRIBER_ID_REPLACE#', '2021-05-02 16:51:56'),
(8, 1, 7, 23, 'https://www.gaxa-bot.com', '2021-05-08 04:40:26'),
(9, 1, 7, 23, 'www.proatcoding.com?subscriber_id=#SUBSCRIBER_ID_REPLACE#', '2021-05-08 04:42:31'),
(10, 1, 7, 23, 'https://gaxa-bot.com', '2021-05-26 19:53:30'),
(11, 1, 7, 19, 'https://gaxa-bot.com', '2021-06-12 19:09:00'),
(12, 1, 7, 19, 'https://gaxa-bot.com', '2021-06-12 19:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_drip_campaign`
--

CREATE TABLE `messenger_bot_drip_campaign` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(250) NOT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_content` text NOT NULL,
  `message_content_hourly` text NOT NULL,
  `created_at` datetime NOT NULL,
  `last_sent_at` datetime NOT NULL,
  `drip_type` enum('default','messenger_bot_engagement_checkbox','messenger_bot_engagement_send_to_msg','messenger_bot_engagement_mme','messenger_bot_engagement_messenger_codes','messenger_bot_engagement_2way_chat_plugin','custom') NOT NULL DEFAULT 'default',
  `campaign_type` enum('messenger','email','sms') NOT NULL DEFAULT 'messenger',
  `engagement_table_id` int(11) NOT NULL,
  `between_start` varchar(50) NOT NULL DEFAULT '00:00',
  `between_end` varchar(50) NOT NULL DEFAULT '23:59',
  `timezone` varchar(250) NOT NULL,
  `message_tag` varchar(255) NOT NULL,
  `total_unsubscribed` int(11) NOT NULL,
  `last_unsubscribed_at` datetime NOT NULL,
  `external_sequence_sms_api_id` varchar(50) NOT NULL,
  `external_sequence_email_api_id` varchar(50) NOT NULL,
  `visual_flow_campaign_id` int(11) NOT NULL,
  `visual_flow_sequence_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_drip_campaign_assign`
--

CREATE TABLE `messenger_bot_drip_campaign_assign` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_table_id` int(11) NOT NULL,
  `subscribe_id` varchar(30) NOT NULL COMMENT 'fb id',
  `messenger_bot_drip_campaign_id` int(11) NOT NULL,
  `drip_type` enum('default','messenger_bot_engagement_checkbox','messenger_bot_engagement_send_to_msg','messenger_bot_engagement_mme','messenger_bot_engagement_messenger_codes','messenger_bot_engagement_2way_chat_plugin','custom') NOT NULL DEFAULT 'default',
  `messenger_bot_drip_last_completed_day` int(11) NOT NULL,
  `messenger_bot_drip_last_completed_hour` float NOT NULL,
  `messenger_bot_drip_is_toatally_complete` enum('0','1') NOT NULL DEFAULT '0',
  `messenger_bot_drip_is_toatally_complete_hourly` enum('0','1') NOT NULL DEFAULT '0',
  `messenger_bot_drip_last_sent_at` datetime NOT NULL,
  `messenger_bot_drip_initial_date` datetime NOT NULL,
  `last_processing_started_at` datetime NOT NULL,
  `last_processing_started_at_hourly` datetime NOT NULL,
  `messenger_bot_drip_processing_status` enum('0','1') NOT NULL DEFAULT '0',
  `messenger_bot_drip_processing_status_hourly` enum('0','1') NOT NULL DEFAULT '0',
  `is_unsubscribed` enum('0','1') NOT NULL DEFAULT '0',
  `unsubscribed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_drip_report`
--

CREATE TABLE `messenger_bot_drip_report` (
  `id` int(11) NOT NULL,
  `messenger_bot_drip_campaign_id` int(11) NOT NULL,
  `messenger_bot_subscriber_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscribe_id` varchar(250) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `last_completed_day` int(11) NOT NULL,
  `last_completed_hour` int(11) NOT NULL,
  `is_sent` enum('0','1') NOT NULL DEFAULT '1',
  `is_opened` enum('0','1') NOT NULL DEFAULT '0',
  `is_delivered` enum('0','1') NOT NULL DEFAULT '0',
  `sent_at` datetime NOT NULL,
  `delivered_at` datetime NOT NULL,
  `opened_at` datetime NOT NULL,
  `sent_response` tinytext NOT NULL,
  `delivered_response` tinytext NOT NULL,
  `last_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_engagement_checkbox`
--

CREATE TABLE `messenger_bot_engagement_checkbox` (
  `id` int(11) NOT NULL,
  `domain_code` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL COMMENT 'auto id',
  `domain_name` varchar(255) NOT NULL,
  `btn_size` enum('small','medium','large','xlarge') NOT NULL DEFAULT 'medium',
  `skin` enum('light','dark') NOT NULL DEFAULT 'light' COMMENT 'light=black, dark=white',
  `center_align` enum('true','false') NOT NULL DEFAULT 'true',
  `button_click_success_message` tinytext NOT NULL,
  `validation_error` tinytext NOT NULL,
  `label_ids` varchar(250) NOT NULL COMMENT 'comma seperated,messenger_bot_broadcast_contact_group.id',
  `reference` varchar(250) NOT NULL,
  `template_id` int(11) NOT NULL COMMENT 'messenger_bot_postback.id',
  `language` varchar(200) NOT NULL DEFAULT 'en_US',
  `created_at` datetime NOT NULL,
  `redirect` enum('0','1') NOT NULL DEFAULT '0',
  `add_button_with_message` enum('0','1') NOT NULL DEFAULT '0',
  `button_with_message_content` tinytext NOT NULL COMMENT 'json',
  `success_redirect_url` tinytext NOT NULL,
  `for_woocommerce` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_engagement_checkbox_reply`
--

CREATE TABLE `messenger_bot_engagement_checkbox_reply` (
  `id` int(11) NOT NULL,
  `user_ref` varchar(20) NOT NULL,
  `checkbox_plugin_id` int(11) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `optin_time` datetime NOT NULL,
  `for_woocommerce` enum('0','1') NOT NULL DEFAULT '0',
  `wc_session_unique_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_persistent_menu`
--

CREATE TABLE `messenger_bot_persistent_menu` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(100) NOT NULL,
  `locale` varchar(20) NOT NULL DEFAULT 'default',
  `item_json` longtext NOT NULL,
  `composer_input_disabled` enum('0','1') NOT NULL DEFAULT '0',
  `poskback_id_json` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_postback`
--

CREATE TABLE `messenger_bot_postback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `postback_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `use_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `messenger_bot_table_id` int(11) NOT NULL,
  `bot_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_template` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_jsoncode` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_for` enum('reply_message','unsubscribe','resubscribe','email-quick-reply','phone-quick-reply','location-quick-reply','birthday-quick-reply','chat-with-human','chat-with-bot') COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` int(11) NOT NULL,
  `inherit_from_template` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `broadcaster_labels` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'comma separated',
  `drip_campaign_id` int(11) NOT NULL,
  `visual_flow_type` enum('flow','general') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `visual_flow_campaign_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messenger_bot_postback`
--

INSERT INTO `messenger_bot_postback` (`id`, `user_id`, `postback_id`, `page_id`, `use_status`, `status`, `messenger_bot_table_id`, `bot_name`, `is_template`, `template_jsoncode`, `template_name`, `template_for`, `template_id`, `inherit_from_template`, `broadcaster_labels`, `drip_campaign_id`, `visual_flow_type`, `visual_flow_campaign_id`) VALUES
(97, 1, 'UNSUBSCRIBE_QUICK_BOXER', 19, '0', '1', 130, 'UNSUBSCRIBE TEMPLATE', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0644\\u0642\\u062f \\u062a\\u0645 \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\\u0643 \\u0628\\u0646\\u062c\\u0627\\u062d \\u0645\\u0646 \\u0642\\u0627\\u0626\\u0645\\u062a\\u0646\\u0627. \\u0645\\u0646 \\u0627\\u0644\\u0645\\u062d\\u0632\\u0646 \\u0623\\u0646 \\u0623\\u0631\\u0627\\u0643 \\u062a\\u0630\\u0647\\u0628. \\u0627\\u0644\\u0623\\u0645\\u0631 \\u0644\\u064a\\u0633 \\u0647\\u0648 \\u0646\\u0641\\u0633\\u0647 \\u0628\\u062f\\u0648\\u0646\\u0643! \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0627\\u0644\\u0627\\u0646\\u0636\\u0645\\u0627\\u0645 \\u0645\\u0631\\u0629 \\u0623\\u062e\\u0631\\u0649 \\u0639\\u0646 \\u0637\\u0631\\u064a\\u0642 \\u0627\\u0644\\u0646\\u0642\\u0631 \\u0641\\u0648\\u0642 \\u0627\\u0644\\u0632\\u0631 \\u0623\\u062f\\u0646\\u0627\\u0647.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"RESUBSCRIBE_QUICK_BOXER\",\"title\":\"\\u0645\\u062a\\u0627\\u0628\\u0639\\u0647\"}]}},\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\"}}}', 'UNSUBSCRIBE TEMPLATE', 'unsubscribe', 0, '0', '', 0, 'general', 0),
(98, 1, 'RESUBSCRIBE_QUICK_BOXER', 19, '0', '1', 131, 'RESUBSCRIBE TEMPLATE', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0639\\u0648\\u062f\\u062a\\u0643 ! \\u0644\\u0645 \\u0646\\u0631\\u0627\\u0643 \\u0645\\u0646\\u0630 \\u0641\\u062a\\u0631\\u0629. \\u0644\\u0646 \\u062a\\u0641\\u0648\\u062a\\u0643 \\u062a\\u062d\\u062f\\u064a\\u062b\\u0627\\u062a\\u0646\\u0627 \\u0627\\u0644\\u0645\\u0647\\u0645\\u0629 \\u0628\\u0639\\u062f \\u0627\\u0644\\u0622\\u0646.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"UNSUBSCRIBE_QUICK_BOXER\",\"title\":\"\\u0627\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0644\\u0645\\u062a\\u0627\\u0628\\u0639\\u0647\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', 'RESUBSCRIBE TEMPLATE', 'resubscribe', 0, '0', '', 0, 'general', 0),
(99, 1, 'QUICK_REPLY_EMAIL_REPLY_BOT', 19, '0', '1', 132, 'QUICK REPLY EMAIL REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your email. We will keep you updated. Thank you for being with us.\"}}}', 'QUICK REPLY EMAIL REPLY', 'email-quick-reply', 0, '0', '', 0, 'general', 0),
(100, 1, 'QUICK_REPLY_PHONE_REPLY_BOT', 19, '0', '1', 133, 'QUICK REPLY PHONE REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"text\":\"\\u0634\\u0643\\u0631\\u0627 \\u060c \\u0644\\u0642\\u062f \\u062a\\u0644\\u0642\\u064a\\u0646\\u0627 \\u0647\\u0627\\u062a\\u0641\\u0643. \\u0634\\u0643\\u0631\\u0627 \\u0644\\u0643 \\u0639\\u0644\\u0649 \\u0648\\u062c\\u0648\\u062f\\u0643 \\u0645\\u0639\\u0646\\u0627.\",\"typing_on_settings\":\"on\",\"delay_in_reply\":\"1\"}}}', 'QUICK REPLY PHONE REPLY', 'phone-quick-reply', 0, '0', '', 0, 'general', 0),
(101, 1, 'QUICK_REPLY_LOCATION_REPLY_BOT', 19, '0', '1', 134, 'QUICK REPLY LOCATION REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your location. Thank you for being with us.\"}}}', 'QUICK REPLY LOCATION REPLY', 'location-quick-reply', 0, '0', '', 0, 'general', 0),
(102, 1, 'QUICK_REPLY_BIRTHDAY_REPLY_BOT', 19, '0', '1', 135, 'QUICK REPLY BIRTHDAY REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your birthday. Thank you for being with us.\"}}}', 'QUICK REPLY BIRTHDAY REPLY', 'birthday-quick-reply', 0, '0', '', 0, 'general', 0),
(103, 1, 'YES_START_CHAT_WITH_HUMAN', 19, '0', '1', 136, 'CHAT WITH HUMAN TEMPLATE', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0634\\u0643\\u0631\\u0627! \\u0625\\u0646\\u0647 \\u0644\\u0645\\u0646 \\u062f\\u0648\\u0627\\u0639\\u064a \\u0633\\u0631\\u0648\\u0631\\u064a \\u0627\\u0644\\u062a\\u062d\\u062f\\u062b \\u0645\\u0639\\u0643. \\u0633\\u064a\\u0631\\u062f \\u0639\\u0644\\u064a\\u0643 \\u0623\\u062d\\u062f \\u0623\\u0639\\u0636\\u0627\\u0621 \\u0641\\u0631\\u064a\\u0642\\u0646\\u0627 \\u0642\\u0631\\u064a\\u0628\\u064b\\u0627. \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u062a\\u0631\\u064a\\u062f \\u0627\\u0644\\u062f\\u0631\\u062f\\u0634\\u0629 \\u0645\\u0639\\u064a(\\u062c\\u0627\\u0643\\u0633\\u0627) \\u0645\\u0631\\u0629 \\u0623\\u062e\\u0631\\u0649 \\u060c \\u0641\\u0642\\u0637 \\u0627\\u0646\\u0642\\u0631 \\u0641\\u0648\\u0642 \\u0627\\u0644\\u0632\\u0631 \\u0623\\u062f\\u0646\\u0627\\u0647.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_BOT\",\"title\":\"\\u062a\\u062d\\u062f\\u062b \\u0645\\u0639 \\u062c\\u0627\\u0643\\u0633\\u0627\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}},\"2\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0627\\u0644\\u0631\\u062c\\u0627\\u0621 \\u0627\\u0644\\u0636\\u063a\\u0637 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0632\\u0631 \\u0627\\u0633\\u0641\\u0644 \\u0627\\u0644\\u0631\\u0633\\u0627\\u0644\\u0647 \\u0648 \\u062a\\u0631\\u0643 \\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641\\u0643 \\u0627\\u0644\\u0645\\u062d\\u0645\\u0648\\u0644 \\u0648 \\u0633\\u0648\\u0641 \\u064a\\u0642\\u0648\\u0645 \\u0627\\u062d\\u062f \\u0645\\u0645\\u062b\\u0644\\u0649 \\u062e\\u062f\\u0645\\u0647 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0628\\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0643 \\r\\n\\r\\n\",\"buttons\":[{\"type\":\"web_url\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/webview_builder\\/get_phone?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0636\\u063a\\u0637 \\u0647\\u0646\\u0627-\\u0627\\u062f\\u062e\\u0644 \\u0631\\u0642\\u0645 \\u0627\\u0644\\u0647\\u0627\\u062a\\u0641\"}]}},\"typing_on_settings\":\"off\",\"delay_in_reply\":\"10\"}}}', 'CHAT WITH HUMAN TEMPLATE', 'chat-with-human', 0, '0', '', 0, 'general', 0),
(104, 1, 'YES_START_CHAT_WITH_BOT', 19, '0', '1', 137, 'CHAT WITH BOT TEMPLATE', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0623\\u0646\\u0627 \\u0633\\u0639\\u064a\\u062f \\u0644\\u0639\\u0648\\u062f\\u062a\\u0643. \\u0633\\u0623\\u0628\\u0630\\u0644 \\u0642\\u0635\\u0627\\u0631\\u0649 \\u062c\\u0647\\u062f\\u064a \\u0644\\u0644\\u0625\\u062c\\u0627\\u0628\\u0629 \\u0639\\u0644\\u0649 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0623\\u0633\\u0626\\u0644\\u0629. \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u062a\\u0631\\u063a\\u0628 \\u0641\\u064a \\u0628\\u062f\\u0621 \\u0627\\u0644\\u062f\\u0631\\u062f\\u0634\\u0629 \\u0645\\u0639 \\u0639\\u0645\\u064a\\u0644 \\u0645\\u0631\\u0629 \\u0623\\u062e\\u0631\\u0649 \\u060c \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0628\\u0628\\u0633\\u0627\\u0637\\u0629 \\u0627\\u0644\\u0646\\u0642\\u0631 \\u0641\\u0648\\u0642 \\u0627\\u0644\\u0632\\u0631 \\u0623\\u062f\\u0646\\u0627\\u0647.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_HUMAN\",\"title\":\"\\u0627\\u0644\\u062f\\u0631\\u062f\\u0634\\u0629 \\u0645\\u0639 \\u0639\\u0645\\u064a\\u0644\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', 'CHAT WITH BOT TEMPLATE', 'chat-with-bot', 0, '0', '', 0, 'general', 0),
(138, 1, 'Comment not identified', 19, '1', '1', 187, 'Comment not identified ', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"quick_reply\",\"text\":\"Sorry!  #LEAD_USER_FIRST_NAME# I didn\'t get your meaning ,\\r\\nplease leave your phone number and our agent will call you \\r\\n\",\"quick_replies\":[{\"content_type\":\"user_phone_number\"}],\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', 'Comment not identified ', 'reply_message', 0, '0', '', 0, 'general', 0),
(153, 1, 'Subscirbe_Thank_you', 19, '1', '1', 207, 'Subscirbe | Thank you', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"text\":\"Thank you  #LEAD_USER_FIRST_NAME# , Now you will recive our all new campaigns and offers\\r\\n\\r\\n\",\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', 'Subscirbe | Thank you', 'reply_message', 0, '0', '', 0, 'general', 0),
(156, 1, 'Chat with human', 19, '1', '1', 210, 'Chat with human', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Thanks! It is a pleasure talking you. One of our team member will reply you soon. If you want to chat with me again, just click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_HUMAN\",\"title\":\"Resume Chat with Bot\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', 'Chat with human', 'reply_message', 0, '0', '', 0, 'general', 0),
(167, 1, 'UNSUBSCRIBE_QUICK_BOXER', 23, '0', '1', 233, 'UNSUBSCRIBE BOT', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"You have been successfully unsubscribed from our list. It sad to see you go. It is not the same without you ! You can join back by clicking the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"RESUBSCRIBE_QUICK_BOXER\",\"title\":\"Resubscribe\"}]}}}}}', 'UNSUBSCRIBE TEMPLATE', 'unsubscribe', 0, '0', '', 0, 'general', 0),
(168, 1, 'RESUBSCRIBE_QUICK_BOXER', 23, '0', '1', 234, 'RESUBSCRIBE BOT', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Welcome back ! We have not seen you for a while. You will no longer miss our important updates.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"UNSUBSCRIBE_QUICK_BOXER\",\"title\":\"Unsubscribe\"}]}}}}}', 'RESUBSCRIBE TEMPLATE', 'resubscribe', 0, '0', '', 0, 'general', 0),
(169, 1, 'QUICK_REPLY_EMAIL_REPLY_BOT', 23, '0', '1', 235, 'QUICK REPLY EMAIL REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your email. We will keep you updated. Thank you for being with us.\"}}}', 'QUICK REPLY EMAIL REPLY', 'email-quick-reply', 0, '0', '', 0, 'general', 0),
(170, 1, 'QUICK_REPLY_PHONE_REPLY_BOT', 23, '0', '1', 236, 'QUICK REPLY PHONE REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your phone. Thank you for being with us.\"}}}', 'QUICK REPLY PHONE REPLY', 'phone-quick-reply', 0, '0', '', 0, 'general', 0),
(171, 1, 'QUICK_REPLY_LOCATION_REPLY_BOT', 23, '0', '1', 237, 'QUICK REPLY LOCATION REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your location. Thank you for being with us.\"}}}', 'QUICK REPLY LOCATION REPLY', 'location-quick-reply', 0, '0', '', 0, 'general', 0),
(172, 1, 'QUICK_REPLY_BIRTHDAY_REPLY_BOT', 23, '0', '1', 238, 'QUICK REPLY BIRTHDAY REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your birthday. Thank you for being with us.\"}}}', 'QUICK REPLY BIRTHDAY REPLY', 'birthday-quick-reply', 0, '0', '', 0, 'general', 0),
(173, 1, 'YES_START_CHAT_WITH_HUMAN', 23, '0', '1', 239, 'CHAT WITH HUMAN', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Thanks! It is a pleasure talking you. One of our team member will reply you soon. If you want to chat with me again, just click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_BOT\",\"title\":\"Resume Chat with Bot\"}]}}}}}', 'CHAT WITH HUMAN TEMPLATE', 'chat-with-human', 0, '0', '', 0, 'general', 0),
(174, 1, 'YES_START_CHAT_WITH_BOT', 23, '0', '1', 240, 'RESUBSCRIBE BOT', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"I am gald to have you back. I will try my best to answer all questions. If you want to start chat with human again you can simply click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_HUMAN\",\"title\":\"Chat with human\"}]}}}}}', 'CHAT WITH BOT TEMPLATE', 'chat-with-bot', 0, '0', '', 0, 'general', 0),
(176, 1, 'General Pro at coding response', 23, '1', '1', 244, 'General Pro at coding response', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"generic_template\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"elements\":[{\"title\":\"Thanks to contact us \",\"subtitle\":\"ProAtCoding Team in your service\",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1620440870139592.jpg\",\"default_action\":{\"type\":\"web_url\",\"url\":\"www.proatcoding.com\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"www.proatcoding.com?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"Official Website \"},{\"type\":\"phone_number\",\"payload\":\"+2-01118136665\",\"title\":\"Contact US\"},{\"type\":\"web_url\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/webview_builder\\/get_phone?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"Leave Your Number\"}]}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', 'General Pro at coding response', 'reply_message', 0, '0', '', 0, 'general', 0),
(177, 1, 'Generic comment replay for GAXA', 19, '1', '1', 245, 'Generic comment replay for GAXA', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"generic_template\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"elements\":[{\"title\":\"\\u0623\\u0647\\u0644\\u0627 \\u0628\\u064a\\u0643 \\u0641\\u0649 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0628\\u0648\\u062a \",\"subtitle\":\"\\u0641\\u0631\\u064a\\u0642 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0628\\u0648\\u062a \\u0641\\u062e\\u062f\\u0645\\u062a\\u0643 \",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627172534171427.png\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0631\\u0633\\u0645\\u0649\"},{\"type\":\"postback\",\"payload\":\"GAXA Prices\",\"title\":\"\\u0627\\u0644\\u062e\\u0637\\u0637 \\u0648 \\u0627\\u0644\\u0627\\u0633\\u0639\\u0627\\u0631\"},{\"type\":\"phone_number\",\"payload\":\"+20 1021786576\",\"title\":\"\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0646\\u0627 \"}]}],\"image_aspect_ratio\":\"square\"}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"1\"}},\"2\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0627\\u0634\\u062a\\u0631\\u0643 \\u0648 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0645\\u062c\\u0627\\u0646\\u0627 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0645\\u062c\\u0627\\u0646\\u064a\\u0647 \\r\\n\\ud83d\\udc49 \\u0628\\u0645\\u062c\\u0631\\u062f \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0628\\u064a\\u062a\\u0645 \\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\\u0643 \\u0641\\u0627\\u0644\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0645\\u062c\\u0627\\u0646\\u064a\\u0647\\ud83d\\udc48\\r\\n\\r\\n\\r\\n\",\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646-\\u0645\\u062c\\u0627\\u0646\\u0627\\u064b\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/Documentation\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0634\\u0631\\u062d \\u0643\\u064a\\u0641\\u064a\\u0647 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\"},{\"type\":\"phone_number\",\"payload\":\"+20 1021786576\",\"title\":\"\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0646\\u0627\"}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"5\"}}}', 'Generic comment replay for GAXA', 'reply_message', 0, '0', '', 0, 'general', 0),
(178, 39, 'UNSUBSCRIBE_QUICK_BOXER', 24, '0', '1', 246, 'UNSUBSCRIBE BOT', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"You have been successfully unsubscribed from our list. It sad to see you go. It is not the same without you ! You can join back by clicking the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"RESUBSCRIBE_QUICK_BOXER\",\"title\":\"Resubscribe\"}]}}}}}', 'UNSUBSCRIBE TEMPLATE', 'unsubscribe', 0, '0', '', 0, 'general', 0),
(179, 39, 'RESUBSCRIBE_QUICK_BOXER', 24, '0', '1', 247, 'RESUBSCRIBE BOT', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Welcome back ! We have not seen you for a while. You will no longer miss our important updates.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"UNSUBSCRIBE_QUICK_BOXER\",\"title\":\"Unsubscribe\"}]}}}}}', 'RESUBSCRIBE TEMPLATE', 'resubscribe', 0, '0', '', 0, 'general', 0),
(180, 39, 'QUICK_REPLY_EMAIL_REPLY_BOT', 24, '0', '1', 248, 'QUICK REPLY EMAIL REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your email. We will keep you updated. Thank you for being with us.\"}}}', 'QUICK REPLY EMAIL REPLY', 'email-quick-reply', 0, '0', '', 0, 'general', 0),
(181, 39, 'QUICK_REPLY_PHONE_REPLY_BOT', 24, '0', '1', 249, 'QUICK REPLY PHONE REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your phone. Thank you for being with us.\"}}}', 'QUICK REPLY PHONE REPLY', 'phone-quick-reply', 0, '0', '', 0, 'general', 0),
(182, 39, 'QUICK_REPLY_LOCATION_REPLY_BOT', 24, '0', '1', 250, 'QUICK REPLY LOCATION REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your location. Thank you for being with us.\"}}}', 'QUICK REPLY LOCATION REPLY', 'location-quick-reply', 0, '0', '', 0, 'general', 0),
(183, 39, 'QUICK_REPLY_BIRTHDAY_REPLY_BOT', 24, '0', '1', 251, 'QUICK REPLY BIRTHDAY REPLY', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"text\":\"Thanks, we have received your birthday. Thank you for being with us.\"}}}', 'QUICK REPLY BIRTHDAY REPLY', 'birthday-quick-reply', 0, '0', '', 0, 'general', 0),
(184, 39, 'YES_START_CHAT_WITH_HUMAN', 24, '0', '1', 252, 'CHAT WITH HUMAN', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"Thanks! It is a pleasure talking you. One of our team member will reply you soon. If you want to chat with me again, just click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_BOT\",\"title\":\"Resume Chat with Bot\"}]}}}}}', 'CHAT WITH HUMAN TEMPLATE', 'chat-with-human', 0, '0', '', 0, 'general', 0),
(185, 39, 'YES_START_CHAT_WITH_BOT', 24, '0', '1', 253, 'RESUBSCRIBE BOT', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"I am gald to have you back. I will try my best to answer all questions. If you want to start chat with human again you can simply click the button below.\",\"buttons\":[{\"type\":\"postback\",\"payload\":\"YES_START_CHAT_WITH_HUMAN\",\"title\":\"Chat with human\"}]}}}}}', 'CHAT WITH BOT TEMPLATE', 'chat-with-bot', 0, '0', '', 0, 'general', 0),
(186, 1, 'GAXA Prices', 19, '1', '1', 257, 'GAXA Prices ', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"carousel\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"elements\":[{\"title\":\"Free\",\"subtitle\":\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0645\\u062c\\u0627\\u0646\\u0627 \",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627175822133625.jpg\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646\"}]},{\"title\":\"Lite\",\"subtitle\":\"\\u062e\\u0637\\u0647 \\u0627\\u0635\\u062d\\u0627\\u0628 \\u0627\\u0644\\u0639\\u0645\\u0627\\u0644 \\u0627\\u0644\\u0645\\u062a\\u0648\\u0633\\u0637\\u0647 \\u0648 \\u0627\\u0644\\u0645\\u0633\\u0648\\u0642\\u064a\\u0646 \",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627174287154293.png\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\"}]},{\"title\":\"Plus\",\"subtitle\":\"\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0645\\u0633\\u0648\\u0642\\u064a\\u0646 \\u0627\\u0644\\u0645\\u062d\\u062a\\u0631\\u0641\\u064a\\u0646 \",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627174446109203.jpg\",\"default_action\":{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/\"},\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\"}]},{\"title\":\"Premium\",\"subtitle\":\"\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0627\\u062a \\u0648 \\u0627\\u0644\\u0627\\u0639\\u0645\\u0627\\u0644 \\u0627\\u0644\\u0636\\u062e\\u0645\\u0647\",\"image_url\":\"https:\\/\\/www.gaxa-bot.com\\/upload\\/image\\/1\\/image_1_1627174530291021.jpg\",\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0623\\u0644\\u0627\\u0646\"},{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\",\"messenger_extensions\":\"true\",\"webview_height_ratio\":\"full\"}]}]}},\"typing_on_settings\":\"on\",\"delay_in_reply\":\"0\"}}}', 'GAXA Prices ', 'reply_message', 0, '0', '', 0, 'general', 0),
(187, 1, 'Service and Details', 19, '1', '1', 258, 'Service and Details', '1', '{\"1\":{\"recipient\":{\"id\":\"replace_id\"},\"message\":{\"template_type\":\"text_with_buttons\",\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"button\",\"text\":\"\\u0645\\u0645\\u064a\\u0632\\u0627\\u062a Gaxa Bots\\r\\n\\u2705\\u0627\\u0644\\u0631\\u062f \\u0639\\u0644\\u064a \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0628\\u0631\\u0633\\u0627\\u0626\\u0644 \\u0645\\u0639\\u062f\\u0629 \\u0645\\u0633\\u0628\\u0642\\u0627\\r\\n\\u2705\\u0639\\u0645\\u0644 \\u0645\\u0627\\u062a\\u062c\\u0631 \\u0645\\u062a\\u0643\\u0627\\u0645\\u0644 \\u0639\\u0644\\u064a \\u0645\\u0627\\u0633\\u0646\\u062c\\u0631 \\u0628\\u0645\\u0646\\u062a\\u0627\\u062c\\u0627\\u062a \\u0645\\u062e\\u062a\\u0644\\u0641\\u0647 \\u0627\\u062a\\u0648\\u0645\\u0627\\u062a\\u064a\\u0643\\u064a\\r\\n\\u2705\\u0639\\u0645\\u0644 \\u0641\\u0648\\u0631\\u0645 \\u0644\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0644\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0628\\u064a\\u0627\\u0646\\u0627\\u062a\\u0647 \\u0639\\u0644\\u064a \\u0645\\u0627\\u0633\\u0646\\u062c\\u0631\\r\\n\\u2705\\u0627\\u0644\\u0631\\u062f \\u0639\\u0644\\u064a \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642\\u0627\\u062a \\u0631\\u062f \\u062a\\u0644\\u0642\\u0627\\u0626\\u064a \\u0639\\u0644\\u064a \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0643\\u0644\\u0645\\u0627\\u062a \\u0627\\u0644\\u0645\\u0641\\u062a\\u0627\\u062d\\u064a\\u0629 \\u0627\\u0644 \\u0628\\u064a\\u0643\\u062a\\u0628\\u0647\\u0627 \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0627\\u0648 \\u062a\\u0639\\u0644\\u064a\\u0642\\u0627\\u062a  \\u0645\\u0648\\u062d\\u062f\\u0647 \\u0644\\u0644\\u0643\\u0644 \\u0627\\u0648 \\u0627\\u0644\\u0627\\u062a\\u0646\\u064a\\u0646 \\u0645\\u0639 \\u0628\\u0639\\u0636\\r\\n\\u2705 \\u0639\\u0645\\u0644 \\u0645\\u0646\\u0634\\u0646 \\u0644\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0641\\u064a \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642\\u0627\\u062a \\u0627\\u062a\\u0648\\u0645\\u0627\\u062a\\u064a\\u0643\\r\\n\\u2705 \\u0627\\u0631\\u0633\\u0627\\u0644 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u0644\\u0643\\u0644 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u062d\\u0633\\u0628 \\u0643\\u0644 \\u0643\\u0644\\u0645\\u0629 \\u0628\\u064a\\u0643\\u062a\\u0628\\u0647\\u0627 \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644\\r\\n\\u2705 \\u062a\\u0642\\u062f\\u0631 \\u062a\\u0634\\u063a\\u0644 \\u0627\\u0644\\u0628\\u0648\\u062a \\u0639\\u0644\\u064a \\u0643\\u0644 \\u0627\\u0644\\u0628\\u0648\\u0633\\u062a\\u0627\\u062a \\u0627\\u0644\\u064a \\u0639\\u0644\\u064a \\u0627\\u0644\\u0635\\u0641\\u062d\\u0629\\r\\n\\u2705 \\u064a\\u0645\\u0643\\u0646\\u0643 \\u062c\\u062f\\u0648\\u0644\\u0629 \\u0627\\u0644\\u0628\\u0648\\u0633\\u062a\\u0627\\u062a \\u0648 \\u0646\\u0634\\u0631\\u0647\\u0627 \\u0639\\u0644\\u064a \\u062c\\u0645\\u064a\\u0639 \\u0645\\u0648\\u0627\\u0642 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\r\\n\\ud83d\\udc49 \\u0627\\u063a\\u062a\\u0645 \\u0627\\u0644\\u0641\\u0631\\u0635\\u0647 \\u0648 \\u062f\\u0644\\u0648\\u0642\\u062a\\u064a \\u0648\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 \\u062c\\u0627\\u0643\\u0633\\u0627 \\u0645\\u062c\\u0627\\u0646\\u0627 \\u0627\\u064a\\u0648\\u0647 \\u0628\\u0628\\u0644\\u0627\\u0627\\u0627\\u0627\\u0627\\u0634\\u0628\\u0645\\u062c\\u0631 \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0628\\u064a\\u062a\\u0645 \\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\\u0643 \\u0641\\u0627\\u0644\\u062e\\u0637\\u0647 \\u0627\\u0644\\u0645\\u062c\\u0627\\u0646\\u064a\\u0647\\r\\n\\r\\n\",\"buttons\":[{\"type\":\"web_url\",\"url\":\"https:\\/\\/www.gaxa-bot.com\\/home\\/sign_up?subscriber_id=#SUBSCRIBER_ID_REPLACE#\",\"title\":\"\\u0623\\u0634\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0646-\\u0645\\u062c\\u0627\\u0646\\u0627\\u064b\"}]}},\"typing_on_settings\":\"off\",\"delay_in_reply\":\"0\"}}}', 'Service and Details', 'reply_message', 0, '0', '', 0, 'general', 0);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_reply_error_log`
--

CREATE TABLE `messenger_bot_reply_error_log` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `fb_page_id` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `error_message` varchar(250) NOT NULL,
  `bot_settings_id` int(11) NOT NULL,
  `error_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_saved_templates`
--

CREATE TABLE `messenger_bot_saved_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(250) NOT NULL,
  `savedata` longtext NOT NULL,
  `saved_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `template_access` enum('private','public') NOT NULL DEFAULT 'private',
  `preview_image` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `allowed_package_ids` varchar(255) NOT NULL COMMENT 'comma seperated',
  `template_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_subscriber`
--

CREATE TABLE `messenger_bot_subscriber` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_table_id` int(11) NOT NULL,
  `page_id` varchar(100) NOT NULL,
  `permission` enum('0','1') NOT NULL DEFAULT '1',
  `subscribe_id` varchar(35) NOT NULL,
  `client_thread_id` varchar(255) NOT NULL,
  `contact_group_id` varchar(255) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `profile_pic` text NOT NULL,
  `gender` varchar(15) NOT NULL,
  `locale` varchar(15) NOT NULL,
  `timezone` varchar(15) NOT NULL,
  `unavailable` enum('0','1') NOT NULL DEFAULT '0',
  `last_error_message` text NOT NULL,
  `unavailable_conversation` enum('0','1') NOT NULL DEFAULT '0',
  `last_error_message_conversation` text NOT NULL,
  `refferer_id` varchar(100) NOT NULL COMMENT 'get started refference number from ref parameter of chat plugin',
  `refferer_source` varchar(50) NOT NULL COMMENT 'checkbox_plugin or CUSTOMER_CHAT_PLUGIN or MESSENGER_CODE or SHORTLINK or FB PAGE or COMMENT PRIVATE REPLY',
  `refferer_uri` tinytext NOT NULL COMMENT 'CUSTOMER_CHAT_PLUGIN URL',
  `subscribed_at` datetime NOT NULL,
  `unsubscribed_at` datetime NOT NULL,
  `link` varchar(255) NOT NULL,
  `is_image_download` enum('0','1') NOT NULL DEFAULT '0',
  `image_path` varchar(250) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `is_bot_subscriber` enum('0','1') NOT NULL DEFAULT '1',
  `is_email_unsubscriber` enum('0','1') NOT NULL DEFAULT '0',
  `is_imported` enum('0','1') NOT NULL DEFAULT '0',
  `is_updated_name` enum('0','1') NOT NULL DEFAULT '1',
  `last_name_update_time` datetime NOT NULL,
  `email` varchar(75) NOT NULL,
  `entry_time` datetime NOT NULL,
  `last_update_time` datetime NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `phone_number_entry_time` datetime NOT NULL,
  `phone_number_last_update` datetime NOT NULL,
  `user_location` text NOT NULL,
  `location_map_url` text NOT NULL,
  `birthdate` date NOT NULL,
  `birthdate_entry_time` datetime NOT NULL,
  `last_subscriber_interaction_time` datetime NOT NULL COMMENT 'UTC Time - When user last sent message',
  `is_24h_1_sent` enum('0','1') NOT NULL DEFAULT '0' COMMENT '24H+1 message Broadcasting created or not',
  `woocommerce_drip_campaign_id` int(11) NOT NULL,
  `wc_user_id` int(11) NOT NULL,
  `password` text NOT NULL,
  `subscriber_type` enum('messenger','system') NOT NULL DEFAULT 'messenger',
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messenger_bot_subscriber`
--

INSERT INTO `messenger_bot_subscriber` (`id`, `user_id`, `page_table_id`, `page_id`, `permission`, `subscribe_id`, `client_thread_id`, `contact_group_id`, `first_name`, `last_name`, `full_name`, `profile_pic`, `gender`, `locale`, `timezone`, `unavailable`, `last_error_message`, `unavailable_conversation`, `last_error_message_conversation`, `refferer_id`, `refferer_source`, `refferer_uri`, `subscribed_at`, `unsubscribed_at`, `link`, `is_image_download`, `image_path`, `status`, `is_bot_subscriber`, `is_email_unsubscriber`, `is_imported`, `is_updated_name`, `last_name_update_time`, `email`, `entry_time`, `last_update_time`, `phone_number`, `phone_number_entry_time`, `phone_number_last_update`, `user_location`, `location_map_url`, `birthdate`, `birthdate_entry_time`, `last_subscriber_interaction_time`, `is_24h_1_sent`, `woocommerce_drip_campaign_id`, `wc_user_id`, `password`, `subscriber_type`, `store_id`) VALUES
(181, 1, 19, '105940371572898', '1', '3850254158404536', '', '', 'Rashad', 'Tantawy', '', 'https://scontent-ams4-1.xx.fbcdn.net/v/t1.30497-1/p720x720/84628273_176159830277856_972693363922829312_n.jpg?_nc_cat=1&ccb=1-3&_nc_sid=12b3be&_nc_eui2=AeF-z5dpFPw0O66mfHShDk7Fik--Qfnh2B6KT75B-eHYHsazUJTZWLOhUDWOZqAkSp55KnjfcCusipPe2zrS0Kry&_nc_ohc=EKgP7n_AQLwAX_pTQbV&_nc_ht=scontent-ams4-1.xx&tp=6&oh=ffc5d1cbaf30c6e51ced414cf8477731&oe=6078C116', 'male', 'en_GB', '2', '0', '', '0', '', '', '', '', '2021-03-19 20:21:16', '0000-00-00 00:00:00', '', '0', '', '1', '1', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '2021-03-19 18:23:04', '1', 0, 0, '', 'messenger', 0),
(183, 1, 19, '105940371572898', '1', '4183691548328926', 't_4002881339733993', '', 'Hajar', 'Mohamed', 'Hajar Mohamed', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=4183691548328926&width=1024&ext=1621017370&hash=AeTFWiTYwOIFwZYo5z4', 'female', 'en_US', '2', '0', '', '0', '', '', '', '', '2021-04-14 20:36:10', '0000-00-00 00:00:00', '/105940371572898/inbox/107870034713265/', '0', '', '0', '1', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '02140004150', '2021-05-03 01:15:58', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '2021-05-08 15:32:32', '1', 0, 0, '', 'messenger', 0),
(184, 1, 19, '105940371572898', '1', '4454716371255849', 't_2975068172768138', '', 'May', 'Fayed', 'May Fayed', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=4454716371255849&width=1024&ext=1621278302&hash=AeS5a6AMOcG22TDeI_c', 'female', 'en_US', '2', '0', '', '0', '', '', '', '', '2021-04-17 21:05:02', '0000-00-00 00:00:00', '/105940371572898/inbox/124031909763744/', '0', '', '1', '1', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '2021-04-23 00:52:06', '1', 0, 0, '', 'messenger', 0),
(187, 1, 19, '105940371572898', '1', '5330655253673615', 't_302844321271479', '', '', '', 'Garzali Bello', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-18 23:13:54', '0000-00-00 00:00:00', '/105940371572898/inbox/119965480170387/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:16', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(188, 1, 19, '105940371572898', '1', '3964281183592132', 't_288512702653743', '', '', '', 'Grace Lwandeh', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-18 23:13:54', '0000-00-00 00:00:00', '/105940371572898/inbox/114173700749565/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:18', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(189, 1, 19, '105940371572898', '1', '3716734655071230', 't_10150000686525267', '', 'Ben', 'Smith', 'Ben Smith', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3716734655071230&width=1024&ext=1621373405&hash=AeRxk7_-UVl35A9c7Xc', 'male', 'en_US', '8', '0', '', '0', '', '', '', '', '2021-04-18 23:13:54', '0000-00-00 00:00:00', '/105940371572898/inbox/107956864704582/', '0', '', '1', '1', '0', '1', '1', '2021-04-18 23:30:05', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(207, 1, 19, '105940371572898', '1', '4120329354677542', 't_4719256974767543', '', 'Rashad', 'Tantawy', 'Rashad M. Tantawy', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=4120329354677542&width=1024&ext=1621375869&hash=AeRqz1qSycLbY7hmyvI', 'male', 'en_US', '2', '0', '', '0', '', '', '', '', '2021-04-19 00:11:09', '0000-00-00 00:00:00', '/105940371572898/inbox/107853124714956/', '0', '', '0', '1', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '011140004150', '2021-04-21 06:28:20', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '2021-07-06 21:50:00', '1', 0, 0, '', 'messenger', 0),
(209, 1, 19, '105940371572898', '1', '4531962266850972', 't_1496156437383204', '', '', '', 'Âmř Ķhăļĕđ', '', '', '', '', '0', '', '0', '', '105940371572898_125077649659170', 'COMMENT PRIVATE REPLY', 'https://facebook.com/125077649659170_125105776323024', '2021-04-20 21:58:00', '0000-00-00 00:00:00', '/105940371572898/inbox/125105802989688/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:12', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(210, 1, 19, '105940371572898', '1', '4120865594632271', 't_1893047864179104', '', '', '', 'Nour Said Baker', '', '', '', '', '0', '', '0', '', '105940371572898_125077649659170', 'COMMENT PRIVATE REPLY', 'https://facebook.com/125077649659170_125117272988541', '2021-04-20 22:42:42', '0000-00-00 00:00:00', '/105940371572898/inbox/125117339655201/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:14', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(211, 1, 19, '105940371572898', '1', '3835267853224967', 't_2317822618350761', '', '', '', 'Waheed Elshaer', '', '', '', '', '0', '', '0', '', '105940371572898_125077649659170', 'COMMENT PRIVATE REPLY', 'https://facebook.com/125077649659170_125169882983280', '2021-04-21 02:46:38', '0000-00-00 00:00:00', '/105940371572898/inbox/125169922983276/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:15', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(212, 1, 19, '105940371572898', '1', '4293501417334932', 't_488699972561030', '', '', '', 'Hoda Anbar', '', '', '', '', '0', '', '0', '', '105940371572898_125077649659170', 'COMMENT PRIVATE REPLY', 'https://facebook.com/125077649659170_125210809645854', '2021-04-21 05:27:06', '0000-00-00 00:00:00', '/105940371572898/inbox/125210842979184/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:15', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(215, 1, 19, '105940371572898', '1', '3669687986489952', 't_1380173152342419', '', '', '', 'Ageeb Ameen', '', '', '', '', '0', '', '0', '', '105940371572898_125077649659170', 'COMMENT PRIVATE REPLY', 'https://facebook.com/125077649659170_125351936298408', '2021-04-21 15:10:27', '0000-00-00 00:00:00', '/105940371572898/inbox/125352166298385/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:16', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(216, 1, 19, '105940371572898', '1', '4050810498320143', 't_119093143614118', '', 'Gaxa', 'Gaxa-bot', 'Gaxa Gaxa-bot', 'https://scontent-amt2-1.xx.fbcdn.net/v/t1.30497-1/p720x720/84628273_176159830277856_972693363922829312_n.jpg?_nc_cat=1&ccb=1-3&_nc_sid=12b3be&_nc_eui2=AeF-z5dpFPw0O66mfHShDk7Fik--Qfnh2B6KT75B-eHYHsazUJTZWLOhUDWOZqAkSp55KnjfcCusipPe2zrS0Kry&_nc_ohc=BnyBL7OgTNQAX8V80L6&_nc_ht=scontent-amt2-1.xx&tp=6&oh=4132e64b0bcc02c75b106bcf9ae764b6&oe=60A44296', 'male', 'en_GB', '2', '0', '', '0', '', '105940371572898_124387659728169', 'COMMENT PRIVATE REPLY', 'https://facebook.com/124387659728169_125364456297156', '2021-04-21 15:48:47', '0000-00-00 00:00:00', '/105940371572898/inbox/125364599630475/', '0', '', '0', '1', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '55', '2021-04-21 16:22:58', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '2021-07-22 18:19:44', '1', 0, 0, '', 'messenger', 0),
(220, 1, 19, '105940371572898', '1', '5725923957432567', 't_2917678485147642', '', '', '', 'مومن ابراهيم', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-21 15:52:58', '0000-00-00 00:00:00', '/105940371572898/inbox/125316572968611/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:16', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(221, 1, 19, '105940371572898', '1', '3913791952039817', 't_840588416803192', '', '', '', 'Mohamed Fathy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-21 15:52:58', '0000-00-00 00:00:00', '/105940371572898/inbox/125304916303110/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:17', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(222, 1, 19, '105940371572898', '1', '4300242663340251', 't_986512785418148', '', '', '', 'Ahmed Bassam', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-21 15:52:58', '0000-00-00 00:00:00', '/105940371572898/inbox/125262972973971/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:18', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(223, 1, 19, '105940371572898', '1', '4068136509909987', 't_10158025732118461', '', '', '', 'Ahmed Aboulfetouh', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-21 15:52:58', '0000-00-00 00:00:00', '/105940371572898/inbox/125258042974464/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:18', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(224, 1, 19, '105940371572898', '1', '5301248796616348', 't_2789755054606994', '', '', '', 'رضا عوض', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-21 15:52:58', '0000-00-00 00:00:00', '/105940371572898/inbox/125220602978208/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:19', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(226, 1, 19, '105940371572898', '1', '4140547479338654', 't_1225204784548904', '', '', '', 'Mohammed Khalil', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-21 15:52:58', '0000-00-00 00:00:00', '/105940371572898/inbox/125186642981604/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:19', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(227, 1, 19, '105940371572898', '1', '5616306515046976', 't_2902229716666757', '', '', '', 'Hassan Alsony', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-21 15:52:58', '0000-00-00 00:00:00', '/105940371572898/inbox/125171889649746/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:19', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(229, 1, 19, '105940371572898', '1', '4230239540360463', 't_2026618074144259', '', '', '', 'Hatem Eldandrawi', '', '', '', '', '0', '', '0', '', '', '', '', '2021-04-21 15:52:58', '0000-00-00 00:00:00', '/105940371572898/inbox/125145462985722/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:20', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(231, 1, 19, '105940371572898', '1', '5405795839495453', 't_2351888084955165', '', '', '', 'Ah Med', '', '', '', '', '0', '', '0', '', '105940371572898_117638910403044', 'COMMENT PRIVATE REPLY', 'https://facebook.com/117638910403044_126341636199438', '2021-04-24 05:15:32', '0000-00-00 00:00:00', '/105940371572898/inbox/126341689532766/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:08', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(232, 1, 19, '105940371572898', '1', '4042633732497187', 't_1372922929738804', '', '', '', 'DrTamer Elhenawy', '', '', '', '', '0', '', '0', '', '105940371572898_128989689267966', 'COMMENT PRIVATE REPLY', 'https://facebook.com/128989689267966_129364639230471', '2021-05-02 17:10:31', '0000-00-00 00:00:00', '/105940371572898/inbox/129364819230453/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:09', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(233, 1, 19, '105940371572898', '1', '3875996712518492', 't_10165373901875293', '', '', '', 'Yousra Zenouki', '', '', '', '', '0', '', '0', '', '105940371572898_128643902635878', 'COMMENT PRIVATE REPLY', 'https://facebook.com/128643902635878_131094395724162', '2021-05-05 22:54:53', '0000-00-00 00:00:00', '/105940371572898/inbox/131093559057579/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:09', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(234, 1, 23, '2085064648484866', '1', '3991235264335270', 't_4706444826048758', '', 'Rashad', 'Tantawy', 'Rashad M. Tantawy', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3991235264335270&width=1024&ext=1623031257&hash=AeREnNDt3GEC5nUoWqM', 'male', 'en_US', '2', '0', '', '0', '', '', '', '', '2021-05-08 04:00:58', '0000-00-00 00:00:00', '/2085064648484866/inbox/2900660946925228/', '0', '', '1', '1', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '2021-06-05 16:31:38', '0', 0, 0, '', 'messenger', 0),
(235, 1, 23, '2085064648484866', '1', '5557351737671806', 't_580819409560837', '', '', '', 'Saif Elmoterey', '', '', '', '', '0', '', '0', '', '2085064648484866_2944165432574779', 'COMMENT PRIVATE REPLY', 'https://facebook.com/2944165432574779_2949954831995839', '2021-05-15 21:47:18', '0000-00-00 00:00:00', '/2085064648484866/inbox/2949954948662494/', '0', '', '1', '0', '0', '0', '1', '2021-07-17 04:01:04', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(236, 1, 23, '2085064648484866', '1', '3906719592698116', 't_10225377698020245', '', '', '', 'Nabil Abdel Hamid', '', '', '', '', '0', '', '0', '', '2085064648484866_2944165432574779', 'COMMENT PRIVATE REPLY', 'https://facebook.com/2944165432574779_2952997651691557', '2021-05-19 21:23:54', '0000-00-00 00:00:00', '/2085064648484866/inbox/2952997785024877/', '0', '', '1', '0', '0', '0', '1', '2021-07-17 04:01:04', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(237, 1, 0, '', '1', 'sys-1622140426878927', '', '', 'Teststore', 'Raashaf', 'Teststore Raashaf', '', '', '', '', '0', '', '0', '', '', '', '', '2021-05-27 20:33:46', '0000-00-00 00:00:00', '', '0', '', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', 'parig32960@brayy.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 0, 0, 'e10adc3949ba59abbe56e057f20f883e', 'system', 1),
(239, 1, 19, '105940371572898', '1', '4180318195383634', 't_197584065630170', '', '', '', 'الغلبان مزيد', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/173885081445093/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:09', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(240, 1, 19, '105940371572898', '1', '5634264356613548', 't_3902175959864176', '', '', '', 'Sageda Abdallah', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/125411789625756/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:10', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '2021-07-26 15:46:49', '1', 0, 0, '', 'messenger', 0),
(242, 1, 19, '105940371572898', '1', '4136638773046395', 't_506174000515934', '', '', '', 'Yahya AbdelFattah', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/130101039156831/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:10', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(243, 1, 19, '105940371572898', '1', '4010040935767024', 't_137653278374337', '', '', '', 'Gaxa Duze', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/129804169186518/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:11', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(244, 1, 19, '105940371572898', '1', '3919094998206950', 't_143994144376554', '', '', '', 'Fahd Mohamed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/129419679224967/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:11', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(245, 1, 19, '105940371572898', '1', '4128103693920201', 't_3891683167585053', '', '', '', 'رجب رمضان', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/129473759219559/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:12', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(246, 1, 19, '105940371572898', '1', '4169465629776146', 't_890608731486699', '', '', '', 'Fahd El Hawara', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/129427105890891/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:12', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(247, 1, 19, '105940371572898', '1', '3766923390073612', 't_10159081464479780', '', '', '', 'Sayed Bahria', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/129340799232855/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:13', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(248, 1, 19, '105940371572898', '1', '5357567544314428', 't_1115487805632099', '', '', '', 'Ahmed Malah', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/129437385889863/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:13', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(249, 1, 19, '105940371572898', '1', '4100938456611643', 't_3575392882564775', '', '', '', 'Mohamed Karam', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/129397475893854/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:13', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(251, 1, 19, '105940371572898', '1', '6102500159763929', 't_1296727197409209', '', '', '', 'Maged Abasery', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/129192372581031/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:14', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(252, 1, 19, '105940371572898', '1', '3933769880048907', 't_811428279779022', '', '', '', 'Yass Meen', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/126994729467462/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:14', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(254, 1, 19, '105940371572898', '1', '3976202025811503', 't_1112964002505374', '', '', '', 'يوسف ياسر يوسف ياسر', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 21:55:24', '0000-00-00 00:00:00', '/105940371572898/inbox/126338226199779/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:17', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(272, 1, 23, '2085064648484866', '1', '3998478866934687', 't_4010565982358506', '', '', '', 'Sageda Abdallah', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2959198061071516/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:03', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(274, 1, 23, '2085064648484866', '1', '4245440272144508', 't_10224390854054929', '', '', '', 'Yazan Badr', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2953037391687583/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:03', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(275, 1, 23, '2085064648484866', '1', '3703424599672230', 't_10217116802449204', '', '', '', 'Youssef Essam El-Din', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718226495168675/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:04', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(277, 1, 23, '2085064648484866', '1', '3177689638993507', 't_3392297397468328', '', '', '', 'Yassin Ahmed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718065468518111/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:05', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(278, 1, 23, '2085064648484866', '1', '3782139508473315', 't_2668274220149788', '', '', '', 'Ahmed M. Khalil', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2852916295033027/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:05', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(279, 1, 23, '2085064648484866', '1', '3633763383339830', 't_222177829444255', '', '', '', 'Ahmed Henish', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2853318224992834/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:05', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(280, 1, 23, '2085064648484866', '1', '3445238325581282', 't_3404807502981819', '', '', '', 'Mostafa Khalil', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2852647605059896/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:06', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(281, 1, 23, '2085064648484866', '1', '2464242090366771', 't_1500062120340692', '', '', '', 'Walid Mohamed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2852644801726843/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:06', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(282, 1, 23, '2085064648484866', '1', '5122119304495970', 't_10158580873386690', '', '', '', 'Mohamed A Saber', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2851259905198666/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:06', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(283, 1, 23, '2085064648484866', '1', '4418738598155424', 't_2837514849904936', '', '', '', 'Mio Moi', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2851014025223254/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:07', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(284, 1, 23, '2085064648484866', '1', '3737092126400920', 't_1897897250357901', '', '', '', 'Ahmed Gamal', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2850870431904280/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:07', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(285, 1, 23, '2085064648484866', '1', '5514809815211804', 't_10225184965151002', '', '', '', 'Mustapha AboulSoud', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2850858888572101/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:07', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(286, 1, 23, '2085064648484866', '1', '3735431636523211', 't_2428120474152440', '', '', '', 'Ahmed El-kholy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2722433098081348/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:08', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(287, 1, 23, '2085064648484866', '1', '3515390298558977', 't_10158799696891203', '', '', '', 'Abd Elrahman Galal', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2846027609055229/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:08', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(288, 1, 23, '2085064648484866', '1', '4028401087181789', 't_10225214884579526', '', '', '', 'Abdelrahman Sharaf', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2839835106341146/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:08', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(289, 1, 23, '2085064648484866', '1', '3588243134627192', 't_3373559849419526', '', '', '', 'Ahmed Meda', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2840735652917758/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:09', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(290, 1, 23, '2085064648484866', '1', '3671149752954246', 't_10164447461235057', '', '', '', 'Amr Hebåh', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2840530899604900/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:09', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(291, 1, 23, '2085064648484866', '1', '4883111695095635', 't_10224555255094826', '', '', '', 'Hesham Farrag', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2840160892975234/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:10', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(292, 1, 23, '2085064648484866', '1', '5269615196412865', 't_10159560451778488', '', '', '', 'Islam Ashraf', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2839932709664719/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:11', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(293, 1, 23, '2085064648484866', '1', '5933242616693195', 't_394578591917929', '', '', '', 'Amr Amin', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2790185944639396/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:11', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(294, 1, 23, '2085064648484866', '1', '3898719890187781', 't_10221213960431168', '', '', '', 'Hesham ElGhonemy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2790180504639940/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:11', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(295, 1, 23, '2085064648484866', '1', '3700446290062632', 't_1575000999351438', '', '', '', 'Ahmed Said', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2789076174750373/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:12', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(296, 1, 23, '2085064648484866', '1', '3859310777472045', 't_2438698916432831', '', '', '', 'Omar Osama', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2788372698154054/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:12', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(297, 1, 23, '2085064648484866', '1', '4168406249850912', 't_10158287011824230', '', '', '', 'Walled Osman', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2788358528155471/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:13', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(298, 1, 23, '2085064648484866', '1', '4216148428396728', 't_3241535192593029', '', '', '', 'Heba Mostafa', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2740224539635537/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:13', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(299, 1, 23, '2085064648484866', '1', '3895744860516748', 't_1939910129479844', '', '', '', 'Osama Hassan', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2746726632318661/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:13', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(300, 1, 23, '2085064648484866', '1', '5106466166061312', 't_1422361787975117', '', '', '', 'Abdelrahman Bl', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2746123299045661/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:13', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(301, 1, 23, '2085064648484866', '1', '3878621492194120', 't_10158011453723778', '', '', '', 'Mohanad Atef', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2744551789202812/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:14', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(302, 1, 23, '2085064648484866', '1', '3751113178271628', 't_1702301463256281', '', '', '', 'Rwida Osama', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2743743432616981/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:14', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(303, 1, 23, '2085064648484866', '1', '3745573772177820', 't_1683940401761477', '', '', '', 'Mahmoud Saber', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2743630659294925/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:14', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(304, 1, 23, '2085064648484866', '1', '5237079146364522', 't_2692065654341402', '', '', '', 'Ebraam Boshra Shokry', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2742222496102408/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:15', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(305, 1, 23, '2085064648484866', '1', '3754511041253006', 't_3482101178480531', '', '', '', 'Abdelrahman Bonna', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2742184712772853/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:15', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(306, 1, 23, '2085064648484866', '1', '4132894590068277', 't_1435841563472325', '', '', '', 'Medhat Gamal', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2742010822790242/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:15', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(307, 1, 23, '2085064648484866', '1', '4150380121641874', 't_10158471567200210', '', '', '', 'Shaza Aly', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2741963996128258/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:16', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(308, 1, 23, '2085064648484866', '1', '3751567114921482', 't_3143426195706273', '', '', '', 'Taher Abd Elhady', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2741886256136032/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:16', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(309, 1, 23, '2085064648484866', '1', '4381872918508073', 't_3277130862370045', '', '', '', 'Huda Said', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2741821399475851/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:16', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(310, 1, 23, '2085064648484866', '1', '3690050361042860', 't_3310949088991162', '', '', '', 'Sayed Yousef', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2740938769564114/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:17', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(311, 1, 23, '2085064648484866', '1', '3699195693521791', 't_10220512991806900', '', '', '', 'Michael Anwar', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2739474496377208/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:17', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(312, 1, 23, '2085064648484866', '1', '3443363315775421', 't_3390027074382990', '', '', '', 'Mohamed Osama', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2738650759792915/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:17', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(313, 1, 23, '2085064648484866', '1', '3563045017139067', 't_2612732635656513', '', '', '', 'Ahmed Šåmîř', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2738003836524274/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:18', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(314, 1, 23, '2085064648484866', '1', '3948526008542342', 't_2047431392068126', '', '', '', 'Mohamed Ezat', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2737365673254757/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:18', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(315, 1, 23, '2085064648484866', '1', '4013382675373423', 't_2906175316154863', '', '', '', 'Mai Taher', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2736075063383818/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:18', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(316, 1, 23, '2085064648484866', '1', '3890293924423420', 't_3225925820821794', '', '', '', 'Maram Abd Elmageed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2735187056805952/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:18', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(317, 1, 23, '2085064648484866', '1', '3258864307550325', 't_786744192152460', '', '', '', 'Mohab Mahmoud', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2734473790210612/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:19', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(318, 1, 23, '2085064648484866', '1', '3878927575496714', 't_3208217642557596', '', '', '', 'Mohamed Salah', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2734345960223395/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:19', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(319, 1, 23, '2085064648484866', '1', '5372487572776403', 't_10157097237291442', '', '', '', 'Kamel Mohamed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2734208740237117/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:19', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(320, 1, 23, '2085064648484866', '1', '5084799234927692', 't_10213555264235413', '', '', '', 'Amr Soltan', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2733664103624914/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:20', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(321, 1, 23, '2085064648484866', '1', '3566227403488962', 't_10207686465756049', '', '', '', 'Mostafa Mohamad', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2733335860324405/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:20', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(322, 1, 23, '2085064648484866', '1', '3807855765988825', 't_3037071956420394', '', '', '', 'Ahmed Ashraf', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2733013753689949/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:20', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(323, 1, 23, '2085064648484866', '1', '3785206294890405', 't_3083346125108576', '', '', '', 'Muhamed Youssef', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732893770368614/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:21', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(324, 1, 23, '2085064648484866', '1', '2766592773465521', 't_1572231796285302', '', '', '', 'Omar Hamed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732610197063638/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:21', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(325, 1, 23, '2085064648484866', '1', '3159111697524734', 't_1221078794895268', '', '', '', 'Eman Atef', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732509067073751/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:21', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0);
INSERT INTO `messenger_bot_subscriber` (`id`, `user_id`, `page_table_id`, `page_id`, `permission`, `subscribe_id`, `client_thread_id`, `contact_group_id`, `first_name`, `last_name`, `full_name`, `profile_pic`, `gender`, `locale`, `timezone`, `unavailable`, `last_error_message`, `unavailable_conversation`, `last_error_message_conversation`, `refferer_id`, `refferer_source`, `refferer_uri`, `subscribed_at`, `unsubscribed_at`, `link`, `is_image_download`, `image_path`, `status`, `is_bot_subscriber`, `is_email_unsubscriber`, `is_imported`, `is_updated_name`, `last_name_update_time`, `email`, `entry_time`, `last_update_time`, `phone_number`, `phone_number_entry_time`, `phone_number_last_update`, `user_location`, `location_map_url`, `birthdate`, `birthdate_entry_time`, `last_subscriber_interaction_time`, `is_24h_1_sent`, `woocommerce_drip_campaign_id`, `wc_user_id`, `password`, `subscriber_type`, `store_id`) VALUES
(326, 1, 23, '2085064648484866', '1', '3865046476921325', 't_1796241430545210', '', '', '', 'Hosam Rashwan', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732377393753585/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:22', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(327, 1, 23, '2085064648484866', '1', '3532100260233545', 't_10218494025049731', '', '', '', 'Alaa A. Farag', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732370643754260/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:22', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(328, 1, 23, '2085064648484866', '1', '3657788877668280', 't_3854788561204065', '', '', '', 'Mohamed Elmancy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732350977089560/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:22', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(329, 1, 23, '2085064648484866', '1', '3395310287240230', 't_2795509337349670', '', '', '', 'Hesham Hafez', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732117867112871/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:23', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(330, 1, 23, '2085064648484866', '1', '5111239792280793', 't_1740882569422367', '', '', '', 'Shaimaa Kamel', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732082033783121/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:23', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(331, 1, 23, '2085064648484866', '1', '4086648174702741', 't_3559208237431502', '', '', '', 'Doaa Saeed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732034190454572/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:23', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(332, 1, 23, '2085064648484866', '1', '5198224870248687', 't_2682285918680882', '', '', '', 'Mohamed Sayed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732028397121818/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:24', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(333, 1, 23, '2085064648484866', '1', '3778712845515303', 't_3118670341585607', '', '', '', 'Mohamed Abdalkarem', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2731992247125433/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:24', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(334, 1, 23, '2085064648484866', '1', '3743813538988463', 't_1247817802228172', '', '', '', 'Khaled Tareq', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2732004403790884/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:24', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(335, 1, 23, '2085064648484866', '1', '5155982484474601', 't_1773947176088795', '', '', '', 'Mohamed Ahmed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2725862997738358/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:25', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(336, 1, 23, '2085064648484866', '1', '4276998628996627', 't_1396046697252271', '', '', '', 'Ahmed Mamdouh', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2726017437722914/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:25', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(337, 1, 23, '2085064648484866', '1', '4088609081215289', 't_10217686171328029', '', '', '', 'Taha Shref Mizo', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2725486791109312/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:26', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(338, 1, 23, '2085064648484866', '1', '3353806041349508', 't_2755596248003829', '', '', '', 'Abood Hawa', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2724053551252636/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:26', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(339, 1, 23, '2085064648484866', '1', '3841820419197223', 't_2768859790012548', '', '', '', 'Ahmed El Nagdy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2724061817918476/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:26', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(340, 1, 23, '2085064648484866', '1', '3376660882437973', 't_10163887328105057', '', '', '', 'Khaled Elabd', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723699877954670/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:26', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(341, 1, 23, '2085064648484866', '1', '3630903073675679', 't_4779304518762419', '', '', '', 'Tareq Adnan Alkadri', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723838907940767/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:27', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(342, 1, 23, '2085064648484866', '1', '3760178054067488', 't_10220899441528695', '', '', '', 'Mahmoud Attia', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2724060774585247/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:27', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(343, 1, 23, '2085064648484866', '1', '3515177735255187', 't_3312258315497935', '', '', '', 'Abdallh Abdul Rassol', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2724061247918533/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:27', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(344, 1, 23, '2085064648484866', '1', '3673941382643129', 't_2664683180414331', '', '', '', 'Nourddine Assmar Ait Bendra', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2724060257918632/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:28', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(345, 1, 23, '2085064648484866', '1', '5141375069270362', 't_1624468877711786', '', '', '', 'Eslam Fawzy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2724059844585340/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:28', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(346, 1, 23, '2085064648484866', '1', '3925734400806585', 't_1170896596622377', '', '', '', 'Eng Ahmed Abdelfattah', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2724050387919619/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:28', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(347, 1, 23, '2085064648484866', '1', '3102282339878592', 't_10157944439391773', '', '', '', 'Amir Ragaei', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723758124615512/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:29', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(348, 1, 23, '2085064648484866', '1', '3497075280323504', 't_630928874505154', '', '', '', 'Ahmed Leo', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723772897947368/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:29', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(349, 1, 23, '2085064648484866', '1', '3950040401723914', 't_10160185657394745', '', '', '', 'Abdelalim Allam', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723847514606573/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:29', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(350, 1, 23, '2085064648484866', '1', '4394909133883131', 't_10223250696554817', '', '', '', 'Medhat Fathi Khedr', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718193121838679/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:30', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(351, 1, 23, '2085064648484866', '1', '4159858504025617', 't_775453403221948', '', '', '', 'Ahmed Youssif', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723622127962445/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:31', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(352, 1, 23, '2085064648484866', '1', '3541784452520627', 't_2624327254482694', '', '', '', 'شدوان القرشي', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723644637960194/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:31', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(353, 1, 23, '2085064648484866', '1', '3347816435240161', 't_319464625871044', '', '', '', 'Smzo Delivery', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723612184630106/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:31', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(354, 1, 23, '2085064648484866', '1', '3149131398489121', 't_10215631267448915', '', '', '', 'Ahmed Rezk', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717750835216241/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:32', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(355, 1, 23, '2085064648484866', '1', '3796564767077853', 't_10219980780083091', '', '', '', 'Raed Abu Hammad', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723609867963671/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:32', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(356, 1, 23, '2085064648484866', '1', '3991692254184486', 't_10157015769815728', '', '', '', 'Islam Jamal', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723584424632882/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:32', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(357, 1, 23, '2085064648484866', '1', '3771304002958433', 't_3117357441665732', '', '', '', 'خالد السلامه المريحي', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723584157966242/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:33', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(358, 1, 23, '2085064648484866', '1', '3116145291821879', 't_1222729728073275', '', '', '', 'Ahmed Elqadi', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723583847966273/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:33', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(359, 1, 23, '2085064648484866', '1', '3777238059029113', 't_3144279518987554', '', '', '', 'Hany Refaat', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723583517966306/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:33', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(360, 1, 23, '2085064648484866', '1', '3660443157406723', 't_10157675632393443', '', '', '', 'Moatasem Osam', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723414734649851/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:34', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(361, 1, 23, '2085064648484866', '1', '3915731288449513', 't_10158752261059756', '', '', '', 'باسم الحجري ابو محمد', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2723400814651243/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:34', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(362, 1, 23, '2085064648484866', '1', '5088127487895000', 't_1954050591402035', '', '', '', 'Abdullah Genidy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2722588328065825/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:34', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(363, 1, 23, '2085064648484866', '1', '3312263395498209', 't_650814192510644', '', '', '', 'Waled Lelo', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2722552324736092/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:35', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(364, 1, 23, '2085064648484866', '1', '3101819079932583', 't_1055428821541905', '', '', '', 'Ashmawi Hashim', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2722560764735248/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:35', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(365, 1, 23, '2085064648484866', '1', '3309060775798985', 't_3842613325754051', '', '', '', 'Amir Code', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2722562758068382/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:35', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(366, 1, 23, '2085064648484866', '1', '3818929978191853', 't_1758352647582903', '', '', '', 'Hatem Genidy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2085332915124706/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:36', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(367, 1, 23, '2085064648484866', '1', '3707289969320501', 't_10223335743604348', '', '', '', 'Abdallah Soaody', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2722513014740023/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:36', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(368, 1, 23, '2085064648484866', '1', '4044569372221052', 't_10223681613615181', '', '', '', 'أبو يوسف المصري', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2722516384739686/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:37', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(369, 1, 23, '2085064648484866', '1', '3708522559184061', 't_3043663969090454', '', '', '', 'Mohamed Aboushady', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2722484738076184/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:37', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(370, 1, 23, '2085064648484866', '1', '4174720195883523', 't_3132935813470085', '', '', '', 'Safwan Hashim', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2719223068402351/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:37', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(371, 1, 23, '2085064648484866', '1', '4101338929897024', 't_288478898914351', '', '', '', 'ĪŤ Omar FaTħī', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718079488516709/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:38', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(372, 1, 23, '2085064648484866', '1', '3925764970815049', 't_10160549459547715', '', '', '', 'Mahmoud Seoudi', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718983821759609/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:38', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(373, 1, 23, '2085064648484866', '1', '3578194825612898', 't_1666883843476276', '', '', '', 'Wasiq Zahid', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718868428437815/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:39', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(374, 1, 23, '2085064648484866', '1', '5168677709872782', 't_1699595940192906', '', '', '', 'Azpark Villa', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717797751878216/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:39', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(375, 1, 23, '2085064648484866', '1', '3877543258997008', 't_3124318470955286', '', '', '', 'Essam Lotfy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718446065146718/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:39', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(376, 1, 23, '2085064648484866', '1', '3698415206880008', 't_1951120745020326', '', '', '', 'عبد الرحمن العكيزي', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718366655154659/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:40', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(377, 1, 23, '2085064648484866', '1', '4375798339127487', 't_10219895195705116', '', '', '', 'Omar Sameh Attia', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718446265146698/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:40', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(378, 1, 23, '2085064648484866', '1', '3794945543959868', 't_10157177516076960', '', '', '', 'Mohamed Abdulrahman', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718380888486569/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:40', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(379, 1, 23, '2085064648484866', '1', '3837326409627302', 't_10163949161605052', '', '', '', 'Ahmed Eltaher', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718408225150502/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:41', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(380, 1, 23, '2085064648484866', '1', '3169268819828053', 't_10163935002495504', '', '', '', 'Danish Agha', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717532398571418/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:41', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(381, 1, 23, '2085064648484866', '1', '5402351623140413', 't_2576062012644569', '', '', '', 'Ashraf Nabil', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718387425152582/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:41', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(382, 1, 23, '2085064648484866', '1', '3607143982747934', 't_10157570767912469', '', '', '', 'Waleed Gomaa', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718369345154390/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:42', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(383, 1, 23, '2085064648484866', '1', '4130233940361928', 't_3139844346097043', '', '', '', 'محمود السيد خليفة', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718368965154428/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:42', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(384, 1, 23, '2085064648484866', '1', '3975294835863214', 't_3679186865443650', '', '', '', 'Hasan Ali', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718367615154563/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:42', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(385, 1, 23, '2085064648484866', '1', '4357851594244136', 't_1654130361405726', '', '', '', 'محمد فتحى', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718366365154688/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:42', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(386, 1, 23, '2085064648484866', '1', '3623431921068021', 't_3512775288734145', '', '', '', 'عبدالرحمن القعاري', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718366031821388/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:43', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(387, 1, 23, '2085064648484866', '1', '5149527508422909', 't_2800126670220778', '', '', '', 'سليمان ابوعائشة', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718364581821533/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:43', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(388, 1, 23, '2085064648484866', '1', '5809341349083411', 't_3297326866990113', '', '', '', 'Young Shehata', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718196138505044/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:43', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(389, 1, 23, '2085064648484866', '1', '3750625611688757', 't_3386669081356736', '', '', '', 'Ahmad Hamad', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718194581838533/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:44', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(390, 1, 23, '2085064648484866', '1', '4013799585326529', 't_10223992600944858', '', '', '', 'Ahmad Al Hafez', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718123235179001/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:44', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(391, 1, 23, '2085064648484866', '1', '3111621838892209', 't_2733316980237623', '', '', '', 'Ahmed Elkaffass', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718038715187453/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:44', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(392, 1, 23, '2085064648484866', '1', '3765004193606959', 't_2740711406149043', '', '', '', 'Jalal A. Elhaj', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718047441853247/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:45', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(393, 1, 23, '2085064648484866', '1', '3871185876273876', 't_3572371056130950', '', '', '', 'السفير.هاني الجمال', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718092931848698/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:45', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(394, 1, 23, '2085064648484866', '1', '5041632012578316', 't_3084597334909814', '', '', '', 'Anvar Tk', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717818385209486/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:45', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(395, 1, 23, '2085064648484866', '1', '5203777263028316', 't_3157938164316480', '', '', '', 'Ahmed El Masry', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2718042398520418/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:46', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(396, 1, 23, '2085064648484866', '1', '3003390153122484', 't_3138020419612221', '', '', '', 'AZ Aldean Alulbe', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717985645192760/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:46', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(397, 1, 23, '2085064648484866', '1', '3267472793310629', 't_3285826781439536', '', '', '', 'Walid Abdelmoniem Selim', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717967615194563/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:46', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(398, 1, 23, '2085064648484866', '1', '3120433341403212', 't_3637542469606646', '', '', '', 'Amr Moorsi', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717966148528043/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:47', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(399, 1, 23, '2085064648484866', '1', '3649298041834053', 't_10163967442160022', '', '', '', 'Seif El Din Hegab', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717859331872058/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:47', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(400, 1, 23, '2085064648484866', '1', '3895967820423561', 't_1560279490817566', '', '', '', 'Mujahed Kamal Yousif', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717955461862445/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:47', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(401, 1, 23, '2085064648484866', '1', '5641085439266854', 't_674851766434778', '', '', '', 'Rabea Alnajjar', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717935165197808/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:48', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(402, 1, 23, '2085064648484866', '1', '3445664062205056', 't_10163959276105319', '', '', '', 'Amr Hassan El-Gamal', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717795175211807/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:48', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(403, 1, 23, '2085064648484866', '1', '4104759956235675', 't_10158341932015993', '', '', '', 'Mahmoud Mohamed Mahmoud', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717933465197978/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:49', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(404, 1, 23, '2085064648484866', '1', '5273569322684057', 't_2711516765758378', '', '', '', 'Mohamed Elfakharany', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717861431871848/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:49', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(405, 1, 23, '2085064648484866', '1', '3534274496683794', 't_3453039464730026', '', '', '', 'Hamada Gamel', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717851755206149/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:50', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(406, 1, 23, '2085064648484866', '1', '4067763843254274', 't_2784326085182402', '', '', '', 'خميس جاد', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717823345208990/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:50', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(407, 1, 23, '2085064648484866', '1', '3792891654159213', 't_3325217994211046', '', '', '', 'Hany Sherif', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717816128543045/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:50', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(408, 1, 23, '2085064648484866', '1', '4084855311565107', 't_326818678503133', '', '', '', 'Sawsan Flower', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717811015210223/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:51', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(409, 1, 23, '2085064648484866', '1', '3742078949204013', 't_2932524880352406', '', '', '', 'Ibrahim Osama Ibrahim', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717804831877508/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:51', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(410, 1, 23, '2085064648484866', '1', '4456162634400584', 't_3135800206498565', '', '', '', 'Jonathan Jody', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717417905249534/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:51', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(411, 1, 23, '2085064648484866', '1', '3830247170388248', 't_2680005048947687', '', '', '', 'Fady Ahmed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717796808544977/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:52', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(412, 1, 23, '2085064648484866', '1', '5152123444857781', 't_3105497249558352', '', '', '', 'Sayed Ashraf', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717671265224198/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:52', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(413, 1, 23, '2085064648484866', '1', '3115961458516113', 't_4658756050832653', '', '', '', 'Mohamed Eissa', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717764461881545/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:52', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(414, 1, 23, '2085064648484866', '1', '3257117194355342', 't_4834063589952579', '', '', '', 'Ahmed Gamal', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717589611899030/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:53', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(415, 1, 23, '2085064648484866', '1', '4197890196911693', 't_3400419080010362', '', '', '', 'Hedra Esam', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717551148569543/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:54', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(416, 1, 23, '2085064648484866', '1', '3482138971914804', 't_10158856388714396', '', '', '', 'Tamer Zedan', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717517285239596/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:55', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(417, 1, 23, '2085064648484866', '1', '3429196020437616', 't_325982218782484', '', '', '', 'بوب بيزنس', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717510145240310/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:55', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(418, 1, 23, '2085064648484866', '1', '4923285607696588', 't_1534003633457021', '', '', '', 'محمد عبده', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717461031911888/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:56', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(419, 1, 23, '2085064648484866', '1', '3082953501818868', 't_726735131497428', '', '', '', 'Micheal Soiral', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717492795242045/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:56', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(420, 1, 23, '2085064648484866', '1', '3540586832618723', 't_2586708584977363', '', '', '', 'Mohammad Subhan Abid', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717422485249076/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:56', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(421, 1, 23, '2085064648484866', '1', '5443421709031085', 't_10164031887355437', '', '', '', 'Michal S Thomas', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717418311916160/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:57', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(422, 1, 23, '2085064648484866', '1', '3884620058295737', 't_3099798223482225', '', '', '', 'Abdelrahman Essam', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2717062731951718/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:57', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0);
INSERT INTO `messenger_bot_subscriber` (`id`, `user_id`, `page_table_id`, `page_id`, `permission`, `subscribe_id`, `client_thread_id`, `contact_group_id`, `first_name`, `last_name`, `full_name`, `profile_pic`, `gender`, `locale`, `timezone`, `unavailable`, `last_error_message`, `unavailable_conversation`, `last_error_message_conversation`, `refferer_id`, `refferer_source`, `refferer_uri`, `subscribed_at`, `unsubscribed_at`, `link`, `is_image_download`, `image_path`, `status`, `is_bot_subscriber`, `is_email_unsubscriber`, `is_imported`, `is_updated_name`, `last_name_update_time`, `email`, `entry_time`, `last_update_time`, `phone_number`, `phone_number_entry_time`, `phone_number_last_update`, `user_location`, `location_map_url`, `birthdate`, `birthdate_entry_time`, `last_subscriber_interaction_time`, `is_24h_1_sent`, `woocommerce_drip_campaign_id`, `wc_user_id`, `password`, `subscriber_type`, `store_id`) VALUES
(423, 1, 23, '2085064648484866', '1', '3137683209655263', 't_3617822101583459', '', '', '', 'Mutwakil Othman', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716803645310960/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:57', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(424, 1, 23, '2085064648484866', '1', '3070925489642424', 't_10222454544089913', '', '', '', 'Benedic Lat', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716987885292536/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:58', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(425, 1, 23, '2085064648484866', '1', '3182845518429690', 't_3131553893587206', '', '', '', 'Anjum Shahzad', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716853611972630/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:58', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(426, 1, 23, '2085064648484866', '1', '2962462767210141', 't_10157816462459072', '', '', '', 'Eileen Maturan', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716953095296015/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:58', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(427, 1, 23, '2085064648484866', '1', '3505762339527689', 't_3049995855049089', '', '', '', 'Amr Arbi', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716793385311986/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:59', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(428, 1, 23, '2085064648484866', '1', '2446207495504523', 't_3214008151981536', '', '', '', 'Christopher Gargar', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716865728638085/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:00:59', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(429, 1, 23, '2085064648484866', '1', '3805873802834210', 't_734042057373090', '', '', '', 'Ahmed Sarwar', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716860885305236/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(430, 1, 23, '2085064648484866', '1', '5438386416179229', 't_2694681290820106', '', '', '', 'Rana Sohail', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716668355324489/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(431, 1, 23, '2085064648484866', '1', '4464419963584432', 't_10162966504173504', '', '', '', 'Sameh Samir Atalla', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716540535337271/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(432, 1, 23, '2085064648484866', '1', '3805039622937541', 't_10223615969929649', '', '', '', 'Ehab Enan', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716493338675324/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:01', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(433, 1, 23, '2085064648484866', '1', '3262652270458368', 't_3275661475812923', '', '', '', 'Anand Giri', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2715959902062001/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:01', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(434, 1, 23, '2085064648484866', '1', '3064009793718741', 't_4923652020994002', '', '', '', 'Gias Uddin Khokon', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716249965366328/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:01', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(435, 1, 23, '2085064648484866', '1', '3715778198520701', 't_10223590623610805', '', '', '', 'Mohamed Abd Alrahman Aldarame', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716114895379835/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:02', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(436, 1, 23, '2085064648484866', '1', '3984541148235533', 't_1015287122238431', '', '', '', 'Mahmoud Shahat', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2716052202052771/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:02', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(437, 1, 23, '2085064648484866', '1', '3979031498801604', 't_2707965132774242', '', '', '', 'Mahmoud Elmahdy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2715837638740894/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:02', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(438, 1, 23, '2085064648484866', '1', '5024193527650666', 't_3301725576533281', '', '', '', 'Bassam Hussien', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2715836928740965/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:03', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(439, 1, 23, '2085064648484866', '1', '4136012733099567', 't_3190627524318225', '', '', '', 'Marco Nagy Farag', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-11 22:00:36', '0000-00-00 00:00:00', '/2085064648484866/inbox/2715344522123539/', '0', '', '1', '0', '0', '1', '1', '2021-07-17 04:01:03', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(440, 1, 19, '105940371572898', '1', '4305069462884180', 't_515079196492642', '', '', '', 'Ashraf Qaruoti', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-17 03:30:04', '0000-00-00 00:00:00', '/105940371572898/inbox/178709370962664/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:07', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(441, 1, 19, '105940371572898', '1', '3745315642234567', 't_106595568368287', '', '', '', 'احمد محمد ال حمد', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-17 03:30:04', '0000-00-00 00:00:00', '/105940371572898/inbox/178932394273695/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:08', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(442, 1, 19, '105940371572898', '1', '3724523804314121', 't_2875584049322648', '', '', '', 'عمري صلاح', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-17 03:30:04', '0000-00-00 00:00:00', '/105940371572898/inbox/178679420965659/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:08', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(443, 1, 19, '105940371572898', '1', '4125462800873202', 't_3951976661566546', '', '', '', 'Marwa Wageah', '', '', '', '', '0', '', '0', '', '105940371572898_187319413434993', 'COMMENT PRIVATE REPLY', 'https://facebook.com/187319413434993_187368370096764', '2021-07-25 03:32:16', '0000-00-00 00:00:00', '/105940371572898/inbox/187368453430089/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:04', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(444, 1, 19, '105940371572898', '1', '4160388034058481', 't_1686154568236848', '', '', '', 'Ziad Farouk', '', '', '', '', '0', '', '0', '', '105940371572898_187936863373248', 'COMMENT PRIVATE REPLY', 'https://facebook.com/187936863373248_188687176631550', '2021-07-27 00:00:53', '0000-00-00 00:00:00', '/105940371572898/inbox/188687239964877/', '0', '', '1', '0', '0', '0', '1', '2021-07-27 00:15:04', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '2021-07-26 22:01:07', '1', 0, 0, '', 'messenger', 0),
(446, 1, 19, '105940371572898', '1', '4175311172589595', 't_647452593323504', '', '', '', 'Mohamed Allam', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/188666769966924/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:04', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(447, 1, 19, '105940371572898', '1', '4224760097616413', 't_378285670531596', '', '', '', 'Hana Ahmed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/188624796637788/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:05', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(449, 1, 19, '105940371572898', '1', '4187474737974492', 't_10159288533690470', '', '', '', 'Waleed Nawar', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/188496286650639/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:05', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(450, 1, 19, '105940371572898', '1', '4623948644303897', 't_848871932697596', '', '', '', 'Mohamed Kamal', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/188055013361433/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:05', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(451, 1, 19, '105940371572898', '1', '4050044478427869', 't_148187867392641', '', '', '', 'محمد رشاد', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/187923786707889/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:06', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(452, 1, 19, '105940371572898', '1', '4137923262928759', 't_3322159364677736', '', '', '', 'Elshafey Mohamed', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/187995733367361/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:06', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(453, 1, 19, '105940371572898', '1', '4225740607515056', 't_10159313272510149', '', '', '', 'Kamal Elbendary', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/187910040042597/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:06', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(454, 1, 19, '105940371572898', '1', '4923294297697001', 't_6566752793350861', '', '', '', 'Mohamed Elbba', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/187841970049404/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:07', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0),
(455, 1, 19, '105940371572898', '1', '6758935620815467', 't_230000735649274', '', '', '', 'Doaa Elhendwy', '', '', '', '', '0', '', '0', '', '', '', '', '2021-07-27 00:12:50', '0000-00-00 00:00:00', '/105940371572898/inbox/187657206734547/', '0', '', '1', '0', '0', '1', '1', '2021-07-27 00:15:07', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0, 0, '', 'messenger', 0);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_subscriber_extra_info`
--

CREATE TABLE `messenger_bot_subscriber_extra_info` (
  `id` int(11) NOT NULL,
  `subscriber_id` varchar(50) NOT NULL,
  `page_id` varchar(50) NOT NULL,
  `input_flow_campaign_id` int(10) NOT NULL,
  `last_question_sent_id` int(10) NOT NULL,
  `last_question_sent_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_template_category`
--

CREATE TABLE `messenger_bot_template_category` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `module_name` varchar(250) DEFAULT NULL,
  `add_ons_id` int(11) NOT NULL,
  `extra_text` varchar(50) NOT NULL DEFAULT 'month',
  `limit_enabled` enum('0','1') NOT NULL DEFAULT '1',
  `bulk_limit_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `add_ons_id`, `extra_text`, `limit_enabled`, `bulk_limit_enabled`, `deleted`) VALUES
(33, 'Social Poster - Account Import : Youtube', 0, '', '1', '0', '0'),
(65, 'Facebook Accounts', 0, '', '1', '0', '0'),
(78, 'Subscriber Manager : Background Lead Scan', 0, '', '0', '0', '0'),
(79, 'Conversation Promo Broadcast Send', 0, 'month', '1', '1', '0'),
(80, 'Comment Automation : Auto Reply Posts', 0, 'month', '1', '0', '0'),
(82, 'Inbox Conversation Manager', 0, '', '0', '0', '0'),
(100, 'Social Poster - Access', 0, '', '0', '0', '0'),
(101, 'Social Poster - Account Import : Pinterest', 0, '', '1', '0', '0'),
(102, 'Social Poster - Account Import : Twitter', 0, '', '1', '0', '0'),
(103, 'Social Poster - Account Import :  Linkedin', 0, '', '1', '0', '0'),
(105, 'Social Poster - Account Import : Reddit', 0, '', '1', '0', '0'),
(107, 'Social Poster - Account Import : Blogger', 0, '', '1', '0', '0'),
(108, 'Social Poster - Account Import :  WordPress', 0, '', '1', '0', '0'),
(109, 'Social Poster - Account Import :  WordPress (Self hosted) ', 0, '', '1', '0', '0'),
(110, 'Social Poster - Text Post', 0, 'month', '1', '1', '0'),
(111, 'Social Poster - Image Post', 0, 'month', '1', '1', '0'),
(112, 'Social Poster - Video Post', 0, 'month', '1', '1', '0'),
(113, 'Social Poster - Link Post', 0, 'month', '1', '1', '0'),
(114, 'Social Poster - HTML Post', 0, 'month', '1', '1', '0'),
(197, 'Messenger Bot - Persistent Menu', 0, '', '0', '0', '0'),
(198, 'Messenger Bot - Persistent Menu : Copyright Enabled', 0, '', '0', '0', '0'),
(199, 'Messenger Bot', 0, '', '0', '0', '0'),
(200, 'Facebook Pages', 0, '', '1', '0', '0'),
(220, 'Facebook Posting : CTA Post', 0, 'month', '1', '0', '0'),
(222, 'Facebook Posting : Carousel/Slider Post', 0, 'month', '1', '0', '0'),
(223, 'Facebook Posting :  Text/Image/Link/Video Post', 0, 'month', '1', '0', '0'),
(251, 'Comment Automation : Auto Comment Campaign', 0, '', '1', '0', '0'),
(256, 'RSS Auto Posting', 0, '', '1', '0', '0'),
(257, 'Messenger Bot : Export, Import & Tree View', 0, '', '1', '', '0'),
(263, 'Email Broadcast - Email Send', 0, 'month', '1', '0', '0'),
(264, 'SMS Broadcast - SMS Send', 0, 'month', '1', '0', '0'),
(265, 'Messenger Bot - Email Auto Responder', 0, '', '1', '0', '0'),
(267, 'Utility Search Tools', 0, 'month', '1', '0', '0'),
(268, 'Messenger E-commerce', 0, '', '1', '0', '0'),
(275, 'One Time Notification Send', 0, 'month', '1', '0', '0'),
(277, 'Social Poster - Account Import :  Medium', 0, '', '1', '0', '0'),
(279, 'Instagram Auto Comment Reply Enable Post', 0, 'month', '1', '0', '0'),
(296, 'Instagram Posting : Image/Video Post', 0, 'month', '1', '1', '0'),
(310, 'Whatsapp Send Order', 4, '', '0', '0', '0'),
(317, 'E-commerce Related Products', 5, '', '1', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `native_api`
--

CREATE TABLE `native_api` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `api_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `otn_optin_subscriber`
--

CREATE TABLE `otn_optin_subscriber` (
  `id` int(11) NOT NULL,
  `otn_id` int(11) NOT NULL,
  `subscriber_id` varchar(255) NOT NULL,
  `page_table_id` int(11) NOT NULL,
  `otn_token` varchar(255) NOT NULL,
  `optin_time` datetime NOT NULL,
  `is_sent` enum('0','1') NOT NULL DEFAULT '0',
  `sent_time` datetime NOT NULL,
  `sent_response` text NOT NULL,
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `otn_optin_subscriber`
--

INSERT INTO `otn_optin_subscriber` (`id`, `otn_id`, `subscriber_id`, `page_table_id`, `otn_token`, `optin_time`, `is_sent`, `sent_time`, `sent_response`, `deleted`) VALUES
(2, 3, '4120329354677542', 19, '7374266282173011349', '2021-04-21 06:54:22', '0', '0000-00-00 00:00:00', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `otn_postback`
--

CREATE TABLE `otn_postback` (
  `id` int(11) NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `otn_postback_id` varchar(191) NOT NULL,
  `reply_postback_id` varchar(255) NOT NULL,
  `label_id` varchar(191) NOT NULL,
  `drip_campaign_id` varchar(191) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `otn_postback`
--

INSERT INTO `otn_postback` (`id`, `template_name`, `user_id`, `page_id`, `otn_postback_id`, `reply_postback_id`, `label_id`, `drip_campaign_id`, `deleted`) VALUES
(3, 'subscribe', 1, 19, 'otn', '165', '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `package_name` varchar(250) NOT NULL,
  `module_ids` text NOT NULL,
  `monthly_limit` text,
  `bulk_limit` text,
  `price` varchar(20) NOT NULL DEFAULT '0',
  `validity` int(11) NOT NULL,
  `validity_extra_info` varchar(255) NOT NULL DEFAULT '1,M',
  `is_default` enum('0','1') NOT NULL DEFAULT '0',
  `visible` enum('0','1') NOT NULL DEFAULT '1',
  `highlight` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `package_name`, `module_ids`, `monthly_limit`, `bulk_limit`, `price`, `validity`, `validity_extra_info`, `is_default`, `visible`, `highlight`, `deleted`) VALUES
(1, 'Free Plan', '251,80,65,200,223,222,220,199,100,103,114,111,113,110,112,267', '{\"251\":\"3\",\"80\":\"3\",\"65\":\"1\",\"200\":\"1\",\"223\":\"3\",\"222\":\"3\",\"220\":\"3\",\"199\":\"0\",\"100\":\"0\",\"103\":\"1\",\"114\":\"1\",\"111\":\"1\",\"113\":\"1\",\"110\":\"1\",\"112\":\"1\",\"267\":\"3\"}', '{\"251\":\"0\",\"80\":\"0\",\"65\":\"0\",\"200\":\"0\",\"223\":\"0\",\"222\":\"0\",\"220\":\"0\",\"199\":\"0\",\"100\":\"0\",\"103\":\"0\",\"114\":\"5\",\"111\":\"5\",\"113\":\"5\",\"110\":\"5\",\"112\":\"5\",\"267\":\"0\"}', 'Trial', 30, '30,D', '1', '1', '0', '0'),
(2, 'Plus', '251,80,79,65,200,223,222,220,279,296,199,197,268', '{\"251\":\"100\",\"80\":\"100\",\"79\":\"50\",\"65\":\"0\",\"200\":\"0\",\"223\":\"50\",\"222\":\"50\",\"220\":\"50\",\"279\":\"10\",\"296\":\"10\",\"199\":\"0\",\"197\":\"0\",\"268\":\"5\"}', '{\"251\":\"0\",\"80\":\"0\",\"79\":\"0\",\"65\":\"0\",\"200\":\"0\",\"223\":\"0\",\"222\":\"0\",\"220\":\"0\",\"279\":\"0\",\"296\":\"0\",\"199\":\"0\",\"197\":\"0\",\"268\":\"0\"}', '35.00', 30, '1,M', '0', '1', '1', '1'),
(3, 'Plus-Test', '65,200,199', '{\"65\":\"0\",\"200\":\"0\",\"199\":\"0\"}', '{\"65\":\"0\",\"200\":\"0\",\"199\":\"0\"}', '10.00', 2, '2,D', '0', '1', '0', '1'),
(4, 'Free Plan', '251,80,65,200,223,222,220,82,199,197,198,257', '{\"251\":\"1\",\"80\":\"1\",\"65\":\"1\",\"200\":\"1\",\"223\":\"1\",\"222\":\"1\",\"220\":\"1\",\"82\":\"0\",\"199\":\"0\",\"197\":\"0\",\"198\":\"0\",\"257\":\"1\"}', '{\"251\":\"0\",\"80\":\"0\",\"65\":\"0\",\"200\":\"0\",\"223\":\"0\",\"222\":\"0\",\"220\":\"0\",\"82\":\"0\",\"199\":\"0\",\"197\":\"0\",\"198\":\"0\",\"257\":\"0\"}', '0', 30, '1,M', '0', '1', '0', '1'),
(5, 'lite', '251,80,79,263,65,200,223,222,220,82,279,296,199,265,197,198,257,268,275,100,103,114,111,113,110,112,78,267', '{\"251\":\"10\",\"80\":\"10\",\"79\":\"5\",\"263\":\"5\",\"65\":\"1\",\"200\":\"2\",\"223\":\"10\",\"222\":\"10\",\"220\":\"10\",\"82\":\"0\",\"279\":\"10\",\"296\":\"10\",\"199\":\"0\",\"265\":\"3\",\"197\":\"0\",\"198\":\"0\",\"257\":\"3\",\"268\":\"1\",\"275\":\"1\",\"100\":\"0\",\"103\":\"1\",\"114\":\"5\",\"111\":\"3\",\"113\":\"3\",\"110\":\"3\",\"112\":\"3\",\"78\":\"0\",\"267\":\"5\"}', '{\"251\":\"0\",\"80\":\"0\",\"79\":\"1\",\"263\":\"0\",\"65\":\"0\",\"200\":\"0\",\"223\":\"0\",\"222\":\"0\",\"220\":\"0\",\"82\":\"0\",\"279\":\"0\",\"296\":\"1\",\"199\":\"0\",\"265\":\"0\",\"197\":\"0\",\"198\":\"0\",\"257\":\"0\",\"268\":\"0\",\"275\":\"0\",\"100\":\"0\",\"103\":\"0\",\"114\":\"1\",\"111\":\"1\",\"113\":\"1\",\"110\":\"1\",\"112\":\"1\",\"78\":\"0\",\"267\":\"0\"}', '9', 30, '1,M', '0', '1', '1', '0'),
(6, 'Plus', '251,80,79,263,65,200,223,222,220,82,279,296,199,265,197,198,257,268,275,256,264,100,103,114,111,113,110,112,78,267', '{\"251\":\"20\",\"80\":\"20\",\"79\":\"20\",\"263\":\"10\",\"65\":\"2\",\"200\":\"4\",\"223\":\"20\",\"222\":\"20\",\"220\":\"20\",\"82\":\"0\",\"279\":\"20\",\"296\":\"20\",\"199\":\"0\",\"265\":\"15\",\"197\":\"0\",\"198\":\"0\",\"257\":\"2\",\"268\":\"2\",\"275\":\"4\",\"256\":\"2\",\"264\":\"5\",\"100\":\"0\",\"103\":\"0\",\"114\":\"5\",\"111\":\"5\",\"113\":\"5\",\"110\":\"5\",\"112\":\"5\",\"78\":\"0\",\"267\":\"10\"}', '{\"251\":\"0\",\"80\":\"0\",\"79\":\"2\",\"263\":\"0\",\"65\":\"0\",\"200\":\"0\",\"223\":\"0\",\"222\":\"0\",\"220\":\"0\",\"82\":\"0\",\"279\":\"0\",\"296\":\"2\",\"199\":\"0\",\"265\":\"0\",\"197\":\"0\",\"198\":\"0\",\"257\":\"2\",\"268\":\"0\",\"275\":\"0\",\"256\":\"0\",\"264\":\"0\",\"100\":\"0\",\"103\":\"0\",\"114\":\"2\",\"111\":\"2\",\"113\":\"2\",\"110\":\"2\",\"112\":\"2\",\"78\":\"0\",\"267\":\"0\"}', '19', 30, '1,M', '0', '1', '0', '0'),
(7, 'Premium', '251,80,79,263,65,200,223,222,220,82,279,296,199,265,197,198,257,268,275,264,100,103,114,111,113,110,112,78,267', '{\"251\":\"0\",\"80\":\"0\",\"79\":\"0\",\"263\":\"0\",\"65\":\"0\",\"200\":\"0\",\"223\":\"0\",\"222\":\"0\",\"220\":\"0\",\"82\":\"0\",\"279\":\"0\",\"296\":\"0\",\"199\":\"0\",\"265\":\"0\",\"197\":\"0\",\"198\":\"0\",\"257\":\"0\",\"268\":\"10\",\"275\":\"0\",\"264\":\"0\",\"100\":\"0\",\"103\":\"0\",\"114\":\"0\",\"111\":\"0\",\"113\":\"0\",\"110\":\"0\",\"112\":\"0\",\"78\":\"0\",\"267\":\"0\"}', '{\"251\":\"0\",\"80\":\"0\",\"79\":\"0\",\"263\":\"0\",\"65\":\"0\",\"200\":\"0\",\"223\":\"0\",\"222\":\"0\",\"220\":\"0\",\"82\":\"0\",\"279\":\"0\",\"296\":\"0\",\"199\":\"0\",\"265\":\"0\",\"197\":\"0\",\"198\":\"0\",\"257\":\"0\",\"268\":\"0\",\"275\":\"0\",\"264\":\"0\",\"100\":\"0\",\"103\":\"0\",\"114\":\"0\",\"111\":\"0\",\"113\":\"0\",\"110\":\"0\",\"112\":\"0\",\"78\":\"0\",\"267\":\"0\"}', '35', 30, '1,M', '0', '1', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `page_response_autoreply`
--

CREATE TABLE `page_response_autoreply` (
  `id` int(11) NOT NULL,
  `page_response_user_info_id` int(11) NOT NULL,
  `auto_reply_campaign_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_name` mediumtext COLLATE utf8mb4_unicode_ci,
  `post_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_created_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_description` longtext COLLATE utf8mb4_unicode_ci,
  `reply_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_like_comment` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `multiple_reply` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_reply_enabled` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nofilter_word_found_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_reply_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_private_reply_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `auto_private_reply_count` int(11) NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `last_reply_time` datetime NOT NULL,
  `error_message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_comment_after_comment_reply` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete_offensive` enum('hide','delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `offensive_words` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_message_offensive_words` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden_comment_count` int(11) NOT NULL,
  `deleted_comment_count` int(11) NOT NULL,
  `auto_comment_reply_count` int(11) NOT NULL,
  `pause_play` enum('play','pause') COLLATE utf8mb4_unicode_ci NOT NULL,
  `structured_message` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_response_auto_like_report`
--

CREATE TABLE `page_response_auto_like_report` (
  `id` int(11) NOT NULL,
  `page_response_auto_like_share_report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `auto_like_page_table_id` text NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_response_auto_like_share`
--

CREATE TABLE `page_response_auto_like_share` (
  `id` int(11) NOT NULL,
  `page_response_user_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_name` text,
  `page_id` varchar(200) NOT NULL,
  `auto_share_post` enum('0','1') NOT NULL DEFAULT '0',
  `auto_share_this_post_by_pages` text NOT NULL,
  `delay_time` varchar(20) NOT NULL,
  `auto_like_post` enum('0','1') NOT NULL DEFAULT '0',
  `auto_like_this_post_by_pages` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_response_auto_like_share_report`
--

CREATE TABLE `page_response_auto_like_share_report` (
  `id` int(11) NOT NULL,
  `page_response_auto_like_share_id` int(11) NOT NULL,
  `page_response_user_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_name` text,
  `page_id` varchar(200) NOT NULL,
  `post_id` varchar(200) NOT NULL,
  `auto_share_post` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '0 = no, 1 = yes, 2 = processing, 3=completed',
  `share_count` int(11) NOT NULL,
  `share_done` int(11) NOT NULL,
  `share_last_tried` datetime NOT NULL,
  `auto_share_this_post_by_pages` text NOT NULL,
  `auto_share_report` longtext,
  `delay_time` varchar(20) NOT NULL,
  `auto_like_post` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '0 = no, 1 = yes, 2 = processing, 3=completed',
  `like_count` int(11) NOT NULL,
  `like_done` int(11) NOT NULL,
  `like_last_tried` datetime NOT NULL,
  `auto_like_this_post_by_pages` text NOT NULL,
  `auto_like_report` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_response_auto_share_report`
--

CREATE TABLE `page_response_auto_share_report` (
  `id` int(11) NOT NULL,
  `page_response_auto_like_share_report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `auto_share_page_table_id` text NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_response_report`
--

CREATE TABLE `page_response_report` (
  `id` int(11) NOT NULL,
  `page_response_autoreply_id` int(11) NOT NULL,
  `auto_reply_campaign_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_name` text,
  `post_id` varchar(200) NOT NULL,
  `post_created_at` varchar(255) DEFAULT NULL,
  `post_description` longtext,
  `reply_type` varchar(200) NOT NULL,
  `auto_like_comment` enum('no','yes') NOT NULL,
  `multiple_reply` enum('no','yes') NOT NULL,
  `comment_reply_enabled` enum('no','yes') NOT NULL,
  `nofilter_word_found_text` longtext NOT NULL,
  `auto_reply_text` longtext NOT NULL,
  `auto_private_reply_status` enum('0','1','2') NOT NULL DEFAULT '0',
  `auto_private_reply_count` int(11) NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `last_reply_time` datetime NOT NULL,
  `error_message` text NOT NULL,
  `hide_comment_after_comment_reply` enum('no','yes') NOT NULL,
  `is_delete_offensive` enum('hide','delete') NOT NULL,
  `offensive_words` longtext NOT NULL,
  `private_message_offensive_words` longtext NOT NULL,
  `hidden_comment_count` int(11) NOT NULL,
  `deleted_comment_count` int(11) NOT NULL,
  `auto_comment_reply_count` int(11) NOT NULL,
  `already_replied_comment_ids` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_config`
--

CREATE TABLE `payment_config` (
  `id` int(11) NOT NULL,
  `paypal_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_payment_type` enum('manual','recurring') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `paypal_mode` enum('live','sandbox') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'live',
  `stripe_secret_key` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_publishable_key` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razorpay_key_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razorpay_key_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paystack_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paystack_public_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercadopago_public_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercadopago_access_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `marcadopago_country` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mollie_api_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `manual_payment` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `manual_payment_instruction` mediumtext COLLATE utf8mb4_unicode_ci,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sslcommerz_store_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sslcommerz_store_password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sslcommers_mode` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senangpay_merchent_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `senangpay_secret_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `senangpay_mode` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instamojo_api_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `instamojo_auth_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `instamojo_mode` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toyyibpay_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toyyibpay_category_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toyyibpay_mode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xendit_secret_api_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `myfatoorah_api_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `myfatoorah_mode` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymaya_public_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymaya_secret_key` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymaya_mode` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_config`
--

INSERT INTO `payment_config` (`id`, `paypal_email`, `paypal_payment_type`, `paypal_mode`, `stripe_secret_key`, `stripe_publishable_key`, `razorpay_key_id`, `razorpay_key_secret`, `paystack_secret_key`, `paystack_public_key`, `mercadopago_public_key`, `mercadopago_access_token`, `marcadopago_country`, `mollie_api_key`, `currency`, `manual_payment`, `manual_payment_instruction`, `deleted`, `sslcommerz_store_id`, `sslcommerz_store_password`, `sslcommers_mode`, `senangpay_merchent_id`, `senangpay_secret_key`, `senangpay_mode`, `instamojo_api_key`, `instamojo_auth_token`, `instamojo_mode`, `toyyibpay_secret_key`, `toyyibpay_category_code`, `toyyibpay_mode`, `xendit_secret_api_key`, `myfatoorah_api_key`, `myfatoorah_mode`, `paymaya_public_key`, `paymaya_secret_key`, `paymaya_mode`) VALUES
(1, 'rashad.m.tantawy@gmail.com', 'manual', 'live', '', '', '', '', '', '', '', '', 'ar', '', 'USD', 'no', '', '0', '', '', 'live', '', '', 'live', '', '', 'live', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_error_log`
--

CREATE TABLE `paypal_error_log` (
  `id` int(11) NOT NULL,
  `call_time` datetime DEFAULT NULL,
  `ipn_value` text,
  `error_log` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paypal_error_log`
--

INSERT INTO `paypal_error_log` (`id`, `call_time`, `ipn_value`, `error_log`) VALUES
(1, '2021-03-20 22:11:47', '{\"verify_status\":\"VERIFIED\",\"data\":{\"mc_gross\":\"1.00\",\"protection_eligibility\":\"Eligible\",\"address_status\":\"confirmed\",\"payer_id\":\"S5UKC5LTPC294\",\"address_street\":\"none\",\"payment_date\":\"13:11:15 Mar 20, 2021 PDT\",\"payment_status\":\"Completed\",\"charset\":\"windows-1252\",\"address_zip\":\"02554\",\"first_name\":\"RASHAD\",\"mc_fee\":\"0.34\",\"address_country_code\":\"US\",\"address_name\":\"Orman company\",\"notify_version\":\"3.9\",\"subscr_id\":\"I-LAJNDYAURUDW\",\"custom\":\"10_4\",\"payer_status\":\"unverified\",\"business\":\"rashad.m.tantawy@gmail.com\",\"address_country\":\"\",\"address_city\":\"egypt\",\"verify_sign\":\"AX2VzBOm4Yo4OS3XBSiBgU5UWUBIAp8I-RXs6L.f24wsCsnz-NV2Y4-M\",\"payer_email\":\"bebodeath@gmail.com\",\"txn_id\":\"4LF42907B74394348\",\"payment_type\":\"instant\",\"payer_business_name\":\"Orman company\",\"last_name\":\"Tantawy\",\"address_state\":\"AK\",\"receiver_email\":\"rashad.m.tantawy@gmail.com\",\"payment_fee\":\"0.34\",\"receiver_id\":\"EWMGE3URQ5LGC\",\"txn_type\":\"subscr_payment\",\"item_name\":\"Gaxa : Lite (30 days)\",\"mc_currency\":\"USD\",\"residence_country\":\"US\",\"transaction_subject\":\"Gaxa : Lite (30 days)\",\"payment_gross\":\"1.00\",\"ipn_track_id\":\"90c0fb6bc731d\"},\"api_key\":\"\"}', '0 : Operation timed out after 5000 milliseconds with 0 bytes received'),
(2, '2021-03-20 22:11:52', '{\"verify_status\":\"VERIFIED\",\"data\":{\"txn_type\":\"subscr_signup\",\"subscr_id\":\"I-LAJNDYAURUDW\",\"last_name\":\"Tantawy\",\"residence_country\":\"US\",\"mc_currency\":\"USD\",\"item_name\":\"Gaxa : Lite (30 days)\",\"business\":\"rashad.m.tantawy@gmail.com\",\"amount3\":\"1.00\",\"recurring\":\"1\",\"address_street\":\"none\",\"verify_sign\":\"ADxrz8JwFvJhQAFqLnlyszlYpIT4A8MBh8dNffQ7IFcvYCSjFK9sAj1d\",\"payer_status\":\"unverified\",\"payer_email\":\"bebodeath@gmail.com\",\"address_status\":\"confirmed\",\"first_name\":\"RASHAD\",\"receiver_email\":\"rashad.m.tantawy@gmail.com\",\"address_country_code\":\"US\",\"payer_id\":\"S5UKC5LTPC294\",\"address_city\":\"egypt\",\"reattempt\":\"1\",\"payer_business_name\":\"Orman company\",\"address_state\":\"AK\",\"subscr_date\":\"13:07:12 Mar 20, 2021 PDT\",\"address_zip\":\"02554\",\"custom\":\"10_4\",\"charset\":\"windows-1252\",\"notify_version\":\"3.9\",\"period3\":\"1 M\",\"address_country\":\"United States\",\"mc_amount3\":\"1.00\",\"address_name\":\"Orman company\",\"ipn_track_id\":\"90c0fb6bc731d\"},\"api_key\":\"\"}', '0 : Operation timed out after 5001 milliseconds with 0 bytes received'),
(3, '2021-04-20 14:07:51', '{\"verify_status\":\"VERIFIED\",\"data\":{\"txn_type\":\"subscr_failed\",\"subscr_id\":\"I-LAJNDYAURUDW\",\"last_name\":\"Tantawy\",\"residence_country\":\"US\",\"item_name\":\"Gaxa : Lite (30 days)\",\"payment_gross\":\"1.00\",\"mc_currency\":\"USD\",\"business\":\"rashad.m.tantawy@gmail.com\",\"verify_sign\":\"AM1L2k3mmn0Q.8vB1vgVdQb9-TPkA.mNQ92Byz2zvYaWa-HYNyC4NtIi\",\"payer_status\":\"unverified\",\"payer_email\":\"bebodeath@gmail.com\",\"first_name\":\"RASHAD\",\"receiver_email\":\"rashad.m.tantawy@gmail.com\",\"payer_id\":\"S5UKC5LTPC294\",\"retry_at\":\"03:00:00 Apr 25, 2021 PDT\",\"payer_business_name\":\"Orman company\",\"mc_gross\":\"1.00\",\"custom\":\"10_4\",\"charset\":\"windows-1252\",\"notify_version\":\"3.9\",\"ipn_track_id\":\"90c0fb6bc731d\"},\"api_key\":\"\"}', '200 : '),
(4, '2021-04-25 15:01:11', '{\"verify_status\":\"VERIFIED\",\"data\":{\"txn_type\":\"subscr_failed\",\"subscr_id\":\"I-LAJNDYAURUDW\",\"last_name\":\"Tantawy\",\"residence_country\":\"US\",\"item_name\":\"Gaxa : Lite (30 days)\",\"payment_gross\":\"1.00\",\"mc_currency\":\"USD\",\"business\":\"rashad.m.tantawy@gmail.com\",\"verify_sign\":\"AH2I0SIcClN7bJrDdlU39-FaOGHlAlQmlFcOLuFNMEKcuXhn8KuyEg5G\",\"payer_status\":\"unverified\",\"payer_email\":\"bebodeath@gmail.com\",\"first_name\":\"RASHAD\",\"receiver_email\":\"rashad.m.tantawy@gmail.com\",\"payer_id\":\"S5UKC5LTPC294\",\"retry_at\":\"03:00:00 Apr 30, 2021 PDT\",\"payer_business_name\":\"Orman company\",\"mc_gross\":\"1.00\",\"custom\":\"10_4\",\"charset\":\"windows-1252\",\"notify_version\":\"3.9\",\"ipn_track_id\":\"fba7003df9adb\"},\"api_key\":\"\"}', '200 : '),
(5, '2021-04-30 13:47:48', '{\"verify_status\":\"VERIFIED\",\"data\":{\"payment_cycle\":\"Monthly\",\"txn_type\":\"recurring_payment_suspended_due_to_max_failed_payment\",\"last_name\":\"Tantawy\",\"next_payment_date\":\"N\\/A\",\"residence_country\":\"US\",\"initial_payment_amount\":\"0.00\",\"currency_code\":\"USD\",\"time_created\":\"13:07:12 Mar 20, 2021 PDT\",\"verify_sign\":\"AgeFVB3HLVg6U0l5a5QVoq0mk0xQAhDf7-2rN5.OipIg6vLdB7rhjCDW\",\"period_type\":\" Regular\",\"payer_status\":\"unverified\",\"tax\":\"0.00\",\"payer_email\":\"bebodeath@gmail.com\",\"first_name\":\"RASHAD\",\"receiver_email\":\"rashad.m.tantawy@gmail.com\",\"payer_id\":\"S5UKC5LTPC294\",\"product_type\":\"1\",\"payer_business_name\":\"Orman company\",\"shipping\":\"0.00\",\"amount_per_cycle\":\"1.00\",\"profile_status\":\"Suspended\",\"custom\":\"10_4\",\"charset\":\"windows-1252\",\"notify_version\":\"3.9\",\"amount\":\"1.00\",\"outstanding_balance\":\"1.00\",\"recurring_payment_id\":\"I-LAJNDYAURUDW\",\"product_name\":\"Gaxa : Lite (30 days)\",\"ipn_track_id\":\"d05279d86e48c\"},\"api_key\":\"\"}', '200 : ');

-- --------------------------------------------------------

--
-- Table structure for table `pinterest_board_info`
--

CREATE TABLE `pinterest_board_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pinterest_table_id` int(11) NOT NULL COMMENT 'rx_pinterest_autopost table id',
  `board_name` varchar(255) NOT NULL,
  `board_url` varchar(255) NOT NULL,
  `board_id` varchar(25) NOT NULL,
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pinterest_config`
--

CREATE TABLE `pinterest_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pinterest_users_info`
--

CREATE TABLE `pinterest_users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pinterest_user_id` varchar(30) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pins` int(11) NOT NULL,
  `boards` int(11) NOT NULL,
  `image` text NOT NULL,
  `code` varchar(255) NOT NULL,
  `add_date` date NOT NULL,
  `pinterest_config_table_id` int(11) NOT NULL,
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reddit_config`
--

CREATE TABLE `reddit_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reddit_users_info`
--

CREATE TABLE `reddit_users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_token` text NOT NULL,
  `refresh_token` varchar(250) NOT NULL,
  `token_type` varchar(200) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `profile_pic` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `add_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `send_email_to_autoresponder_log`
--

CREATE TABLE `send_email_to_autoresponder_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mailchimp_config_id` int(11) NOT NULL,
  `settings_type` varchar(50) NOT NULL COMMENT 'admin settings, member settings',
  `status` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `auto_responder_type` varchar(30) NOT NULL COMMENT 'mailchimp,aweber etc',
  `api_name` varchar(100) NOT NULL,
  `response` text NOT NULL,
  `insert_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_api_config`
--

CREATE TABLE `sms_api_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gateway_name` enum('planet','plivo','twilio','clickatell','clickatell-platform','nexmo','msg91.com','textlocal.in','sms4connect.com','telnor.com','mvaayoo.com','routesms.com','trio-mobile.com','sms40.com','africastalking.com','infobip.com','smsgatewayme','semysms.net','custom','custom_post') CHARACTER SET latin1 NOT NULL,
  `custom_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `username_auth_id` tinytext CHARACTER SET latin1 NOT NULL,
  `password_auth_token` tinytext CHARACTER SET latin1 NOT NULL,
  `routesms_host_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `api_id` tinytext CHARACTER SET latin1 NOT NULL,
  `input_http_url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `final_http_url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone_number` varchar(100) CHARACTER SET latin1 NOT NULL,
  `base_url` varchar(255) NOT NULL COMMENT 'for custom post method',
  `post_data` text NOT NULL COMMENT 'post data for custom post method',
  `status` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `deleted` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_email_contacts`
--

CREATE TABLE `sms_email_contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_type_id` text CHARACTER SET latin1 NOT NULL,
  `first_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `phone_number` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `notes` text NOT NULL,
  `unsubscribed` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `deleted` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_email_contact_group`
--

CREATE TABLE `sms_email_contact_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_email_contact_group`
--

INSERT INTO `sms_email_contact_group` (`id`, `user_id`, `type`, `created_at`, `deleted`) VALUES
(1, 1, 'Gaxa Group', '2021-07-17 03:31:29', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sms_sending_campaign`
--

CREATE TABLE `sms_sending_campaign` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `fb_page_id` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `label_ids` text NOT NULL,
  `excluded_label_ids` text NOT NULL,
  `label_names` text NOT NULL,
  `user_gender` varchar(20) NOT NULL,
  `user_time_zone` varchar(20) NOT NULL,
  `user_locale` varchar(50) NOT NULL,
  `contact_ids` mediumtext NOT NULL,
  `contact_type_id` mediumtext NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `campaign_message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `manual_phone` varchar(255) NOT NULL,
  `posting_status` enum('0','1','2','3') NOT NULL,
  `schedule_time` datetime NOT NULL,
  `time_zone` mediumtext NOT NULL,
  `total_thread` int(11) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `completed_at` datetime NOT NULL,
  `is_try_again` enum('0','1') NOT NULL DEFAULT '1',
  `campaign_delay` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_sending_campaign_send`
--

CREATE TABLE `sms_sending_campaign_send` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sms_api_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `contact_first_name` varchar(255) NOT NULL,
  `contact_last_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone_number` varchar(255) NOT NULL,
  `delivery_id` varchar(250) NOT NULL,
  `sent_time` datetime NOT NULL,
  `processed` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_machine_bulk_reply`
--

CREATE TABLE `tag_machine_bulk_reply` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `reply_content` text NOT NULL,
  `uploaded_image_video` varchar(255) NOT NULL,
  `reply_multiple` enum('0','1') DEFAULT '0',
  `report` longtext NOT NULL,
  `campaign_created` datetime NOT NULL,
  `posting_status` enum('0','1','2') NOT NULL DEFAULT '0',
  `delay_time` int(11) NOT NULL,
  `is_try_again` enum('0','1') NOT NULL DEFAULT '1',
  `total_reply` int(11) NOT NULL,
  `schedule_type` enum('now','later') NOT NULL DEFAULT 'now',
  `schedule_time` datetime NOT NULL,
  `time_zone` varchar(255) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `last_try_error_count` int(11) NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `tag_machine_enabled_post_list_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_id` varchar(255) NOT NULL COMMENT 'facebook page id',
  `page_name` varchar(255) DEFAULT NULL,
  `page_profile` text NOT NULL,
  `post_id` varchar(200) NOT NULL,
  `post_created_at` varchar(255) DEFAULT NULL,
  `post_description` text,
  `error_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_machine_bulk_reply_send`
--

CREATE TABLE `tag_machine_bulk_reply_send` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL COMMENT 'tag_machine_bulk_reply.id',
  `comment_id` varchar(255) NOT NULL,
  `commenter_fb_id` varchar(255) NOT NULL,
  `commenter_name` varchar(255) NOT NULL,
  `comment_time` datetime NOT NULL,
  `sent_time` datetime NOT NULL,
  `response` varchar(255) NOT NULL,
  `processed` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_machine_bulk_tag`
--

CREATE TABLE `tag_machine_bulk_tag` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `tag_database` longtext NOT NULL,
  `tag_exclude` longtext NOT NULL,
  `tag_content` text NOT NULL,
  `uploaded_image_video` varchar(255) NOT NULL,
  `error_message` text NOT NULL,
  `tag_response` text NOT NULL,
  `schedule_type` enum('now','later') NOT NULL DEFAULT 'now',
  `schedule_time` datetime NOT NULL,
  `time_zone` varchar(255) NOT NULL,
  `campaign_created` datetime NOT NULL,
  `posting_status` enum('0','1','2') NOT NULL DEFAULT '0',
  `last_updated_at` datetime NOT NULL,
  `tag_machine_enabled_post_list_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_id` varchar(255) NOT NULL COMMENT 'facebook page id',
  `page_name` varchar(255) DEFAULT NULL,
  `page_profile` text NOT NULL,
  `post_id` varchar(200) NOT NULL,
  `post_created_at` varchar(255) DEFAULT NULL,
  `post_description` text,
  `commenter_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_machine_commenter_info`
--

CREATE TABLE `tag_machine_commenter_info` (
  `id` int(11) NOT NULL,
  `tag_machine_enabled_post_list_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_id` varchar(255) NOT NULL COMMENT 'facebook page id',
  `page_name` varchar(255) DEFAULT NULL,
  `post_id` varchar(200) NOT NULL,
  `last_comment_id` varchar(255) NOT NULL,
  `last_comment_time` varchar(255) NOT NULL,
  `commenter_fb_id` varchar(255) NOT NULL,
  `commenter_name` varchar(255) NOT NULL,
  `subscribed` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_machine_comment_info`
--

CREATE TABLE `tag_machine_comment_info` (
  `id` int(11) NOT NULL,
  `tag_machine_enabled_post_list_id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_id` varchar(255) NOT NULL COMMENT 'facebook page id',
  `page_name` varchar(255) DEFAULT NULL,
  `post_id` varchar(200) NOT NULL,
  `comment_id` varchar(255) NOT NULL,
  `comment_text` text NOT NULL,
  `commenter_fb_id` varchar(255) NOT NULL,
  `commenter_name` varchar(255) NOT NULL,
  `comment_time` varchar(255) NOT NULL,
  `subscribed` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_machine_enabled_post_list`
--

CREATE TABLE `tag_machine_enabled_post_list` (
  `id` int(11) NOT NULL,
  `facebook_rx_fb_user_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_info_table_id` int(11) NOT NULL,
  `page_id` varchar(255) NOT NULL COMMENT 'facebook page id',
  `page_name` varchar(255) DEFAULT NULL,
  `page_profile` text NOT NULL,
  `post_id` varchar(200) NOT NULL,
  `post_created_at` varchar(255) DEFAULT NULL,
  `post_description` text,
  `last_updated_at` datetime NOT NULL,
  `commenter_count` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `id` int(11) NOT NULL,
  `verify_status` varchar(200) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `paypal_email` varchar(200) NOT NULL,
  `receiver_email` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `payment_date` varchar(100) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `paid_amount` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `cycle_start_date` date NOT NULL,
  `cycle_expired_date` date NOT NULL,
  `package_id` int(11) NOT NULL,
  `stripe_card_source` text NOT NULL,
  `paypal_txn_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`id`, `verify_status`, `first_name`, `last_name`, `paypal_email`, `receiver_email`, `country`, `payment_date`, `payment_type`, `transaction_id`, `paid_amount`, `user_id`, `cycle_start_date`, `cycle_expired_date`, `package_id`, `stripe_card_source`, `paypal_txn_type`) VALUES
(1, 'VERIFIED', 'RASHAD', 'Tantawy', 'bebodeath@gmail.com', 'rashad.m.tantawy@gmail.com', 'US', '2021-03-20 22:11:15', 'PAYPAL-Instant', '4LF42907B74394348', 1, 10, '2021-03-20', '2021-04-19', 4, '', ''),
(2, 'VERIFIED', 'RASHAD', 'Tantawy', 'bebodeath@gmail.com', 'rashad.m.tantawy@gmail.com', 'US', '1970-01-01 02:00:00', 'PAYPAL', '', 0, 10, '2021-04-20', '2021-05-20', 4, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history_manual`
--

CREATE TABLE `transaction_history_manual` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `paid_amount` varchar(255) NOT NULL,
  `paid_currency` char(4) NOT NULL,
  `additional_info` longtext NOT NULL,
  `filename` varchar(255) NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tumblr_config`
--

CREATE TABLE `tumblr_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `consumer_id` varchar(255) NOT NULL,
  `consumer_secret` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_config`
--

CREATE TABLE `twitter_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `consumer_id` varchar(255) NOT NULL,
  `consumer_secret` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_users_info`
--

CREATE TABLE `twitter_users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `oauth_token` varchar(200) NOT NULL,
  `oauth_token_secret` varchar(200) NOT NULL,
  `screen_name` varchar(200) NOT NULL,
  `twitter_user_id` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `profile_image` text NOT NULL,
  `followers` int(11) NOT NULL,
  `add_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ultrapost_auto_reply`
--

CREATE TABLE `ultrapost_auto_reply` (
  `id` int(11) NOT NULL,
  `ultrapost_campaign_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `reply_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_like_comment` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `multiple_reply` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_reply_enabled` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nofilter_word_found_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_reply_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_comment_after_comment_reply` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete_offensive` enum('hide','delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `offensive_words` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_message_offensive_words` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `structured_message` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `page_name` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ultrapost_auto_reply`
--

INSERT INTO `ultrapost_auto_reply` (`id`, `ultrapost_campaign_name`, `user_id`, `reply_type`, `auto_like_comment`, `multiple_reply`, `comment_reply_enabled`, `nofilter_word_found_text`, `auto_reply_text`, `hide_comment_after_comment_reply`, `is_delete_offensive`, `offensive_words`, `private_message_offensive_words`, `page_ids`, `structured_message`, `page_name`) VALUES
(7, 'General ProAtCoding Response', 1, 'generic', 'yes', 'yes', 'yes', '[{\"comment_reply\":\"\",\"private_reply\":\"\",\"image_link\":\"\",\"video_link\":\"\"}]', '[{\"comment_reply\":\"Thanks, #LEAD_USER_FIRST_NAME#  to contact us.\\r\\nPlease check your inbox\",\"private_reply\":\"176\",\"image_link\":\"\",\"video_link\":\"\"}]', 'no', 'hide', '', '', '23', 'yes', 'Pro At Coding'),
(8, 'Generic Comment replay for gaxa', 1, 'generic', 'yes', 'yes', 'yes', '[{\"comment_reply\":\"\",\"private_reply\":\"\",\"image_link\":\"\",\"video_link\":\"\"}]', '[{\"comment_reply\":\"\\u0627\\u0647\\u0644\\u0627\\u064b  #LEAD_USER_FIRST_NAME# \\r\\n\\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645\\u0643 , \\u062a\\u0645 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644\",\"private_reply\":\"177\",\"image_link\":\"\",\"video_link\":\"\"}]', 'no', 'hide', '', '', '19', 'yes', 'Gaxa');

-- --------------------------------------------------------

--
-- Table structure for table `update_list`
--

CREATE TABLE `update_list` (
  `id` int(11) NOT NULL,
  `files` text NOT NULL,
  `sql_query` text NOT NULL,
  `update_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usage_log`
--

CREATE TABLE `usage_log` (
  `id` bigint(20) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usage_month` int(11) NOT NULL,
  `usage_year` year(4) NOT NULL,
  `usage_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usage_log`
--

INSERT INTO `usage_log` (`id`, `module_id`, `user_id`, `usage_month`, `usage_year`, `usage_count`) VALUES
(1, 103, 1, 3, 2021, 1),
(2, 200, 1, 3, 2021, 1),
(3, 65, 1, 3, 2021, 1),
(6, 268, 1, 3, 2021, 0),
(7, 204, 1, 3, 2021, 3),
(8, 223, 1, 3, 2021, 2),
(9, 222, 1, 3, 2021, 2),
(10, 220, 1, 3, 2021, 3),
(13, 264, 1, 3, 2021, 1),
(22, 65, 21, 3, 2021, 1),
(23, 223, 1, 4, 2021, 3),
(24, 275, 1, 4, 2021, 1),
(25, 80, 1, 4, 2021, 5),
(26, 204, 1, 4, 2021, 3),
(29, 222, 1, 4, 2021, 1),
(30, 80, 1, 5, 2021, 19),
(31, 275, 1, 5, 2021, 1),
(32, 200, 1, 5, 2021, 1),
(33, 223, 1, 5, 2021, 1),
(34, 204, 1, 5, 2021, 1),
(35, 268, 1, 5, 2021, 0),
(36, 80, 1, 6, 2021, 2),
(37, 268, 1, 6, 2021, 1),
(38, 204, 1, 6, 2021, 1),
(39, 251, 1, 6, 2021, 1),
(40, 65, 39, 6, 2021, 1),
(41, 200, 39, 6, 2021, 1),
(42, 80, 1, 7, 2021, 6),
(43, 267, 1, 7, 2021, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(99) NOT NULL,
  `email` varchar(99) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `password` varchar(99) NOT NULL,
  `address` text NOT NULL,
  `user_type` enum('Member','Admin') NOT NULL,
  `status` enum('1','0') NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purchase_date` datetime NOT NULL,
  `last_login_at` datetime NOT NULL,
  `activation_code` varchar(20) DEFAULT NULL,
  `expired_date` datetime NOT NULL,
  `bot_status` enum('0','1') NOT NULL DEFAULT '1',
  `package_id` int(11) NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  `brand_logo` text,
  `brand_url` text,
  `vat_no` varchar(100) DEFAULT NULL,
  `currency` enum('USD','AUD','CAD','EUR','ILS','NZD','RUB','SGD','SEK','BRL') NOT NULL DEFAULT 'USD',
  `time_zone` varchar(255) DEFAULT NULL,
  `company_email` varchar(200) DEFAULT NULL,
  `paypal_email` varchar(100) NOT NULL,
  `paypal_subscription_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `last_payment_method` varchar(50) NOT NULL,
  `last_login_ip` varchar(25) NOT NULL,
  `affiliate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `password`, `address`, `user_type`, `status`, `add_date`, `purchase_date`, `last_login_at`, `activation_code`, `expired_date`, `bot_status`, `package_id`, `deleted`, `brand_logo`, `brand_url`, `vat_no`, `currency`, `time_zone`, `company_email`, `paypal_email`, `paypal_subscription_enabled`, `last_payment_method`, `last_login_ip`, `affiliate_id`) VALUES
(1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '+201118136665', '07fa63558df59ebfe357cabb0eed3e10', 'Cairo,Government Egypt', 'Admin', '1', '2019-08-26 01:00:00', '0000-00-00 00:00:00', '2021-07-27 00:57:01', NULL, '0000-00-00 00:00:00', '1', 0, '0', '', NULL, NULL, 'USD', '', NULL, '', '0', '', '45.246.214.127', 0),
(21, 'Hanan', 'hanansaid.art@gmail.com', '', '3fa4d97045c939ea502e6c00d298c8bd', '', 'Member', '1', '2021-03-22 17:24:44', '0000-00-00 00:00:00', '2021-03-27 00:43:23', '156458', '2021-03-27 00:00:00', '0', 1, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '', 0),
(37, 'shafik salah', 'shafiksalah44@gmail.com', '', '1318ed64fd3d213850ef4838e6dbeaee', '', 'Member', '1', '2021-04-18 17:47:58', '0000-00-00 00:00:00', '2021-04-18 19:50:09', '109781', '2021-04-23 00:00:00', '0', 1, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '156.199.225.133', 0),
(38, 'wessam azab', 'wessamazab@yahoo.com', '', '09540eebe874a25701779f481116a577', '', 'Member', '0', '2021-05-04 07:46:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '135165', '2021-05-09 00:00:00', '0', 1, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '', 0),
(39, 'mohamed reda', 'reda99763@gmail.com', '', 'f1acebdfedb454557485d92c64c45f3f', '', 'Member', '1', '2021-06-18 20:12:04', '0000-00-00 00:00:00', '2021-06-19 20:58:46', '186260', '2021-06-23 00:00:00', '0', 1, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '41.233.72.68', 0),
(40, 'Mr trend', 'mosatfa346@gmail.com', '', 'c26a6dfde2cedf93a9f8ecb9d8f58964', '', 'Member', '1', '2021-06-19 18:58:36', '0000-00-00 00:00:00', '2021-06-28 13:40:08', '877835', '2021-06-19 00:00:00', '0', 4, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '197.160.202.92', 0),
(41, 'Godfrey Samwel', 'godfreysamweli44@gmail.com', '', 'b78ee49f667592af173f70560b5db986', '', 'Member', '1', '2021-07-08 18:55:33', '0000-00-00 00:00:00', '2021-07-08 21:02:38', '214218', '2021-07-13 00:00:00', '0', 1, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '41.75.221.35', 0),
(42, 'HANAN MOHAMMED', 'hananmohammed2468@gmail.com', '', '', '', 'Admin', '1', '2021-07-27 10:26:21', '0000-00-00 00:00:00', '2021-07-27 03:26:21', '', '2021-08-26 00:00:00', '1', 1, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '', 0),
(43, 'test', 'test@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', '', 'Admin', '1', '2021-07-27 01:39:47', '0000-00-00 00:00:00', '2021-07-27 03:45:53', '139407', '2021-08-26 00:00:00', '1', 1, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '156.199.116.168', 0),
(45, 'ziruvybu', 'tacysaqah@mailinator.com', '201201611733', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', '', 'Member', '0', '2021-07-27 04:11:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '104754', '2021-08-26 00:00:00', '1', 1, '0', NULL, NULL, NULL, 'USD', NULL, NULL, '', '0', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_input_custom_fields`
--

CREATE TABLE `user_input_custom_fields` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_type` varchar(20) NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_input_custom_fields_assaign`
--

CREATE TABLE `user_input_custom_fields_assaign` (
  `id` int(11) NOT NULL,
  `subscriber_id` varchar(50) NOT NULL,
  `page_id` varchar(50) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value` text NOT NULL,
  `assaign_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_login_info`
--

CREATE TABLE `user_login_info` (
  `id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `login_time` datetime NOT NULL,
  `login_ip` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login_info`
--

INSERT INTO `user_login_info` (`id`, `user_id`, `user_name`, `user_email`, `login_time`, `login_ip`) VALUES
(1, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 10:15:37', '45.246.230.227'),
(2, 2, 'Rashad', 'bebodeath@gmail.com', '2021-03-13 16:07:20', '197.53.177.85'),
(3, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 16:08:59', '197.53.177.85'),
(4, 2, 'Rashad', 'bebodeath@gmail.com', '2021-03-13 16:13:46', '197.53.177.85'),
(5, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 16:20:06', '197.53.177.85'),
(6, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 16:30:34', '197.53.177.85'),
(7, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 16:45:15', '197.53.177.85'),
(8, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 18:31:34', '197.53.177.85'),
(9, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 18:35:12', '197.53.177.85'),
(10, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 18:38:17', '197.53.177.85'),
(11, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-13 19:02:44', '197.53.177.85'),
(12, 6, 'Hajar', 'hajarmohamed9820@gmail.com', '2021-03-14 11:14:03', '45.97.19.77'),
(13, 6, 'Hajar', 'hajarmohamed9820@gmail.com', '2021-03-14 12:03:29', '45.97.19.77'),
(14, 8, 'RashadTest', 'cerasoc169@grokleft.com', '2021-03-14 12:50:18', '197.53.177.85'),
(15, 6, 'Hajar', 'hajarmohamed9820@gmail.com', '2021-03-14 12:51:56', '45.97.19.77'),
(16, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-14 13:57:21', '197.53.177.85'),
(17, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-14 14:23:09', '197.53.177.85'),
(18, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-14 15:08:22', '197.53.177.85'),
(19, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-14 16:23:25', '197.53.177.85'),
(20, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-14 16:42:40', '197.53.177.85'),
(21, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-14 16:56:35', '197.53.177.85'),
(22, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-14 22:01:54', '45.243.194.211'),
(23, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-14 22:03:24', '45.243.194.211'),
(24, 9, 'Rashad', 'bebodeath@gmail.com', '2021-03-14 23:47:43', '45.243.194.211'),
(25, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-15 12:17:31', '45.243.194.211'),
(26, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-15 12:23:03', '45.243.194.211'),
(27, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-15 12:30:14', '45.243.194.211'),
(28, 13, 'HRashad', 'govor11812@gameqo.com', '2021-03-15 13:38:24', '45.97.19.77'),
(29, 11, 'Hajar', 'hajarmohamed9820@gmail.com', '2021-03-15 15:09:18', '45.97.19.77'),
(30, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-15 17:28:49', '45.243.194.211'),
(31, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-15 17:57:50', '45.243.194.211'),
(32, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-15 23:17:38', '45.243.194.211'),
(33, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-15 23:26:45', '45.243.194.211'),
(34, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 00:39:08', '45.243.194.211'),
(35, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-16 00:48:49', '45.243.194.211'),
(36, 17, 'Demo Reviewer', 'Reviewer@gaxa.com', '2021-03-16 01:11:05', '45.243.194.211'),
(37, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 01:22:53', '45.243.194.211'),
(38, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 01:30:36', '45.243.194.211'),
(39, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 01:31:49', '45.243.194.211'),
(40, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 01:33:55', '45.243.194.211'),
(41, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 01:40:08', '45.243.194.211'),
(42, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 01:40:37', '45.243.194.211'),
(43, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 01:49:59', '45.243.194.211'),
(44, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 02:20:21', '45.243.194.211'),
(45, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 02:25:53', '45.243.194.211'),
(46, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 03:22:21', '45.243.194.211'),
(47, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 03:27:27', '45.243.194.211'),
(48, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 03:46:37', '45.243.194.211'),
(49, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 03:47:11', '45.243.194.211'),
(50, 17, 'Demo Reviewer', 'Reviewer@gaxa.com', '2021-03-16 05:45:18', '163.114.133.1'),
(51, 17, 'Demo Reviewer', 'Reviewer@gaxa.com', '2021-03-16 06:18:36', '218.212.83.58'),
(52, 17, 'Demo Reviewer', 'Reviewer@gaxa.com', '2021-03-16 06:19:14', '218.212.83.58'),
(53, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-16 14:33:44', '45.243.194.211'),
(54, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 23:53:16', '41.129.33.96'),
(55, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-16 23:54:51', '41.129.33.96'),
(56, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-17 02:12:47', '41.129.33.96'),
(57, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-17 18:24:30', '197.53.182.83'),
(58, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-18 17:20:27', '45.243.130.102'),
(59, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-18 20:12:12', '45.243.130.102'),
(60, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-18 22:41:19', '45.243.130.102'),
(61, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-19 15:17:02', '45.243.236.83'),
(62, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-19 16:47:46', '102.47.233.107'),
(63, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-19 17:06:10', '102.47.233.107'),
(64, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-19 17:29:57', '102.47.233.107'),
(65, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-20 10:41:30', '45.243.236.83'),
(66, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-20 10:43:55', '45.243.236.83'),
(67, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-20 10:44:16', '45.243.236.83'),
(68, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-20 10:45:07', '45.243.236.83'),
(69, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-20 10:46:31', '45.243.236.83'),
(70, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-20 10:46:53', '45.243.236.83'),
(71, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-20 21:39:23', '45.243.236.83'),
(72, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-20 21:56:07', '45.243.208.30'),
(73, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-20 22:12:40', '45.243.208.30'),
(74, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-21 21:14:32', '41.129.37.237'),
(75, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-21 21:28:29', '41.129.37.237'),
(76, 10, 'Rashad', 'bebodeath@gmail.com', '2021-03-21 21:31:22', '41.129.37.237'),
(77, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-22 00:08:33', '41.129.37.237'),
(78, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-22 00:21:06', '41.129.37.237'),
(79, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-22 19:27:16', '41.129.37.237'),
(80, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-22 19:54:28', '41.129.37.237'),
(81, 22, 'test', 'bebodeath@gmail.com', '2021-03-22 21:37:26', '41.129.37.237'),
(82, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-22 21:39:08', '41.129.37.237'),
(83, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-23 00:46:37', '45.243.246.27'),
(84, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-23 01:08:32', '45.243.246.27'),
(85, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-23 21:32:39', '45.243.246.27'),
(86, 22, '', 'bebodeath@gmail.com', '2021-03-23 21:57:35', '45.243.246.27'),
(87, 22, '', 'bebodeath@gmail.com', '2021-03-23 22:00:39', '45.243.246.27'),
(88, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-23 22:01:14', '45.243.246.27'),
(89, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-24 13:51:29', '45.243.246.27'),
(90, 22, '', 'bebodeath@gmail.com', '2021-03-24 22:38:35', '45.246.235.31'),
(91, 22, 'Demo', 'bebodeath@gmail.com', '2021-03-24 22:39:04', '45.246.235.31'),
(92, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-24 22:50:33', '45.246.235.31'),
(93, 23, '', 'dohewew996@dwgtcm.com', '2021-03-24 22:51:21', '45.246.235.31'),
(94, 23, '', 'dohewew996@dwgtcm.com', '2021-03-24 23:03:00', '45.246.235.31'),
(95, 23, '', 'dohewew996@dwgtcm.com', '2021-03-24 23:36:42', '45.246.235.31'),
(96, 23, '', 'dohewew996@dwgtcm.com', '2021-03-24 23:37:02', '45.246.235.31'),
(97, 23, '', 'dohewew996@dwgtcm.com', '2021-03-24 23:46:15', '45.246.235.31'),
(98, 23, 'Demo', 'dohewew996@dwgtcm.com', '2021-03-25 00:56:03', '45.246.235.31'),
(99, 23, 'Demo', 'dohewew996@dwgtcm.com', '2021-03-25 01:01:33', '45.246.235.31'),
(100, 23, 'Demo', 'dohewew996@dwgtcm.com', '2021-03-26 16:38:36', '102.43.240.4'),
(101, 23, 'Demo', 'dohewew996@dwgtcm.com', '2021-03-26 16:51:28', '102.43.240.4'),
(102, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-26 16:51:52', '102.43.240.4'),
(103, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-26 18:21:19', '102.43.240.4'),
(104, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-03-28 00:47:16', '45.243.152.199'),
(105, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-01 19:44:25', '45.243.208.139'),
(106, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-02 12:43:01', '45.243.184.18'),
(107, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-02 21:39:51', '45.243.184.18'),
(108, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-06 00:27:44', '45.243.229.161'),
(109, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-06 21:19:10', '41.234.79.251'),
(110, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-07 11:40:36', '45.243.201.12'),
(111, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-13 02:26:59', '41.129.4.53'),
(112, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-14 19:09:26', '45.243.138.97'),
(113, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-15 02:50:07', '45.243.138.97'),
(114, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-15 21:48:53', '45.243.228.246'),
(115, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 04:30:38', '45.243.228.246'),
(116, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 04:32:22', '45.243.228.246'),
(117, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 04:39:09', '45.243.228.246'),
(118, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 04:59:58', '45.243.228.246'),
(119, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 05:04:01', '45.243.228.246'),
(120, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 05:05:27', '45.243.228.246'),
(121, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 05:12:31', '45.243.228.246'),
(122, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 05:16:37', '45.243.228.246'),
(123, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 05:21:51', '45.243.228.246'),
(124, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 05:23:35', '45.243.228.246'),
(125, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 05:24:18', '45.243.228.246'),
(126, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 05:30:20', '45.243.228.246'),
(127, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 19:01:38', '45.243.228.246'),
(128, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-16 19:23:21', '45.243.228.246'),
(129, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-17 01:37:04', '45.243.228.246'),
(130, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-17 04:07:03', '45.243.228.246'),
(131, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-17 05:30:36', '45.243.228.246'),
(132, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-17 15:34:27', '45.243.228.246'),
(133, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-17 17:47:58', '45.243.228.246'),
(134, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-18 01:14:51', '45.243.204.222'),
(135, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-18 02:24:44', '45.243.204.222'),
(136, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-18 16:03:25', '45.243.204.222'),
(137, 37, 'shafik salah', 'shafiksalah44@gmail.com', '2021-04-18 19:50:09', '156.199.225.133'),
(138, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-18 20:33:16', '45.243.236.226'),
(139, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-19 18:11:39', '45.243.209.44'),
(140, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-19 21:02:05', '45.243.209.44'),
(141, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-20 04:16:24', '45.243.209.44'),
(142, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-20 14:28:19', '45.243.209.44'),
(143, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-20 19:02:55', '45.243.209.44'),
(144, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 00:26:29', '45.243.209.44'),
(145, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 03:26:44', '45.243.209.44'),
(146, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 05:32:12', '45.243.209.44'),
(147, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 15:04:06', '45.243.209.44'),
(148, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 15:32:04', '45.243.209.44'),
(149, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 15:59:26', '45.243.209.44'),
(150, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 17:56:01', '45.243.152.21'),
(151, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 18:01:27', '45.243.152.21'),
(152, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-21 19:30:18', '45.243.152.21'),
(153, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-22 00:42:33', '45.243.152.21'),
(154, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-23 01:24:22', '45.243.152.21'),
(155, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-23 01:49:57', '45.243.152.21'),
(156, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-23 05:13:51', '45.243.152.21'),
(157, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-23 17:29:29', '41.129.31.211'),
(158, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-24 00:46:30', '41.129.31.211'),
(159, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-24 00:48:45', '41.129.31.211'),
(160, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-24 23:52:51', '41.129.31.211'),
(161, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-25 03:43:51', '41.129.31.211'),
(162, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-26 02:17:43', '45.243.145.206'),
(163, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-27 19:56:12', '45.243.186.10'),
(164, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-27 22:33:50', '196.132.130.148'),
(165, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-27 23:23:01', '196.132.130.148'),
(166, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-27 23:25:12', '196.132.130.148'),
(167, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-27 23:27:26', '196.132.130.148'),
(168, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-28 04:05:06', '45.243.186.10'),
(169, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-28 17:37:31', '45.243.152.27'),
(170, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-28 19:55:17', '45.243.152.27'),
(171, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-29 04:22:33', '41.129.26.126'),
(172, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-29 16:17:10', '41.129.26.126'),
(173, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-04-30 21:24:52', '45.243.163.212'),
(174, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-01 00:03:46', '45.243.163.212'),
(175, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-01 18:05:37', '45.243.163.212'),
(176, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-02 03:35:47', '45.243.163.212'),
(177, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-02 16:28:18', '45.243.163.212'),
(178, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-04 01:29:55', '41.129.11.33'),
(179, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-04 23:01:44', '102.60.126.22'),
(180, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-06 01:16:43', '45.243.201.216'),
(181, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-06 01:43:38', '45.243.201.216'),
(182, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-06 20:20:32', '45.243.201.216'),
(183, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-07 22:55:22', '45.246.211.60'),
(184, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-07 23:48:43', '45.246.211.60'),
(185, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-08 02:58:23', '45.246.211.60'),
(186, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-08 16:53:48', '45.246.211.60'),
(187, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-08 22:02:02', '45.246.211.60'),
(188, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-09 02:07:48', '41.129.31.115'),
(189, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-09 11:49:19', '41.129.31.115'),
(190, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-10 01:29:27', '41.129.31.115'),
(191, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-10 19:17:54', '41.129.31.115'),
(192, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-11 02:00:18', '45.243.175.157'),
(193, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-11 18:08:40', '45.246.223.226'),
(194, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-13 01:12:31', '45.246.223.226'),
(195, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-17 23:16:34', '45.243.129.94'),
(196, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-19 00:31:27', '45.243.129.94'),
(197, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-24 18:18:16', '156.178.101.53'),
(198, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-24 22:23:08', '45.243.134.64'),
(199, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-26 18:49:16', '45.243.164.234'),
(200, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-05-27 14:38:56', '102.47.232.116'),
(201, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-05 13:24:40', '45.243.145.254'),
(202, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-10 23:39:23', '45.243.154.210'),
(203, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-11 15:16:25', '45.243.154.210'),
(204, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-11 23:51:59', '45.243.154.210'),
(205, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-12 18:41:10', '45.243.154.210'),
(206, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-12 22:22:32', '45.243.158.245'),
(207, 39, 'mohamed reda', 'reda99763@gmail.com', '2021-06-18 22:15:28', '41.43.11.88'),
(208, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-19 00:42:11', '45.246.238.65'),
(209, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-19 02:16:03', '45.246.238.65'),
(210, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-19 04:39:38', '45.246.238.65'),
(211, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-19 04:43:03', '45.246.238.65'),
(212, 39, 'mohamed reda', 'reda99763@gmail.com', '2021-06-19 20:58:46', '41.233.72.68'),
(213, 40, 'Mr trend', 'mosatfa346@gmail.com', '2021-06-19 21:10:51', '45.242.17.67'),
(214, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-19 21:12:15', '102.62.205.202'),
(215, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-21 23:46:05', '41.129.3.228'),
(216, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-25 00:51:42', '45.243.255.140'),
(217, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-25 18:06:52', '102.61.243.71'),
(218, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-25 19:24:45', '102.61.243.71'),
(219, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-06-26 18:49:42', '45.243.221.216'),
(220, 40, 'Mr trend', 'mosatfa346@gmail.com', '2021-06-28 13:40:08', '197.160.202.92'),
(221, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-08 01:18:22', '45.243.143.231'),
(222, 41, 'Godfrey Samwel', 'godfreysamweli44@gmail.com', '2021-07-08 21:02:38', '41.75.221.35'),
(223, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-09 13:39:05', '45.243.143.231'),
(224, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-10 22:12:14', '45.243.198.41'),
(225, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-10 23:17:29', '45.243.198.41'),
(226, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-11 01:47:10', '45.243.198.41'),
(227, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-11 20:42:31', '45.243.147.2'),
(228, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-11 21:50:16', '45.243.147.2'),
(229, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-12 11:42:34', '45.243.147.2'),
(230, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-17 01:20:44', '45.243.217.247'),
(231, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-17 16:28:49', '197.53.255.61'),
(232, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-18 02:21:26', '45.243.217.247'),
(233, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-19 03:26:15', '45.243.190.230'),
(234, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-19 13:11:39', '45.243.190.230'),
(235, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-19 20:08:51', '45.243.146.171'),
(236, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-19 20:09:37', '45.243.146.171'),
(237, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-20 02:34:07', '45.243.146.171'),
(238, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-20 03:25:42', '45.243.146.171'),
(239, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-20 03:29:28', '45.243.146.171'),
(240, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-20 05:08:24', '45.243.146.171'),
(241, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-20 06:14:47', '45.243.146.171'),
(242, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-20 14:48:52', '45.243.146.171'),
(243, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-20 17:42:39', '45.243.146.171'),
(244, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-20 19:30:02', '45.243.146.171'),
(245, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-22 16:17:12', '45.243.189.120'),
(246, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-22 16:19:32', '45.243.189.120'),
(247, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-22 19:01:16', '45.243.189.120'),
(248, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-22 19:12:34', '45.243.189.120'),
(249, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-23 15:46:15', '45.243.189.120'),
(250, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-24 18:43:19', '45.243.204.240'),
(251, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-24 19:16:16', '45.243.204.240'),
(252, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-25 00:48:55', '45.243.204.240'),
(253, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-25 13:59:21', '45.243.204.240'),
(254, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-25 19:30:00', '45.243.204.240'),
(255, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-25 21:26:52', '45.243.204.240'),
(256, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-26 00:44:08', '45.243.204.240'),
(257, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-26 15:39:00', '45.246.214.127'),
(258, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-26 17:34:08', '45.246.214.127'),
(259, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-27 00:05:20', '45.246.214.127'),
(260, 1, 'Gaxa', 'rashad.m.tantawy@gmail.com', '2021-07-27 00:57:01', '45.246.214.127'),
(261, 43, 'test', 'test@gmail.com', '2021-07-27 03:42:08', '156.199.116.168'),
(262, 43, 'test', 'test@gmail.com', '2021-07-27 03:45:53', '156.199.116.168');

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `id` int(11) NOT NULL,
  `version` varchar(255) NOT NULL,
  `current` enum('1','0') NOT NULL DEFAULT '1',
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`id`, `version`, `current`, `date`) VALUES
(1, '6.0.8', '0', '2021-03-13 10:15:19'),
(2, '6.1', '0', '2021-03-18 13:52:50'),
(3, '6.1.1', '0', '2021-03-20 14:09:56'),
(4, '6.1.2', '0', '2021-03-20 14:10:18'),
(5, '6.1.3', '0', '2021-03-21 15:09:17'),
(6, '6.1.4', '0', '2021-03-21 15:09:40'),
(7, '6.1.5', '0', '2021-04-15 19:40:08'),
(8, '6.1.6', '0', '2021-04-24 06:02:00'),
(9, '6.1.7', '0', '2021-04-24 06:02:18'),
(10, '6.1.8', '0', '2021-04-24 06:02:38'),
(11, '6.1.9', '0', '2021-06-05 09:35:45'),
(12, '6.2', '0', '2021-06-05 09:36:07'),
(13, '6.2.1', '0', '2021-06-05 09:36:30'),
(14, '6.2.2', '0', '2021-06-05 09:36:43'),
(15, '6.2.3', '0', '2021-06-05 09:36:55'),
(16, '6.2.4', '0', '2021-07-07 16:19:15'),
(17, '6.2.5', '0', '2021-07-07 16:19:58'),
(18, '6.2.6', '0', '2021-07-07 16:20:37'),
(19, '6.2.7', '0', '2021-07-07 16:21:06'),
(20, '6.2.8', '1', '2021-07-07 16:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `wordpress_config`
--

CREATE TABLE `wordpress_config` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wordpress_config_self_hosted`
--

CREATE TABLE `wordpress_config_self_hosted` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `domain_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authentication_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `error_message` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wordpress_users_info`
--

CREATE TABLE `wordpress_users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blog_id` varchar(200) NOT NULL,
  `blog_url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` text NOT NULL,
  `posts` int(11) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `youtube_channel_info`
--

CREATE TABLE `youtube_channel_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `channel_id` varchar(255) NOT NULL,
  `access_token` text,
  `refresh_token` text,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `youtube_channel_list`
--

CREATE TABLE `youtube_channel_list` (
  `id` int(11) NOT NULL,
  `channel_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `channel_id` varchar(200) NOT NULL,
  `title` text,
  `description` text,
  `profile_image` text,
  `cover_image` text,
  `view_count` varchar(250) DEFAULT NULL,
  `video_count` varchar(250) DEFAULT NULL,
  `subscriber_count` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `youtube_video_list`
--

CREATE TABLE `youtube_video_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `channel_id` varchar(200) DEFAULT NULL,
  `video_id` varchar(200) DEFAULT NULL,
  `title` text,
  `image_link` text,
  `publish_time` varchar(200) DEFAULT NULL,
  `tags` text,
  `categoryId` int(11) DEFAULT NULL,
  `defaultLanguage` varchar(255) NOT NULL,
  `privacyStatus` varchar(255) DEFAULT NULL,
  `localizations` text,
  `liveBroadcastContent` varchar(250) DEFAULT NULL,
  `duration` varchar(250) DEFAULT NULL,
  `dimension` varchar(200) DEFAULT NULL,
  `definition` varchar(200) DEFAULT NULL,
  `caption` text,
  `licensedContent` text,
  `projection` varchar(250) DEFAULT NULL,
  `viewCount` int(11) DEFAULT NULL,
  `likeCount` int(11) DEFAULT NULL,
  `dislikeCount` int(11) DEFAULT NULL,
  `favoriteCount` int(11) DEFAULT NULL,
  `commentCount` int(11) DEFAULT NULL,
  `description` text,
  `backlink_status` enum('0','2','1') NOT NULL DEFAULT '0' COMMENT '0 = incomplete, 2 = submitted, 1 = completed',
  `rank_status` enum('0','1') NOT NULL DEFAULT '0',
  `backlink_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`unique_name`);

--
-- Indexes for table `ad_config`
--
ALTER TABLE `ad_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_earning_history`
--
ALTER TABLE `affiliate_earning_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_id` (`affiliate_id`);

--
-- Indexes for table `affiliate_forgot_password`
--
ALTER TABLE `affiliate_forgot_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payment_settings`
--
ALTER TABLE `affiliate_payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_visitors_action`
--
ALTER TABLE `affiliate_visitors_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_id` (`affiliate_id`);

--
-- Indexes for table `affiliate_withdrawal_methods`
--
ALTER TABLE `affiliate_withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_withdrawal_requests`
--
ALTER TABLE `affiliate_withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `for_user_id` (`user_id`,`status`);

--
-- Indexes for table `autoposting`
--
ALTER TABLE `autoposting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`,`cron_status`);

--
-- Indexes for table `auto_comment_reply_info`
--
ALTER TABLE `auto_comment_reply_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auto_comment_template_id` (`auto_comment_template_id`),
  ADD KEY `auto_private_reply_status` (`auto_private_reply_status`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auto_comment_reply_tb`
--
ALTER TABLE `auto_comment_reply_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogger_blog_info`
--
ALTER TABLE `blogger_blog_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogger_users_info`
--
ALTER TABLE `blogger_users_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `tags` (`tags`(255)),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `blog_post_categories`
--
ALTER TABLE `blog_post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `blog_post_tags`
--
ALTER TABLE `blog_post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `comboposter_campaigns`
--
ALTER TABLE `comboposter_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_page_builder`
--
ALTER TABLE `custom_page_builder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FX_USER_ID` (`user_id`);

--
-- Indexes for table `ecommerce_attribute`
--
ALTER TABLE `ecommerce_attribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `woocommerce_attribute_id` (`woocommerce_attribute_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `ecommerce_cart`
--
ALTER TABLE `ecommerce_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriber_id` (`subscriber_id`),
  ADD KEY `user_id` (`user_id`,`store_id`);

--
-- Indexes for table `ecommerce_cart_address_saved`
--
ALTER TABLE `ecommerce_cart_address_saved`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriber_id` (`subscriber_id`);

--
-- Indexes for table `ecommerce_cart_item`
--
ALTER TABLE `ecommerce_cart_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`,`product_id`,`attribute_info`);

--
-- Indexes for table `ecommerce_cart_pickup_points`
--
ALTER TABLE `ecommerce_cart_pickup_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `ecommerce_category`
--
ALTER TABLE `ecommerce_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `woocommerce_category_id` (`woocommerce_category_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `ecommerce_config`
--
ALTER TABLE `ecommerce_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `ecommerce_coupon`
--
ALTER TABLE `ecommerce_coupon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_id_2` (`store_id`,`coupon_code`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ecommerce_product`
--
ALTER TABLE `ecommerce_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `woocommerce_product_id` (`store_id`,`woocommerce_product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `ecommerce_reminder_report`
--
ALTER TABLE `ecommerce_reminder_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`,`user_id`),
  ADD KEY `subscriber_id` (`subscriber_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `ecommerce_store`
--
ALTER TABLE `ecommerce_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_unique_id` (`store_unique_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `ecommerce_store_business_hours`
--
ALTER TABLE `ecommerce_store_business_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `email_clickrate_links_backup`
--
ALTER TABLE `email_clickrate_links_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_mailgun_config`
--
ALTER TABLE `email_mailgun_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_mandrill_config`
--
ALTER TABLE `email_mandrill_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sendgrid_config`
--
ALTER TABLE `email_sendgrid_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sending_campaign`
--
ALTER TABLE `email_sending_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`posting_status`),
  ADD KEY `user_id_2` (`user_id`,`posting_status`),
  ADD KEY `user_id_3` (`user_id`,`completed_at`);

--
-- Indexes for table `email_sending_campaign_send`
--
ALTER TABLE `email_sending_campaign_send`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `email_sms_template`
--
ALTER TABLE `email_sms_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `email_smtp_config`
--
ALTER TABLE `email_smtp_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template_management`
--
ALTER TABLE `email_template_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_type` (`template_type`);

--
-- Indexes for table `facebook_ex_autoreply`
--
ALTER TABLE `facebook_ex_autoreply`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`page_info_table_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `facebook_ex_autoreply_report`
--
ALTER TABLE `facebook_ex_autoreply_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comment_id` (`comment_id`),
  ADD KEY `Autoreply_teable_id` (`autoreply_table_id`);

--
-- Indexes for table `facebook_ex_conversation_campaign`
--
ALTER TABLE `facebook_ex_conversation_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`posting_status`),
  ADD KEY `dashboard` (`user_id`),
  ADD KEY `dashboard2` (`user_id`,`completed_at`),
  ADD KEY `dashboard3` (`user_id`,`posting_status`);

--
-- Indexes for table `facebook_ex_conversation_campaign_send`
--
ALTER TABLE `facebook_ex_conversation_campaign_send`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `facebook_rx_auto_post`
--
ALTER TABLE `facebook_rx_auto_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`facebook_rx_fb_user_info_id`),
  ADD KEY `posting_status` (`posting_status`),
  ADD KEY `dashboard` (`user_id`,`last_updated_at`),
  ADD KEY `parent_campaign_id` (`parent_campaign_id`),
  ADD KEY `page_group_user_id` (`page_group_user_id`(191)),
  ADD KEY `is_child` (`is_child`),
  ADD KEY `schedule_type` (`schedule_type`);

--
-- Indexes for table `facebook_rx_config`
--
ALTER TABLE `facebook_rx_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facebook_rx_cta_post`
--
ALTER TABLE `facebook_rx_cta_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`facebook_rx_fb_user_info_id`),
  ADD KEY `posting_status` (`posting_status`),
  ADD KEY `dashboard` (`user_id`,`last_updated_at`);

--
-- Indexes for table `facebook_rx_fb_group_info`
--
ALTER TABLE `facebook_rx_fb_group_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rx_fb_user_info_group` (`facebook_rx_fb_user_info_id`);

--
-- Indexes for table `facebook_rx_fb_page_info`
--
ALTER TABLE `facebook_rx_fb_page_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`),
  ADD KEY `rx_fb_user_info` (`facebook_rx_fb_user_info_id`),
  ADD KEY `user_id` (`user_id`,`page_id`) USING BTREE;

--
-- Indexes for table `facebook_rx_fb_user_info`
--
ALTER TABLE `facebook_rx_fb_user_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `facebook_rx_slider_post`
--
ALTER TABLE `facebook_rx_slider_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`facebook_rx_fb_user_info_id`),
  ADD KEY `posting_status` (`posting_status`),
  ADD KEY `dashboard` (`user_id`,`last_updated_at`);

--
-- Indexes for table `fb_msg_manager`
--
ALTER TABLE `fb_msg_manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `thread_id` (`thread_id`,`user_id`,`facebook_rx_fb_user_info_id`) USING BTREE;

--
-- Indexes for table `fb_msg_manager_notification_settings`
--
ALTER TABLE `fb_msg_manager_notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fb_simple_support_desk`
--
ALTER TABLE `fb_simple_support_desk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `support_category` (`support_category`);

--
-- Indexes for table `fb_support_category`
--
ALTER TABLE `fb_support_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fb_support_desk_reply`
--
ALTER TABLE `fb_support_desk_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `forget_password`
--
ALTER TABLE `forget_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instagram_autoreply_report`
--
ALTER TABLE `instagram_autoreply_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comment_id` (`comment_id`),
  ADD KEY `Autoreply_teable_id` (`autoreply_table_id`);

--
-- Indexes for table `instagram_reply_autoreply`
--
ALTER TABLE `instagram_reply_autoreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`page_info_table_id`,`post_id`(191));

--
-- Indexes for table `instagram_reply_template`
--
ALTER TABLE `instagram_reply_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `linkedin_config`
--
ALTER TABLE `linkedin_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `linkedin_users_info`
--
ALTER TABLE `linkedin_users_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_config`
--
ALTER TABLE `login_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mailchimp_config`
--
ALTER TABLE `mailchimp_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FX_USER_ID` (`user_id`);

--
-- Indexes for table `mailchimp_list`
--
ALTER TABLE `mailchimp_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `list` (`mailchimp_config_id`,`list_id`);

--
-- Indexes for table `medium_users_info`
--
ALTER TABLE `medium_users_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_child_1`
--
ALTER TABLE `menu_child_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_child_2`
--
ALTER TABLE `menu_child_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_bot`
--
ALTER TABLE `messenger_bot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`page_id`),
  ADD KEY `xbot_query` (`fb_page_id`(191),`keyword_type`,`postback_id`(191));

--
-- Indexes for table `messenger_bot_broadcast_contact_group`
--
ALTER TABLE `messenger_bot_broadcast_contact_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_id` (`page_id`,`group_name`);

--
-- Indexes for table `messenger_bot_broadcast_serial`
--
ALTER TABLE `messenger_bot_broadcast_serial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`page_id`),
  ADD KEY `posting_status` (`posting_status`);

--
-- Indexes for table `messenger_bot_broadcast_serial_send`
--
ALTER TABLE `messenger_bot_broadcast_serial_send`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`processed`) USING BTREE;

--
-- Indexes for table `messenger_bot_domain_whitelist`
--
ALTER TABLE `messenger_bot_domain_whitelist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`page_id`);

--
-- Indexes for table `messenger_bot_drip_campaign`
--
ALTER TABLE `messenger_bot_drip_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`,`user_id`),
  ADD KEY `xengagementtable_type` (`engagement_table_id`,`drip_type`) USING BTREE;

--
-- Indexes for table `messenger_bot_drip_campaign_assign`
--
ALTER TABLE `messenger_bot_drip_campaign_assign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribe_id` (`subscribe_id`,`messenger_bot_drip_campaign_id`),
  ADD KEY `xis_completed_hour` (`messenger_bot_drip_is_toatally_complete_hourly`),
  ADD KEY `xis_completed_day` (`messenger_bot_drip_is_toatally_complete`);

--
-- Indexes for table `messenger_bot_drip_report`
--
ALTER TABLE `messenger_bot_drip_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messenger_bot_drip_campaign_id` (`messenger_bot_drip_campaign_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messenger_bot_engagement_checkbox`
--
ALTER TABLE `messenger_bot_engagement_checkbox`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain_code` (`domain_code`),
  ADD KEY `user_id` (`user_id`,`page_id`);

--
-- Indexes for table `messenger_bot_engagement_checkbox_reply`
--
ALTER TABLE `messenger_bot_engagement_checkbox_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_bot_persistent_menu`
--
ALTER TABLE `messenger_bot_persistent_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_id` (`page_id`,`locale`);

--
-- Indexes for table `messenger_bot_postback`
--
ALTER TABLE `messenger_bot_postback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`postback_id`,`page_id`) USING BTREE;

--
-- Indexes for table `messenger_bot_reply_error_log`
--
ALTER TABLE `messenger_bot_reply_error_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_bot_saved_templates`
--
ALTER TABLE `messenger_bot_saved_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`,`template_access`,`allowed_package_ids`(191));

--
-- Indexes for table `messenger_bot_subscriber`
--
ALTER TABLE `messenger_bot_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`page_id`,`subscribe_id`) USING BTREE,
  ADD KEY `contact_group_id` (`contact_group_id`),
  ADD KEY `idx_subscriber_id` (`subscribe_id`),
  ADD KEY `email` (`email`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `messenger_bot_subscriber_extra_info`
--
ALTER TABLE `messenger_bot_subscriber_extra_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriber_id` (`subscriber_id`,`page_id`);

--
-- Indexes for table `messenger_bot_template_category`
--
ALTER TABLE `messenger_bot_template_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `native_api`
--
ALTER TABLE `native_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otn_optin_subscriber`
--
ALTER TABLE `otn_optin_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `otn_id_subscriber_id` (`otn_id`,`subscriber_id`) USING BTREE;

--
-- Indexes for table `otn_postback`
--
ALTER TABLE `otn_postback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_response_autoreply`
--
ALTER TABLE `page_response_autoreply`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`page_info_table_id`);

--
-- Indexes for table `page_response_auto_like_report`
--
ALTER TABLE `page_response_auto_like_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_response_auto_like_share`
--
ALTER TABLE `page_response_auto_like_share`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`page_info_table_id`);

--
-- Indexes for table `page_response_auto_like_share_report`
--
ALTER TABLE `page_response_auto_like_share_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id` (`post_id`);

--
-- Indexes for table `page_response_auto_share_report`
--
ALTER TABLE `page_response_auto_share_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_response_report`
--
ALTER TABLE `page_response_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_response_autoreply_id` (`page_response_autoreply_id`,`post_id`);

--
-- Indexes for table `payment_config`
--
ALTER TABLE `payment_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paypal_error_log`
--
ALTER TABLE `paypal_error_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinterest_board_info`
--
ALTER TABLE `pinterest_board_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinterest_config`
--
ALTER TABLE `pinterest_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinterest_users_info`
--
ALTER TABLE `pinterest_users_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reddit_config`
--
ALTER TABLE `reddit_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reddit_users_info`
--
ALTER TABLE `reddit_users_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_email_to_autoresponder_log`
--
ALTER TABLE `send_email_to_autoresponder_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sms_api_config`
--
ALTER TABLE `sms_api_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sms_email_contacts`
--
ALTER TABLE `sms_email_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_email_contact_group`
--
ALTER TABLE `sms_email_contact_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`type`);

--
-- Indexes for table `sms_sending_campaign`
--
ALTER TABLE `sms_sending_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`posting_status`),
  ADD KEY `userId_completed` (`user_id`,`completed_at`) USING BTREE,
  ADD KEY `userid_postingstatus` (`user_id`,`posting_status`);

--
-- Indexes for table `sms_sending_campaign_send`
--
ALTER TABLE `sms_sending_campaign_send`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`processed`) USING BTREE;

--
-- Indexes for table `tag_machine_bulk_reply`
--
ALTER TABLE `tag_machine_bulk_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posting_status` (`posting_status`,`is_try_again`);

--
-- Indexes for table `tag_machine_bulk_reply_send`
--
ALTER TABLE `tag_machine_bulk_reply_send`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`processed`);

--
-- Indexes for table `tag_machine_bulk_tag`
--
ALTER TABLE `tag_machine_bulk_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posting_status` (`posting_status`),
  ADD KEY `facebook_rx_fb_user_info_id` (`facebook_rx_fb_user_info_id`,`page_info_table_id`,`post_id`);

--
-- Indexes for table `tag_machine_commenter_info`
--
ALTER TABLE `tag_machine_commenter_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_machine_enabled_post_list_id` (`tag_machine_enabled_post_list_id`,`commenter_fb_id`);

--
-- Indexes for table `tag_machine_comment_info`
--
ALTER TABLE `tag_machine_comment_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_machine_enabled_post_list_id` (`tag_machine_enabled_post_list_id`,`comment_id`);

--
-- Indexes for table `tag_machine_enabled_post_list`
--
ALTER TABLE `tag_machine_enabled_post_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `facebook_rx_fb_user_info_id` (`facebook_rx_fb_user_info_id`,`page_info_table_id`,`post_id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transaction_history_manual`
--
ALTER TABLE `transaction_history_manual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thm_user_id` (`user_id`);

--
-- Indexes for table `tumblr_config`
--
ALTER TABLE `tumblr_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `twitter_config`
--
ALTER TABLE `twitter_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `twitter_users_info`
--
ALTER TABLE `twitter_users_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ultrapost_auto_reply`
--
ALTER TABLE `ultrapost_auto_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_list`
--
ALTER TABLE `update_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usage_log`
--
ALTER TABLE `usage_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`,`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_input_custom_fields`
--
ALTER TABLE `user_input_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom field` (`user_id`,`reply_type`);

--
-- Indexes for table `user_input_custom_fields_assaign`
--
ALTER TABLE `user_input_custom_fields_assaign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriber_id` (`subscriber_id`,`page_id`,`custom_field_id`);

--
-- Indexes for table `user_login_info`
--
ALTER TABLE `user_login_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `version` (`version`),
  ADD KEY `Current` (`current`);

--
-- Indexes for table `wordpress_config`
--
ALTER TABLE `wordpress_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wordpress_config_self_hosted`
--
ALTER TABLE `wordpress_config_self_hosted`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ct_user_id` (`user_id`);

--
-- Indexes for table `wordpress_users_info`
--
ALTER TABLE `wordpress_users_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youtube_channel_info`
--
ALTER TABLE `youtube_channel_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youtube_channel_list`
--
ALTER TABLE `youtube_channel_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youtube_video_list`
--
ALTER TABLE `youtube_video_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `user_id` (`user_id`,`video_id`),
  ADD KEY `backlink_status` (`backlink_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ad_config`
--
ALTER TABLE `ad_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_earning_history`
--
ALTER TABLE `affiliate_earning_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_forgot_password`
--
ALTER TABLE `affiliate_forgot_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_payment_settings`
--
ALTER TABLE `affiliate_payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `affiliate_visitors_action`
--
ALTER TABLE `affiliate_visitors_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_withdrawal_methods`
--
ALTER TABLE `affiliate_withdrawal_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_withdrawal_requests`
--
ALTER TABLE `affiliate_withdrawal_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `autoposting`
--
ALTER TABLE `autoposting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auto_comment_reply_info`
--
ALTER TABLE `auto_comment_reply_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auto_comment_reply_tb`
--
ALTER TABLE `auto_comment_reply_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogger_blog_info`
--
ALTER TABLE `blogger_blog_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogger_users_info`
--
ALTER TABLE `blogger_users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_post_categories`
--
ALTER TABLE `blog_post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_tags`
--
ALTER TABLE `blog_post_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comboposter_campaigns`
--
ALTER TABLE `comboposter_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_page_builder`
--
ALTER TABLE `custom_page_builder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecommerce_attribute`
--
ALTER TABLE `ecommerce_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecommerce_cart`
--
ALTER TABLE `ecommerce_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ecommerce_cart_address_saved`
--
ALTER TABLE `ecommerce_cart_address_saved`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ecommerce_cart_item`
--
ALTER TABLE `ecommerce_cart_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ecommerce_cart_pickup_points`
--
ALTER TABLE `ecommerce_cart_pickup_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecommerce_category`
--
ALTER TABLE `ecommerce_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ecommerce_config`
--
ALTER TABLE `ecommerce_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ecommerce_coupon`
--
ALTER TABLE `ecommerce_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecommerce_product`
--
ALTER TABLE `ecommerce_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ecommerce_reminder_report`
--
ALTER TABLE `ecommerce_reminder_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecommerce_store`
--
ALTER TABLE `ecommerce_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ecommerce_store_business_hours`
--
ALTER TABLE `ecommerce_store_business_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_clickrate_links_backup`
--
ALTER TABLE `email_clickrate_links_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_mailgun_config`
--
ALTER TABLE `email_mailgun_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_mandrill_config`
--
ALTER TABLE `email_mandrill_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sendgrid_config`
--
ALTER TABLE `email_sendgrid_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sending_campaign`
--
ALTER TABLE `email_sending_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sending_campaign_send`
--
ALTER TABLE `email_sending_campaign_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sms_template`
--
ALTER TABLE `email_sms_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_smtp_config`
--
ALTER TABLE `email_smtp_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_template_management`
--
ALTER TABLE `email_template_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `facebook_ex_autoreply`
--
ALTER TABLE `facebook_ex_autoreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `facebook_ex_autoreply_report`
--
ALTER TABLE `facebook_ex_autoreply_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `facebook_ex_conversation_campaign`
--
ALTER TABLE `facebook_ex_conversation_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facebook_ex_conversation_campaign_send`
--
ALTER TABLE `facebook_ex_conversation_campaign_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facebook_rx_auto_post`
--
ALTER TABLE `facebook_rx_auto_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `facebook_rx_config`
--
ALTER TABLE `facebook_rx_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facebook_rx_cta_post`
--
ALTER TABLE `facebook_rx_cta_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `facebook_rx_fb_group_info`
--
ALTER TABLE `facebook_rx_fb_group_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facebook_rx_fb_page_info`
--
ALTER TABLE `facebook_rx_fb_page_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `facebook_rx_fb_user_info`
--
ALTER TABLE `facebook_rx_fb_user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `facebook_rx_slider_post`
--
ALTER TABLE `facebook_rx_slider_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fb_msg_manager`
--
ALTER TABLE `fb_msg_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `fb_msg_manager_notification_settings`
--
ALTER TABLE `fb_msg_manager_notification_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fb_simple_support_desk`
--
ALTER TABLE `fb_simple_support_desk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fb_support_category`
--
ALTER TABLE `fb_support_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fb_support_desk_reply`
--
ALTER TABLE `fb_support_desk_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forget_password`
--
ALTER TABLE `forget_password`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `instagram_autoreply_report`
--
ALTER TABLE `instagram_autoreply_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instagram_reply_autoreply`
--
ALTER TABLE `instagram_reply_autoreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instagram_reply_template`
--
ALTER TABLE `instagram_reply_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linkedin_config`
--
ALTER TABLE `linkedin_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `linkedin_users_info`
--
ALTER TABLE `linkedin_users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_config`
--
ALTER TABLE `login_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mailchimp_config`
--
ALTER TABLE `mailchimp_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mailchimp_list`
--
ALTER TABLE `mailchimp_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medium_users_info`
--
ALTER TABLE `medium_users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `menu_child_1`
--
ALTER TABLE `menu_child_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `menu_child_2`
--
ALTER TABLE `menu_child_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot`
--
ALTER TABLE `messenger_bot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `messenger_bot_broadcast_contact_group`
--
ALTER TABLE `messenger_bot_broadcast_contact_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `messenger_bot_broadcast_serial`
--
ALTER TABLE `messenger_bot_broadcast_serial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_broadcast_serial_send`
--
ALTER TABLE `messenger_bot_broadcast_serial_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_domain_whitelist`
--
ALTER TABLE `messenger_bot_domain_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messenger_bot_drip_campaign`
--
ALTER TABLE `messenger_bot_drip_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_drip_campaign_assign`
--
ALTER TABLE `messenger_bot_drip_campaign_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_drip_report`
--
ALTER TABLE `messenger_bot_drip_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_engagement_checkbox`
--
ALTER TABLE `messenger_bot_engagement_checkbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_engagement_checkbox_reply`
--
ALTER TABLE `messenger_bot_engagement_checkbox_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_persistent_menu`
--
ALTER TABLE `messenger_bot_persistent_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_postback`
--
ALTER TABLE `messenger_bot_postback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `messenger_bot_reply_error_log`
--
ALTER TABLE `messenger_bot_reply_error_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `messenger_bot_saved_templates`
--
ALTER TABLE `messenger_bot_saved_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_subscriber`
--
ALTER TABLE `messenger_bot_subscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT for table `messenger_bot_subscriber_extra_info`
--
ALTER TABLE `messenger_bot_subscriber_extra_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_bot_template_category`
--
ALTER TABLE `messenger_bot_template_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT for table `native_api`
--
ALTER TABLE `native_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otn_optin_subscriber`
--
ALTER TABLE `otn_optin_subscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `otn_postback`
--
ALTER TABLE `otn_postback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `page_response_autoreply`
--
ALTER TABLE `page_response_autoreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_response_auto_like_report`
--
ALTER TABLE `page_response_auto_like_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_response_auto_like_share`
--
ALTER TABLE `page_response_auto_like_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_response_auto_like_share_report`
--
ALTER TABLE `page_response_auto_like_share_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_response_auto_share_report`
--
ALTER TABLE `page_response_auto_share_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_response_report`
--
ALTER TABLE `page_response_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_config`
--
ALTER TABLE `payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paypal_error_log`
--
ALTER TABLE `paypal_error_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pinterest_board_info`
--
ALTER TABLE `pinterest_board_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pinterest_config`
--
ALTER TABLE `pinterest_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pinterest_users_info`
--
ALTER TABLE `pinterest_users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reddit_config`
--
ALTER TABLE `reddit_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reddit_users_info`
--
ALTER TABLE `reddit_users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `send_email_to_autoresponder_log`
--
ALTER TABLE `send_email_to_autoresponder_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_api_config`
--
ALTER TABLE `sms_api_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_email_contacts`
--
ALTER TABLE `sms_email_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_email_contact_group`
--
ALTER TABLE `sms_email_contact_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_sending_campaign`
--
ALTER TABLE `sms_sending_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_sending_campaign_send`
--
ALTER TABLE `sms_sending_campaign_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_machine_bulk_reply`
--
ALTER TABLE `tag_machine_bulk_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_machine_bulk_reply_send`
--
ALTER TABLE `tag_machine_bulk_reply_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_machine_bulk_tag`
--
ALTER TABLE `tag_machine_bulk_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_machine_commenter_info`
--
ALTER TABLE `tag_machine_commenter_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_machine_comment_info`
--
ALTER TABLE `tag_machine_comment_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_machine_enabled_post_list`
--
ALTER TABLE `tag_machine_enabled_post_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaction_history_manual`
--
ALTER TABLE `transaction_history_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tumblr_config`
--
ALTER TABLE `tumblr_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `twitter_config`
--
ALTER TABLE `twitter_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `twitter_users_info`
--
ALTER TABLE `twitter_users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ultrapost_auto_reply`
--
ALTER TABLE `ultrapost_auto_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `update_list`
--
ALTER TABLE `update_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usage_log`
--
ALTER TABLE `usage_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_input_custom_fields`
--
ALTER TABLE `user_input_custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_input_custom_fields_assaign`
--
ALTER TABLE `user_input_custom_fields_assaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login_info`
--
ALTER TABLE `user_login_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wordpress_config`
--
ALTER TABLE `wordpress_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wordpress_config_self_hosted`
--
ALTER TABLE `wordpress_config_self_hosted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wordpress_users_info`
--
ALTER TABLE `wordpress_users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `youtube_channel_info`
--
ALTER TABLE `youtube_channel_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `youtube_channel_list`
--
ALTER TABLE `youtube_channel_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `youtube_video_list`
--
ALTER TABLE `youtube_video_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD CONSTRAINT `fk_comments` FOREIGN KEY (`parent_id`) REFERENCES `blog_post_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_post_comments` FOREIGN KEY (`post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mailchimp_config`
--
ALTER TABLE `mailchimp_config`
  ADD CONSTRAINT `FX_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mailchimp_list`
--
ALTER TABLE `mailchimp_list`
  ADD CONSTRAINT `FK_MAILCHIMP_CONFIG_ID` FOREIGN KEY (`mailchimp_config_id`) REFERENCES `mailchimp_config` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_history_manual`
--
ALTER TABLE `transaction_history_manual`
  ADD CONSTRAINT `thm_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wordpress_config_self_hosted`
--
ALTER TABLE `wordpress_config_self_hosted`
  ADD CONSTRAINT `ct_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
