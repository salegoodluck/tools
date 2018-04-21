/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : erp_database_newest

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-21 13:51:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for erp_shipping_method_default_copy
-- ----------------------------
DROP TABLE IF EXISTS `erp_shipping_method_default_copy`;
CREATE TABLE `erp_shipping_method_default_copy` (
  `methodID` int(11) NOT NULL AUTO_INCREMENT,
  `methodTitle` varchar(200) DEFAULT NULL,
  `methodCode` varchar(50) DEFAULT NULL,
  `methodPlat` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`methodID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_shipping_method_default_copy
-- ----------------------------
INSERT INTO `erp_shipping_method_default_copy` VALUES ('1', 'ePacketHongKong', 'EUB', '1');
INSERT INTO `erp_shipping_method_default_copy` VALUES ('2', 'ePacketChina', 'EUB_CHINA', '1');
INSERT INTO `erp_shipping_method_default_copy` VALUES ('3', 'StandardShippingFromOutsideUS', 'US_STANDARD', '0');
INSERT INTO `erp_shipping_method_default_copy` VALUES ('4', 'StandardInternational', 'US_International', '0');

-- ----------------------------
-- View structure for erp_de_orders
-- ----------------------------
DROP VIEW IF EXISTS `erp_de_orders`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_de_orders` AS select `o`.`erp_orders_id` AS `erp_orders_id`,`o`.`ebay_orders_id` AS `ebay_orders_id`,`o`.`orderlineitemid` AS `orderlineitemid`,`o`.`buyer_id` AS `buyer_id`,`o`.`buyer_name` AS `buyer_name`,`o`.`buyer_phone` AS `buyer_phone`,`o`.`buyer_email` AS `buyer_email`,`o`.`buyer_address_1` AS `buyer_address_1`,`o`.`buyer_address_2` AS `buyer_address_2`,`o`.`buyer_city` AS `buyer_city`,`o`.`buyer_state` AS `buyer_state`,`o`.`buyer_zip` AS `buyer_zip`,`o`.`buyer_country` AS `buyer_country`,`o`.`buyer_country_code` AS `buyer_country_code`,`o`.`orders_total` AS `orders_total`,`o`.`orders_ship_fee` AS `orders_ship_fee`,`o`.`currency_type` AS `currency_type`,`o`.`currency_value` AS `currency_value`,`o`.`shipping_method` AS `shipping_method`,`o`.`ShippingServiceSelected` AS `ShippingServiceSelected`,`o`.`shipmentAutoMatched` AS `shipmentAutoMatched`,`o`.`pay_method` AS `pay_method`,`o`.`pay_id` AS `pay_id`,`o`.`transactionIDNew` AS `transactionIDNew`,`o`.`orders_time` AS `orders_time`,`o`.`sales_account` AS `sales_account`,`o`.`erp_user_id` AS `erp_user_id`,`o`.`orders_type` AS `orders_type`,`o`.`orders_status` AS `orders_status`,`o`.`orders_is_backorder` AS `orders_is_backorder`,`o`.`eub_status` AS `eub_status`,`o`.`orders_remark` AS `orders_remark`,`o`.`orders_export_time` AS `orders_export_time`,`o`.`orders_paid_time` AS `orders_paid_time`,`o`.`orders_print_time` AS `orders_print_time`,`o`.`orders_is_join` AS `orders_is_join`,`o`.`orders_is_split` AS `orders_is_split`,`o`.`orders_is_resend` AS `orders_is_resend`,`o`.`orders_is_refund` AS `orders_is_refund`,`o`.`orders_shipping_code` AS `orders_shipping_code`,`o`.`orders_old_shipping_code` AS `orders_old_shipping_code`,`o`.`orders_shipping_time` AS `orders_shipping_time`,`o`.`orders_shipping_user` AS `orders_shipping_user`,`o`.`orders_is_rechecked` AS `orders_is_rechecked`,`o`.`recheck_user` AS `recheck_user`,`o`.`recheck_time` AS `recheck_time`,`o`.`orders_is_tracking` AS `orders_is_tracking`,`o`.`orders_join_remark` AS `orders_join_remark`,`o`.`custom_shipping_fee` AS `custom_shipping_fee`,`o`.`notes_to_yourself` AS `notes_to_yourself`,`o`.`orders_shipping_method` AS `orders_shipping_method`,`o`.`ebayStatusIsMarked` AS `ebayStatusIsMarked`,`o`.`eBayStatusMarkedCount` AS `eBayStatusMarkedCount`,`o`.`eBayStatusUploadTrackingNumberCount` AS `eBayStatusUploadTrackingNumberCount`,`o`.`trackingNumberUploaded` AS `trackingNumberUploaded`,`o`.`priceMayBeWorry` AS `priceMayBeWorry`,`o`.`autoSendMessageStatus` AS `autoSendMessageStatus`,`o`.`autoSendMessageLastTime` AS `autoSendMessageLastTime`,`o`.`token_id` AS `token_id`,`o`.`autoSendFeedbackStatus` AS `autoSendFeedbackStatus`,`o`.`autoSendFeedbackLastTime` AS `autoSendFeedbackLastTime`,`o`.`tempFields` AS `tempFields`,`o`.`productsCost` AS `productsCost`,`o`.`packetWeight` AS `packetWeight`,`o`.`shippingCost` AS `shippingCost`,`o`.`platFeeTotal` AS `platFeeTotal`,`o`.`profitTotal` AS `profitTotal`,`o`.`profitRate` AS `profitRate`,`o`.`overseasArrived` AS `overseasArrived`,`o`.`old_erp_orders_id` AS `old_erp_orders_id`,`o`.`operateCost` AS `operateCost` from (`erp_orders` `o` join `erp_shipment` `s` USE INDEX (`IDX_SHIPMENTSCANLOCAL`) on((`o`.`shipmentAutoMatched` = `s`.`shipmentID`))) where ((`o`.`orders_is_join` = 0) and (`s`.`shipmentScanLocal` = 2)) ;

-- ----------------------------
-- View structure for erp_orders_buyer_zip
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_buyer_zip`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_buyer_zip` AS select `erp_database_newest`.`erp_orders`.`buyer_zip` AS `buyer_zip`,count(`erp_database_newest`.`erp_orders`.`buyer_zip`) AS `shuliang` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`buyer_zip` is not null) and (trim(`erp_database_newest`.`erp_orders`.`buyer_zip`) <> '')) group by `erp_database_newest`.`erp_orders`.`buyer_zip` having (`shuliang` > 2) ;

-- ----------------------------
-- View structure for erp_orders_from_amz_for_statistics
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_from_amz_for_statistics`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_from_amz_for_statistics` AS select `op`.`orders_products_id` AS `orders_products_id`,`op`.`erp_orders_id` AS `erp_orders_id`,`op`.`ebay_orders_id` AS `ebay_orders_id`,`op`.`orderlineitemid` AS `orderlineitemid`,`op`.`orders_item_number` AS `orders_item_number`,`op`.`itemSite` AS `itemSite`,`op`.`orders_sku` AS `orders_sku`,`op`.`orders_item` AS `orders_item`,`op`.`item_price` AS `item_price`,`op`.`price_suggest` AS `price_suggest`,`op`.`item_count` AS `item_count`,`op`.`item_cost` AS `item_cost`,`op`.`item_attribute` AS `item_attribute`,`op`.`transactionID` AS `transactionID`,`op`.`token_id` AS `token_id`,`op`.`feedback_id` AS `feedback_id`,`op`.`comment_type` AS `comment_type`,`op`.`comment_text` AS `comment_text`,`op`.`comment_time` AS `comment_time`,`op`.`getFeedback` AS `getFeedback`,`o`.`orders_export_time` AS `orders_export_time` from (`erp_orders` `o` join `erp_orders_products` `op`) where ((`o`.`erp_orders_id` = `op`.`erp_orders_id`) and (`o`.`orders_type` = 7) and ((`o`.`orders_status` = 5) or (`o`.`orders_status` = 8))) ;

-- ----------------------------
-- View structure for erp_orders_from_amz_for_statistics_bak
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_from_amz_for_statistics_bak`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_from_amz_for_statistics_bak` AS select `op`.`orders_products_id` AS `orders_products_id`,`op`.`erp_orders_id` AS `erp_orders_id`,`op`.`ebay_orders_id` AS `ebay_orders_id`,`op`.`orderlineitemid` AS `orderlineitemid`,`op`.`orders_item_number` AS `orders_item_number`,`op`.`itemSite` AS `itemSite`,`op`.`orders_sku` AS `orders_sku`,`op`.`orders_item` AS `orders_item`,`op`.`item_price` AS `item_price`,`op`.`price_suggest` AS `price_suggest`,`op`.`item_count` AS `item_count`,`op`.`item_cost` AS `item_cost`,`op`.`item_attribute` AS `item_attribute`,`op`.`transactionID` AS `transactionID`,`op`.`token_id` AS `token_id`,`op`.`feedback_id` AS `feedback_id`,`op`.`comment_type` AS `comment_type`,`op`.`comment_text` AS `comment_text`,`op`.`comment_time` AS `comment_time`,`op`.`getFeedback` AS `getFeedback`,`o`.`orders_export_time` AS `orders_export_time` from (`erp_orders` `o` left join `erp_orders_products` `op` on((`o`.`erp_orders_id` = `op`.`erp_orders_id`))) where ((`o`.`orders_type` = 7) and ((`o`.`orders_status` = 5) or (`o`.`orders_status` = 8))) ;

-- ----------------------------
-- View structure for erp_orders_one_month
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_one_month`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_one_month` AS select `erp_database_newest`.`erp_orders`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders`.`ebay_orders_id` AS `ebay_orders_id`,`erp_database_newest`.`erp_orders`.`orderlineitemid` AS `orderlineitemid`,`erp_database_newest`.`erp_orders`.`buyer_id` AS `buyer_id`,`erp_database_newest`.`erp_orders`.`buyer_name` AS `buyer_name`,`erp_database_newest`.`erp_orders`.`buyer_phone` AS `buyer_phone`,`erp_database_newest`.`erp_orders`.`buyer_email` AS `buyer_email`,`erp_database_newest`.`erp_orders`.`buyer_address_1` AS `buyer_address_1`,`erp_database_newest`.`erp_orders`.`buyer_address_2` AS `buyer_address_2`,`erp_database_newest`.`erp_orders`.`buyer_city` AS `buyer_city`,`erp_database_newest`.`erp_orders`.`buyer_state` AS `buyer_state`,`erp_database_newest`.`erp_orders`.`buyer_zip` AS `buyer_zip`,`erp_database_newest`.`erp_orders`.`buyer_country` AS `buyer_country`,`erp_database_newest`.`erp_orders`.`buyer_country_code` AS `buyer_country_code`,`erp_database_newest`.`erp_orders`.`orders_total` AS `orders_total`,`erp_database_newest`.`erp_orders`.`orders_ship_fee` AS `orders_ship_fee`,`erp_database_newest`.`erp_orders`.`currency_type` AS `currency_type`,`erp_database_newest`.`erp_orders`.`currency_value` AS `currency_value`,`erp_database_newest`.`erp_orders`.`shipping_method` AS `shipping_method`,`erp_database_newest`.`erp_orders`.`ShippingServiceSelected` AS `ShippingServiceSelected`,`erp_database_newest`.`erp_orders`.`shipmentAutoMatched` AS `shipmentAutoMatched`,`erp_database_newest`.`erp_orders`.`pay_method` AS `pay_method`,`erp_database_newest`.`erp_orders`.`pay_id` AS `pay_id`,`erp_database_newest`.`erp_orders`.`transactionIDNew` AS `transactionIDNew`,`erp_database_newest`.`erp_orders`.`orders_time` AS `orders_time`,`erp_database_newest`.`erp_orders`.`sales_account` AS `sales_account`,`erp_database_newest`.`erp_orders`.`erp_user_id` AS `erp_user_id`,`erp_database_newest`.`erp_orders`.`orders_type` AS `orders_type`,`erp_database_newest`.`erp_orders`.`orders_status` AS `orders_status`,`erp_database_newest`.`erp_orders`.`orders_is_backorder` AS `orders_is_backorder`,`erp_database_newest`.`erp_orders`.`eub_status` AS `eub_status`,`erp_database_newest`.`erp_orders`.`orders_remark` AS `orders_remark`,`erp_database_newest`.`erp_orders`.`orders_export_time` AS `orders_export_time`,`erp_database_newest`.`erp_orders`.`orders_paid_time` AS `orders_paid_time`,`erp_database_newest`.`erp_orders`.`orders_print_time` AS `orders_print_time`,`erp_database_newest`.`erp_orders`.`orders_is_join` AS `orders_is_join`,`erp_database_newest`.`erp_orders`.`orders_is_split` AS `orders_is_split`,`erp_database_newest`.`erp_orders`.`orders_is_resend` AS `orders_is_resend`,`erp_database_newest`.`erp_orders`.`orders_is_refund` AS `orders_is_refund`,`erp_database_newest`.`erp_orders`.`orders_shipping_code` AS `orders_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_old_shipping_code` AS `orders_old_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_shipping_time` AS `orders_shipping_time`,`erp_database_newest`.`erp_orders`.`orders_shipping_user` AS `orders_shipping_user`,`erp_database_newest`.`erp_orders`.`orders_is_rechecked` AS `orders_is_rechecked`,`erp_database_newest`.`erp_orders`.`recheck_user` AS `recheck_user`,`erp_database_newest`.`erp_orders`.`recheck_time` AS `recheck_time`,`erp_database_newest`.`erp_orders`.`orders_is_tracking` AS `orders_is_tracking`,`erp_database_newest`.`erp_orders`.`orders_join_remark` AS `orders_join_remark`,`erp_database_newest`.`erp_orders`.`custom_shipping_fee` AS `custom_shipping_fee`,`erp_database_newest`.`erp_orders`.`notes_to_yourself` AS `notes_to_yourself`,`erp_database_newest`.`erp_orders`.`orders_shipping_method` AS `orders_shipping_method`,`erp_database_newest`.`erp_orders`.`ebayStatusIsMarked` AS `ebayStatusIsMarked`,`erp_database_newest`.`erp_orders`.`eBayStatusMarkedCount` AS `eBayStatusMarkedCount`,`erp_database_newest`.`erp_orders`.`eBayStatusUploadTrackingNumberCount` AS `eBayStatusUploadTrackingNumberCount`,`erp_database_newest`.`erp_orders`.`trackingNumberUploaded` AS `trackingNumberUploaded`,`erp_database_newest`.`erp_orders`.`priceMayBeWorry` AS `priceMayBeWorry`,`erp_database_newest`.`erp_orders`.`autoSendMessageStatus` AS `autoSendMessageStatus`,`erp_database_newest`.`erp_orders`.`autoSendMessageLastTime` AS `autoSendMessageLastTime`,`erp_database_newest`.`erp_orders`.`token_id` AS `token_id`,`erp_database_newest`.`erp_orders`.`autoSendFeedbackStatus` AS `autoSendFeedbackStatus`,`erp_database_newest`.`erp_orders`.`autoSendFeedbackLastTime` AS `autoSendFeedbackLastTime`,`erp_database_newest`.`erp_orders`.`tempFields` AS `tempFields`,`erp_database_newest`.`erp_orders`.`productsCost` AS `productsCost`,`erp_database_newest`.`erp_orders`.`packetWeight` AS `packetWeight`,`erp_database_newest`.`erp_orders`.`shippingCost` AS `shippingCost`,`erp_database_newest`.`erp_orders`.`platFeeTotal` AS `platFeeTotal`,`erp_database_newest`.`erp_orders`.`profitTotal` AS `profitTotal`,`erp_database_newest`.`erp_orders`.`profitRate` AS `profitRate`,`erp_database_newest`.`erp_orders`.`overseasArrived` AS `overseasArrived`,`erp_database_newest`.`erp_orders`.`orders_expired_time` AS `orders_expired_time`,`erp_database_newest`.`erp_orders`.`orders_logistics_id` AS `orders_logistics_id`,`erp_database_newest`.`erp_orders`.`old_erp_orders_id` AS `old_erp_orders_id` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`orders_status` = 5) and (`erp_database_newest`.`erp_orders`.`orders_is_join` = 0) and (`erp_database_newest`.`erp_orders`.`orders_shipping_time` <= now()) and (`erp_database_newest`.`erp_orders`.`orders_shipping_time` >= (now() - interval 1 month)) and (not(`erp_database_newest`.`erp_orders`.`shipmentAutoMatched` in (select `erp_database_newest`.`erp_shipment`.`shipmentID` from `erp_shipment` where ((`erp_database_newest`.`erp_shipment`.`shipmentScanLocal` = 2) and (`erp_database_newest`.`erp_shipment`.`shipmentEnable` = 1)))))) ;

-- ----------------------------
-- View structure for erp_orders_products_now_day
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_products_now_day`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_products_now_day` AS select `erp_database_newest`.`erp_orders_products`.`orders_products_id` AS `orders_products_id`,`erp_database_newest`.`erp_orders_products`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders_products`.`ebay_orders_id` AS `ebay_orders_id`,`erp_database_newest`.`erp_orders_products`.`orderlineitemid` AS `orderlineitemid`,`erp_database_newest`.`erp_orders_products`.`orders_item_number` AS `orders_item_number`,`erp_database_newest`.`erp_orders_products`.`itemSite` AS `itemSite`,`erp_database_newest`.`erp_orders_products`.`orders_sku` AS `orders_sku`,`erp_database_newest`.`erp_orders_products`.`orders_item` AS `orders_item`,`erp_database_newest`.`erp_orders_products`.`item_price` AS `item_price`,`erp_database_newest`.`erp_orders_products`.`price_suggest` AS `price_suggest`,`erp_database_newest`.`erp_orders_products`.`item_count` AS `item_count`,`erp_database_newest`.`erp_orders_products`.`item_cost` AS `item_cost`,`erp_database_newest`.`erp_orders_products`.`transactionID` AS `transactionID`,`erp_database_newest`.`erp_orders_products`.`token_id` AS `token_id`,`erp_database_newest`.`erp_orders_products`.`feedback_id` AS `feedback_id`,`erp_database_newest`.`erp_orders_products`.`comment_type` AS `comment_type`,`erp_database_newest`.`erp_orders_products`.`comment_text` AS `comment_text`,`erp_database_newest`.`erp_orders_products`.`comment_time` AS `comment_time`,`erp_database_newest`.`erp_orders_products`.`getFeedback` AS `getFeedback` from `erp_orders_products` where `erp_database_newest`.`erp_orders_products`.`erp_orders_id` in (select `erp_database_newest`.`erp_orders`.`erp_orders_id` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`orders_status` >= 3) and (`erp_database_newest`.`erp_orders`.`orders_status` < 6) and (`erp_database_newest`.`erp_orders`.`orders_is_join` = 0) and (`erp_database_newest`.`erp_orders`.`orders_export_time` <= now()) and (`erp_database_newest`.`erp_orders`.`orders_export_time` >= date_format(now(),'%Y-%m-%d')) and (not(`erp_database_newest`.`erp_orders`.`shipmentAutoMatched` in (select `erp_database_newest`.`erp_shipment`.`shipmentID` from `erp_shipment` where ((`erp_database_newest`.`erp_shipment`.`shipmentScanLocal` = 2) and (`erp_database_newest`.`erp_shipment`.`shipmentEnable` = 1))))))) ;

-- ----------------------------
-- View structure for erp_orders_products_one_month
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_products_one_month`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_products_one_month` AS select `erp_database_newest`.`erp_orders_products`.`orders_products_id` AS `orders_products_id`,`erp_database_newest`.`erp_orders_products`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders_products`.`ebay_orders_id` AS `ebay_orders_id`,`erp_database_newest`.`erp_orders_products`.`orderlineitemid` AS `orderlineitemid`,`erp_database_newest`.`erp_orders_products`.`orders_item_number` AS `orders_item_number`,`erp_database_newest`.`erp_orders_products`.`itemSite` AS `itemSite`,`erp_database_newest`.`erp_orders_products`.`orders_sku` AS `orders_sku`,`erp_database_newest`.`erp_orders_products`.`orders_item` AS `orders_item`,`erp_database_newest`.`erp_orders_products`.`item_price` AS `item_price`,`erp_database_newest`.`erp_orders_products`.`price_suggest` AS `price_suggest`,`erp_database_newest`.`erp_orders_products`.`item_count` AS `item_count`,`erp_database_newest`.`erp_orders_products`.`item_cost` AS `item_cost`,`erp_database_newest`.`erp_orders_products`.`transactionID` AS `transactionID`,`erp_database_newest`.`erp_orders_products`.`token_id` AS `token_id`,`erp_database_newest`.`erp_orders_products`.`feedback_id` AS `feedback_id`,`erp_database_newest`.`erp_orders_products`.`comment_type` AS `comment_type`,`erp_database_newest`.`erp_orders_products`.`comment_text` AS `comment_text`,`erp_database_newest`.`erp_orders_products`.`comment_time` AS `comment_time`,`erp_database_newest`.`erp_orders_products`.`getFeedback` AS `getFeedback` from `erp_orders_products` where `erp_database_newest`.`erp_orders_products`.`erp_orders_id` in (select `erp_database_newest`.`erp_orders`.`erp_orders_id` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`orders_status` = 5) and (`erp_database_newest`.`erp_orders`.`orders_is_join` = 0) and (`erp_database_newest`.`erp_orders`.`orders_shipping_time` <= now()) and (`erp_database_newest`.`erp_orders`.`orders_shipping_time` >= (now() - interval 1 month)) and (not(`erp_database_newest`.`erp_orders`.`shipmentAutoMatched` in (select `erp_database_newest`.`erp_shipment`.`shipmentID` from `erp_shipment` where ((`erp_database_newest`.`erp_shipment`.`shipmentScanLocal` = 2) and (`erp_database_newest`.`erp_shipment`.`shipmentEnable` = 1))))))) ;

-- ----------------------------
-- View structure for erp_orders_products_seven_day
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_products_seven_day`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_products_seven_day` AS select `p`.`orders_products_id` AS `orders_products_id`,`p`.`erp_orders_id` AS `erp_orders_id`,`p`.`ebay_orders_id` AS `ebay_orders_id`,`p`.`orderlineitemid` AS `orderlineitemid`,`p`.`orders_item_number` AS `orders_item_number`,`p`.`itemSite` AS `itemSite`,`p`.`orders_sku` AS `orders_sku`,`p`.`orders_item` AS `orders_item`,`p`.`item_price` AS `item_price`,`p`.`price_suggest` AS `price_suggest`,`p`.`item_count` AS `item_count`,`p`.`item_cost` AS `item_cost`,`p`.`transactionID` AS `transactionID`,`p`.`token_id` AS `token_id`,`p`.`feedback_id` AS `feedback_id`,`p`.`comment_type` AS `comment_type`,`p`.`comment_text` AS `comment_text`,`p`.`comment_time` AS `comment_time`,`p`.`getFeedback` AS `getFeedback` from (`erp_orders_products` `p` join `erp_orders` `o` on((`p`.`erp_orders_id` = `o`.`erp_orders_id`))) where ((`o`.`orders_status` = 5) and (`o`.`orders_is_join` = 0) and (`o`.`orders_export_time` <= now()) and (`o`.`orders_export_time` >= (now() - interval 7 day)) and (not(exists(select NULL from `erp_shipment` `s` where ((`s`.`shipmentScanLocal` = 2) and (`s`.`shipmentEnable` = 1) and (`s`.`shipmentID` = `o`.`shipmentAutoMatched`)))))) ;

-- ----------------------------
-- View structure for erp_orders_stockoffirsttransport
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_stockoffirsttransport`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_stockoffirsttransport` AS select sum(`op`.`item_count`) AS `co`,`op`.`orders_sku` AS `sku` from (`erp_orders` `o` join `erp_orders_products` `op`) where ((`o`.`erp_orders_id` = `op`.`erp_orders_id`) and (`o`.`orders_status` >= 3) and (`o`.`orders_status` <= 5) and (`o`.`orders_type` = 10) and (`o`.`orders_is_join` = 0) and (`o`.`overseasArrived` = 0)) group by `op`.`orders_sku` ;

-- ----------------------------
-- View structure for erp_orders_stockofpurchaseonshipping
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_stockofpurchaseonshipping`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_stockofpurchaseonshipping` AS select sum(`op`.`item_count`) AS `co`,`op`.`orders_sku` AS `orders_sku` from (`erp_orders` `o` join `erp_orders_products` `op`) where ((`o`.`erp_orders_id` = `op`.`erp_orders_id`) and (`o`.`orders_status` = 1) and (`o`.`orders_type` = 10) and (`o`.`orders_is_join` = 0) and (`o`.`overseasArrived` = 0)) group by `op`.`orders_sku` ;

-- ----------------------------
-- View structure for erp_orders_view
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_view` AS select `erp_database_newest`.`erp_orders`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders`.`ebay_orders_id` AS `ebay_orders_id`,`erp_database_newest`.`erp_orders`.`orderlineitemid` AS `orderlineitemid`,`erp_database_newest`.`erp_orders`.`buyer_id` AS `buyer_id`,`erp_database_newest`.`erp_orders`.`buyer_name` AS `buyer_name`,`erp_database_newest`.`erp_orders`.`buyer_phone` AS `buyer_phone`,`erp_database_newest`.`erp_orders`.`buyer_email` AS `buyer_email`,`erp_database_newest`.`erp_orders`.`buyer_address_1` AS `buyer_address_1`,`erp_database_newest`.`erp_orders`.`buyer_address_2` AS `buyer_address_2`,`erp_database_newest`.`erp_orders`.`buyer_city` AS `buyer_city`,`erp_database_newest`.`erp_orders`.`buyer_state` AS `buyer_state`,`erp_database_newest`.`erp_orders`.`buyer_zip` AS `buyer_zip`,`erp_database_newest`.`erp_orders`.`buyer_country` AS `buyer_country`,`erp_database_newest`.`erp_orders`.`buyer_country_code` AS `buyer_country_code`,`erp_database_newest`.`erp_orders`.`orders_total` AS `orders_total`,`erp_database_newest`.`erp_orders`.`orders_ship_fee` AS `orders_ship_fee`,`erp_database_newest`.`erp_orders`.`currency_type` AS `currency_type`,`erp_database_newest`.`erp_orders`.`currency_value` AS `currency_value`,`erp_database_newest`.`erp_orders`.`shipping_method` AS `shipping_method`,`erp_database_newest`.`erp_orders`.`ShippingServiceSelected` AS `ShippingServiceSelected`,`erp_database_newest`.`erp_orders`.`shipmentAutoMatched` AS `shipmentAutoMatched`,`erp_database_newest`.`erp_orders`.`pay_method` AS `pay_method`,`erp_database_newest`.`erp_orders`.`pay_id` AS `pay_id`,`erp_database_newest`.`erp_orders`.`transactionIDNew` AS `transactionIDNew`,`erp_database_newest`.`erp_orders`.`orders_time` AS `orders_time`,`erp_database_newest`.`erp_orders`.`sales_account` AS `sales_account`,`erp_database_newest`.`erp_orders`.`erp_user_id` AS `erp_user_id`,`erp_database_newest`.`erp_orders`.`orders_type` AS `orders_type`,`erp_database_newest`.`erp_orders`.`orders_status` AS `orders_status`,`erp_database_newest`.`erp_orders`.`orders_is_backorder` AS `orders_is_backorder`,`erp_database_newest`.`erp_orders`.`eub_status` AS `eub_status`,`erp_database_newest`.`erp_orders`.`orders_remark` AS `orders_remark`,`erp_database_newest`.`erp_orders`.`orders_export_time` AS `orders_export_time`,`erp_database_newest`.`erp_orders`.`orders_paid_time` AS `orders_paid_time`,`erp_database_newest`.`erp_orders`.`orders_print_time` AS `orders_print_time`,`erp_database_newest`.`erp_orders`.`orders_is_join` AS `orders_is_join`,`erp_database_newest`.`erp_orders`.`orders_is_split` AS `orders_is_split`,`erp_database_newest`.`erp_orders`.`orders_is_resend` AS `orders_is_resend`,`erp_database_newest`.`erp_orders`.`orders_is_refund` AS `orders_is_refund`,`erp_database_newest`.`erp_orders`.`orders_shipping_code` AS `orders_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_old_shipping_code` AS `orders_old_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_shipping_time` AS `orders_shipping_time`,`erp_database_newest`.`erp_orders`.`orders_shipping_user` AS `orders_shipping_user`,`erp_database_newest`.`erp_orders`.`orders_is_rechecked` AS `orders_is_rechecked`,`erp_database_newest`.`erp_orders`.`recheck_user` AS `recheck_user`,`erp_database_newest`.`erp_orders`.`recheck_time` AS `recheck_time`,`erp_database_newest`.`erp_orders`.`orders_is_tracking` AS `orders_is_tracking`,`erp_database_newest`.`erp_orders`.`orders_join_remark` AS `orders_join_remark`,`erp_database_newest`.`erp_orders`.`custom_shipping_fee` AS `custom_shipping_fee`,`erp_database_newest`.`erp_orders`.`notes_to_yourself` AS `notes_to_yourself`,`erp_database_newest`.`erp_orders`.`orders_shipping_method` AS `orders_shipping_method`,`erp_database_newest`.`erp_orders`.`ebayStatusIsMarked` AS `ebayStatusIsMarked`,`erp_database_newest`.`erp_orders`.`eBayStatusMarkedCount` AS `eBayStatusMarkedCount`,`erp_database_newest`.`erp_orders`.`eBayStatusUploadTrackingNumberCount` AS `eBayStatusUploadTrackingNumberCount`,`erp_database_newest`.`erp_orders`.`trackingNumberUploaded` AS `trackingNumberUploaded`,`erp_database_newest`.`erp_orders`.`priceMayBeWorry` AS `priceMayBeWorry`,`erp_database_newest`.`erp_orders`.`autoSendMessageStatus` AS `autoSendMessageStatus`,`erp_database_newest`.`erp_orders`.`autoSendMessageLastTime` AS `autoSendMessageLastTime`,`erp_database_newest`.`erp_orders`.`token_id` AS `token_id`,`erp_database_newest`.`erp_orders`.`autoSendFeedbackStatus` AS `autoSendFeedbackStatus`,`erp_database_newest`.`erp_orders`.`autoSendFeedbackLastTime` AS `autoSendFeedbackLastTime`,`erp_database_newest`.`erp_orders`.`tempFields` AS `tempFields`,`erp_database_newest`.`erp_orders`.`productsCost` AS `productsCost`,`erp_database_newest`.`erp_orders`.`packetWeight` AS `packetWeight`,`erp_database_newest`.`erp_orders`.`shippingCost` AS `shippingCost`,`erp_database_newest`.`erp_orders`.`platFeeTotal` AS `platFeeTotal`,`erp_database_newest`.`erp_orders`.`profitTotal` AS `profitTotal`,`erp_database_newest`.`erp_orders`.`profitRate` AS `profitRate`,`erp_database_newest`.`erp_orders`.`cargo_weight` AS `cargo_weight`,`erp_database_newest`.`erp_orders`.`orders_is_alert` AS `orders_is_alert`,`erp_database_newest`.`erp_orders`.`isMixed` AS `isMixed`,`erp_database_newest`.`erp_orders`.`isChineseOrder` AS `isChineseOrder`,`erp_database_newest`.`erp_orders`.`isMailSended` AS `isMailSended`,`erp_database_newest`.`erp_orders`.`old_erp_orders_id` AS `old_erp_orders_id`,`erp_database_newest`.`erp_orders`.`write_date` AS `write_date`,`erp_database_newest`.`erp_orders`.`orders_warehouse_id` AS `orders_warehouse_id` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`orders_is_join` = 0) and (`erp_database_newest`.`erp_orders`.`orders_export_time` >= (now() + interval -(92) day))) ;

-- ----------------------------
-- View structure for erp_orders_view_before_92
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_view_before_92`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_view_before_92` AS select `erp_database_newest`.`erp_orders`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders`.`ebay_orders_id` AS `ebay_orders_id`,`erp_database_newest`.`erp_orders`.`orderlineitemid` AS `orderlineitemid`,`erp_database_newest`.`erp_orders`.`buyer_id` AS `buyer_id`,`erp_database_newest`.`erp_orders`.`buyer_name` AS `buyer_name`,`erp_database_newest`.`erp_orders`.`buyer_phone` AS `buyer_phone`,`erp_database_newest`.`erp_orders`.`buyer_email` AS `buyer_email`,`erp_database_newest`.`erp_orders`.`buyer_address_1` AS `buyer_address_1`,`erp_database_newest`.`erp_orders`.`buyer_address_2` AS `buyer_address_2`,`erp_database_newest`.`erp_orders`.`buyer_city` AS `buyer_city`,`erp_database_newest`.`erp_orders`.`buyer_state` AS `buyer_state`,`erp_database_newest`.`erp_orders`.`buyer_zip` AS `buyer_zip`,`erp_database_newest`.`erp_orders`.`buyer_country` AS `buyer_country`,`erp_database_newest`.`erp_orders`.`buyer_country_code` AS `buyer_country_code`,`erp_database_newest`.`erp_orders`.`orders_total` AS `orders_total`,`erp_database_newest`.`erp_orders`.`orders_ship_fee` AS `orders_ship_fee`,`erp_database_newest`.`erp_orders`.`currency_type` AS `currency_type`,`erp_database_newest`.`erp_orders`.`currency_value` AS `currency_value`,`erp_database_newest`.`erp_orders`.`shipping_method` AS `shipping_method`,`erp_database_newest`.`erp_orders`.`ShippingServiceSelected` AS `ShippingServiceSelected`,`erp_database_newest`.`erp_orders`.`shipmentAutoMatched` AS `shipmentAutoMatched`,`erp_database_newest`.`erp_orders`.`pay_method` AS `pay_method`,`erp_database_newest`.`erp_orders`.`pay_id` AS `pay_id`,`erp_database_newest`.`erp_orders`.`transactionIDNew` AS `transactionIDNew`,`erp_database_newest`.`erp_orders`.`orders_time` AS `orders_time`,`erp_database_newest`.`erp_orders`.`sales_account` AS `sales_account`,`erp_database_newest`.`erp_orders`.`erp_user_id` AS `erp_user_id`,`erp_database_newest`.`erp_orders`.`orders_type` AS `orders_type`,`erp_database_newest`.`erp_orders`.`orders_status` AS `orders_status`,`erp_database_newest`.`erp_orders`.`orders_is_backorder` AS `orders_is_backorder`,`erp_database_newest`.`erp_orders`.`eub_status` AS `eub_status`,`erp_database_newest`.`erp_orders`.`orders_remark` AS `orders_remark`,`erp_database_newest`.`erp_orders`.`orders_export_time` AS `orders_export_time`,`erp_database_newest`.`erp_orders`.`orders_paid_time` AS `orders_paid_time`,`erp_database_newest`.`erp_orders`.`orders_print_time` AS `orders_print_time`,`erp_database_newest`.`erp_orders`.`orders_is_join` AS `orders_is_join`,`erp_database_newest`.`erp_orders`.`orders_is_split` AS `orders_is_split`,`erp_database_newest`.`erp_orders`.`orders_is_resend` AS `orders_is_resend`,`erp_database_newest`.`erp_orders`.`orders_is_refund` AS `orders_is_refund`,`erp_database_newest`.`erp_orders`.`orders_shipping_code` AS `orders_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_old_shipping_code` AS `orders_old_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_shipping_time` AS `orders_shipping_time`,`erp_database_newest`.`erp_orders`.`orders_shipping_user` AS `orders_shipping_user`,`erp_database_newest`.`erp_orders`.`orders_is_rechecked` AS `orders_is_rechecked`,`erp_database_newest`.`erp_orders`.`recheck_user` AS `recheck_user`,`erp_database_newest`.`erp_orders`.`recheck_time` AS `recheck_time`,`erp_database_newest`.`erp_orders`.`orders_is_tracking` AS `orders_is_tracking`,`erp_database_newest`.`erp_orders`.`orders_join_remark` AS `orders_join_remark`,`erp_database_newest`.`erp_orders`.`custom_shipping_fee` AS `custom_shipping_fee`,`erp_database_newest`.`erp_orders`.`notes_to_yourself` AS `notes_to_yourself`,`erp_database_newest`.`erp_orders`.`orders_shipping_method` AS `orders_shipping_method`,`erp_database_newest`.`erp_orders`.`ebayStatusIsMarked` AS `ebayStatusIsMarked`,`erp_database_newest`.`erp_orders`.`eBayStatusMarkedCount` AS `eBayStatusMarkedCount`,`erp_database_newest`.`erp_orders`.`eBayStatusUploadTrackingNumberCount` AS `eBayStatusUploadTrackingNumberCount`,`erp_database_newest`.`erp_orders`.`trackingNumberUploaded` AS `trackingNumberUploaded`,`erp_database_newest`.`erp_orders`.`priceMayBeWorry` AS `priceMayBeWorry`,`erp_database_newest`.`erp_orders`.`autoSendMessageStatus` AS `autoSendMessageStatus`,`erp_database_newest`.`erp_orders`.`autoSendMessageLastTime` AS `autoSendMessageLastTime`,`erp_database_newest`.`erp_orders`.`token_id` AS `token_id`,`erp_database_newest`.`erp_orders`.`autoSendFeedbackStatus` AS `autoSendFeedbackStatus`,`erp_database_newest`.`erp_orders`.`autoSendFeedbackLastTime` AS `autoSendFeedbackLastTime`,`erp_database_newest`.`erp_orders`.`tempFields` AS `tempFields`,`erp_database_newest`.`erp_orders`.`productsCost` AS `productsCost`,`erp_database_newest`.`erp_orders`.`packetWeight` AS `packetWeight`,`erp_database_newest`.`erp_orders`.`shippingCost` AS `shippingCost`,`erp_database_newest`.`erp_orders`.`platFeeTotal` AS `platFeeTotal`,`erp_database_newest`.`erp_orders`.`profitTotal` AS `profitTotal`,`erp_database_newest`.`erp_orders`.`profitRate` AS `profitRate`,`erp_database_newest`.`erp_orders`.`isMixed` AS `isMixed`,`erp_database_newest`.`erp_orders`.`isChineseOrder` AS `isChineseOrder`,`erp_database_newest`.`erp_orders`.`old_erp_orders_id` AS `old_erp_orders_id` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`orders_is_join` = 0) and (`erp_database_newest`.`erp_orders`.`orders_export_time` <= (now() + interval -(91) day))) ;

-- ----------------------------
-- View structure for erp_orders_view_month_total
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_view_month_total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_view_month_total` AS select `erp_orders_view`.`orders_total` AS `orders_total`,`erp_orders_view`.`orders_type` AS `orders_type`,`erp_orders_view`.`orders_export_time` AS `orders_export_time`,`erp_orders_view`.`erp_orders_id` AS `erp_orders_id`,`erp_orders_view`.`orders_status` AS `orders_status`,`erp_orders_view`.`orders_shipping_time` AS `orders_shipping_time`,`erp_orders_view`.`currency_value` AS `currency_value`,`erp_orders_view`.`orders_warehouse_id` AS `orders_warehouse_id` from `erp_orders_view` where ((`erp_orders_view`.`orders_status` <> 6) and (`erp_orders_view`.`orders_status` <> 7) and (date_format(`erp_orders_view`.`orders_export_time`,'%Y%m') = date_format(curdate(),'%Y%m'))) ;

-- ----------------------------
-- View structure for erp_orders_view_print_shipping_status
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_view_print_shipping_status`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_view_print_shipping_status` AS select `erp_database_newest`.`erp_orders`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders`.`orders_shipping_time` AS `orders_shipping_time`,`erp_database_newest`.`erp_orders`.`orders_print_time` AS `orders_print_time`,`erp_database_newest`.`erp_orders`.`orders_export_time` AS `orders_export_time`,`erp_database_newest`.`erp_orders`.`orders_status` AS `orders_status`,`erp_database_newest`.`erp_orders`.`orders_type` AS `orders_type`,`erp_database_newest`.`erp_orders`.`orders_is_backorder` AS `orders_is_backorder` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`orders_is_join` = 0) and (`erp_database_newest`.`erp_orders`.`orders_export_time` >= (now() + interval -(92) day)) and ((`erp_database_newest`.`erp_orders`.`orders_status` = 4) or (`erp_database_newest`.`erp_orders`.`orders_status` = 3))) ;

-- ----------------------------
-- View structure for erp_orders_view_print_shipping_status_new
-- ----------------------------
DROP VIEW IF EXISTS `erp_orders_view_print_shipping_status_new`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_orders_view_print_shipping_status_new` AS select `erp_database_newest`.`erp_orders`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders`.`orders_shipping_time` AS `orders_shipping_time`,`erp_database_newest`.`erp_orders`.`orders_print_time` AS `orders_print_time`,`erp_database_newest`.`erp_orders`.`orders_export_time` AS `orders_export_time`,`erp_database_newest`.`erp_orders`.`orders_status` AS `orders_status`,`erp_database_newest`.`erp_orders`.`orders_type` AS `orders_type`,`erp_database_newest`.`erp_orders`.`orders_is_backorder` AS `orders_is_backorder`,`erp_database_newest`.`erp_orders`.`orders_warehouse_id` AS `orders_warehouse_id` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`orders_is_join` = 0) and (`erp_database_newest`.`erp_orders`.`orders_is_backorder` in (0,1)) and (`erp_database_newest`.`erp_orders`.`orders_export_time` >= (now() - interval 92 day)) and (`erp_database_newest`.`erp_orders`.`orders_status` in (3,4))) ;

-- ----------------------------
-- View structure for erp_products_sale_day14_view
-- ----------------------------
DROP VIEW IF EXISTS `erp_products_sale_day14_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_products_sale_day14_view` AS select sum(`p`.`item_count`) AS `sum(p.item_count)`,`o`.`orders_print_time` AS `orders_print_time`,`p`.`orders_sku` AS `orders_sku` from ((`erp_orders_view` `o` left join `erp_orders_products` `p` on((`o`.`erp_orders_id` = `p`.`erp_orders_id`))) left join `erp_shipment` `c` on((`o`.`shipmentAutoMatched` = `c`.`shipmentID`))) where ((`c`.`shipmentScanLocal` = 1) and ((to_days(now()) - to_days(`o`.`orders_print_time`)) <= 30) and ((`o`.`orders_status` = 4) or (`o`.`orders_status` = 5)) and (`o`.`orders_type` <= 7)) group by `p`.`orders_sku` ;

-- ----------------------------
-- View structure for erp_products_sale_day30_view
-- ----------------------------
DROP VIEW IF EXISTS `erp_products_sale_day30_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_products_sale_day30_view` AS select sum(`p`.`item_count`) AS `sum(p.item_count)`,`o`.`orders_print_time` AS `orders_print_time`,`p`.`orders_sku` AS `orders_sku` from ((`erp_orders_view` `o` left join `erp_orders_products` `p` on((`o`.`erp_orders_id` = `p`.`erp_orders_id`))) left join `erp_shipment` `c` on((`o`.`shipmentAutoMatched` = `c`.`shipmentID`))) where ((`c`.`shipmentScanLocal` = 1) and ((to_days(now()) - to_days(`o`.`orders_print_time`)) <= 60) and ((`o`.`orders_status` = 4) or (`o`.`orders_status` = 5)) and (`o`.`orders_type` <= 7)) group by `p`.`orders_sku` ;

-- ----------------------------
-- View structure for erp_products_sale_day7_view
-- ----------------------------
DROP VIEW IF EXISTS `erp_products_sale_day7_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_products_sale_day7_view` AS select sum(`p`.`item_count`) AS `sum(p.item_count)`,`o`.`orders_print_time` AS `orders_print_time`,`p`.`orders_sku` AS `orders_sku` from ((`erp_orders_view` `o` left join `erp_orders_products` `p` on((`o`.`erp_orders_id` = `p`.`erp_orders_id`))) left join `erp_shipment` `c` on((`o`.`shipmentAutoMatched` = `c`.`shipmentID`))) where ((`c`.`shipmentScanLocal` = 1) and ((to_days(now()) - to_days(`o`.`orders_print_time`)) <= 7) and ((`o`.`orders_status` = 4) or (`o`.`orders_status` = 5)) and (`o`.`orders_type` <= 7)) group by `p`.`orders_sku` ;

-- ----------------------------
-- View structure for erp_resend_record
-- ----------------------------
DROP VIEW IF EXISTS `erp_resend_record`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `erp_resend_record` AS select `erp_database_newest`.`erp_orders`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders`.`ebay_orders_id` AS `ebay_orders_id`,`erp_database_newest`.`erp_orders`.`orderlineitemid` AS `orderlineitemid`,`erp_database_newest`.`erp_orders`.`buyer_id` AS `buyer_id`,`erp_database_newest`.`erp_orders`.`buyer_name` AS `buyer_name`,`erp_database_newest`.`erp_orders`.`buyer_phone` AS `buyer_phone`,`erp_database_newest`.`erp_orders`.`buyer_email` AS `buyer_email`,`erp_database_newest`.`erp_orders`.`buyer_address_1` AS `buyer_address_1`,`erp_database_newest`.`erp_orders`.`buyer_address_2` AS `buyer_address_2`,`erp_database_newest`.`erp_orders`.`buyer_city` AS `buyer_city`,`erp_database_newest`.`erp_orders`.`buyer_state` AS `buyer_state`,`erp_database_newest`.`erp_orders`.`buyer_zip` AS `buyer_zip`,`erp_database_newest`.`erp_orders`.`buyer_country` AS `buyer_country`,`erp_database_newest`.`erp_orders`.`buyer_country_code` AS `buyer_country_code`,`erp_database_newest`.`erp_orders`.`orders_total` AS `orders_total`,`erp_database_newest`.`erp_orders`.`orders_ship_fee` AS `orders_ship_fee`,`erp_database_newest`.`erp_orders`.`currency_type` AS `currency_type`,`erp_database_newest`.`erp_orders`.`currency_value` AS `currency_value`,`erp_database_newest`.`erp_orders`.`shipping_method` AS `shipping_method`,`erp_database_newest`.`erp_orders`.`ShippingServiceSelected` AS `ShippingServiceSelected`,`erp_database_newest`.`erp_orders`.`shipmentAutoMatched` AS `shipmentAutoMatched`,`erp_database_newest`.`erp_orders`.`pay_method` AS `pay_method`,`erp_database_newest`.`erp_orders`.`pay_id` AS `pay_id`,`erp_database_newest`.`erp_orders`.`transactionIDNew` AS `transactionIDNew`,`erp_database_newest`.`erp_orders`.`orders_time` AS `orders_time`,`erp_database_newest`.`erp_orders`.`sales_account` AS `sales_account`,`erp_database_newest`.`erp_orders`.`erp_user_id` AS `erp_user_id`,`erp_database_newest`.`erp_orders`.`orders_type` AS `orders_type`,`erp_database_newest`.`erp_orders`.`orders_status` AS `orders_status`,`erp_database_newest`.`erp_orders`.`orders_is_backorder` AS `orders_is_backorder`,`erp_database_newest`.`erp_orders`.`eub_status` AS `eub_status`,`erp_database_newest`.`erp_orders`.`orders_remark` AS `orders_remark`,`erp_database_newest`.`erp_orders`.`orders_export_time` AS `orders_export_time`,`erp_database_newest`.`erp_orders`.`orders_paid_time` AS `orders_paid_time`,`erp_database_newest`.`erp_orders`.`orders_print_time` AS `orders_print_time`,`erp_database_newest`.`erp_orders`.`orders_is_join` AS `orders_is_join`,`erp_database_newest`.`erp_orders`.`orders_is_split` AS `orders_is_split`,`erp_database_newest`.`erp_orders`.`orders_is_resend` AS `orders_is_resend`,`erp_database_newest`.`erp_orders`.`orders_is_refund` AS `orders_is_refund`,`erp_database_newest`.`erp_orders`.`orders_shipping_code` AS `orders_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_old_shipping_code` AS `orders_old_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_shipping_time` AS `orders_shipping_time`,`erp_database_newest`.`erp_orders`.`orders_shipping_user` AS `orders_shipping_user`,`erp_database_newest`.`erp_orders`.`orders_is_rechecked` AS `orders_is_rechecked`,`erp_database_newest`.`erp_orders`.`recheck_user` AS `recheck_user`,`erp_database_newest`.`erp_orders`.`recheck_time` AS `recheck_time`,`erp_database_newest`.`erp_orders`.`orders_is_tracking` AS `orders_is_tracking`,`erp_database_newest`.`erp_orders`.`orders_join_remark` AS `orders_join_remark`,`erp_database_newest`.`erp_orders`.`custom_shipping_fee` AS `custom_shipping_fee`,`erp_database_newest`.`erp_orders`.`notes_to_yourself` AS `notes_to_yourself`,`erp_database_newest`.`erp_orders`.`orders_shipping_method` AS `orders_shipping_method`,`erp_database_newest`.`erp_orders`.`ebayStatusIsMarked` AS `ebayStatusIsMarked`,`erp_database_newest`.`erp_orders`.`eBayStatusMarkedCount` AS `eBayStatusMarkedCount`,`erp_database_newest`.`erp_orders`.`eBayStatusUploadTrackingNumberCount` AS `eBayStatusUploadTrackingNumberCount`,`erp_database_newest`.`erp_orders`.`trackingNumberUploaded` AS `trackingNumberUploaded`,`erp_database_newest`.`erp_orders`.`priceMayBeWorry` AS `priceMayBeWorry`,`erp_database_newest`.`erp_orders`.`autoSendMessageStatus` AS `autoSendMessageStatus`,`erp_database_newest`.`erp_orders`.`autoSendMessageLastTime` AS `autoSendMessageLastTime`,`erp_database_newest`.`erp_orders`.`token_id` AS `token_id`,`erp_database_newest`.`erp_orders`.`autoSendFeedbackStatus` AS `autoSendFeedbackStatus`,`erp_database_newest`.`erp_orders`.`autoSendFeedbackLastTime` AS `autoSendFeedbackLastTime`,`erp_database_newest`.`erp_orders`.`tempFields` AS `tempFields`,`erp_database_newest`.`erp_orders`.`productsCost` AS `productsCost`,`erp_database_newest`.`erp_orders`.`packetWeight` AS `packetWeight`,`erp_database_newest`.`erp_orders`.`shippingCost` AS `shippingCost`,`erp_database_newest`.`erp_orders`.`platFeeTotal` AS `platFeeTotal`,`erp_database_newest`.`erp_orders`.`profitTotal` AS `profitTotal`,`erp_database_newest`.`erp_orders`.`profitRate` AS `profitRate`,`erp_database_newest`.`erp_orders`.`old_erp_orders_id` AS `old_erp_orders_id` from `erp_orders` where (`erp_database_newest`.`erp_orders`.`orders_type` = 5) ;

-- ----------------------------
-- View structure for export_bepost_48
-- ----------------------------
DROP VIEW IF EXISTS `export_bepost_48`;
CREATE ALGORITHM=UNDEFINED DEFINER=`erp`@`%` SQL SECURITY INVOKER VIEW `export_bepost_48` AS select `erp_database_newest`.`erp_orders`.`erp_orders_id` AS `erp_orders_id`,`erp_database_newest`.`erp_orders`.`buyer_id` AS `buyer_id`,`erp_database_newest`.`erp_orders`.`orders_shipping_code` AS `orders_shipping_code`,`erp_database_newest`.`erp_orders`.`orders_shipping_time` AS `orders_shipping_time` from `erp_orders` where ((`erp_database_newest`.`erp_orders`.`orders_type` = 1) and (`erp_database_newest`.`erp_orders`.`orders_export_time` between '2013-04-01 00:00:00' and '2013-08-31 23:59:59') and (`erp_database_newest`.`erp_orders`.`shipmentAutoMatched` in (12,23,24,25,26,39)) and (`erp_database_newest`.`erp_orders`.`orders_status` = 5)) ;

-- ----------------------------
-- Procedure structure for ddfh_bltj
-- ----------------------------
DROP PROCEDURE IF EXISTS `ddfh_bltj`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `ddfh_bltj`(
)
    SQL SECURITY INVOKER
BEGIN
select @rq:=curdate();
-- 改日已经写入，就不能继续写入
IF (select count(*) from erp_orders_shippment_monitoring where statistical_time=UNIX_TIMESTAMP(date_sub(@rq,interval 1 day)) )<1
then

-- erp_csk表 在测试库中映射正式库erp_orders表
-- 7天订单数据汇总
DROP TABLE IF EXISTS orders7_tj;

CREATE TEMPORARY table orders7_tj
select erp_orders_id,orders_status,orders_export_time,orders_shipping_time,orders_warehouse_id from erp_orders a 
where a.orders_status in(3,4,5,7,8,9,10,11,12) and a.orders_export_time>=date_sub(@rq,interval 8 day) and a.orders_export_time<date_sub(@rq,interval 1 day)
and a.orders_warehouse_id in(1000,1025,1035) and a.orders_is_join=0;


-- 抽取统计前一天的订单
DROP TABLE IF EXISTS orders_tj;
CREATE TEMPORARY table orders_tj
select erp_orders_id,orders_status,orders_export_time,orders_shipping_time,orders_warehouse_id from orders7_tj a 
where a.orders_export_time>=date_sub(@rq,interval 2 day) and a.orders_export_time<date_sub(@rq,interval 1 day);

-- 新进订单
DROP TABLE IF EXISTS dd_xj;
CREATE TEMPORARY table dd_xj
select date_sub(@rq,interval 2 day) as ddrq,orders_warehouse_id,COUNT(erp_orders_id) as xjds from orders_tj  GROUP BY orders_warehouse_id;
-- 24小时发货订单量,已经指定的订单日期也是当天,发货时间不管日期，只管小于24小时。
DROP TABLE IF EXISTS dd_fh;
CREATE TEMPORARY table dd_fh
select orders_warehouse_id,IFNULL(COUNT(erp_orders_id),0) as ds_24 from orders_tj 
where orders_status=5 and (UNIX_TIMESTAMP(orders_shipping_time)-UNIX_TIMESTAMP(orders_export_time))/3600<24
and orders_shipping_time>=date_sub(@rq,interval 2 day) and orders_shipping_time<date_sub(@rq,interval 0 day)
GROUP BY orders_warehouse_id;

-- 当天发货订单量，只管是当天发货不管它是否是当天的订单
DROP TABLE IF EXISTS dtdd;
CREATE TEMPORARY table dtdd
select date_sub(@rq,interval 2 day) as ddrq,orders_warehouse_id,IFNULL(COUNT(erp_orders_id),0) as fhds from erp_orders a
where orders_status=5 and orders_shipping_time>=date_sub(@rq,interval 2 day) and orders_shipping_time<date_sub(@rq,interval 1 day)
and a.orders_warehouse_id in(1000,1025,1035) and a.orders_is_join=0
GROUP BY orders_warehouse_id;


-- 7天内新进订单量
DROP TABLE IF EXISTS dd_7;
CREATE TEMPORARY table dd_7
select orders_warehouse_id,COUNT(erp_orders_id) as ds7 from orders7_tj GROUP BY orders_warehouse_id;

-- 7天内新进订单发货订单量,7*24=168小时
DROP TABLE IF EXISTS dd_7fh;
CREATE TEMPORARY table dd_7fh
select orders_warehouse_id,COUNT(erp_orders_id) as ds7fh from orders7_tj 
where orders_status=5 and (UNIX_TIMESTAMP(orders_shipping_time)-UNIX_TIMESTAMP(orders_export_time))/3600<168
and orders_shipping_time>=date_sub(@rq,interval 8 day) and orders_shipping_time<date_sub(@rq,interval 0 day)
GROUP BY orders_warehouse_id;

-- 7天发货订单量
DROP TABLE IF EXISTS dd_7fh2;
CREATE TEMPORARY table dd_7fh2
select orders_warehouse_id,COUNT(erp_orders_id) as ds7fh2 
from erp_orders
where orders_status=5 and orders_shipping_time>=date_sub(@rq,interval 8 day) and orders_shipping_time<date_sub(@rq,interval 1 day)
and orders_warehouse_id in(1000,1025,1035) and orders_is_join=0
GROUP BY orders_warehouse_id;

-- 计算7天时长
DROP TABLE IF EXISTS orders7_sc;
CREATE TEMPORARY table orders7_sc
select erp_orders_id,orders_status,UNIX_TIMESTAMP(orders_export_time) as ddsj,
IFNULL(UNIX_TIMESTAMP(orders_shipping_time),UNIX_TIMESTAMP(date_sub(@rq,interval 0 day))) as fhsj,orders_warehouse_id 
from erp_orders a 
where a.orders_status in(3,4,5,7,8,9,10,11,12) and a.orders_export_time>=date_sub(@rq,interval 8 day) and a.orders_export_time<date_sub(@rq,interval 1 day)
and a.orders_warehouse_id in(1000,1025,1035) and a.orders_is_join=0;

-- 更新临时表发货时间不规范的时间 比如：'0000-00-00 00:00:00'
update orders7_sc set fhsj=UNIX_TIMESTAMP(date_sub(@rq,interval 0 day)) where fhsj=0;
-- 分仓库计算7天订单时长
-- 时间戳相减除以3600 即是小时
DROP TABLE IF EXISTS dd7_sc;
CREATE TEMPORARY table dd7_sc
select orders_warehouse_id,sum((fhsj-ddsj)/3600)/COUNT(erp_orders_id) as dd_sc from orders7_sc GROUP BY orders_warehouse_id;

--  存储数据到 发货指标表 erp_orders_shippment_monitoring
--  显示的统计时间，数据分析要求必需显示前一天:date_sub(a.ddrq,interval -1 day)
INSERT into erp_orders_shippment_monitoring(statistical_time,warehouse_id,new_order_total,shipped_total,shipped_percent,24_deal_total,
24_deal_percent,new_order_seven_total,shipped_seven_total,shipped_seven_percent,
average_order_deal_time,insert_time,delivery_seven_total,delivery_seven_percent)
select UNIX_TIMESTAMP(date_sub(a.ddrq,interval -1 day)) as 日期,a.orders_warehouse_id as 仓库,
a.xjds as 当天新进订单量,IFNULL(b.ds_24,0) as 24小时发货订单量,IFNULL(b.ds_24/a.xjds,0) as 24小时发货比例,
IFNULL(c.fhds,0) as 当天发货订单量,IFNULL(c.fhds/a.xjds,0) as 当天发货比例,d.ds7 as 7天新进订单量,e.ds7fh as 7天新进订单发货量,e.ds7fh/d.ds7 as 7天新进订单发货比例,
dd_sc as 7天订单平均处理时长,NOW(),g.ds7fh2 as 7天发货量,g.ds7fh2/d.ds7 as 7天订单发货比例
from dd_xj a LEFT JOIN dd_fh b on a.orders_warehouse_id=b.orders_warehouse_id
LEFT JOIN dtdd c on a.orders_warehouse_id=c.orders_warehouse_id
RIGHT JOIN dd_7 d on a.orders_warehouse_id=d.orders_warehouse_id
RIGHT JOIN dd_7fh e on e.orders_warehouse_id=a.orders_warehouse_id
LEFT JOIN dd7_sc f on f.orders_warehouse_id=e.orders_warehouse_id
RIGHT JOIN dd_7fh2 g on g.orders_warehouse_id=a.orders_warehouse_id;

DROP table orders_tj;
DROP table dd_xj;
DROP table dd_fh;
DROP table dtdd;
DROP table orders7_tj;
DROP table dd_7;
DROP table dd_7fh;
DROP table orders7_sc;
DROP table dd7_sc;
DROP table dd_7fh2;

end if;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ddlx_tj
-- ----------------------------
DROP PROCEDURE IF EXISTS `ddlx_tj`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `ddlx_tj`(
)
    SQL SECURITY INVOKER
BEGIN
-- erp_csk表 在测试库中映射正式库erp_orders表
-- 单日计算写入
select @rq:=curdate();
IF (select count(*) from erp_orders_perform_monitoring where statistical_time=UNIX_TIMESTAMP(date_sub(@rq,interval 1 day)) )<1
then
DROP TABLE IF EXISTS orders_tj;

CREATE TEMPORARY table orders_tj
select erp_orders_id,orders_status,left(orders_export_time,10) as ddrq,left(orders_shipping_time,10) as fhrq,orders_warehouse_id,orders_is_backorder from erp_orders a 
where a.orders_status in(1,3,4,5,7,8,9,10,11,12) and a.orders_export_time>=date_sub(@rq,interval 30 day) and a.orders_export_time<date_sub(@rq,interval 0 day)
and a.orders_is_join=0;

-- 新建订单
DROP TABLE IF EXISTS xjdd;
CREATE TEMPORARY table xjdd
select date_sub(@rq,interval 1 day) as rq,COUNT(erp_orders_id) as drdds from orders_tj where orders_status in(1,3,4,5,7,8,9,10,11,12) and ddrq=date_sub(@rq,interval 1 day);

-- 截止到订单统计时间前一天为止未发货的订单，发货日期是当天或之后
DROP TABLE IF EXISTS qtwfdd;
CREATE TEMPORARY table qtwfdd
select DISTINCT date_sub(@rq,interval 1 day) as rq,COUNT(erp_orders_id) as qtds from orders_tj 
where orders_status in(1,3,4,5,7,8,9,10,11,12) and ddrq<date_sub(@rq,interval 1 day) and (fhrq>=date_sub(@rq,interval 1 day) or fhrq is null);


-- 总未发订单数量；订单日期可以是当天，但发货日期不能是当天
DROP TABLE IF EXISTS zwfdd;
CREATE TEMPORARY table zwfdd
select date_sub(@rq,interval 1 day) as rq,COUNT(erp_orders_id) as dtds from orders_tj 
where orders_status in(1,3,4,7,9,10,11,12) and ddrq<=date_sub(@rq,interval 1 day);

-- 当日欠货订单数
select @qh:=COUNT(erp_orders_id) from orders_tj where orders_status in(1,3,4,7,9,10,11,12) and ddrq>=date_sub(@rq,interval 30 day) and orders_is_backorder=1;

-- 当日发货订单数
DROP TABLE IF EXISTS fhds;
CREATE TEMPORARY table fhds
select DISTINCT  date_sub(@rq,interval 1 day) as rq,COUNT(erp_orders_id) as drfss from orders_tj where orders_status=5 and fhrq=date_sub(@rq,interval 1 day);

-- 3天未发订单
select @d3:=COUNT(erp_orders_id)from orders_tj where orders_status in(1,3,4,7,9,10,11,12) and ddrq>=date_sub(@rq,interval 3 day);

-- 3-7天未发订单
select @d3_7:=COUNT(erp_orders_id) from orders_tj where orders_status in(1,3,4,7,9,10,11,12) and ddrq<date_sub(@rq,interval 3 day) and ddrq>=date_sub(@rq,interval 7 day);

-- 7天以上未发订单
select @d7:=COUNT(erp_orders_id) from orders_tj where orders_status in(1,3,4,7,9,10,11,12) and ddrq<date_sub(@rq,interval 7 day);

-- 存入订单履行监控指标总表 erp_orders_perform_monitoring
INSERT into erp_orders_perform_monitoring(statistical_time,new_order_total,all_order_total,not_shipped_total,not_shipped_percent,not_stock_total,not_stock_percent,
shipped_total,shipped_percent,not_shipped_three_total,not_shipped_seven_total,not_shipped_beyond_seven_total,insert_time)
select UNIX_TIMESTAMP(a.rq) as 日期,a.drdds as 当日新进单数,a.drdds+b.qtds as 当日总订单数,IFNULL(c.dtds,0) as 总未发订单数,c.dtds/(a.drdds+b.qtds) as 未发订单比例,@qh as 欠货订单数,@qh/(a.drdds+b.qtds) as 欠货订单比例,
IFNULL(d.drfss,0) as 当日发货订单数,IFNULL(d.drfss/(a.drdds+b.qtds),0) as 当日发货订单比例,@d3 as 3天以内未发订单数,@d3_7 as 3到7天内未发订单数,@d7 as 7天以上未发订单数,NOW()
from xjdd a LEFT JOIN qtwfdd b on a.rq=b.rq
LEFT JOIN zwfdd c on a.rq=c.rq
LEFT JOIN fhds d on a.rq=d.rq;

drop table orders_tj;
drop table xjdd;
drop table qtwfdd;
drop table zwfdd;
drop table fhds;

end if;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_audit_Purchasepens
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_audit_Purchasepens`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_audit_Purchasepens`(
)
    SQL SECURITY INVOKER
BEGIN
-- 存储采购数据
-- 整合库存数据 ,整合期末数据(库存数据)20170630
drop table if EXISTS erp_database_newest.erp_eudit_stock;
CREATE TABLE erp_database_newest.erp_eudit_stock (
    sku VARCHAR(50),
    warehouse_id INT,
    ac_date DATE,
    stock_number INT,
    stock_price DECIMAL(20 , 4 )
);
create index erp_eudit_stock on erp_database_newest.erp_eudit_stock(sku,warehouse_id);

insert into erp_database_newest.erp_eudit_stock
select   sku,warehouse_id,'2017-06-30' as ac_date,stock_number,stock_price
from      (select trim(sku) as sku,warehouse_id,stock_number,stock_price from erp_database_newest.sku_stock_shenzhen_0925
        union all
          select trim(sku) as sku,warehouse_id,stock_number,stock_price from erp_database_newest.sku_stock_yiwu_0925
          union all
          select trim(sku) as sku,warehouse_id,stock_number,stock_price from erp_database_newest.sku_stock_dongguan_0925
          union all
          select trim(sku) as sku,warehouse_id,SUM(stock_number) AS stock_number,MAX(stock_price) AS stock_price 
		  from erp_database_newest.sku_stock_hw_0925 group by trim(sku),warehouse_id
           ) as z1
;
-- 存储采购数据(首先存储相关月份的数据)
drop table if exists erp_database_newest.erp_audit_Purchasepens_month;
CREATE TABLE erp_database_newest.erp_audit_Purchasepens_month (
    `sku` VARCHAR(50) COMMENT 'sku',
    `warehouse_id` INT COMMENT '仓库ID',
    ac_date DATE COMMENT '采购日期,取每月最后一天',
    Purchasepens_count INT DEFAULT 0 COMMENT '采购笔数(境内仓的采购笔数)',
    Purchasepens_count_overseas INT DEFAULT 0 COMMENT '海外仓的转入笔数'
);
create index erp_audit_Purchasepens_month on erp_database_newest.erp_audit_Purchasepens_month(sku);

-- 插入数据(插入境内仓的数据)
insert into erp_database_newest.erp_audit_Purchasepens_month
SELECT     trim(pp.op_pro_sku) AS sku
           ,ep.procurement_warehouse_id as warehouse_id
           ,last_day(orders_record_time) as ac_date
           ,sum(ifnull(pa.orders_record_count,0)) as Purchasepens_count
		   ,0 as Purchasepens_count_overseas  -- 境内仓没有转入
FROM       (select distinct op_pro_sku,po_id FROM ERP_DATABASE_NEWEST.erp_procurement_products) pp
INNER JOIN ERP_DATABASE_NEWEST.erp_procurement ep 
ON         ep.po_id = pp.po_id
INNER JOIN ERP_DATABASE_NEWEST.erp_orders_record pa 
ON         pa.procurement_id = pp.po_id
AND        pa.products_sku = pp.op_pro_sku
WHERE      has_new_arrival = 0
AND        po_status >=2  and orders_record_type in (1,9)
AND        orders_record_time >= '2015-01-01 00:00:00'
AND        orders_record_time <= '2017-06-30 23:59:59'
AND        ((mustFollowing = 0 AND ep.arrival_is_end = 1) OR po_status =6)
GROUP BY   trim(pp.op_pro_sku),ep.procurement_warehouse_id,last_day(orders_record_time)
;
-- 插入数据(插入海外仓的转入数据)
insert into erp_database_newest.erp_audit_Purchasepens_month
select     case when trim(t2.productSKU) like '%(%' then substring_index(trim(t2.productSKU),'(',1) else trim(t2.productSKU) end as sku  -- FBA :9999 海外仓:9998
           ,case when t1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end as warehouse_id
           ,last_day(createdDatetime) as ac_date
		   ,0 as Purchasepens_count  -- 海外仓没有采购
		   ,sum(ifnull(t2.quantity,0)) as Purchasepens_count_overseas
FROM       `salamoer_database`.`sangelfine_allocation_product` as t1
inner JOIN `salamoer_database`.`sangelfine_allocation_product_list` as t2 
ON         t1.allocationProductID = t2.allocationProductID
where      t1.status in (3,4) -- 3:头程在途,4:海外仓到货
and        t1.createdDatetime >= '2015-01-01 00:00:00'
and        t1.createdDatetime <= '2017-06-30 23:59:59'  -- receiveWarehouseID 接受仓库
and        t1.receiveWarehouseID in (1001,1002,1004,1005,1008,1009,1010,1011,1012,1013,1014,1015,1016 ,1017,1018,1019
               ,1023,1024,1026,1027,1030,1031,1032,1033,1037,1038,1039,1040)
group by   case when trim(t2.productSKU) like '%(%' then substring_index(trim(t2.productSKU),'(',1) else trim(t2.productSKU) end
           ,case when t1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end
           ,last_day(createdDatetime)
;
-- 处理捆绑转入的情况
drop table if exists erp_database_newest.erp_audit_Purchasepens_month_tmp;
CREATE TABLE erp_database_newest.erp_audit_Purchasepens_month_tmp (
    `sku` VARCHAR(50) COMMENT 'sku',
    `warehouse_id` INT COMMENT '仓库ID',
    ac_date DATE COMMENT '采购日期,取每月最后一天',
    Purchasepens_count INT DEFAULT 0 COMMENT '采购笔数(境内仓的采购笔数)',
    Purchasepens_count_overseas INT DEFAULT 0 COMMENT '海外仓的转入笔数'
);
create index erp_audit_Purchasepens_month_tmp on erp_database_newest.erp_audit_Purchasepens_month_tmp(sku);
-- 插入没有捆绑的数据
insert into erp_database_newest.erp_audit_Purchasepens_month_tmp
select   SKU
         ,warehouse_id
		 ,ac_date
		 ,Purchasepens_count
		 ,Purchasepens_count_overseas
from     erp_database_newest.erp_audit_Purchasepens_month as t 
where    sku not like '%+%'
;
-- 插入捆绑左边的数据
insert into erp_database_newest.erp_audit_Purchasepens_month_tmp
select   substring_index(sku,'+',1)
         ,warehouse_id
		 ,ac_date
		 ,Purchasepens_count
		 ,Purchasepens_count_overseas
from     erp_database_newest.erp_audit_Purchasepens_month as t 
where    sku like '%+%'  
;
-- 插入捆绑右边的数据
insert into erp_database_newest.erp_audit_Purchasepens_month_tmp
select   substring_index(sku,'+',-1)
         ,warehouse_id
		 ,ac_date
		 ,Purchasepens_count
		 ,Purchasepens_count_overseas
from     erp_database_newest.erp_audit_Purchasepens_month as t 
where    sku like '%+%'
;

-- 汇总数据插入最终的表中
truncate table erp_database_newest.erp_audit_Purchasepens_month;

insert into erp_database_newest.erp_audit_Purchasepens_month
select   sku
         ,warehouse_id
		 ,ac_date
		 ,sum(Purchasepens_count) as Purchasepens_count
		 ,sum(Purchasepens_count_overseas) as Purchasepens_count_overseas 
from     erp_database_newest.erp_audit_Purchasepens_month_tmp as t 
group by sku,warehouse_id,ac_date
;

-- 存储每个月的采购数据,如果该月份没有采购数据,则补0
drop table if exists erp_database_newest.erp_audit_Purchasepens;
CREATE TABLE erp_database_newest.erp_audit_Purchasepens (
    `sku` VARCHAR(50) COMMENT 'sku',
    `warehouse_id` INT COMMENT '仓库ID',
    ac_date DATE COMMENT '采购日期,取每月最后一天',
    `Purchasepens_count` INT DEFAULT 0 COMMENT '采购笔数(境内仓的采购数据)',
    `Purchasepens_count_transfer` INT DEFAULT 0 COMMENT '深圳仓转出的数据',
    `Purchasepens_count_overseas` INT DEFAULT 0 COMMENT '海外仓到货的数据',
    sales_pens INT DEFAULT 0 COMMENT '销售数据',
    stock_number INT DEFAULT 0 COMMENT '库存数量20170630库存',
    stock_price DECIMAL(20 , 4 ) COMMENT '库存价格20170630'
);
create index erp_audit_Purchasepens on erp_database_newest.erp_audit_Purchasepens(sku);

-- 插入数据(其中以采购和销售的并集作为主表)
 SET @m=1;
 while @m<=30 do
 --  设置参数,使日期从2015年01开始跑到2017年6月份  -- 转出不区分仓库,所有转出全部为深圳仓
insert into erp_database_newest.erp_audit_Purchasepens
SELECT    T1.SKU,T1.warehouse_id,T1.AC_DATE
          ,ifnull(T1.Purchasepens_count,0) as Purchasepens_count
          ,ifnull(T3.Purchasepens_count_transfer,0) AS Purchasepens_count_transfer
		  ,ifnull(t1.Purchasepens_count_overseas,0) as Purchasepens_count_overseas
		  ,ifnull(t2.sales_pens,0) as sales_pens
		  ,case when t1.ac_date = '2017-06-30' then ifnull(t4.stock_number,0) else 0 end  as stock_number
		  ,case when t1.ac_date = '2017-06-30' then ifnull(t4.stock_price,0) else 0 end   as stock_price
FROM      (select   z1.sku,z1.warehouse_id,LAST_DAY(DATE_FORMAT('2017-07-31','%Y-%m-%d') - interval @m month) as ac_date
		            ,ifnull(z2.Purchasepens_count,0) as Purchasepens_count
		            ,ifnull(z2.Purchasepens_count_overseas,0) as Purchasepens_count_overseas
          from      (select   distinct sku,warehouse_id
				    from      (select distinct sku,warehouse_id from erp_database_newest.erp_audit_Purchasepens_month  -- 采购数据
                             union all
                              select distinct sku,warehouse_id from erp_database_newest.erp_audit_sales -- 销售数据
							 union all
							  select distinct sku,warehouse_id from erp_database_newest.erp_eudit_stock -- 库存数据
							 union all
							  select distinct sku ,1000 from erp_database_newest.erp_audit_Purchasepens_month 
							  where Purchasepens_count_overseas <> 0  -- 没有销售,没有采购,没有库存,但是有转出(转出全部算作深圳仓)
                              ) s1 -- 以有库存,有销售,有采购的数据为主表
					)as z1
          left join (select  sku,warehouse_id,Purchasepens_count,Purchasepens_count_overseas
					from erp_database_newest.erp_audit_Purchasepens_month 
					where  ac_date = LAST_DAY(DATE_FORMAT('2017-07-31','%Y-%m-%d') - interval @m month)
					) as z2
          on        z1.sku = z2.sku 
          and       z1.warehouse_id = z2.warehouse_id
          ) AS T1
left join erp_database_newest.erp_audit_sales as t2
on        t1.sku = t2.sku
and       t1.warehouse_id = t2.warehouse_id
and       t1.ac_date = t2.ac_date
left join (SELECT    products_sku AS sku,1000 as warehouse_id,last_day(orders_record_time) as ac_date
		             ,SUM(orders_record_count) AS Purchasepens_count_transfer  -- 所有境内仓的转出全部归入深圳仓
          FROM      erp_database_newest.erp_orders_record_Call_out
          WHERE     orders_record_type = 5 -- 深圳仓转出
          AND       orders_record_time >= '2015-01-01 00:00:00'
          AND       orders_record_time <= '2017-06-30 23:59:59'
          GROUP BY  products_sku,last_day(orders_record_time)
          ) as t3
on        t1.sku = t3.sku
and       t1.warehouse_id = t3.warehouse_id
and       t1.ac_date = t3.ac_date
left join erp_database_newest.erp_eudit_stock as t4
on        t1.sku = t4.sku
and       t1.warehouse_id = t4.warehouse_id
;

-- 循环加1
set @m=@m+1;
end WHILE;

-- 删除sku为空的数据
DELETE FROM erp_database_newest.erp_audit_Purchasepens 
WHERE
    sku IS NULL;

-- 删除多余的表
drop table erp_database_newest.erp_audit_Purchasepens_month;
drop table erp_database_newest.erp_audit_Purchasepens_month_tmp;

-- 删除采购,销售,库存都是0的sku{
-- 查询单行合计数量
drop table if EXISTS aa;
CREATE TEMPORARY table aa
select sku,warehouse_id
       ,SUM(Purchasepens_count + sales_pens+stock_number + Purchasepens_count_transfer + Purchasepens_count_overseas) as shl
from erp_database_newest.erp_audit_Purchasepens
GROUP BY sku,warehouse_id;

CREATE INDEX a01 on aa(sku,warehouse_id);
-- 删除 原表分组合计数据为0 的行
SET SQL_SAFE_UPDATES = 0;
DELETE a FROM aa b
        INNER JOIN
    erp_database_newest.erp_audit_Purchasepens a ON a.sku = b.sku
        AND a.warehouse_id = b.warehouse_id
        AND b.shl = 0;

-- 释放资源占用
DROP table aa;
-- }

-- 插入盘盈,撤单入库,报损,扫描缺货单的数据
drop table if EXISTS erp_database_newest.erp_audit_scrap_overage;
CREATE TABLE erp_database_newest.erp_audit_scrap_overage (
    sku VARCHAR(50),
    ac_date DATE COMMENT '日期',
    Warehouse_scrap INT DEFAULT 0 COMMENT '报损/扫描缺货单',
    Warehouse_overage INT DEFAULT 0 COMMENT '盘盈/撤单入库'
);
create index erp_audit_scrap_overage on erp_database_newest.erp_audit_scrap_overage(sku);

-- 插入数据
insert into erp_database_newest.erp_audit_scrap_overage
SELECT    products_sku AS sku,last_day(orders_record_time) AS ac_date,
          SUM(CASE WHEN orders_record_type IN (3 , 8) THEN orders_record_count ELSE 0 END) AS Warehouse_scrap,
          SUM(CASE WHEN orders_record_type IN (2 , 7,12) THEN orders_record_count ELSE 0 END) AS Warehouse_overage
FROM      erp_database_newest.erp_orders_record
WHERE     orders_record_type IN (3 , 2, 7, 8,12)
AND       orders_record_time >= '2015-01-01 00:00:00'
AND       orders_record_time <= '2017-06-30 23:59:59'
GROUP BY  products_sku,last_day(orders_record_time)
; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_audit_sales
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_audit_sales`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_audit_sales`(
)
    SQL SECURITY INVOKER
BEGIN
-- 取1.2销售数据
-- 取海外的sku,但不是境内的sku及仓库
drop table if exists erp_database_newest.erp_audit_sales_sku;
CREATE TABLE erp_database_newest.erp_audit_sales_sku (
    sku VARCHAR(50) COMMENT 'sku',
    sku_overseas VARCHAR(50) COMMENT '海外sku',
    warehouse_id INT DEFAULT 0 COMMENT '仓库ID'
);
create index erp_audit_sales on erp_database_newest.erp_audit_sales_sku(sku);
create index erp_audit_sales_01 on erp_database_newest.erp_audit_sales_sku(sku_overseas);
-- 插入数据
insert into erp_database_newest.erp_audit_sales_sku
select    distinct t1.productSKU,t1.specifiedSKU
          ,case when t1.warehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end as warehouse_id -- 9999:FBA  9998:海外仓
from      salamoer_database.sangelfine_warehouse_products as t1  
left join erp_database_newest.erp_products_data as t2
on        t1.specifiedSKU = t2.products_sku
where     t1.warehouseID <> 1000
and       t2.products_sku is null
;
-- 插入境内sku,避免重复
-- 取海外的sku,但是不是境内的sku及仓库
drop table if exists erp_database_newest.erp_audit_sales_sku_Territory;
CREATE TABLE erp_database_newest.erp_audit_sales_sku_Territory (
    products_sku VARCHAR(50) COMMENT 'sku');
create index erp_audit_sales_sku_Territory on erp_database_newest.erp_audit_sales_sku_Territory(products_sku);
-- 插入数据
insert into erp_database_newest.erp_audit_sales_sku_Territory
select distinct products_sku from   erp_database_newest.erp_products_data;

-- 统计销售数据(境内销售数据)
drop table if exists erp_database_newest.erp_audit_sales;
CREATE TABLE erp_database_newest.erp_audit_sales (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT DEFAULT 0 COMMENT '仓库ID',
    ac_date DATE COMMENT '时间日期,取每月最后一天',
    sales_pens INT COMMENT '销售数据'
);
create index erp_audit_sales on erp_database_newest.erp_audit_sales(sku,warehouse_id,ac_date);
create index erp_audit_sales_01 on erp_database_newest.erp_audit_sales(warehouse_id);
create index erp_audit_sales_02 on erp_database_newest.erp_audit_sales(ac_date);

-- 插入数据(其中以采购和销售的并集作为主表)
SET @m=1;
while @m<=30 do
SELECT @start_date:=DATE_SUB(DATE_FORMAt('2017-08-01','%Y-%m-%d'),INTERVAL (@m+1) month);
SELECT 
    @end_date:=DATE_SUB(DATE_FORMAT('2017-08-01', '%Y-%m-%d'),
        INTERVAL @m MONTH);

-- 插入数据 由于数据量太大,所以目前采用分月插入数据
-- 插入境内仓数据(其中只取打印时间不为空的数据)
insert into erp_database_newest.erp_audit_sales
select     t2.orders_sku as sku
           ,t1.orders_warehouse_id as warehouse_id 
           ,last_day(t1.orders_shipping_time ) as ac_date
           ,sum(item_count)as sales_pens
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id 
inner join erp_database_newest.erp_audit_sales_sku_Territory as t3  -- 同一个sku可能在不同的仓库里面
on         t2.orders_sku = t3.products_sku
where      t1.orders_shipping_time >= @start_date
and        t1.orders_shipping_time < @end_date
and        t1.orders_status = 5
and        t1.orders_is_join = 0 
group by   t2.orders_sku ,t1.orders_warehouse_id,last_day(t1.orders_shipping_time )
;
-- 插入境内仓数据(其中只取打印时间为空的数据)
insert into erp_database_newest.erp_audit_sales
select     t2.orders_sku as sku
           ,t1.orders_warehouse_id as warehouse_id 
           ,last_day(t1.orders_export_time) as ac_date 
           ,sum(item_count)as sales_pens
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id 
inner join erp_database_newest.erp_audit_sales_sku_Territory as t3
on         t2.orders_sku = t3.products_sku
where      t1.orders_export_time >= @start_date
and        t1.orders_export_time < @end_date
and        t1.orders_shipping_time  is null
and        t1.orders_status = 5
and        t1.orders_is_join = 0 
group by   t2.orders_sku ,t1.orders_warehouse_id,last_day(t1.orders_export_time) 
;


-- 海外数据(其中只取打印时间不为空的数据)
insert into erp_database_newest.erp_audit_sales
select     t3.sku as sku   -- 海外仓的sku转换成为境内仓的sku
           ,9998  as warehouse_id
           ,last_day(t1.orders_shipping_time ) as ac_date 
           ,sum(item_count)as sales_pens
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id 
inner join erp_database_newest.erp_audit_sales_sku  as t3
on         t2.orders_sku = t3.sku_overseas
where      t1.orders_shipping_time >= @start_date
and        t1.orders_shipping_time < @end_date
and        t1.orders_status = 5
and        t1.orders_is_join = 0 
and        t3.warehouse_id = 9998
group by   t3.sku,last_day(t1.orders_shipping_time )
;

-- 海外数据(其中只取打印时间为空的数据)
insert into erp_database_newest.erp_audit_sales
select     t3.sku as sku   -- 海外仓的sku转换成为境内仓的sku -- 9999:FBA,9998海外仓
           ,9998 as warehouse_id 
           ,last_day(t1.orders_export_time) as ac_date  
           ,sum(item_count)as sales_pens
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id 
inner join erp_database_newest.erp_audit_sales_sku  as t3
on         t2.orders_sku = t3.sku_overseas
where      t1.orders_export_time >= @start_date
and        t1.orders_export_time < @end_date
and        t1.orders_shipping_time is null
and        t1.orders_status = 5
and        t1.orders_is_join = 0 
and        t3.warehouse_id = 9998
group by   t3.sku,last_day(t1.orders_export_time)
;
-- 海外FBA数据(其中只取打印时间不为空的数据)
insert into erp_database_newest.erp_audit_sales
select     t3.sku as sku   -- FBA的sku转换成为境内仓的sku
           ,9999  as warehouse_id
           ,last_day(t1.orders_shipping_time ) as ac_date 
           ,sum(item_count)as sales_pens
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id 
inner join erp_database_newest.erp_audit_sales_sku  as t3
on         t2.orders_sku = t3.sku_overseas
where      t1.orders_shipping_time >= @start_date
and        t1.orders_shipping_time < @end_date
and        t1.orders_status = 8  -- 海外FBA的销售 
and        t1.orders_is_join = 0 
and        t3.warehouse_id = 9999
group by   t3.sku,last_day(t1.orders_shipping_time )
;

-- 海外FBA数据(其中只取打印时间为空的数据)
insert into erp_database_newest.erp_audit_sales
select     t3.sku as sku   -- FBA的sku转换成为境内仓的sku -- 9999:FBA,9998海外仓
           ,9999  as warehouse_id 
           ,last_day(t1.orders_export_time) as ac_date  
           ,sum(item_count)as sales_pens
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id 
inner join erp_database_newest.erp_audit_sales_sku  as t3
on         t2.orders_sku = t3.sku_overseas
where      t1.orders_export_time >= @start_date
and        t1.orders_export_time < @end_date
and        t1.orders_shipping_time  is null
and        t1.orders_status = 8 -- 海外FBA的销售 
and        t1.orders_is_join = 0 
and        t3.warehouse_id = 9999
group by   t3.sku,last_day(t1.orders_export_time)
;
-- 循环加1
set @m=@m+1;
end WHILE;

-- 修改仓库为0的默认为深圳仓
UPDATE erp_database_newest.erp_audit_sales 
SET 
    warehouse_id = 1000
WHERE
    warehouse_id = 0;

-- 拆分捆绑销售的数据
-- 统计销售数据(境内销售数据)
drop table if exists erp_database_newest.erp_audit_sales_tmp;
CREATE TABLE erp_database_newest.erp_audit_sales_tmp (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT DEFAULT 0 COMMENT '仓库ID',
    ac_date DATE COMMENT '时间日期,取每月最后一天',
    sales_pens INT COMMENT '销售数据'
);
create index erp_audit_sales_tmp on erp_database_newest.erp_audit_sales_tmp(sku,warehouse_id,ac_date);
create index erp_audit_sales_tmp_01 on erp_database_newest.erp_audit_sales_tmp(warehouse_id);
create index erp_audit_sales_tmp_02 on erp_database_newest.erp_audit_sales_tmp(ac_date);

-- 插入没有捆绑的数据
insert into erp_database_newest.erp_audit_sales_tmp
select   SKU
         ,warehouse_id
		 ,ac_date
		 ,sales_pens
from     erp_database_newest.erp_audit_sales as t 
where    sku not like '%+%'
;
-- 插入捆绑左边的数据  海外仓
insert into erp_database_newest.erp_audit_sales_tmp
select   substring_index(sku,'+',1)
         ,warehouse_id
		 ,ac_date
		 ,sales_pens
from     erp_database_newest.erp_audit_sales as t 
where    sku like '%+%'  and warehouse_id = 9998  
;
-- 插入捆绑右边的数据  海外仓
insert into erp_database_newest.erp_audit_sales_tmp
select   substring_index(sku,'+',-1)
         ,warehouse_id
		 ,ac_date
		 ,sales_pens
from     erp_database_newest.erp_audit_sales as t 
where    sku like '%+%'  and warehouse_id = 9998  
;
-- 插入捆绑左边的数据  FBA
insert into erp_database_newest.erp_audit_sales_tmp
select substring_index(substring_index(sku,'+',1),'FBA',-1)
       ,warehouse_id
       ,ac_date
       ,sales_pens
from   erp_database_newest.erp_audit_sales as t 
where  sku like '%+%'  and warehouse_id = 9999
;
-- 插入捆绑右边的数据  FBA
insert into erp_database_newest.erp_audit_sales_tmp
select CASE WHEN substring_index(substring_index(sku,'+',-1),'[',1) LIKE '%(%' 
                  THEN substring_index(substring_index(substring_index(sku,'+',-1),'[',1),'(',1)
		    ELSE substring_index(substring_index(sku,'+',-1),'[',1) END  as sku
       ,warehouse_id
       ,ac_date
       ,sales_pens
from   erp_database_newest.erp_audit_sales as t 
where  sku like '%+%'  and warehouse_id = 9999
;

-- 汇总数据插入到最终的表中
truncate table erp_database_newest.erp_audit_sales;

insert into erp_database_newest.erp_audit_sales
select sku
       ,warehouse_id
       ,ac_date
       ,sum(sales_pens) as sales_pens
from   erp_database_newest.erp_audit_sales_tmp
group by sku,warehouse_id,ac_date
;
-- 删除临时表
-- drop table erp_database_newest.erp_audit_sales_tmp;
-- drop table erp_database_newest.erp_audit_sales_sku;
-- drop table erp_database_newest.erp_audit_sales_sku_Territory;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_audit_sales_purchasepens
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_audit_sales_purchasepens`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_audit_sales_purchasepens`(
)
    SQL SECURITY INVOKER
BEGIN
-- 推算进销存的数据
-- 创建最终存储数据的表
drop table if exists erp_database_newest.erp_audit_sales_purchasepens;
CREATE TABLE erp_database_newest.erp_audit_sales_purchasepens (
    `sku` VARCHAR(50) COMMENT 'sku',
    `warehouse_id` INT DEFAULT 0 COMMENT '仓库ID',
    `ac_date` DATE COMMENT '日期',
    `Final_pen_count` INT DEFAULT 0 COMMENT '期末笔数',
    `Sales_pens` INT DEFAULT 0 COMMENT '销售笔数',
    `Warehouse_Call_out` INT DEFAULT 0 COMMENT '深圳仓库sku调出数据',
    `Warehouse_scrap` INT DEFAULT 0 COMMENT '本仓库sku报废数据',
    `Warehouse_overage` INT DEFAULT 0 COMMENT '本仓库sku盘盈数据',
    `Initial_pen_count` INT DEFAULT 0 COMMENT '期初笔数',
    `max_Purchasepens` INT DEFAULT 0 COMMENT '最大采购数',
    Warehouse_overage_Transferred INT DEFAULT 0 COMMENT '海外仓的调入数据',
    `stock_price` DECIMAL(20 , 4 ) COMMENT '库存价格',
    `difference` INT(11) DEFAULT 0 COMMENT '期末+出-期初-入的差值',
    KEY `erp_sales_Purchasepens` (`sku` , `warehouse_id` , `ac_date`) USING BTREE,
    KEY `warehouse_id` (`warehouse_id`) USING BTREE,
    KEY `ac_date` (`ac_date`) USING BTREE
);

-- 存储进销存的数据
drop table if exists erp_database_newest.erp_audit_sales_purchasepens_tmp;
CREATE TABLE erp_database_newest.erp_audit_sales_purchasepens_tmp (
    `sku` VARCHAR(50) COMMENT 'sku',
    `warehouse_id` INT DEFAULT 0 COMMENT '仓库ID',
    `ac_date` DATE COMMENT '日期',
    `Final_pen_count` INT DEFAULT 0 COMMENT '期末笔数',
    `Sales_pens` INT DEFAULT 0 COMMENT '销售笔数',
    `Warehouse_Call_out` INT DEFAULT 0 COMMENT '深圳仓库sku调出数据',
    `Warehouse_scrap` INT DEFAULT 0 COMMENT '本仓库sku报废数据',
    `Warehouse_overage` INT DEFAULT 0 COMMENT '本仓库sku盘盈数据',
    `Initial_pen_count` INT DEFAULT 0 COMMENT '期初笔数',
    `max_Purchasepens` INT DEFAULT 0 COMMENT '最大采购数',
    Warehouse_overage_Transferred INT DEFAULT 0 COMMENT '海外仓的调入数据',
    `stock_price` DECIMAL(20 , 4 ) COMMENT '库存价格',
    `difference` INT(11) DEFAULT 0 COMMENT '期末+出-期初-入的差值',
    KEY `erp_sales_Purchasepens_tmp` (`sku` , `warehouse_id` , `ac_date`) USING BTREE,
    KEY `warehouse_id_tmp` (`warehouse_id`) USING BTREE,
    KEY `ac_date_tmp` (`ac_date`) USING BTREE
);
-- 1.推算东莞仓的数据,东莞仓只有201706一个月的数据,其中,东莞仓的期初全部用盘盈或者撤单入库补充
insert into erp_database_newest.erp_audit_sales_purchasepens_tmp
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,t1.stock_number as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,ifnull(t2.Warehouse_Call_out,0) as Warehouse_Call_out  -- 东莞仓调出的数据
		 ,0 as Warehouse_scrap     -- 本仓库sku报废数据 
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据
         ,0 AS Initial_pen_count -- 期初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,ifnull(t1.Purchasepens_count,0)  as max_Purchasepens -- 最大的采购数量
		 ,0 as  Warehouse_overage_Transferred -- 海外仓调入数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_database_newest.erp_audit_Purchasepens as t1
left join(SELECT    products_sku AS sku,last_day(orders_record_time) AS ac_date,
                   SUM(orders_record_count) AS Warehouse_Call_out
         FROM      erp_database_newest.erp_orders_record
         WHERE     orders_record_reason = '东莞调深圳仓'
         AND       orders_record_time >= '2017-06-01 00:00:00'
         AND       orders_record_time <= '2017-06-30 23:59:59'
         GROUP BY  products_sku,last_day(orders_record_time)
		 ) as t2
on       t1.sku = t2.sku
and      t1.ac_date = t2.ac_date
where    t1.warehouse_id = 1035
and      t1.ac_date = '2017-06-30'
;

-- 期末 + 销售 >= 采购 ,其中期初=0,盘盈/扫描缺货单=期末+销售-采购(其中如果期末+销量-采购>总盘盈/扫描缺货单,则需要补盘盈,总盘盈全部给东莞仓,其中需要补充的盘盈为
-- 期末+销量-采购-总盘盈/扫描缺货单,如果期末+销量-采购<=总盘盈/扫描缺货单,不需要补充盘盈,其中分给东莞仓的盘盈=期末+销量-采购
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_database_newest.erp_audit_scrap_overage AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date 
SET 
    t1.Warehouse_overage = CASE
        WHEN Final_pen_count + sales_pens - max_Purchasepens > t2.Warehouse_overage THEN t2.Warehouse_overage
        ELSE Final_pen_count + sales_pens - max_Purchasepens
    END
WHERE
    Final_pen_count + sales_pens >= max_Purchasepens
;

-- 期末 + 销售 < 采购,其中期初=0,报损/扫描缺货单=期末+销售-采购(其中如果采购-销售-期末>总报损/扫描缺货单,则需要补充盘亏,总报损/扫描缺货单给东莞仓
-- ,其中需要补充的盘亏为采购-销售-期末-总报损/扫描缺货单,如果采购-销售-期末<=总报损/扫描缺货单,不需要补盘亏,其中分给东莞仓的报损/扫描缺货单=采购-销售-期末
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_database_newest.erp_audit_scrap_overage AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date 
SET 
    t1.Warehouse_scrap = CASE
        WHEN max_Purchasepens - Final_pen_count - sales_pens > t2.Warehouse_scrap THEN t2.Warehouse_scrap
        ELSE max_Purchasepens - Final_pen_count - sales_pens
    END
WHERE
    Final_pen_count + sales_pens < max_Purchasepens
;

-- 把处理好的东莞仓数据存入到固定的表中,并删除tmp表中东莞仓的数据
insert into erp_database_newest.erp_audit_sales_purchasepens
select  * from erp_database_newest.erp_audit_sales_purchasepens_tmp
;

-- 删除临时表的数据,存储下一个仓库的数据
 truncate table erp_database_newest.erp_audit_sales_purchasepens_tmp;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap - Initial_pen_count - max_Purchasepens - Warehouse_overage_Transferred - Warehouse_overage
;


-- 3.推算深圳仓的数据,其中报损和扫描缺货单全部归入到深圳仓,不够的部分再用盘盈,测单入库补充
insert into erp_database_newest.erp_audit_sales_purchasepens_tmp
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,t1.stock_number as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,t1.Purchasepens_count_transfer as Warehouse_Call_out  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,0 as Warehouse_scrap -- 本仓库sku报废数据 
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据
         ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,t1.Purchasepens_count as max_Purchasepens -- 最大的采购数量(海外仓没有采购)
		 ,0 as Warehouse_overage_Transferred -- 海外仓的调入数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_database_newest.erp_audit_Purchasepens as t1
where    t1.warehouse_id = 1000
; 
-- 如果期末+销售+调出>=采购+盘盈,则盘盈全部给深圳仓, 则期初=期末+销售+调出-采购-盘盈
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Warehouse_Call_out - max_Purchasepens - t2.Warehouse_overage,
    t1.Warehouse_overage = t2.Warehouse_overage
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out >= max_Purchasepens + t2.Warehouse_overage
;

-- 如果期末+销售+调出<采购+盘盈且期末+销售+调出>=采购,则期初为0,此时补充部分盘盈给深圳仓
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    INNER JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_overage = Final_pen_count + Sales_pens + Warehouse_Call_out - max_Purchasepens
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out < max_Purchasepens + t2.Warehouse_overage
        AND Final_pen_count + Sales_pens + Warehouse_Call_out >= max_Purchasepens
;

-- 如果期末+销售+调出<采购且期末+销售+调出>=采购-报损,则用报损补充,此时期初=0,需要补充的报损=采购-期末-采购-转出
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_scrap = max_Purchasepens - (Final_pen_count + Sales_pens + Warehouse_Call_out)
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out < max_Purchasepens
        AND Final_pen_count + Sales_pens + Warehouse_Call_out >= max_Purchasepens - t2.Warehouse_scrap
;

-- 如果期末+销售+调出+报损<采购,则报损全部给深圳仓,此时期初=0
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_scrap = t2.Warehouse_scrap
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + t2.Warehouse_scrap < max_Purchasepens
;
-- 如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈 计算20170630这一天的期初
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap - max_Purchasepens - Warehouse_overage
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap >= max_Purchasepens + Warehouse_overage
        AND ac_date = '2017-06-30'
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0 计算20170630这一天的期初
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + t1.Warehouse_scrap < max_Purchasepens + Warehouse_overage
        AND ac_date = '2017-06-30'
;
-- 把海外仓的本月的期末转换成为上月的期初
 SET @m=2;
 while @m<=30 do
 SELECT @loop_date:=DATE_SUB(DATE_FORMAt('2017-07-31','%Y-%m-%d'),INTERVAL @m month);
-- 修改本月期末为上月的期初
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_database_newest.erp_audit_sales_purchasepens_tmp AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.ac_date = LAST_DAY(DATE_SUB(t2.ac_date, INTERVAL 1 MONTH)) 
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.ac_date = @loop_date
;
-- 如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap - max_Purchasepens - Warehouse_overage
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap >= max_Purchasepens + Warehouse_overage
        AND ac_date = @loop_date
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + t1.Warehouse_scrap < max_Purchasepens + Warehouse_overage
        AND t1.ac_date = @loop_date
;
-- 循环加1
set @m=@m+1;
end WHILE;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap - Initial_pen_count - max_Purchasepens - Warehouse_overage_Transferred - Warehouse_overage
;

-- 对比剩余的报损/扫描缺货单和盘亏,再次分配
drop table if exists erp_database_newest.erp_audit_sales_purchasepens_Surplus;
CREATE TABLE erp_database_newest.erp_audit_sales_purchasepens_Surplus (
    `sku` VARCHAR(50) COMMENT 'sku',
    difference INT COMMENT '差额',
    Warehouse_scrap_Surplus INT COMMENT '剩余报损/扫描缺货单',
    Warehouse_overage_Surplus INT COMMENT '剩余盘盈/测单入库'
);
create index erp_audit_sales_purchasepens_Surplus on erp_database_newest.erp_audit_sales_purchasepens_Surplus(sku);

insert into erp_database_newest.erp_audit_sales_purchasepens_Surplus
select    t1.sku
          ,t1.difference
		  ,ifnull(t2.Warehouse_scrap,0)
		  ,ifnull(t2.Warehouse_overage,0)
from      (select sku,max(abs(difference)) as difference
		  from erp_database_newest.erp_audit_sales_purchasepens_tmp where warehouse_id = 1000 
		  group by sku
		  ) as t1
left join (select  m1.sku,(ifnull(m1.Warehouse_scrap,0) - ifnull(m2.Warehouse_scrap,0) - ifnull(m3.Warehouse_scrap,0)) as Warehouse_scrap
                   ,(ifnull(m1.Warehouse_overage,0) -ifnull(m2.Warehouse_overage,0) - ifnull(m3.Warehouse_overage,0)) as Warehouse_overage
          from     (select sku,sum(Warehouse_scrap) as Warehouse_scrap,sum(Warehouse_overage) as Warehouse_overage
                   from erp_database_newest.erp_audit_scrap_overage group by sku) as m1
	      left join(select sku,sum(Warehouse_scrap) as Warehouse_scrap,sum(Warehouse_overage) as Warehouse_overage
                   from erp_database_newest.erp_audit_sales_purchasepens group by sku) as m2  -- 东莞仓数据
          on       m1.sku = m2.sku
		  left join(select sku,sum(Warehouse_scrap) as Warehouse_scrap,sum(Warehouse_overage) as Warehouse_overage
                   from erp_database_newest.erp_audit_sales_purchasepens_tmp group by sku) as m3 -- 深圳仓数据
          on       m1.sku = m3.sku
		  group by m1.sku
		  ) as t2
on        t1.sku = t2.sku
;
-- 如果有差额,且报损>差额(绝对值)+盘盈,则报损全部给深圳仓,盘盈全部给深圳仓
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            (IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0)) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date
        INNER JOIN
    erp_database_newest.erp_audit_sales_purchasepens_Surplus AS t3 ON t1.sku = t3.sku 
SET 
    t1.Warehouse_scrap = t2.Warehouse_scrap
WHERE
    t3.difference > 0
        AND t3.Warehouse_scrap_Surplus - t3.difference >= 0
;

-- 如果差额为0,且有盘盈或者盘亏,且盘盈=盘亏,则盘盈全部给深圳仓,盘亏全部给深圳仓
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            (IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0)) AS Warehouse_overage,
            (IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0)) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_overage) AS Warehouse_overage,
            SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date
        INNER JOIN
    erp_database_newest.erp_audit_sales_purchasepens_Surplus AS t3 ON t1.sku = t3.sku 
SET 
    t1.Warehouse_overage = t2.Warehouse_overage,
    t1.Warehouse_scrap = t2.Warehouse_scrap
WHERE
    t3.Warehouse_scrap_Surplus + t3.Warehouse_overage_Surplus <> 0
        AND t3.Warehouse_scrap_Surplus - t3.Warehouse_overage_Surplus = 0
        AND t3.difference = 0
;
-- (报损/扫描缺货单)已经分配完成,尽可能的分配盘盈/测单入库
-- 如果期末+销售+调出+报损>=采购+剩余盘盈 则剩余盘盈全部给深圳仓,且期初=期末+销售+调出+报损-采购+剩余盘盈
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
INNER JOIN (SELECT m1.sku,m1.ac_date,(IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0)) AS Warehouse_overage
           FROM  erp_database_newest.erp_audit_scrap_overage AS m1
           LEFT JOIN (SELECT sku,ac_date,SUM(Warehouse_overage) AS Warehouse_overage
                     FROM erp_database_newest.erp_audit_sales_purchasepens
                     GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap - max_Purchasepens - t2.Warehouse_overage,
	t1.Warehouse_overage = t2.Warehouse_overage
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap >= max_Purchasepens + t2.Warehouse_overage
;

-- 如果期末+销售+调出+报损<采购+剩余盘盈且期末+销售+调出+报损大于等于采购 则盘盈=期末+销售+调出+报损-采购,且期初=0
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
INNER JOIN (SELECT m1.sku,m1.ac_date,(IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0)) AS Warehouse_overage
           FROM  erp_database_newest.erp_audit_scrap_overage AS m1
           LEFT JOIN (SELECT sku,ac_date,SUM(Warehouse_overage) AS Warehouse_overage
                     FROM erp_database_newest.erp_audit_sales_purchasepens
                     GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date
SET 
    Initial_pen_count = 0,
	t1.Warehouse_overage = Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap - max_Purchasepens
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap >= max_Purchasepens
and Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap < max_Purchasepens + t2.Warehouse_overage
;

-- 如果期末+销售+调出+报损<采购,则盘盈不分给深圳仓,期初等于0
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap < max_Purchasepens
;
-- 把海外仓的本月的期末转换成为上月的期初(2017-06-30不参与循环)
SET @c=2;
while @c<=30 do
SELECT @loop_date_dc:=DATE_SUB(DATE_FORMAt('2017-07-31','%Y-%m-%d'),INTERVAL @c month);
-- 修改本月期末为上月的期初
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_database_newest.erp_audit_sales_purchasepens_tmp AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.ac_date = LAST_DAY(DATE_SUB(t2.ac_date, INTERVAL 1 MONTH)) 
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.ac_date = @loop_date_dc
;
-- 如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap - max_Purchasepens - Warehouse_overage
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap >= max_Purchasepens + Warehouse_overage
        AND ac_date = @loop_date_dc
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Warehouse_Call_out + t1.Warehouse_scrap < max_Purchasepens + Warehouse_overage
        AND t1.ac_date = @loop_date_dc
;
-- 循环加1
set @c=@c+1;
end WHILE;

-- 把处理好的深圳仓数据存入到固定的表中,并删除tmp表中深圳仓的数据
insert into erp_database_newest.erp_audit_sales_purchasepens
select  * from erp_database_newest.erp_audit_sales_purchasepens_tmp
;

-- 删除临时表的数据,存储下一个仓库的数据
-- truncate table erp_database_newest.erp_audit_sales_purchasepens_tmp;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Warehouse_Call_out + Warehouse_scrap - Initial_pen_count - max_Purchasepens - Warehouse_overage_Transferred - Warehouse_overage
;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_audit_sales_purchasepens_Amount
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_audit_sales_purchasepens_Amount`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_audit_sales_purchasepens_Amount`(
)
    SQL SECURITY INVOKER
BEGIN
-- 计算进销存的金额和数量
drop table if exists erp_database_newest.erp_audit_sales_purchasepens_Amount;
CREATE TABLE erp_database_newest.erp_audit_sales_purchasepens_Amount (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT DEFAULT 0 COMMENT '仓库ID',
    ac_date DATE COMMENT '日期',
    Final_pen_count INT DEFAULT 0 COMMENT '期末数量',
    final_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '期末价格',
    final_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '期末金额',
    Sales_pens INT DEFAULT 0 COMMENT '销售数量',
    sales_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '销售价格',
    sales_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '销售金额',
    transfer INT DEFAULT 0 COMMENT '深圳仓库sku调出数量',
    transfer_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '深圳仓库sku调出价格',
    transfer_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '深圳仓库sku调出金额',
    Warehouse_scrap INT DEFAULT 0 COMMENT '本仓库sku报废数量',
    Warehouse_scrap_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '本仓库sku报废数据价格',
    Warehouse_scrap_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '本仓库sku报废数据金额',
    Warehouse_overage INT DEFAULT 0 COMMENT '本仓库sku盘盈数量',
    Warehouse_overage_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '本仓库sku盘盈数据价格',
    Warehouse_overage_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '本仓库sku盘盈数据金额',
    Initial_pen_count INT DEFAULT 0 COMMENT '期初数量',
    Initial_pen_count_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '期初价格',
    Initial_pen_count_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '期初金额',
    Purchasepens INT DEFAULT 0 COMMENT '采购数量',
    Purchasepens_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '采购价格',
    Purchasepens_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '采购金额',
    overseas INT DEFAULT 0 COMMENT '海外仓的调入数量',
    overseas_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '海外仓的调入的价格',
    overseas_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '海外仓的调入金额',
    stock_price DECIMAL(20 , 4 ) COMMENT '库存价格',
    Purchasepens_price DECIMAL(20 , 4 ) COMMENT '采购价',
    KEY erp_audit_sales_purchasepens_Amount (sku , warehouse_id , ac_date) USING BTREE,
    KEY warehouse_id_Amount (warehouse_id) USING BTREE,
    KEY ac_date_Amount (ac_date) USING BTREE
);

-- 插入数据  插入第一个月数据,深圳仓和义乌仓的数据
insert into erp_database_newest.erp_audit_sales_purchasepens_Amount
select    t1.sku                -- sku
          ,t1.warehouse_id      -- 仓库ID
          ,t1.ac_date           -- 日期
          ,t1.Final_pen_count   -- 期末数量
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then coalesce(t3.stock_price,t4.products_value,0) 
		        else round(((t1.Warehouse_overage + t1.Initial_pen_count ) * coalesce(t3.stock_price,t4.products_value,0) 
                       + ifnull(t2.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
          end                                            as final_stock_price    -- 期末价格
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then 0  
		        else round(t1.Final_pen_count * round(((t1.Warehouse_overage + t1.Initial_pen_count ) 
                       * coalesce(t3.stock_price,t4.products_value,0) + ifnull(t2.cg_je,0)) / 
                       (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4),4)
          end                                            as final_money   -- 期末金额
          ,t1.Sales_pens                                 as Sales_pens    -- 销售数量
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then coalesce(t3.stock_price,t4.products_value,0)  
		        else round(((t1.Warehouse_overage + t1.Initial_pen_count ) * coalesce(t3.stock_price,t4.products_value,0) 
                     + ifnull(t2.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
          end                                            as sales_stock_price  -- 销售价格
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then 0
		        else round(t1.Sales_pens * round(((t1.Warehouse_overage + t1.Initial_pen_count ) 
                       * coalesce(t3.stock_price,t4.products_value,0) + ifnull(t2.cg_je,0)) / 
                       (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4),4)
          end                                            as sales_money   -- 销售金额
          ,t1.Purchasepens_count_transfer                as transfer  -- 深圳仓库sku调出数量
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then coalesce(t3.stock_price,t4.products_value,0)  
		        else round(((t1.Warehouse_overage + t1.Initial_pen_count ) * coalesce(t3.stock_price,t4.products_value,0) 
                     + ifnull(t2.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
          end                                            as transfer_stock_price   -- 深圳仓库sku调出价格
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then 0
		        else round(t1.Purchasepens_count_transfer * round(((t1.Warehouse_overage + t1.Initial_pen_count ) 
                       * coalesce(t3.stock_price,t4.products_value,0) + ifnull(t2.cg_je,0)) / 
                       (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4),4)
          end                                            as transfer_money -- 深圳仓库sku调出金额
          ,t1.Warehouse_scrap                            as Warehouse_scrap -- 报废数据数量
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then coalesce(t3.stock_price,t4.products_value,0) 
		        else round(((t1.Warehouse_overage + t1.Initial_pen_count ) * coalesce(t3.stock_price,t4.products_value,0) 
                     + ifnull(t2.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
          end                                            as Warehouse_scrap_stock_price -- 报废数据价格
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then 0
		        else round(t1.Warehouse_scrap * round(((t1.Warehouse_overage + t1.Initial_pen_count ) 
                       * coalesce(t3.stock_price,t4.products_value,0) + ifnull(t2.cg_je,0)) / 
                       (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4),4)
          end                                            as Warehouse_scrap_money -- 废数据金额
          ,t1.Warehouse_overage                          as Warehouse_overage -- 本仓库sku盘盈数量
          ,coalesce(t3.stock_price,t4.products_value,0)  as Warehouse_overage_stock_price -- 盘盈都是用期初库存价,第一个和期初的价格一样
          ,t1.Warehouse_overage * coalesce(t3.stock_price,t4.products_value,0) as Warehouse_overage_money -- 本仓库sku盘盈数据金额
          ,t1.Initial_pen_count                       as Initial_count -- 期初数量 期初价取最小月份采购价,如没有,则取初始价格,如初始价格没有,则为0
          ,coalesce(t3.stock_price,t4.products_value,0)  as Initial_count_stock_price -- 期初价格
          ,t1.Initial_pen_count * coalesce(t3.stock_price,t4.products_value,0) as Initial_count_money -- 期初金额
          ,t1.max_Purchasepens                           as Purchasepens -- 采购数量
          ,case when ifnull(t2.cg_sl,0) = 0 then 0 else round(t2.cg_je / t2.cg_sl,4) end as Purchasepens_stock_price -- 采购价格
          ,ifnull(t2.cg_je,0)                            as Purchasepens_money   -- 采购金额
          ,0                                             as overseas -- 海外仓的调入数量,目前处理境内仓,没有海外仓转入数据
          ,0                                             as overseas_stock_price -- 海外仓的调入的价格
          ,0                                             as overseas_money   -- 海外仓的调入金额
          ,case when (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens) = 0 then coalesce(t3.stock_price,t4.products_value,0) 
		        else round(((t1.Warehouse_overage + t1.Initial_pen_count ) * coalesce(t3.stock_price,t4.products_value,0) 
                     + ifnull(t2.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
          end                                                                  as stock_price -- 库存价格
          ,case when ifnull(t2.cg_sl,0) = 0 then 0 else round(t2.cg_je / t2.cg_sl,4) end as Purchasepens_price   -- 采购价格
from      erp_database_newest.erp_audit_sales_purchasepens as t1
left join (select   last_day(orders_record_time) as ac_date ,procurement_warehouse_id as warehouse_id,products_sku as sku
		            ,sum(orders_record_count) as cg_sl,sum(rk_je) as cg_je  
		  from      erp_database_newest.erp_purchase_amount_details 
		  group by  last_day(orders_record_time),procurement_warehouse_id ,products_sku
          ) as t2
on        t1.ac_date = t2.ac_date
and       t1.sku = t2.sku
and       t1.warehouse_id = t2.warehouse_id
left join (select   min(last_day(orders_record_time)) as ac_date ,procurement_warehouse_id as warehouse_id,products_sku as sku
		            ,round(sum(rk_je)/sum(orders_record_count),4) as stock_price
		  from      erp_database_newest.erp_purchase_amount_details 
		  group by  procurement_warehouse_id ,products_sku) as t3
on        t1.sku = t3.sku 
and       t1.warehouse_id = t3.warehouse_id
left join erp_database_newest.erp_products_data t4
on        t1.sku = t4.products_sku
and       t1.warehouse_id = t4.product_warehouse_id
where     t1.warehouse_id in (1000,1025) 
and       t1.ac_date = '2015-01-31'
;

-- 循环插入2015-02到2017-06的数据
 SET @m=1;
 while @m<=29 do
 SELECT @loop_date:=last_day(DATE_add(DATE_FORMAt('2015-01-31','%Y-%m-%d'),INTERVAL @m month)) ;
insert into erp_database_newest.erp_audit_sales_purchasepens_Amount
select   t1.sku                -- sku
         ,t1.warehouse_id      -- 仓库ID
         ,t1.ac_date           -- 日期
         ,t1.Final_pen_count   -- 期末数量
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then t2.stock_price
               else round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price + ifnull(t3.cg_je,0)) /
                      (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
         end                                             as final_stock_price    -- 期末价格
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then 0
               else round(t1.Final_pen_count * round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price 
                      + ifnull(t3.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4),4)
         end                                             as final_money   -- 期末金额
         ,t1.Sales_pens                                  as Sales_pens -- 销售数量
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then t2.stock_price
               else round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price + ifnull(t3.cg_je,0)) /
                      (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
         end                                             as sales_stock_price  -- 销售价格
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then 0
               else round(t1.Sales_pens * round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price 
                      + ifnull(t3.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4),4)
         end                                             as sales_money   -- 销售金额
         ,t1.Purchasepens_count_transfer                 as transfer  -- 深圳仓库sku调出数量
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then t2.stock_price
               else round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price + ifnull(t3.cg_je,0)) /
                      (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
         end                                             as transfer_stock_price   -- 深圳仓库sku调出价格
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then 0
               else round(t1.Purchasepens_count_transfer * round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price 
                      + ifnull(t3.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4),4) 
         end                                             as transfer_money -- 深圳仓库sku调出金额
         ,t1.Warehouse_scrap                             as Warehouse_scrap  -- sku报废数量
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then t2.stock_price
               else round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price + ifnull(t3.cg_je,0)) /
                      (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
         end                                             as Warehouse_scrap_stock_price -- sku报废价格
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then 0
		       else round(t1.Warehouse_scrap * round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price 
                      + ifnull(t3.cg_je,0)) / (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4),4)
         end                                             as Warehouse_scrap_money -- 本仓库sku报废数据金额
         ,t1.Warehouse_overage                           as Warehouse_overage -- 本仓库sku盘盈数量
         ,t2.stock_price                                 as Warehouse_overage_stock_price -- 盘盈都是用期初库存价,第一个和期初的价格一样
         ,round(t1.Warehouse_overage * t2.stock_price,4) as Warehouse_overage_money -- 本仓库sku盘盈数据金额
         ,t1.Initial_pen_count                           as Initial_count -- 期初数量 第二个月为第一个月的期末库存价
         ,t2.stock_price                                 as Initial_count_stock_price -- 期初价格
         ,round(t1.Initial_pen_count * t2.stock_price,4) as Initial_count_money -- 期初金额
         ,t1.max_Purchasepens                            as Purchasepens -- 采购数量
         ,case when ifnull(t3.cg_sl,0) = 0 then 0 else round(t3.cg_je / t3.cg_sl,4) end  as Purchasepens_stock_price -- 采购价格
         ,ifnull(t3.cg_je,0)                             as Purchasepens_money   -- 采购金额
         ,0                                              as overseas -- 海外仓的调入数量,目前处理境内仓,没有海外仓转入数据
         ,0                                              as overseas_stock_price -- 海外仓的调入的价格
         ,0                                              as overseas_money   -- 海外仓的调入金额
         ,case when t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens = 0 then t2.stock_price
		       else round(((t1.Warehouse_overage + t1.Initial_pen_count) * t2.stock_price + ifnull(t3.cg_je,0)) /
			          (t1.Warehouse_overage + t1.Initial_pen_count + t1.max_Purchasepens),4) 
         end                                             as stock_price -- 库存价格
         ,case when ifnull(t3.cg_sl,0) = 0 then 0 else round(t3.cg_je / t3.cg_sl,4) end as Purchasepens_price   -- 采购价格
from     erp_database_newest.erp_audit_sales_purchasepens as t1
inner join erp_database_newest.erp_audit_sales_purchasepens_Amount as t2
on       t1.sku = t2.sku
and      t1.warehouse_id = t2.warehouse_id
and      t1.ac_date = LAST_DAY(DATE_add(t2.ac_date, INTERVAL 1 MONTH)) 
left join (select   last_day(orders_record_time) as ac_date ,procurement_warehouse_id as warehouse_id,products_sku as sku
		            ,sum(orders_record_count) as cg_sl,sum(rk_je) as cg_je  
		  from      erp_database_newest.erp_purchase_amount_details 
		  group by  last_day(orders_record_time),procurement_warehouse_id ,products_sku
          ) as t3
on        t1.ac_date = t3.ac_date
and       t1.sku = t3.sku
and       t1.warehouse_id = t3.warehouse_id
where     t1.warehouse_id in (1000,1025) 
and       t1.ac_date = @loop_date
;
-- 循环加1
set @m=@m+1;
end WHILE;

-- 核对转入转出的金额
drop table if exists erp_database_newest.erp_audit_transfer_overseas_Amount;
CREATE TABLE erp_database_newest.erp_audit_transfer_overseas_Amount (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT DEFAULT 0 COMMENT '仓库ID',
    ac_date DATE COMMENT '日期',
    overseas INT DEFAULT 0 COMMENT '海外仓的调入数量',
    overseas_stock_price DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '海外仓的调入的价格',
    overseas_money DECIMAL(20 , 4 ) DEFAULT 0 COMMENT '海外仓的调入金额',
    KEY erp_audit_transfer_overseas_Amount (sku , warehouse_id , ac_date) USING BTREE,
    KEY warehouse_id_transfer_overseas_Amount (warehouse_id) USING BTREE,
    KEY ac_date_transfer_overseas_Amount (ac_date) USING BTREE
);
insert into erp_database_newest.erp_audit_transfer_overseas_Amount
select    t1.sku
          ,t1.warehouse_id
          ,t1.ac_date
          ,t1.Purchasepens_count_overseas as overseas
          ,case when t1.Purchasepens_count_overseas = 0 then 0
		        when t1.Purchasepens_count_overseas <= t2.transfer then t2.transfer_stock_price 
		 		when t1.Purchasepens_count_overseas > t2.transfer then t3.transfer_stock_price
                else 0 end  as overseas_stock_price
          ,round(round(case when t1.Purchasepens_count_overseas = 0 then 0
                            when t1.Purchasepens_count_overseas <= t2.transfer then t2.transfer_stock_price 
		 		            when t1.Purchasepens_count_overseas > t2.transfer then t3.transfer_stock_price
                else 0 end,4) * t1.Purchasepens_count_overseas,4)   as overseas_money
from      erp_database_newest.erp_audit_sales_purchasepens as t1
inner join erp_database_newest.erp_audit_sales_purchasepens_Amount as t2
on        t1.sku = t2.sku
and       t1.ac_date = t2.ac_date
and       t2.warehouse_id = 1000
left join erp_database_newest.erp_audit_sales_purchasepens_Amount as t3
on        t1.sku = t3.sku
and       t1.ac_date = LAST_DAY(DATE_SUB(t3.ac_date, INTERVAL 1 MONTH)) 
and       t3.warehouse_id = 1000
where     t1.warehouse_id in (9999,9998) 
;

-- 插入数据  插入第一个月数据,海外仓和FBA
insert into erp_database_newest.erp_audit_sales_purchasepens_Amount
select    t1.sku                -- sku
          ,t1.warehouse_id      -- 仓库ID
          ,t1.ac_date           -- 日期
          ,t2.Final_pen_count   -- 期末数量
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then coalesce(t3.overseas_stock_prices,t4.stock_price,0)
                else round(((t2.Warehouse_overage + t2.Initial_pen_count) * coalesce(t3.overseas_stock_prices,t4.stock_price,0) + t1.overseas_money) /
                 (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4)
          end                                  as final_stock_price    -- 期末价格
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then 0
                else round(t2.Final_pen_count * round(((t2.Warehouse_overage + t2.Initial_pen_count) 
                       * coalesce(t3.overseas_stock_prices,t4.stock_price,0) + t1.overseas_money) /
                       (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4),4)
          end                                  as final_money   -- 期末金额
          ,t2.Sales_pens                       as Sales_pens    -- 销售数量
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then coalesce(t3.overseas_stock_prices,t4.stock_price,0)
                else round(((t2.Warehouse_overage + t2.Initial_pen_count) * coalesce(t3.overseas_stock_prices,t4.stock_price,0) + t1.overseas_money) /
                 (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4)
          end                                  as sales_stock_price  -- 销售价格
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then 0
                else round(t2.Sales_pens * round(((t2.Warehouse_overage + t2.Initial_pen_count) * coalesce(t3.overseas_stock_prices,t4.stock_price,0)
                       + t1.overseas_money) / (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4),4)
          end                                  as sales_money   -- 销售金额
          ,t2.Purchasepens_count_transfer      as transfer  -- 深圳仓库sku调出数量
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then coalesce(t3.overseas_stock_prices,t4.stock_price,0)
                else round(((t2.Warehouse_overage + t2.Initial_pen_count) * coalesce(t3.overseas_stock_prices,t4.stock_price,0) + t1.overseas_money) /
                 (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4)
          end                                  as transfer_stock_price   -- 深圳仓库sku调出价格
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then 0
                else round(t2.Purchasepens_count_transfer * round(((t2.Warehouse_overage + t2.Initial_pen_count) 
                       * coalesce(t3.overseas_stock_prices,t4.stock_price,0) + t1.overseas_money) /
                       (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4),4)
          end                                  as transfer_money -- 深圳仓库sku调出金额
          ,t2.Warehouse_scrap                  as Warehouse_scrap -- 报废数据数量
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then coalesce(t3.overseas_stock_prices,t4.stock_price,0)
                else round(((t2.Warehouse_overage + t2.Initial_pen_count) * coalesce(t3.overseas_stock_prices,t4.stock_price,0) + t1.overseas_money) /
                 (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4)
          end                                  as Warehouse_scrap_stock_price -- 报废数据价格
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then 0
                else round(t2.Warehouse_scrap * round(((t2.Warehouse_overage + t2.Initial_pen_count) 
                       * coalesce(t3.overseas_stock_prices,t4.stock_price,0) + t1.overseas_money) /
                       (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4),4)
          end                                  as Warehouse_scrap_money -- 废数据金额
          ,t2.Warehouse_overage                as Warehouse_overage -- 本仓库sku盘盈数量
          ,coalesce(t3.overseas_stock_prices,t4.stock_price,0)  as Warehouse_overage_stock_price -- 盘盈都是用期初库存价,第一个和期初的价格一样
          ,round(t2.Warehouse_overage * coalesce(t3.overseas_stock_prices,t4.stock_price,0),4) as Warehouse_overage_money -- 本仓库sku盘盈数据金额
          ,t2.Initial_pen_count                as Initial_count -- 期初数量 期初价取最小月份采购价,如没有,则取初始价格,如初始价格没有,则为0 
          ,coalesce(t3.overseas_stock_prices,t4.stock_price,0)  as Initial_count_stock_price -- 期初价格 
          ,round(t2.Initial_pen_count * coalesce(t3.overseas_stock_prices,t4.stock_price,0),4) as Initial_count_money -- 期初金额
          ,0                                   as Purchasepens -- 采购数量  海外仓不采购
          ,0                                   as Purchasepens_stock_price -- 采购价格 海外仓不采购
          ,0                                   as Purchasepens_money   -- 采购金额 海外仓不采购
          ,t1.overseas                         as overseas -- 海外仓的调入数量,目前处理境内仓,没有海外仓转入数据
          ,t1.overseas_stock_price             as overseas_stock_price -- 海外仓的调入的价格
          ,t1.overseas_money                   as overseas_money   -- 海外仓的调入金额
          ,case when (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas) = 0 then coalesce(t3.overseas_stock_prices,t4.stock_price,0)
                else round(((t2.Warehouse_overage + t2.Initial_pen_count) * coalesce(t3.overseas_stock_prices,t4.stock_price,0) + t1.overseas_money) /
                 (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4)
          end                                  as stock_price -- 库存价格
          ,0                                   as Purchasepens_price   -- 采购价格 海外仓没有采购价
from      erp_database_newest.erp_audit_transfer_overseas_Amount as t1
inner join erp_database_newest.erp_audit_sales_purchasepens as t2
on        t1.sku = t2.sku
and       t1.warehouse_id = t2.warehouse_id
and       t1.ac_date = t2.ac_date
left join (select   min(ac_date),warehouse_id,sku,sum(overseas_stock_price) as overseas_stock_prices
		  from      erp_database_newest.erp_audit_transfer_overseas_Amount 
		  where     overseas > 0
		  group by  warehouse_id,sku
          ) as t3
on        t1.sku = t3.sku
and       t1.warehouse_id = t3.warehouse_id
left join erp_database_newest.erp_eudit_stock as t4
on        t1.sku = t4.sku
and       t1.warehouse_id = t4.warehouse_id
where     t1.warehouse_id in (9999,9998) 
and       t1.ac_date = '2015-01-31'
;

-- 循环插入2015-02到2017-06的数据
 SET @c=1;
 while @c<=29 do
 SELECT @loop_date:=last_day(DATE_add(DATE_FORMAt('2015-01-31','%Y-%m-%d'),INTERVAL @c month)) ;
insert into erp_database_newest.erp_audit_sales_purchasepens_Amount
select   t1.sku                -- sku
         ,t1.warehouse_id      -- 仓库ID
         ,t1.ac_date           -- 日期
         ,t2.Final_pen_count   -- 期末数量
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then t3.stock_price
		       else round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price + t1.overseas_money) /
			          (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4) 
         end                                   as final_stock_price    -- 期末价格
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then 0
		       else round(t2.Final_pen_count * round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price 
                      + t1.overseas_money) / (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4),4)
         end                                   as final_money   -- 期末金额
         ,t2.Sales_pens                        as Sales_pens -- 销售数量
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then t3.stock_price
		       else round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price + t1.overseas_money) /
			          (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4) 
         end                                   as sales_stock_price  -- 销售价格
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then 0
		       else round(t2.Sales_pens * round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price 
                      + t1.overseas_money) / (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4),4) 
         end                                   as sales_money   -- 销售金额
         ,t2.Purchasepens_count_transfer       as transfer  -- 深圳仓库sku调出数量
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then t3.stock_price
		       else round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price + t1.overseas_money) /
			          (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4) 
         end                                   as transfer_stock_price   -- 深圳仓库sku调出价格
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then 0
		       else round(t2.Purchasepens_count_transfer * round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price 
                      + t1.overseas_money) / (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4),4)
         end                                   as transfer_money -- 深圳仓库sku调出金额
         ,t2.Warehouse_scrap                   as Warehouse_scrap  -- sku报废数量
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then t3.stock_price
		       else round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price + t1.overseas_money) /
			          (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4) 
         end                                   as Warehouse_scrap_stock_price -- sku报废价格
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then 0
		       else round(t2.Warehouse_scrap * round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price 
                      + t1.overseas_money) / (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4),4)
         end                                   as Warehouse_scrap_money -- 本仓库sku报废数据金额
         ,t2.Warehouse_overage                 as Warehouse_overage -- 本仓库sku盘盈数量
         ,t3.stock_price                       as Warehouse_overage_stock_price -- 盘盈都是用期初库存价,第一个和期初的价格一样
         ,round(t2.Warehouse_overage * t3.stock_price,4) as Warehouse_overage_money -- 本仓库sku盘盈数据金额
         ,t2.Initial_pen_count                 as Initial_count -- 期初数量 第二个月为第一个月的期末库存价
         ,t3.stock_price                       as Initial_count_stock_price -- 期初价格
         ,round(t2.Initial_pen_count * t3.stock_price,4) as Initial_count_money -- 期初金额
         ,0                                    as Purchasepens -- 采购数量 海外仓没有采购
         ,0                                    as Purchasepens_stock_price -- 采购价格
         ,0                                    as Purchasepens_money   -- 采购金额
         ,t1.overseas                          as overseas -- 海外仓的调入数量,目前处理境内仓,没有海外仓转入数据
         ,t1.overseas_stock_price              as overseas_stock_price -- 海外仓的调入的价格
         ,t1.overseas_money                    as overseas_money   -- 海外仓的调入金额
         ,case when t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas = 0 then t3.stock_price
		       else round(((t2.Warehouse_overage + t2.Initial_pen_count) * t3.stock_price + t1.overseas_money) /
			          (t2.Warehouse_overage + t2.Initial_pen_count + t1.overseas),4) 
         end                                             as stock_price -- 库存价格
         ,0                                    as Purchasepens_price   -- 采购价格
from      erp_database_newest.erp_audit_transfer_overseas_Amount as t1
inner join erp_database_newest.erp_audit_sales_purchasepens as t2
on        t1.sku = t2.sku
and       t1.warehouse_id = t2.warehouse_id
and       t1.ac_date = t2.ac_date
inner join erp_database_newest.erp_audit_sales_purchasepens_Amount as t3
on       t1.sku = t3.sku
and      t1.warehouse_id = t3.warehouse_id
and      t1.ac_date = LAST_DAY(DATE_add(t3.ac_date, INTERVAL 1 MONTH)) 
where    t1.warehouse_id in (9999,9998) 
and      t1.ac_date = @loop_date
;
-- 循环加1
set @c=@c+1;
end WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_audit_sales_purchasepens_v_1
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_audit_sales_purchasepens_v_1`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_audit_sales_purchasepens_v_1`(
)
    SQL SECURITY INVOKER
BEGIN
-- 推算进销存的数据
-- 创建最终存储数据的表
drop table if exists erp_database_newest.erp_audit_sales_purchasepens;
CREATE TABLE erp_database_newest.erp_audit_sales_purchasepens (
    `sku` VARCHAR(50) COMMENT 'sku',
    `warehouse_id` INT DEFAULT 0 COMMENT '仓库ID',
    `ac_date` DATE COMMENT '日期',
    `Final_pen_count` INT DEFAULT 0 COMMENT '期末笔数',
    `Sales_pens` INT DEFAULT 0 COMMENT '销售笔数',
    `Purchasepens_count_transfer` INT DEFAULT 0 COMMENT '深圳仓库sku调出数据',
    `Warehouse_scrap` INT DEFAULT 0 COMMENT '本仓库sku报废数据',
    `Warehouse_overage` INT DEFAULT 0 COMMENT '本仓库sku盘盈数据',
    `Initial_pen_count` INT DEFAULT 0 COMMENT '期初笔数',
    `max_Purchasepens` INT DEFAULT 0 COMMENT '最大采购数',
    Purchasepens_count_overseas INT DEFAULT 0 COMMENT '海外仓的调入数据',
    `stock_price` DECIMAL(20 , 4 ) COMMENT '库存价格',
    `difference` INT(11) DEFAULT 0 COMMENT '期末+出-期初-入的差值',
    KEY `erp_sales_Purchasepens` (`sku` , `warehouse_id` , `ac_date`) USING BTREE,
    KEY `warehouse_id` (`warehouse_id`) USING BTREE,
    KEY `ac_date` (`ac_date`) USING BTREE
);
-- 1.推算东莞仓的数据,东莞仓只有201706一个月的数据,其中,东莞仓的期初全部用盘盈或者撤单入库补充
insert into erp_database_newest.erp_audit_sales_purchasepens
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,t1.stock_number as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,ifnull(t2.Purchasepens_count_transfer,0) as Purchasepens_count_transfer  -- 东莞仓调出的数据
		 ,0 as Warehouse_scrap     -- 本仓库sku报废数据 
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据
         ,0 AS Initial_pen_count -- 期初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,ifnull(t1.Purchasepens_count,0)  as max_Purchasepens -- 最大的采购数量
		 ,0 as  Purchasepens_count_overseas -- 海外仓调入数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_database_newest.erp_audit_Purchasepens as t1
left join(SELECT    products_sku AS sku,last_day(orders_record_time) AS ac_date,
                   SUM(orders_record_count) AS Purchasepens_count_transfer
         FROM      erp_database_newest.erp_orders_record
         WHERE     orders_record_reason = '东莞调深圳仓'
         AND       orders_record_time >= '2017-06-01 00:00:00'
         AND       orders_record_time <= '2017-06-30 23:59:59'
         GROUP BY  products_sku,last_day(orders_record_time)
		 ) as t2
on       t1.sku = t2.sku
and      t1.ac_date = t2.ac_date
where    t1.warehouse_id = 1035
and      t1.ac_date = '2017-06-30'
;

-- 期末 + 销售 + 调出 >= 采购 ,其中期初=0,盘盈=期末+销售 + 调出-采购(其中如果期末+销量 + 调出-采购>总盘盈,则需要补盘盈,总盘盈全部给东莞仓,其中需要补充的盘盈为
-- 期末+销量-采购-总盘盈/扫描缺货单,如果期末+销量-采购<=总盘盈/扫描缺货单,不需要补充盘盈,其中分给东莞仓的盘盈=期末+销量-采购
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_audit_scrap_overage AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date 
SET 
    t1.Warehouse_overage = CASE
        WHEN Final_pen_count + sales_pens + Purchasepens_count_transfer - max_Purchasepens > t2.Warehouse_overage THEN t2.Warehouse_overage
        ELSE Final_pen_count + sales_pens + Purchasepens_count_transfer - max_Purchasepens
    END
WHERE
    Final_pen_count + sales_pens + Purchasepens_count_transfer >= max_Purchasepens
;

-- 期末 + 销售 < 采购,其中期初=0,报损/扫描缺货单=期末+销售-采购(其中如果采购-销售-期末>总报损/扫描缺货单,则需要补充盘亏,总报损/扫描缺货单给东莞仓
-- ,其中需要补充的盘亏为采购-销售-期末-总报损/扫描缺货单,如果采购-销售-期末<=总报损/扫描缺货单,不需要补盘亏,其中分给东莞仓的报损/扫描缺货单=采购-销售-期末
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_audit_scrap_overage AS t2 ON t1.sku = t2.sku
        AND t1.ac_date = t2.ac_date 
SET 
    t1.Warehouse_scrap = CASE
        WHEN max_Purchasepens - Final_pen_count - sales_pens - Purchasepens_count_transfer > t2.Warehouse_scrap THEN t2.Warehouse_scrap
        ELSE max_Purchasepens - Final_pen_count - sales_pens - Purchasepens_count_transfer
    END
WHERE
    Final_pen_count + sales_pens - Purchasepens_count_transfer < max_Purchasepens
;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - Initial_pen_count - max_Purchasepens - Purchasepens_count_overseas - Warehouse_overage
;


-- 插入sku只属于一个仓库的数据,盘盈报损等信息不需要分配
-- 创建临死表存储临时数据
drop table if exists erp_database_newest.erp_audit_sales_purchasepens_tmp;
CREATE TABLE erp_database_newest.erp_audit_sales_purchasepens_tmp (
    `sku` VARCHAR(50) COMMENT 'sku',
    `warehouse_id` INT DEFAULT 0 COMMENT '仓库ID',
    `ac_date` DATE COMMENT '日期',
    `Final_pen_count` INT DEFAULT 0 COMMENT '期末笔数',
    `Sales_pens` INT DEFAULT 0 COMMENT '销售笔数',
    `Purchasepens_count_transfer` INT DEFAULT 0 COMMENT '深圳仓库sku调出数据',
    `Warehouse_scrap` INT DEFAULT 0 COMMENT '本仓库sku报废数据',
    `Warehouse_overage` INT DEFAULT 0 COMMENT '本仓库sku盘盈数据',
    `Initial_pen_count` INT DEFAULT 0 COMMENT '期初笔数',
    `max_Purchasepens` INT DEFAULT 0 COMMENT '最大采购数',
    Purchasepens_count_overseas INT DEFAULT 0 COMMENT '海外仓的调入数据',
    `stock_price` DECIMAL(20 , 4 ) COMMENT '库存价格',
    `difference` INT(11) DEFAULT 0 COMMENT '期末+出-期初-入的差值',
    KEY `erp_sales_Purchasepens_tmp` (`sku` , `warehouse_id` , `ac_date`) USING BTREE,
    KEY `warehouse_id_tmp` (`warehouse_id`) USING BTREE,
    KEY `ac_date_tmp` (`ac_date`) USING BTREE
);
insert into erp_database_newest.erp_audit_sales_purchasepens_tmp
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,t1.stock_number as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,t1.Purchasepens_count_transfer as Purchasepens_count_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,ifnull(t3.Warehouse_scrap,0) as Warehouse_scrap -- 本仓库sku报废数据 
		 ,ifnull(t3.Warehouse_overage,0) as Warehouse_overage  -- 本仓库sku盘盈数据
         ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,t1.Purchasepens_count as max_Purchasepens -- 最大的采购数量(海外仓没有采购)
		 ,t1.Purchasepens_count_overseas as Purchasepens_count_overseas -- 海外仓的调入数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_database_newest.erp_audit_Purchasepens as t1
inner join(select sku,count(1) as zl
          from (select distinct sku,warehouse_id from erp_database_newest.erp_audit_Purchasepens where warehouse_id <> 1035) m 
          group by sku) as t2
on        t1.sku = t2.sku
left join (SELECT   m1.sku,m1.ac_date,IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
                    ,IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
          FROM      erp_database_newest.erp_audit_scrap_overage AS m1
          LEFT JOIN (SELECT sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap,SUM(Warehouse_overage) AS Warehouse_overage
                    FROM  erp_database_newest.erp_audit_sales_purchasepens GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
          AND m1.ac_date = m2.ac_date
		  )as t3
on        t1.sku = t3.sku
and       t1.ac_date = t3.ac_date
where     t2.zl = 1 and t1.warehouse_id <> 1035
; 

-- 计算期初数据  如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈 计算20170630这一天的期初
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage - Purchasepens_count_overseas
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap >= max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0 
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap < max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;
-- 把海外仓的本月的期末转换成为上月的期初
 SET @m=2;
 while @m<=30 do
 SELECT @loop_date:=DATE_SUB(DATE_FORMAt('2017-07-31','%Y-%m-%d'),INTERVAL @m month);
-- 修改本月期末为上月的期初
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_database_newest.erp_audit_sales_purchasepens_tmp AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.ac_date = LAST_DAY(DATE_SUB(t2.ac_date, INTERVAL 1 MONTH)) 
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.ac_date = @loop_date
;
-- 计算期初数据  如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈 计算20170630这一天的期初
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage - Purchasepens_count_overseas
WHERE
    ac_date = @loop_date
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap >= max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0 
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    ac_date = @loop_date
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap < max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;
-- 循环加1
set @m=@m+1;
end WHILE;

-- 把处理好的深圳仓数据存入到固定的表中,并删除tmp表中深圳仓的数据
insert into erp_database_newest.erp_audit_sales_purchasepens
select  * from erp_database_newest.erp_audit_sales_purchasepens_tmp
;

-- 删除临时表的数据,存储下一个仓库的数据
 truncate table erp_database_newest.erp_audit_sales_purchasepens_tmp;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - Initial_pen_count - max_Purchasepens - Purchasepens_count_overseas - Warehouse_overage
;
-- 插入sku属于两个仓库的数据,盘盈报损等信息需要按照两个仓库分配
insert into erp_database_newest.erp_audit_sales_purchasepens_tmp
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,t1.stock_number as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,t1.Purchasepens_count_transfer as Purchasepens_count_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,0 as Warehouse_scrap -- 本仓库sku报废数据 
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据
         ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,t1.Purchasepens_count as max_Purchasepens -- 最大的采购数量(海外仓没有采购)
		 ,t1.Purchasepens_count_overseas as Purchasepens_count_overseas -- 海外仓的调入数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_database_newest.erp_audit_Purchasepens as t1
inner join(select sku,count(1) as zl
          from (select distinct sku,warehouse_id from erp_database_newest.erp_audit_Purchasepens where warehouse_id <> 1035) m 
          group by sku) as t2
on        t1.sku = t2.sku
left join erp_database_newest.erp_audit_scrap_overage as t3
on        t1.sku = t3.sku
and       t1.ac_date = t3.ac_date
where     t2.zl = 2 and t1.warehouse_id <> 1035
; 

-- 分配规则优先满足小的那个仓,
-- 如果期末+销售+转出 >= 采购+调入+盘盈,则盘盈全部分配给小仓库,期初=期末+销售+转出-(采购+调入+盘盈)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Purchasepens_count_transfer) - (max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage),
    t1.Warehouse_overage = t3.Warehouse_overage
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer >= max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage
;
-- 如果期末+销售+转出 < 采购+调入+盘盈且期末+销售+转出 >= 采购+调入,期初=0,盘盈=如果期末+销售+转出-(采购+调入)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_overage = (Final_pen_count + Sales_pens + Purchasepens_count_transfer) - (max_Purchasepens + Purchasepens_count_overseas)
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer < max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer >= max_Purchasepens + Purchasepens_count_overseas
;

-- 如果期末+销售+转出 < 采购+调入且期末+销售+转出+报损 >= 采购+调入,此时期初=0,报损=采购+调入 - (期末+销售+转出)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_scrap = (max_Purchasepens + Purchasepens_count_overseas) - (Final_pen_count + Sales_pens + Purchasepens_count_transfer)
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer < max_Purchasepens + Purchasepens_count_overseas
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + t3.Warehouse_scrap >= max_Purchasepens + Purchasepens_count_overseas
;
-- 如果期末+销售+转出+报损<采购+调入
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer + t3.Warehouse_scrap < max_Purchasepens + Purchasepens_count_overseas
;
-- 小仓库已经分配,现在开始分配大仓库,大仓库分配的数量=总盘盈/报损的数量-小仓库分配的数量
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MAX(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) - IFNULL(m3.Warehouse_scrap, 0) AS Warehouse_scrap,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) - IFNULL(m3.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m3 ON m1.sku = m3.sku
        AND m1.ac_date = m3.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Warehouse_scrap = t3.Warehouse_scrap,
    t1.Warehouse_overage = t3.Warehouse_overage
;
-- 计算期初数据  如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈 
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage - Purchasepens_count_overseas
WHERE
    ac_date = '2017-06-30'
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap >= max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0 
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    ac_date = '2017-06-30'
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap < max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;
-- 把海外仓的本月的期末转换成为上月的期初
 SET @c=2;
 while @c<=30 do
 SELECT @loop_date_two:=DATE_SUB(DATE_FORMAt('2017-07-31','%Y-%m-%d'),INTERVAL @c month);
-- 修改本月期末为上月的期初
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_database_newest.erp_audit_sales_purchasepens_tmp AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.ac_date = LAST_DAY(DATE_SUB(t2.ac_date, INTERVAL 1 MONTH)) 
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.ac_date = @loop_date_two
;
-- 计算期初数据  如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈 计算20170630这一天的期初
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage - Purchasepens_count_overseas
WHERE
    ac_date = @loop_date_two
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap >= max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0 
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    ac_date = @loop_date_two
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap < max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;
-- 循环加1
set @c=@c+1;
end WHILE;

-- 把处理好的深圳仓数据存入到固定的表中,并删除tmp表中深圳仓的数据
insert into erp_database_newest.erp_audit_sales_purchasepens
select  * from erp_database_newest.erp_audit_sales_purchasepens_tmp
;

-- 删除临时表的数据,存储下一个仓库的数据
 truncate table erp_database_newest.erp_audit_sales_purchasepens_tmp;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - Initial_pen_count - max_Purchasepens - Purchasepens_count_overseas - Warehouse_overage
;

-- 插入sku属于三个仓库或者四个仓库的数据,盘盈报损等信息需要按照多个仓库分配,按需分配第一个,第二个仓库,第三个仓库全部分配,后面的仓库不分配
insert into erp_database_newest.erp_audit_sales_purchasepens_tmp
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,t1.stock_number as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,t1.Purchasepens_count_transfer as Purchasepens_count_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,0 as Warehouse_scrap -- 本仓库sku报废数据 
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据
         ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,t1.Purchasepens_count as max_Purchasepens -- 最大的采购数量(海外仓没有采购)
		 ,t1.Purchasepens_count_overseas as Purchasepens_count_overseas -- 海外仓的调入数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_database_newest.erp_audit_Purchasepens as t1
inner join(select sku,count(1) as zl
          from (select distinct sku,warehouse_id from erp_database_newest.erp_audit_Purchasepens where warehouse_id <> 1035) m 
          group by sku) as t2
on        t1.sku = t2.sku
left join erp_database_newest.erp_audit_scrap_overage as t3
on        t1.sku = t3.sku
and       t1.ac_date = t3.ac_date
where     t2.zl in (3,4) and t1.warehouse_id <> 1035
; 

-- 分配规则优先满足小的那个仓,
-- 如果期末+销售+转出 >= 采购+调入+盘盈,则盘盈全部分配给小仓库,期初=期末+销售+转出-(采购+调入+盘盈)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Purchasepens_count_transfer) - (max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage),
    t1.Warehouse_overage = t3.Warehouse_overage
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer >= max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage
;
-- 如果期末+销售+转出 < 采购+调入+盘盈且期末+销售+转出 >= 采购+调入,期初=0,盘盈=如果期末+销售+转出-(采购+调入)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_overage = (Final_pen_count + Sales_pens + Purchasepens_count_transfer) - (max_Purchasepens + Purchasepens_count_overseas)
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer < max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer >= max_Purchasepens + Purchasepens_count_overseas
;

-- 如果期末+销售+转出 < 采购+调入且期末+销售+转出+报损 >= 采购+调入,此时期初=0,报损=采购+调入 - (期末+销售+转出)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_scrap = (max_Purchasepens + Purchasepens_count_overseas) - (Final_pen_count + Sales_pens + Purchasepens_count_transfer)
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer < max_Purchasepens + Purchasepens_count_overseas
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + t3.Warehouse_scrap >= max_Purchasepens + Purchasepens_count_overseas
;
-- 如果期末+销售+转出+报损<采购+调入
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer + t3.Warehouse_scrap < max_Purchasepens + Purchasepens_count_overseas
;
-- 小仓库已经分配,现在开始分配第二小仓库
-- 如果期末+销售+转出 >= 采购+调入+盘盈,则盘盈全部分配给小仓库,期初=期末+销售+转出-(采购+调入+盘盈)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku, MIN(m1.warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp AS m1
    LEFT JOIN (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) m2 ON m1.sku = m2.sku
        AND m1.warehouse_id = m2.warehouse_id
    WHERE
        m2.warehouse_id IS NULL) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Purchasepens_count_transfer) - (max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage),
    t1.Warehouse_overage = t3.Warehouse_overage
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer >= max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage
;
-- 如果期末+销售+转出 < 采购+调入+盘盈且期末+销售+转出 >= 采购+调入,期初=0,盘盈=如果期末+销售+转出-(采购+调入)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku, MIN(m1.warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp AS m1
    LEFT JOIN (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) m2 ON m1.sku = m2.sku
        AND m1.warehouse_id = m2.warehouse_id
    WHERE
        m2.warehouse_id IS NULL) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_overage = (Final_pen_count + Sales_pens + Purchasepens_count_transfer) - (max_Purchasepens + Purchasepens_count_overseas)
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer < max_Purchasepens + Purchasepens_count_overseas + t3.Warehouse_overage
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer >= max_Purchasepens + Purchasepens_count_overseas
;

-- 如果期末+销售+转出 < 采购+调入且期末+销售+转出+报损 >= 采购+调入,此时期初=0,报损=采购+调入 - (期末+销售+转出)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku, MIN(m1.warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp AS m1
    LEFT JOIN (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) m2 ON m1.sku = m2.sku
        AND m1.warehouse_id = m2.warehouse_id
    WHERE
        m2.warehouse_id IS NULL) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_scrap = (max_Purchasepens + Purchasepens_count_overseas) - (Final_pen_count + Sales_pens + Purchasepens_count_transfer)
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer < max_Purchasepens + Purchasepens_count_overseas
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + t3.Warehouse_scrap >= max_Purchasepens + Purchasepens_count_overseas
;
-- 如果期末+销售+转出+报损<采购+调入
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku, MIN(m1.warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp AS m1
    LEFT JOIN (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) m2 ON m1.sku = m2.sku
        AND m1.warehouse_id = m2.warehouse_id
    WHERE
        m2.warehouse_id IS NULL) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Initial_pen_count = 0,
    t1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    Final_pen_count + Sales_pens + Purchasepens_count_transfer + t3.Warehouse_scrap < max_Purchasepens + Purchasepens_count_overseas
;

-- 最大的仓库全部分配,最后一个仓库不分配
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MAX(warehouse_id) AS warehouse_id
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        INNER JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) - IFNULL(m3.Warehouse_scrap, 0) AS Warehouse_scrap,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) - IFNULL(m3.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_audit_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m3 ON m1.sku = m3.sku
        AND m1.ac_date = m3.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Warehouse_scrap = t3.Warehouse_scrap,
    t1.Warehouse_overage = t3.Warehouse_overage
;
-- 计算期初数据  如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈 
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage - Purchasepens_count_overseas
WHERE
    ac_date = '2017-06-30'
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap >= max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0 
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    ac_date = '2017-06-30'
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap < max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;
-- 把海外仓的本月的期末转换成为上月的期初
 SET @i=2;
 while @i<=30 do
 SELECT @loop_date_three:=DATE_SUB(DATE_FORMAt('2017-07-31','%Y-%m-%d'),INTERVAL @i month);
-- 修改本月期末为上月的期初
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_database_newest.erp_audit_sales_purchasepens_tmp AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.ac_date = LAST_DAY(DATE_SUB(t2.ac_date, INTERVAL 1 MONTH)) 
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.ac_date = @loop_date_three
;
-- 计算期初数据  如果期末+销售+调出 + 报损>=采购+盘盈 则期初=期末+销售+调出 +报损-采购-盘盈 计算20170630这一天的期初
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage - Purchasepens_count_overseas
WHERE
    ac_date = @loop_date_three
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap >= max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;

-- 如果期末+销售+调出+报损<采购+盘盈,则报损全部给深圳仓,此时期初=0 
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens_tmp AS t1 
SET 
    Initial_pen_count = 0
WHERE
    ac_date = @loop_date_three
        AND Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap < max_Purchasepens + Warehouse_overage + Purchasepens_count_overseas
;
-- 循环加1
set @i=@i+1;
end WHILE;

-- 把处理好的深圳仓数据存入到固定的表中,并删除tmp表中深圳仓的数据
insert into erp_database_newest.erp_audit_sales_purchasepens
select  * from erp_database_newest.erp_audit_sales_purchasepens_tmp
;

-- 删除临时表的数据,存储下一个仓库的数据
 truncate table erp_database_newest.erp_audit_sales_purchasepens_tmp;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - Initial_pen_count - max_Purchasepens - Purchasepens_count_overseas - Warehouse_overage
; 
-- 更改盘盈盘亏的数据
SET SQL_SAFE_UPDATES = 0;
update erp_database_newest.erp_audit_sales_purchasepens AS t1 
inner join(select products_sku as sku,owned_warehouse as warehouse_id,last_day(orders_record_time) as ac_date
                  ,sum(case when orders_record_type = 2 then orders_record_count else 0 end ) as Warehouse_overage
		          ,sum(case when orders_record_type = 13 then orders_record_count else 0 end ) as Warehouse_scrap
		  from    erp_database_newest.erp_orders_record_Call_out
		  where   orders_record_time >= '2015-01-01 00:00:00'
		  and     orders_record_time <= '2017-06-30 23:59:59'
		  and     orders_record_status in (2,13)
		  group by products_sku,owned_warehouse,last_day(orders_record_time)
		  ) as t2
on        t1.sku = t2.sku
and       t1.warehouse_id = t2.warehouse_id
and       t1.ac_date = t2.ac_date
set       t1.Warehouse_overage = t1.Warehouse_overage + t2.Warehouse_overage,
          t1.Warehouse_scrap = t1.Warehouse_scrap + t2.Warehouse_scrap
;
-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_audit_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Purchasepens_count_transfer + Warehouse_scrap - Initial_pen_count - max_Purchasepens - Purchasepens_count_overseas - Warehouse_overage
;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_cost
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_cost`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_cost`(
)
    SQL SECURITY INVOKER
BEGIN
drop table  if exists erp_database_newest.erp_cost_2;
CREATE TABLE erp_database_newest.erp_cost_2 (
    main_name VARCHAR(20) COMMENT '批次名',
    ac_date DATE COMMENT '日期',
    cost DECIMAL(20 , 4 ) COMMENT '实际费用',
    erp_shippingCost DECIMAL(20 , 4 ) COMMENT '预估费用',
    erp_orders_id INT COMMENT '订单号',
    shipmentAutoMatched INT COMMENT '物流方式id',
    shipmentSupplierID INT COMMENT '物流公司id',
    suppliers_company VARCHAR(200) COMMENT '物流公司名称',
	Supplier_Abbreviation_name varchar(255) DEFAULT NULL COMMENT '供应商简称',
   Supplier_full_name varchar(255) comment '供应商全称'
);

create  index   erp_cost_2 on erp_database_newest.erp_cost_2 (main_name,ac_date);
create index erp_cost_2_01 on erp_database_newest.erp_cost_2 (erp_orders_id);
create index erp_cost_2_02 on erp_database_newest.erp_cost_2 (ac_date);
SET @m=1;
while @m<=18 do
SELECT @start_date:=DATE_add(DATE_FORMAt('2015-06-01','%Y-%m-%d'),INTERVAL @m month);
SELECT  @end_date:=DATE_ADD(DATE_FORMAT('2015-06-01', '%Y-%m-%d'),INTERVAL (@m + 1) MONTH);

insert into erp_database_newest.erp_cost_2  
select   t1.main_name ,ac_date  , cast(cost as decimal(20,4)) as  cost, shippingCost,t1.erp_orders_id
         ,t1.shipmentAutoMatched,t1.shipmentSupplierID,t1.suppliers_company,Supplier_Abbreviation_name,Supplier_full_name
from (
select   t1.main_name,DATE_FORMAT(t2.orders_export_time,'%Y-%m-%d')  as ac_date ,cost, shippingCost,t2.erp_orders_id
         ,t2.shipmentAutoMatched,t3.shipmentSupplierID,t4.suppliers_company,t5.Supplier_Abbreviation_name,t5.Supplier_full_name
from     erp_database_newest.erp_orders as t2 
inner join erp_database_newest.erp_shipment_cost as t1
on       t1.orders_id = t2.erp_orders_id
left join erp_database_newest.erp_shipment as t3
on       t2.shipmentAutoMatched = t3.shipmentID
left join erp_database_newest.erp_shipment_suppliers as t4
on       t3.shipmentSupplierID = t4.suppliers_id
left join erp_database_newest.erp_logistics_Supplier as t5
on       t1.main_name = t5.mian_name
where    t2.orders_export_time >= @start_date 
and      t2.orders_export_time < @end_date
 and      t2.orders_shipping_time is null 
union all
select    t1.main_name,DATE_FORMAT(t2.orders_shipping_time,'%Y-%m-%d')  as ac_date ,cost  ,shippingCost,t2.erp_orders_id
          ,t2.shipmentAutoMatched,t3.shipmentSupplierID,t4.suppliers_company,t5.Supplier_Abbreviation_name,t5.Supplier_full_name
from     erp_database_newest.erp_orders as t2  
inner join erp_database_newest.erp_shipment_cost as t1
on       t1.orders_id = t2.erp_orders_id
left join erp_database_newest.erp_shipment as t3
on       t2.shipmentAutoMatched = t3.shipmentID
left join erp_database_newest.erp_shipment_suppliers as t4
on       t3.shipmentSupplierID = t4.suppliers_id
left join erp_database_newest.erp_logistics_Supplier as t5
on       t1.main_name = t5.mian_name
where    t2.orders_shipping_time >= @start_date 
and      t2.orders_shipping_time < @end_date
) t1 ;
set @m=@m+1;
end WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_cost_shore
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_cost_shore`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_cost_shore`(
)
    SQL SECURITY INVOKER
BEGIN
drop table  if exists erp_database_newest.erp_cost_shore;
CREATE TABLE erp_database_newest.erp_cost_shore (
    main_name VARCHAR(20) COMMENT '批次名',
    ac_date DATE COMMENT '日期',
    cost DECIMAL(20 , 4 ) COMMENT '实际费用',
    erp_shippingCost DECIMAL(20 , 4 ) COMMENT '预估费用',
    erp_orders_id INT COMMENT '订单号',
    shipmentAutoMatched INT COMMENT '物流方式id',
    shipmentSupplierID INT COMMENT '物流公司id',
    suppliers_company VARCHAR(200) COMMENT '物流公司名称',
    suppliers_company_WLGS VARCHAR(255) DEFAULT NULL COMMENT '无账单公司的名称按照erp系统物流公司',
    suppliers_company_WLQD VARCHAR(255) COMMENT '无账单公司的名称按照物流渠道代码'
);

create  index   erp_cost_shore on erp_database_newest.erp_cost_shore (suppliers_company_WLGS,suppliers_company_WLQD);
create index erp_cost_shore_01 on erp_database_newest.erp_cost_shore (erp_orders_id);
create index erp_cost_shore_02 on erp_database_newest.erp_cost_shore (ac_date);
SET @m=1;
while @m<=18 do
SELECT @start_date:=DATE_add(DATE_FORMAt('2015-06-01','%Y-%m-%d'),INTERVAL @m month);
SELECT 
    @end_date:=DATE_ADD(DATE_FORMAT('2015-06-01', '%Y-%m-%d'),
        INTERVAL (@m + 1) MONTH);

insert into erp_database_newest.erp_cost_shore  
select   t2.main_name,DATE_FORMAT(t1.orders_export_time,'%Y-%m-%d')  as ac_date ,cost, shippingCost,t1.erp_orders_id
         ,t1.shipmentAutoMatched,t3.shipmentSupplierID,T4.suppliers_company,t5.Supplier_full_name AS suppliers_company_WLGS
         ,t6.Supplier_full_name AS suppliers_company_WLQD
from      erp_database_newest.erp_orders  as t1
left join erp_database_newest.erp_cost_2  as t2
on         t1.erp_orders_id = t2.erp_orders_id
left join erp_database_newest.erp_shipment as t3
on       t1.shipmentAutoMatched = t3.shipmentID
left join erp_database_newest.erp_shipment_suppliers as t4
on       t3.shipmentSupplierID = t4.suppliers_id
left join (select   * from erp_logistics_Supplier_zx where flag = 2)  as t5
on           t4.suppliers_company = t5.mian_name
left join (select   * from erp_logistics_Supplier_zx where flag = 3)  as t6
on        t1.shipmentAutoMatched = t6.mian_name
where     t1.orders_export_time >= @start_date
and       t1.orders_export_time < @end_date
and       t1.orders_status in (5,6,8)
and       T1.orders_is_join = 0 
and       t1.orders_shipping_time is null
and       t2.erp_orders_id is null   
;

insert into erp_database_newest.erp_cost_shore  
select   t2.main_name,DATE_FORMAT(t1.orders_shipping_time,'%Y-%m-%d')  as ac_date ,cost, shippingCost,t1.erp_orders_id
         ,t1.shipmentAutoMatched,t3.shipmentSupplierID,T4.suppliers_company,t5.Supplier_full_name AS suppliers_company_WLGS
         ,t6.Supplier_full_name AS suppliers_company_WLQD
from      erp_database_newest.erp_orders  as t1
left join erp_database_newest.erp_cost_2  as t2
on         t1.erp_orders_id = t2.erp_orders_id
left join erp_database_newest.erp_shipment as t3
on       t1.shipmentAutoMatched = t3.shipmentID
left join erp_database_newest.erp_shipment_suppliers as t4
on       t3.shipmentSupplierID = t4.suppliers_id
left join (select   * from erp_logistics_Supplier_zx where flag = 2)  as t5
on           t4.suppliers_company = t5.mian_name
left join (select   * from erp_logistics_Supplier_zx where flag = 3)  as t6
on        t1.shipmentAutoMatched = t6.mian_name
where     t1.orders_shipping_time >= @start_date
and       t1.orders_shipping_time < @end_date
and       t1.orders_status in (5,6,8)
and       T1.orders_is_join = 0 
and       t2.erp_orders_id is null   
;
set @m=@m+1;
end WHILE;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_orders_products_20171123
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_orders_products_20171123`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_orders_products_20171123`(
)
    SQL SECURITY INVOKER
BEGIN
drop table if exists `erp_database_newest`.`erp_orders_products_20171123`;
CREATE TABLE `erp_database_newest`.`erp_orders_products_20171123` (
    `orders_products_id` INT NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `erp_orders_id` INT DEFAULT NULL COMMENT '内单号',
    `ebay_orders_id` INT DEFAULT NULL COMMENT 'ebay平台订单号',
    `orderlineitemid` VARCHAR(100) NOT NULL DEFAULT '0' COMMENT '交易ID',
    `orders_item_number` VARCHAR(100) NOT NULL DEFAULT '0',
    `itemSite` VARCHAR(50) DEFAULT '0' COMMENT 'Amazon站点',
    `orders_sku` VARCHAR(50) DEFAULT NULL COMMENT '产品代码',
    `orders_item` VARCHAR(200) DEFAULT NULL COMMENT '商品名称',
    `item_price` FLOAT DEFAULT NULL COMMENT '产品价格',
    `price_suggest` FLOAT DEFAULT '0' COMMENT '建议价格',
    `item_count` INT DEFAULT NULL COMMENT '产品数量',
    `item_cost` FLOAT DEFAULT '0' COMMENT '产品运费',
    `item_attribute` TEXT COMMENT '订单产品属性',
    `transactionID` VARCHAR(100) NOT NULL DEFAULT '0' COMMENT '订单产品属性',
    `token_id` INT NOT NULL DEFAULT '0' COMMENT '事物id',
    `feedback_id` VARCHAR(50) DEFAULT NULL COMMENT '令牌id',
    `comment_type` VARCHAR(100) DEFAULT NULL COMMENT '评论类型',
    `comment_text` TEXT COMMENT '评论内容',
    `comment_time` DATETIME DEFAULT NULL COMMENT '评论时间',
    `getFeedback` INT NOT NULL DEFAULT '0',
    `platform_sku` VARCHAR(50) DEFAULT NULL COMMENT '平台SKU',
    item_freight FLOAT(7 , 2 ) NOT NULL DEFAULT '0.00' COMMENT '单品运费',
    PRIMARY KEY (`orders_products_id`),
    KEY `IDX_ORDERSID_ORDERSSKU` (`erp_orders_id` , `orders_sku`) USING BTREE,
    KEY `IDX_ORDERS_SKU_ERP_ORDERS_ID` (`orders_sku`),
    KEY `IDX_PLATFORMSKU` (`platform_sku`) USING BTREE,
    KEY `transactionID` (`transactionID`),
    KEY `orders_item_number` (`orders_item_number`),
    KEY `erp_orders_id_2` (`ebay_orders_id` , `orderlineitemid` , `orders_item` , `token_id`),
    KEY `IDX_ORDERLINEITEMID` (`orderlineitemid`) USING BTREE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='订单产品明细表'
;

insert into `erp_database_newest`.`erp_orders_products_20171123`
select    orders_products_id ,erp_orders_id ,ebay_orders_id  ,orderlineitemid ,orders_item_number ,itemSite ,orders_sku,orders_item
          ,item_price,price_suggest,item_count,item_cost,item_attribute,transactionID,token_id,feedback_id,comment_type,comment_text
          ,comment_time,getFeedback,platform_sku,0.00 as item_freight
from    `erp_database_newest`.`erp_orders_products`
where    orders_products_id <= 1200000 ;

set @i=1;
while @i<= 665 do
select @i;
insert into `erp_database_newest`.`erp_orders_products_20171123`
select  orders_products_id ,erp_orders_id ,ebay_orders_id  ,orderlineitemid ,orders_item_number ,itemSite ,orders_sku,orders_item
          ,item_price,price_suggest,item_count,item_cost,item_attribute,transactionID,token_id,feedback_id,comment_type,comment_text
          ,comment_time,getFeedback,platform_sku,0.00 as item_freight
from    `erp_database_newest`.`erp_orders_products`
where    orders_products_id >= 1200001 + (@i - 1) * 100000
and      orders_products_id <= 1200000 + @i * 100000
;

set @i=@i+1;
end while;

alter table `erp_database_newest`.`erp_orders_products` rename `erp_database_newest`.`erp_orders_products_bf`;
alter table `erp_database_newest`.`erp_orders_products_20171123` rename `erp_database_newest`.`erp_orders_products` ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_Purchasepens_sales_stock
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_Purchasepens_sales_stock`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_Purchasepens_sales_stock`(
)
    SQL SECURITY INVOKER
BEGIN
/*
-- 插入数据(其中以采购和销售的并集作为主表)
SET @m=1;
while @m<=4 do
SELECT @start_date:=DATE_add(DATE_FORMAt('2017-06-01','%Y-%m-%d'),INTERVAL @m month);
SELECT 
    @end_date:=DATE_ADD(DATE_FORMAT('2017-06-01', '%Y-%m-%d'),
        INTERVAL (@m + 1) MONTH);

-- 插入数据 由于数据量太大,所以目前采用分月插入数据
-- 插入境内仓数据(其中只取打印时间不为空的数据)
insert into erp_data_warehouse.erp_sales
select     t3.sku as sku      -- 全部展现境内sku
           ,case when t1.orders_status = 8 then 9999   -- 状态为8,则仓库为fba仓
                 when t3.flag = 1 then 9998   -- sku为海外的sku,则仓库为海外仓
                 when t1.orders_warehouse_id = 1033 then 1000  
                 when t1.orders_warehouse_id = 1041 then 9998 
				 else t1.orders_warehouse_id 
           end as warehouse_id 
           ,last_day(t1.orders_shipping_time ) as ac_date
           ,sum(item_count)as sales_pens
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id 
inner join erp_data_warehouse.erp_sales_sku as t3  -- 同一个sku可能在不同的仓库里面
on         trim(t2.orders_sku) = t3.sku_overseas 
where      t1.orders_shipping_time >= @start_date
and        t1.orders_shipping_time < @end_date
and        t1.orders_status in (5,8)
and        t1.orders_is_join = 0 
group by   t3.sku,last_day(t1.orders_shipping_time )
           ,case when t1.orders_status = 8 then 9999   -- 状态为8,则仓库为fba仓
                 when t3.flag = 1 then 9998   -- sku为海外的sku,则仓库为海外仓
                 when t1.orders_warehouse_id = 1033 then 1000  
                 when t1.orders_warehouse_id = 1041 then 9998   -- 香港仓判断为海外仓
				 else t1.orders_warehouse_id 
           end
;
-- 插入境内仓数据(其中只取打印时间为空的数据)
insert into erp_data_warehouse.erp_sales
select     t3.sku as sku      -- 全部展现境内sku
           ,case when t1.orders_status = 8 then 9999   -- 状态为8,则仓库为fba仓
                 when t3.flag = 1 then 9998   -- sku为海外的sku,则仓库为海外仓
                 when t1.orders_warehouse_id = 1033 then 1000  
                 when t1.orders_warehouse_id = 1041 then 9998 
				 else t1.orders_warehouse_id 
           end as warehouse_id 
           ,last_day(t1.orders_export_time) as ac_date 
           ,sum(item_count)as sales_pens
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id  
inner join erp_data_warehouse.erp_sales_sku as t3
on         trim(t2.orders_sku) = t3.sku_overseas
where      t1.orders_export_time >= @start_date
and        t1.orders_export_time < @end_date
and        t1.orders_shipping_time  is null
and        t1.orders_status in (5,8)
and        t1.orders_is_join = 0 
group by   t3.sku,last_day(t1.orders_export_time )
           ,case when t1.orders_status = 8 then 9999   -- 状态为8,则仓库为fba仓
                 when t3.flag = 1 then 9998   -- sku为海外的sku,则仓库为海外仓
                 when t1.orders_warehouse_id = 1033 then 1000  
                 when t1.orders_warehouse_id = 1041 then 9998   -- 香港仓判断为海外仓
				 else t1.orders_warehouse_id 
           end
;
-- 循环加1
set @m=@m+1;
end WHILE;

-- 存储转入转出的数据
drop table if exists erp_data_warehouse.erp_transfer_overseas;
CREATE TABLE erp_data_warehouse.erp_transfer_overseas (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT COMMENT '仓库ID',
    ac_date DATE COMMENT '采购日期,取每月最后一天',
    Purchasepens_transfer INT DEFAULT 0 COMMENT '深圳仓转出',
    way_last_month INT DEFAULT 0 COMMENT '上月在途数据',
    Purchasepens_overseas INT DEFAULT 0 COMMENT '海外仓的转入笔数',
    way_month INT DEFAULT 0 COMMENT '本月在途数据'
);
create index erp_transfer_overseas on erp_data_warehouse.erp_transfer_overseas(sku);

-- 插入数据(插入境内仓的数据)
insert into erp_data_warehouse.erp_transfer_overseas
SELECT     products_sku as sku
           ,1000 as warehouse_id
           ,last_day(orders_record_time) as ac_date
		   ,sum(ifnull(orders_record_count,0)) as Purchasepens_transfer -- 深圳仓的转出-- 所有境内仓的转出全部归入深圳仓
		   ,0 as way_last_month -- 上月在途数量
		   ,0 as Purchasepens_overseas  -- 海外仓的转入笔数
		   ,0 as way_month -- 本月在途数据
from      erp_database_newest.erp_orders_record
WHERE     orders_record_type = 5 -- 深圳仓转出
AND       orders_record_time >= '2017-07-01 00:00:00'
AND       orders_record_time <= '2017-10-31 23:59:59'
GROUP BY  products_sku,last_day(orders_record_time)
;
-- 插入数据(插入海外仓的转入数据)其中已经到货入库的数据
insert into erp_data_warehouse.erp_transfer_overseas
select     sku
           ,warehouse_id
           ,ac_date
		   ,0 as Purchasepens_transfer  -- 深圳仓的转出-- 所有境内仓的转出全部归入深圳仓
           ,sum(way_last_month) as way_last_month   -- 上月在途数量
           ,sum(Purchasepens_overseas) as Purchasepens_overseas  -- 境内仓没有转入
           ,sum(ifnull(way_month,0)) as way_month -- 本月在途数据way_month
from       (SELECT   trim(t2.productSKU) as sku,t3.ac_date,sum(ifnull(t2.quantity,0))  as Purchasepens_overseas,0 as way_month
                     ,case when t1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end as warehouse_id
                     ,0 as way_last_month
           FROM      salamoer_database.sangelfine_allocation_product as t1
           inner JOIN salamoer_database.sangelfine_allocation_product_list as t2 
           ON        t1.allocationProductID = t2.allocationProductID 
           inner join(select distinct last_day(createTime) as ac_date,substring_index(contactID,'-',1) as contactID,sku
                     from salamoer_database.records_out_of_storage 
                     where  type = 1 and createTime >= '2017-07-01 00:00:00' and createTime <= '2017-10-31 23:59:59'
                     ) as t3
           on        t2.allocationProductID = t3.contactID  and t2.productSKU = t3.sku
           left join (SELECT   products_sku AS sku,SUM(orders_record_count) AS Purchasepens_transfer
					FROM      erp_database_newest.erp_orders_record
                    WHERE     orders_record_type = 5 -- 深圳仓转出
                    AND       orders_record_time >= '2017-06-01 00:00:00'
                    AND       orders_record_time <= '2017-06-30 23:59:59'
                    GROUP BY  products_sku
                    ) as t4 on t2.productSKU = t4.sku  and t3.ac_date = '2017-07-31' -- 去掉6月份转出,7月份到货读的情况
           where     t1.status = 4 and t4.sku is null  -- 3:头程在途,4:海外仓到货in (3,4)
--           and       t1.receiveWarehouseID in (1001,1002,1004,1005,1008,1009,1010,1011,1012,1013,1014,1015,1016 ,1017,1018,1019
--                          ,1023,1024,1026,1027,1030,1031,1032,1033,1037,1038,1039,1040)
           group by  trim(t2.productSKU),t3.ac_date,case when t1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end
          union all
          select    trim(m2.productSKU) as sku,m3.ac_date_out as ac_date,0 as Purchasepens_overseas,sum(ifnull(m2.quantity,0)) as way_month
                    ,case when m1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end as warehouse_id
                    ,0 as way_last_month
          FROM      salamoer_database.sangelfine_allocation_product as m1
          inner JOIN salamoer_database.sangelfine_allocation_product_list as m2 
          ON        m1.allocationProductID = m2.allocationProductID
          inner join(select distinct last_day(orders_record_time) as ac_date_out,procurement_id 
                    from erp_database_newest.erp_orders_record where  orders_record_type = 5 and
                    orders_record_time >= '2017-07-01 00:00:00' and orders_record_time <= '2017-10-31 23:59:59'
                    ) as m3
          on        m2.allocationProductID = m3.procurement_id
          inner join(select distinct last_day(createTime) as ac_date_in,substring_index(contactID,'-',1) as contactID,sku
                    from salamoer_database.records_out_of_storage 
                    where  type = 1 and createTime >= '2017-07-01 00:00:00' 
                    ) as m4
          on        m2.allocationProductID = m4.contactID  and m2.productSKU = m4.sku
          where     m1.status = 4 -- 3:头程在途,4:海外仓到货in (3,4) 
          and       m3.ac_date_out < m4.ac_date_in
          group by  trim(m2.productSKU),m3.ac_date_out,case when m1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end
		 union all
		  select    trim(m2.productSKU) as sku,m3.ac_date_out as ac_date,0 as Purchasepens_overseas,sum(ifnull(m2.quantity,0)) as way_month
                    ,case when m1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end as warehouse_id
                    ,0 as way_last_month
          FROM      salamoer_database.sangelfine_allocation_product as m1
          inner JOIN salamoer_database.sangelfine_allocation_product_list as m2 
          ON        m1.allocationProductID = m2.allocationProductID
          inner join(select distinct last_day(orders_record_time) as ac_date_out,procurement_id 
                    from erp_database_newest.erp_orders_record where  orders_record_type = 5 and
                    orders_record_time >= '2017-07-01 00:00:00' and orders_record_time <= '2017-10-31 23:59:59'
                    ) as m3
          on        m2.allocationProductID = m3.procurement_id
          where     m1.status = 3 -- 3:头程在途,4:海外仓到货in (3,4) 
          group by  trim(m2.productSKU),m3.ac_date_out,case when m1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end
        union all
		  select    trim(m2.productSKU) as sku,m4.ac_date_in as ac_date,0 as Purchasepens_overseas,0 as way_month
                    ,case when m1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end as warehouse_id
                    ,sum(ifnull(m2.quantity,0)) as way_last_month  
          FROM      salamoer_database.sangelfine_allocation_product as m1
          inner JOIN salamoer_database.sangelfine_allocation_product_list as m2 
          ON        m1.allocationProductID = m2.allocationProductID
          inner join(select distinct last_day(orders_record_time) as ac_date_out,procurement_id 
                    from erp_database_newest.erp_orders_record where  orders_record_type = 5 and
                    orders_record_time >= '2017-07-01 00:00:00' and orders_record_time <= '2017-10-31 23:59:59'
                    ) as m3
          on        m2.allocationProductID = m3.procurement_id
          inner join(select distinct last_day(createTime) as ac_date_in,substring_index(contactID,'-',1) as contactID,sku
                    from salamoer_database.records_out_of_storage 
                    where  type = 1 and createTime >= '2017-07-01 00:00:00'  and createTime <= '2017-10-31 23:59:59'
                    ) as m4
          on        m2.allocationProductID = m4.contactID  and m2.productSKU = m4.sku
          where     m1.status = 4 -- 3:头程在途,4:海外仓到货in (3,4) 
          and       m3.ac_date_out < m4.ac_date_in
          group by  trim(m2.productSKU),m4.ac_date_in
                    ,case when m1.receiveWarehouseID in (1010,1023,1037,1039,1040) then 9999 else 9998 end
           ) as m
group by   sku,warehouse_id,ac_date
;  -- 转入转出核对完毕



-- 存储采购数据(首先存储相关月份的数据)
drop table if exists erp_data_warehouse.erp_Purchasepens_month;
CREATE TABLE erp_data_warehouse.erp_Purchasepens_month (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT COMMENT '仓库ID',
    ac_date DATE COMMENT '采购日期,取每月最后一天',
    Purchasepens INT DEFAULT 0 COMMENT '采购笔数(境内仓的采购笔数)',
    Initial_pen_count INT DEFAULT 0 COMMENT '2017-07-31期初库存',
    stock_price DECIMAL(20 , 4 ) COMMENT '2017-07-31期初库存价'
);
create index erp_Purchasepens_month on erp_data_warehouse.erp_Purchasepens_month(sku);

-- 插入数据(插入境内仓采购的数据)
insert into erp_data_warehouse.erp_Purchasepens_month
select    t1.sku
          ,t1.warehouse_id
          ,t1.ac_date
          ,sum(t1.Purchasepens) as Purchasepens
          ,sum(case when t1.ac_date = '2017-07-31' then t1.Initial_pen_count else 0 end) as Initial_pen_count
          ,sum(case when t1.ac_date = '2017-07-31' then t1.stock_price else 0 end) as stock_price
from      (select    trim(pp.op_pro_sku) AS sku,ep.procurement_warehouse_id as warehouse_id,last_day(orders_record_time) as ac_date
                     ,sum(ifnull(pa.orders_record_count,0)) as Purchasepens,0 as Initial_pen_count,0 as stock_price
          FROM      (select distinct op_pro_sku,po_id FROM ERP_DATABASE_NEWEST.erp_procurement_products) pp
          INNER JOIN ERP_DATABASE_NEWEST.erp_procurement ep 
          ON        ep.po_id = pp.po_id
          INNER JOIN ERP_DATABASE_NEWEST.erp_orders_record pa 
          ON        pa.procurement_id = pp.po_id
          AND       pa.products_sku = pp.op_pro_sku
          WHERE     orders_record_time >= '2017-07-01 00:00:00'
          AND       orders_record_time <= '2017-10-31 23:59:59'
          and orders_record_type in (1,9)
-- AND po_status >=2  AND has_new_arrival = 0 AND ((mustFollowing = 0 AND ep.arrival_is_end = 1) OR po_status =6)
          GROUP BY  trim(pp.op_pro_sku),ep.procurement_warehouse_id,last_day(orders_record_time)
        union all
          select    trim(sku) as sku,warehouse_id,'2017-07-31' as ac_date,0 as Purchasepens
                    ,stock_number as Initial_pen_count,stock_price 
          from      erp_database_newest.sku_stock_shenzhen_0925
        union all
          select    trim(sku) as sku,warehouse_id,'2017-07-31' as ac_date,0 as Purchasepens
                    ,stock_number as Initial_pen_count,stock_price 
          from      erp_database_newest.sku_stock_yiwu_0925
        union all
          select    trim(sku) as sku,warehouse_id,'2017-07-31' as ac_date,0 as Purchasepens
                    ,stock_number as Initial_pen_count,stock_price 
          from      erp_database_newest.sku_stock_dongguan_0925
        union all
          select    trim(sku) as sku,warehouse_id,'2017-07-31' as ac_date,0 as Purchasepens
                    ,SUM(stock_number) AS stock_number,MAX(stock_price) AS stock_price 
          from      erp_database_newest.sku_stock_hw_0925 WHERE sku not like '%(%'group by trim(sku),warehouse_id
          ) as t1
group by  t1.sku,t1.warehouse_id,t1.ac_date
;


-- 存储每个月的采购数据,如果该月份没有采购数据,则补0
drop table if exists erp_data_warehouse.erp_Purchasepens;
CREATE TABLE erp_data_warehouse.erp_Purchasepens (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT COMMENT '仓库ID',
    ac_date DATE COMMENT '采购日期,取每月最后一天',
    Purchasepens INT DEFAULT 0 COMMENT '采购笔数(境内仓的采购数据)',
    Purchasepens_transfer INT DEFAULT 0 COMMENT '深圳仓转出的数据',
    way_last_month INT DEFAULT 0 COMMENT '上月在途数量',
    Purchasepens_overseas INT DEFAULT 0 COMMENT '海外仓到货的数据',
    way_month INT DEFAULT 0 COMMENT '本月在途数量',
    sales_pens INT DEFAULT 0 COMMENT '销售数据',
    Initial_pen_count INT DEFAULT 0 COMMENT '20170731期初数量',
    stock_price DECIMAL(20 , 4 ) COMMENT '20170731期初价格'
);
create index erp_Purchasepens on erp_data_warehouse.erp_Purchasepens(sku);

-- 插入数据(其中以采购和销售的并集作为主表)
 SET @i=1;
 while @i<=4 do
 --  设置参数,使日期从2015年01开始跑到2017年6月份  -- 转出不区分仓库,所有转出全部为深圳仓
insert into erp_data_warehouse.erp_Purchasepens
SELECT    T1.SKU,T1.warehouse_id,T1.AC_DATE
          ,ifnull(T1.Purchasepens,0) as Purchasepens_count
          ,ifnull(T3.Purchasepens_transfer,0) AS Purchasepens_transfer
		  ,ifnull(t3.way_last_month,0) as way_last_month
          ,ifnull(T3.Purchasepens_overseas,0) AS Purchasepens_overseas
		  ,ifnull(t3.way_month,0) as way_month
		  ,ifnull(t2.sales_pens,0) as sales_pens
		  ,ifnull(t1.Initial_pen_count,0) as Initial_pen_count
		  ,ifnull(t1.stock_price,0)  as stock_price
FROM      (select   z1.sku,z1.warehouse_id,LAST_DAY(DATE_FORMAT('2017-06-30','%Y-%m-%d') + interval @i month) as ac_date
		            ,ifnull(z2.Purchasepens,0) as Purchasepens,ifnull(z2.stock_price,0) as stock_price
		            ,ifnull(z2.Initial_pen_count,0) as Initial_pen_count
          from      (select   distinct sku,warehouse_id
				    from      (select distinct sku,warehouse_id from erp_data_warehouse.erp_Purchasepens_month  -- 采购数据
                             union all
                              select distinct sku,warehouse_id from erp_data_warehouse.erp_sales -- 销售数据
							 union all
							  select distinct sku ,warehouse_id from erp_data_warehouse.erp_transfer_overseas -- 转入转出
                              ) s1 -- 以有库存,有销售,有采购,有转入转出的数据为主表
					)as z1
          left join (select  sku,warehouse_id,Purchasepens,Initial_pen_count,stock_price
					from erp_data_warehouse.erp_Purchasepens_month 
					where  ac_date = LAST_DAY(DATE_FORMAT('2017-06-30','%Y-%m-%d') + interval @i month)
					) as z2
          on        z1.sku = z2.sku 
          and       z1.warehouse_id = z2.warehouse_id
          ) AS T1
left join erp_data_warehouse.erp_sales as t2
on        t1.sku = t2.sku
and       t1.warehouse_id = t2.warehouse_id
and       t1.ac_date = t2.ac_date
left join erp_data_warehouse.erp_transfer_overseas as t3
on        t1.sku = t3.sku
and       t1.warehouse_id = t3.warehouse_id
and       t1.ac_date = t3.ac_date
;

-- 循环加1
set @i=@i+1;
end WHILE;

-- 删除某sku,某仓库在查询区间内没有采购,没有销售,没有转出,没有库存的数据
DELETE A FROM erp_data_warehouse.erp_Purchasepens A
        INNER JOIN
    (SELECT 
        SKU,
            WAREHOUSE_ID,
            SUM(Purchasepens + Purchasepens_transfer + way_last_month + Purchasepens_overseas + way_month + sales_pens + Initial_pen_count) AS Z
    FROM
        erp_data_warehouse.erp_Purchasepens
    GROUP BY SKU , WAREHOUSE_ID) B ON A.SKU = B.SKU
        AND A.WAREHOUSE_ID = B.WAREHOUSE_ID 
WHERE
    B.Z = 0
;

-- 插入盘盈,撤单入库,报损,扫描缺货单的数据
drop table if EXISTS erp_data_warehouse.erp_scrap_overage;
CREATE TABLE erp_data_warehouse.erp_scrap_overage (
    sku VARCHAR(50),
    ac_date DATE COMMENT '日期',
    Warehouse_scrap INT DEFAULT 0 COMMENT '报损/扫描缺货单',
    Warehouse_overage INT DEFAULT 0 COMMENT '盘盈/撤单入库'
);
create index erp_scrap_overage on erp_data_warehouse.erp_scrap_overage(sku);

-- 插入数据
insert into erp_data_warehouse.erp_scrap_overage
SELECT    products_sku AS sku,last_day(orders_record_time) AS ac_date,
          SUM(CASE WHEN orders_record_type IN (3 , 8) THEN orders_record_count ELSE 0 END) AS Warehouse_scrap,
          SUM(CASE WHEN orders_record_type IN (2 , 7,12) THEN orders_record_count ELSE 0 END) AS Warehouse_overage
FROM      erp_database_newest.erp_orders_record
WHERE     orders_record_type IN (3 , 2, 7, 8,12)
AND       orders_record_time >= '2017-07-01 00:00:00'
AND       orders_record_time <= '2017-10-31 23:59:59'
GROUP BY  products_sku,last_day(orders_record_time)
;  
*/
drop table if exists erp_data_warehouse.erp_sales_purchasepens_tmp;
CREATE TABLE erp_data_warehouse.erp_sales_purchasepens_tmp (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT DEFAULT 0 COMMENT '仓库ID',
    ac_date DATE COMMENT '日期',
    Final_pen_count INT DEFAULT 0 COMMENT '期末笔数',
    Sales_pens INT DEFAULT 0 COMMENT '销售笔数',
    Purchasepens_transfer INT DEFAULT 0 COMMENT '深圳仓库sku调出数据',
    way_last_month INT DEFAULT 0 COMMENT '上月在途数据',
    Warehouse_scrap INT DEFAULT 0 COMMENT '本仓库sku报废数据',
    Warehouse_overage INT DEFAULT 0 COMMENT '本仓库sku盘盈数据',
    Initial_pen_count INT DEFAULT 0 COMMENT '期初笔数',
    max_Purchasepens INT DEFAULT 0 COMMENT '最大采购数',
    Purchasepens_overseas INT DEFAULT 0 COMMENT '海外仓的调入数据',
    way_month INT DEFAULT 0 COMMENT '本月在途数据',
    stock_price DECIMAL(20 , 4 ) COMMENT '库存价格',
    difference INT DEFAULT 0 COMMENT '期末+出-期初-入的差值',
    KEY erp_sales_Purchasepens (sku , warehouse_id , ac_date) USING BTREE,
    KEY warehouse_id (warehouse_id) USING BTREE,
    KEY ac_date (ac_date) USING BTREE
);
-- 插入sku属于两个以上仓库的数据,盘盈报损等信息需要按照多个仓库分配,按需分配第一个,第二个仓库,第三个仓库全部分配,后面的仓库不分配
insert into erp_data_warehouse.erp_sales_purchasepens_tmp
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,0 as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,t1.Purchasepens_transfer as Purchasepens_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,t1.way_last_month as way_last_month -- 上月在途数据
		 ,0 as Warehouse_scrap -- 本仓库sku报废数据 
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据
         ,t1.Initial_pen_count AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,t1.Purchasepens as max_Purchasepens -- 最大的采购数量(海外仓没有采购)
		 ,t1.Purchasepens_overseas as Purchasepens_overseas -- 海外仓的调入数据
		 ,t1.way_month as way_month -- 本月在途数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_data_warehouse.erp_Purchasepens as t1
inner join(select sku,count(1) as zl
          from (select distinct sku,warehouse_id from erp_data_warehouse.erp_Purchasepens) m 
          group by sku) as t2
on        t1.sku = t2.sku
where     t2.zl >=3 
; 

-- 分配规则优先满足小的那个仓,销售+转出+上月在途 >= 期初+采购+调入+本月在途,期末=0
-- 若销售+转出+上月在途 >= 期初+采购+调入+本月在途+盘盈,则盘盈全部分配给小仓库
-- 若销售+转出+上月在途 < 期初+采购+调入+本月在途+盘盈,则盘盈 = 销售+转出+上月在途-(期初+采购+调入+本月在途)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    erp_data_warehouse.erp_scrap_overage AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Final_pen_count = 0,
    t1.Warehouse_overage = CASE
        WHEN Sales_pens + Purchasepens_transfer + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count + IFNULL(IFNULL(t3.Warehouse_overage, 0), 0) THEN IFNULL(IFNULL(t3.Warehouse_overage, 0), 0)
        ELSE (Sales_pens + Purchasepens_transfer + way_last_month) - (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count)
    END
WHERE
    t1.ac_date = '2017-07-31'
        AND Sales_pens + Purchasepens_transfer + way_last_month >= max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 分配规则优先满足小的那个仓,销售+转出+上月在途 < 期初+采购+调入+本月在途
-- 若销售+转出+上月在途+报损 < 期初+采购+调入+本月在途,则期末=0,报损=(期初+采购+调入+本月在途) - (销售+转出+上月在途)
-- 若销售+转出+上月在途+报损 <= 期初+采购+调入+本月在途,则期末=期初+采购+调入+本月在途 - (销售+转出+上月在途+报损),且报损全部分配给小仓库
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    erp_data_warehouse.erp_scrap_overage AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END,
    t1.Warehouse_scrap = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + way_last_month)
        ELSE IFNULL(t3.Warehouse_scrap, 0)
    END
WHERE
    t1.ac_date = '2017-07-31'
        AND Sales_pens + Purchasepens_transfer + way_last_month < max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 小仓库已经分配,现在开始分配最大的仓库(第二小仓库),销售+转出+上月在途 >= 期初+采购+调入+本月在途,期末=0
-- 若销售+转出+上月在途 >= 期初+采购+调入+本月在途+盘盈,则盘盈全部分配给小仓库
-- 若销售+转出+上月在途 < 期初+采购+调入+本月在途+盘盈,则盘盈 = 销售+转出+上月在途-(期初+采购+调入+本月在途)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MAX(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Final_pen_count = 0,
    t1.Warehouse_overage = CASE
        WHEN Sales_pens + Purchasepens_transfer + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count + IFNULL(t3.Warehouse_overage, 0) THEN IFNULL(t3.Warehouse_overage, 0)
        ELSE (Sales_pens + Purchasepens_transfer + way_last_month) - (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count)
    END
WHERE
    t1.ac_date = '2017-07-31'
        AND Sales_pens + Purchasepens_transfer + way_last_month >= max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 小仓库已经分配,现在开始分配最大的仓库(第二小仓库),销售+转出+上月在途 < 期初+采购+调入+本月在途
-- 若销售+转出+上月在途+报损 < 期初+采购+调入+本月在途,则期末=0,报损=(期初+采购+调入+本月在途) - (销售+转出+上月在途)
-- 若销售+转出+上月在途+报损 <= 期初+采购+调入+本月在途,则期末=期初+采购+调入+本月在途 - (销售+转出+上月在途+报损),且报损全部分配给小仓库
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MAX(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_data_warehouse.erp_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END,
    t1.Warehouse_scrap = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + way_last_month)
        ELSE IFNULL(t3.Warehouse_scrap, 0)
    END
WHERE
    t1.ac_date = '2017-07-31'
        AND Sales_pens + Purchasepens_transfer + way_last_month < max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 第二小的仓库(最大的仓库)全部分配,最后一个仓库不分配
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku, MIN(m1.warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp AS m1
    LEFT JOIN (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) m2 ON m1.sku = m2.sku
        AND m1.warehouse_id = m2.warehouse_id
    WHERE
        m2.warehouse_id IS NULL
    GROUP BY m1.sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            m1.Warehouse_scrap - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap,
            m1.Warehouse_overage - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Warehouse_scrap = IFNULL(t3.Warehouse_scrap, 0),
    t1.Warehouse_overage = IFNULL(t3.Warehouse_overage, 0),
    Final_pen_count = CASE
        WHEN (max_Purchasepens + Purchasepens_overseas + way_month + IFNULL(t3.Warehouse_overage, 0) + Initial_pen_count) <= (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month) THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + IFNULL(t3.Warehouse_overage, 0) + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END
WHERE
    t1.ac_date = '2017-07-31'
;

-- 不参与分配的仓推算其期末期初的数据
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + way_last_month + Warehouse_scrap > Initial_pen_count + max_Purchasepens + Purchasepens_overseas + way_month + Warehouse_overage THEN 0
        ELSE Initial_pen_count + max_Purchasepens + Purchasepens_overseas + way_month + Warehouse_overage - (Sales_pens + Purchasepens_transfer + way_last_month + Warehouse_scrap)
    END
WHERE
    t1.ac_date = '2017-07-31'
;

-- 把海外仓的本月的期末转换成为上月的期初
 SET @l=1;
 while @l<=3 do
 SELECT @loop_date_three:=last_day(DATE_add(DATE_FORMAt('2017-07-31','%Y-%m-%d'),INTERVAL @l month));
-- 修改本月期末为上月的期初
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_data_warehouse.erp_sales_purchasepens_tmp AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.ac_date = LAST_DAY(DATE_ADD(t2.ac_date, INTERVAL 1 MONTH)) 
SET 
    t1.Initial_pen_count = t2.Final_pen_count
WHERE
    t1.ac_date = @loop_date_three
;
-- 分配规则优先满足小的那个仓,销售+转出+上月在途 >= 期初+采购+调入+本月在途,期末=0
-- 若销售+转出+上月在途 >= 期初+采购+调入+本月在途+盘盈,则盘盈全部分配给小仓库
-- 若销售+转出+上月在途 < 期初+采购+调入+本月在途+盘盈,则盘盈 = 销售+转出+上月在途-(期初+采购+调入+本月在途)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    erp_data_warehouse.erp_scrap_overage AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Final_pen_count = 0,
    t1.Warehouse_overage = CASE
        WHEN Sales_pens + Purchasepens_transfer + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count + IFNULL(IFNULL(t3.Warehouse_overage, 0), 0) THEN IFNULL(IFNULL(t3.Warehouse_overage, 0), 0)
        ELSE (Sales_pens + Purchasepens_transfer + way_last_month) - (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count)
    END
WHERE
    t1.ac_date = @loop_date_three
        AND Sales_pens + Purchasepens_transfer + way_last_month >= max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 分配规则优先满足小的那个仓,销售+转出+上月在途 < 期初+采购+调入+本月在途
-- 若销售+转出+上月在途+报损 < 期初+采购+调入+本月在途,则期末=0,报损=(期初+采购+调入+本月在途) - (销售+转出+上月在途)
-- 若销售+转出+上月在途+报损 <= 期初+采购+调入+本月在途,则期末=期初+采购+调入+本月在途 - (销售+转出+上月在途+报损),且报损全部分配给小仓库
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    erp_data_warehouse.erp_scrap_overage AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END,
    t1.Warehouse_scrap = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + way_last_month)
        ELSE IFNULL(t3.Warehouse_scrap, 0)
    END
WHERE
    t1.ac_date = @loop_date_three
        AND Sales_pens + Purchasepens_transfer + way_last_month < max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 小仓库已经分配,现在开始分配最大仓库(第二小仓库),销售+转出+上月在途 >= 期初+采购+调入+本月在途,期末=0
-- 若销售+转出+上月在途 >= 期初+采购+调入+本月在途+盘盈,则盘盈全部分配给小仓库
-- 若销售+转出+上月在途 < 期初+采购+调入+本月在途+盘盈,则盘盈 = 销售+转出+上月在途-(期初+采购+调入+本月在途)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MAX(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_overage, 0) - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Final_pen_count = 0,
    t1.Warehouse_overage = CASE
        WHEN Sales_pens + Purchasepens_transfer + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count + IFNULL(t3.Warehouse_overage, 0) THEN IFNULL(t3.Warehouse_overage, 0)
        ELSE (Sales_pens + Purchasepens_transfer + way_last_month) - (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count)
    END
WHERE
    t1.ac_date = @loop_date_three
        AND Sales_pens + Purchasepens_transfer + way_last_month >= max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 小仓库已经分配,现在开始分配最大仓库(第二小仓库),销售+转出+上月在途 < 期初+采购+调入+本月在途
-- 若销售+转出+上月在途+报损 < 期初+采购+调入+本月在途,则期末=0,报损=(期初+采购+调入+本月在途) - (销售+转出+上月在途)
-- 若销售+转出+上月在途+报损 <= 期初+采购+调入+本月在途,则期末=期初+采购+调入+本月在途 - (销售+转出+上月在途+报损),且报损全部分配给小仓库
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MAX(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            IFNULL(m1.Warehouse_scrap, 0) - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap
    FROM
        erp_data_warehouse.erp_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku, ac_date, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END,
    t1.Warehouse_scrap = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + way_last_month)
        ELSE IFNULL(t3.Warehouse_scrap, 0)
    END
WHERE
    t1.ac_date = @loop_date_three
        AND Sales_pens + Purchasepens_transfer + way_last_month < max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 第二小仓库(最大的仓库)全部分配,最后一个仓库不分配
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        m1.sku, MIN(m1.warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp AS m1
    LEFT JOIN (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) m2 ON m1.sku = m2.sku
        AND m1.warehouse_id = m2.warehouse_id
    WHERE
        m2.warehouse_id IS NULL
    GROUP BY m1.sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            m1.Warehouse_scrap - IFNULL(m2.Warehouse_scrap, 0) AS Warehouse_scrap,
            m1.Warehouse_overage - IFNULL(m2.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m2 ON m1.sku = m2.sku
        AND m1.ac_date = m2.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Warehouse_scrap = IFNULL(t3.Warehouse_scrap, 0),
    t1.Warehouse_overage = IFNULL(t3.Warehouse_overage, 0),
    Final_pen_count = CASE
        WHEN (max_Purchasepens + Purchasepens_overseas + way_month + IFNULL(t3.Warehouse_overage, 0) + Initial_pen_count) <= (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month) THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + IFNULL(t3.Warehouse_overage, 0) + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END
WHERE
    t1.ac_date = @loop_date_three
;

-- 不参与分配的仓推算其期末期初的数据
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + way_last_month + Warehouse_scrap > Initial_pen_count + max_Purchasepens + Purchasepens_overseas + way_month + Warehouse_overage THEN 0
        ELSE Initial_pen_count + max_Purchasepens + Purchasepens_overseas + way_month + Warehouse_overage - (Sales_pens + Purchasepens_transfer + way_last_month + Warehouse_scrap)
    END
WHERE
    t1.ac_date = @loop_date_three
;
-- 循环加1
set @l=@l+1;
end WHILE;

-- 把处理完成的数据存入到目标表中,并删除tmp表中数据  创建最终存储数据的表 
drop table if exists erp_data_warehouse.erp_sales_purchasepens;
CREATE TABLE erp_data_warehouse.erp_sales_purchasepens (
    sku VARCHAR(50) COMMENT 'sku',
    warehouse_id INT DEFAULT 0 COMMENT '仓库ID',
    ac_date DATE COMMENT '日期',
    Final_pen_count INT DEFAULT 0 COMMENT '期末笔数',
    Sales_pens INT DEFAULT 0 COMMENT '销售笔数',
    Purchasepens_transfer INT DEFAULT 0 COMMENT '深圳仓库sku调出数据',
    way_last_month INT DEFAULT 0 COMMENT '上月在途数据',
    Warehouse_scrap INT DEFAULT 0 COMMENT '本仓库sku报废数据',
    Warehouse_overage INT DEFAULT 0 COMMENT '本仓库sku盘盈数据',
    Initial_pen_count INT DEFAULT 0 COMMENT '期初笔数',
    max_Purchasepens INT DEFAULT 0 COMMENT '最大采购数',
    Purchasepens_overseas INT DEFAULT 0 COMMENT '海外仓的调入数据',
    way_month INT DEFAULT 0 COMMENT '本月在途数据',
    stock_price DECIMAL(20 , 4 ) COMMENT '库存价格',
    difference INT DEFAULT 0 COMMENT '期末+出-期初-入的差值',
    KEY erp_sales_Purchasepens_01 (sku , warehouse_id , ac_date) USING BTREE,
    KEY warehouse_id_01 (warehouse_id) USING BTREE,
    KEY ac_date_01 (ac_date) USING BTREE
);
insert into erp_data_warehouse.erp_sales_purchasepens
select  * from erp_data_warehouse.erp_sales_purchasepens_tmp
;

-- 删除临时表的数据,存储下一个仓库的数据
  truncate table erp_data_warehouse.erp_sales_purchasepens_tmp;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Purchasepens_transfer + Warehouse_scrap + way_last_month - (Initial_pen_count + max_Purchasepens + Purchasepens_overseas + Warehouse_overage + way_month)
;

-- 插入sku属于两个仓库的数据,盘盈报损等信息需要按照两个仓库分配
insert into erp_data_warehouse.erp_sales_purchasepens_tmp
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,0 as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,t1.Purchasepens_transfer as Purchasepens_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,t1.way_last_month as way_last_month -- 上月在途数据
		 ,0 as Warehouse_scrap -- 本仓库sku报废数据 
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据
         ,t1.Initial_pen_count AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,t1.Purchasepens as max_Purchasepens -- 最大的采购数量(海外仓没有采购)
		 ,t1.Purchasepens_overseas as Purchasepens_overseas -- 海外仓的调入数据
		 ,t1.way_month as way_month -- 本月在途数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_data_warehouse.erp_Purchasepens as t1
inner join(select sku,count(1) as zl
          from (select distinct sku,warehouse_id from erp_data_warehouse.erp_Purchasepens) m 
          group by sku) as t2
on        t1.sku = t2.sku
where     t2.zl = 2  ; 

-- 分配规则优先满足小的那个仓,销售+转出+上月在途 >= 期初+采购+调入+本月在途,期末=0
-- 若销售+转出+上月在途 >= 期初+采购+调入+本月在途+盘盈,则盘盈全部分配给小仓库
-- 若销售+转出+上月在途 < 期初+采购+调入+本月在途+盘盈,则盘盈 = 销售+转出+上月在途-(期初+采购+调入+本月在途)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    erp_data_warehouse.erp_scrap_overage AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Final_pen_count = 0,
    t1.Warehouse_overage = CASE
        WHEN Sales_pens + Purchasepens_transfer + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count + IFNULL(t3.Warehouse_overage, 0) THEN IFNULL(t3.Warehouse_overage, 0)
        ELSE (Sales_pens + Purchasepens_transfer + way_last_month) - (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count)
    END
WHERE
    t1.ac_date = '2017-07-31'
        AND Sales_pens + Purchasepens_transfer + way_last_month >= max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 分配规则优先满足小的那个仓,销售+转出+上月在途 < 期初+采购+调入+本月在途
-- 若销售+转出+上月在途+报损 < 期初+采购+调入+本月在途,则期末=0,报损=(期初+采购+调入+本月在途) - (销售+转出+上月在途)
-- 若销售+转出+上月在途+报损 <= 期初+采购+调入+本月在途,则期末=期初+采购+调入+本月在途 - (销售+转出+上月在途+报损),且报损全部分配给小仓库
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    erp_data_warehouse.erp_scrap_overage AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END,
    t1.Warehouse_scrap = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + way_last_month)
        ELSE IFNULL(t3.Warehouse_scrap, 0)
    END
WHERE
    t1.ac_date = '2017-07-31'
        AND Sales_pens + Purchasepens_transfer + way_last_month < max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 小仓库已经分配,现在开始分配大仓库,大仓库分配的数量=总盘盈/报损的数量-小仓库分配的数量
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MAX(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            m1.Warehouse_scrap - IFNULL(m3.Warehouse_scrap, 0) AS Warehouse_scrap,
            m1.Warehouse_overage - IFNULL(m3.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m3 ON m1.sku = m3.sku
        AND m1.ac_date = m3.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Warehouse_scrap = IFNULL(t3.Warehouse_scrap, 0),
    t1.Warehouse_overage = IFNULL(t3.Warehouse_overage, 0),
    t1.Final_pen_count = CASE
        WHEN (max_Purchasepens + Purchasepens_overseas + way_month + IFNULL(t3.Warehouse_overage, 0) + Initial_pen_count) <= (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month) THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + IFNULL(t3.Warehouse_overage, 0) + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END
WHERE
    t1.ac_date = '2017-07-31'
;

-- 把海外仓的本月的期末转换成为上月的期初
 SET @k=1;
 while @k<=3 do
 SELECT @loop_date_two:=last_day(DATE_add(DATE_FORMAt('2017-07-31','%Y-%m-%d'),INTERVAL @k month));
-- 修改本月期末为上月的期初
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_data_warehouse.erp_sales_purchasepens_tmp AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.ac_date = LAST_DAY(DATE_ADD(t2.ac_date, INTERVAL 1 MONTH)) 
SET 
    t1.Initial_pen_count = t2.Final_pen_count
WHERE
    t1.ac_date = @loop_date_two
;
-- 分配规则优先满足小的那个仓,销售+转出+上月在途 >= 期初+采购+调入+本月在途,期末=0
-- 若销售+转出+上月在途 >= 期初+采购+调入+本月在途+盘盈,则盘盈全部分配给小仓库
-- 若销售+转出+上月在途 < 期初+采购+调入+本月在途+盘盈,则盘盈 = 销售+转出+上月在途-(期初+采购+调入+本月在途)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    erp_data_warehouse.erp_scrap_overage AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Final_pen_count = 0,
    t1.Warehouse_overage = CASE
        WHEN Sales_pens + Purchasepens_transfer + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count + IFNULL(t3.Warehouse_overage, 0) THEN IFNULL(t3.Warehouse_overage, 0)
        ELSE (Sales_pens + Purchasepens_transfer + way_last_month) - (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count)
    END
WHERE
    t1.ac_date = @loop_date_two
        AND Sales_pens + Purchasepens_transfer + way_last_month >= max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;

-- 分配规则优先满足小的那个仓,销售+转出+上月在途 < 期初+采购+调入+本月在途
-- 若销售+转出+上月在途+报损 < 期初+采购+调入+本月在途,则期末=0,报损=(期初+采购+调入+本月在途) - (销售+转出+上月在途)
-- 若销售+转出+上月在途+报损 <= 期初+采购+调入+本月在途,则期末=期初+采购+调入+本月在途 - (销售+转出+上月在途+报损),且报损全部分配给小仓库
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MIN(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    erp_data_warehouse.erp_scrap_overage AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END,
    t1.Warehouse_scrap = CASE
        WHEN Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month > max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count THEN (max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + way_last_month)
        ELSE IFNULL(t3.Warehouse_scrap, 0)
    END
WHERE
    t1.ac_date = @loop_date_two
        AND Sales_pens + Purchasepens_transfer + way_last_month < max_Purchasepens + Purchasepens_overseas + way_month + Initial_pen_count
;
-- 小仓库已经分配,现在开始分配大仓库,大仓库分配的数量=总盘盈/报损的数量-小仓库分配的数量
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    (SELECT 
        sku, MAX(warehouse_id) AS warehouse_id
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        LEFT JOIN
    (SELECT 
        m1.sku,
            m1.ac_date,
            m1.Warehouse_scrap - IFNULL(m3.Warehouse_scrap, 0) AS Warehouse_scrap,
            m1.Warehouse_overage - IFNULL(m3.Warehouse_overage, 0) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_scrap_overage AS m1
    LEFT JOIN (SELECT 
        sku,
            ac_date,
            SUM(Warehouse_scrap) AS Warehouse_scrap,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_data_warehouse.erp_sales_purchasepens_tmp
    GROUP BY sku , ac_date) AS m3 ON m1.sku = m3.sku
        AND m1.ac_date = m3.ac_date) AS t3 ON t1.sku = t3.sku
        AND t1.ac_date = t3.ac_date 
SET 
    t1.Warehouse_scrap = IFNULL(t3.Warehouse_scrap, 0),
    t1.Warehouse_overage = IFNULL(t3.Warehouse_overage, 0),
    t1.Final_pen_count = CASE
        WHEN (max_Purchasepens + Purchasepens_overseas + way_month + IFNULL(t3.Warehouse_overage, 0) + Initial_pen_count) <= (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month) THEN 0
        ELSE (max_Purchasepens + Purchasepens_overseas + way_month + IFNULL(t3.Warehouse_overage, 0) + Initial_pen_count) - (Sales_pens + Purchasepens_transfer + IFNULL(t3.Warehouse_scrap, 0) + way_last_month)
    END
WHERE
    t1.ac_date = @loop_date_two
;
-- 循环加1
set @k=@k+1;
end WHILE;

-- 把处理好的深圳仓数据存入到固定的表中,并删除tmp表中深圳仓的数据
insert into erp_data_warehouse.erp_sales_purchasepens
select  * from erp_data_warehouse.erp_sales_purchasepens_tmp
;

-- 删除临时表的数据,存储下一个仓库的数据
truncate table erp_data_warehouse.erp_sales_purchasepens_tmp;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Purchasepens_transfer + Warehouse_scrap + way_last_month - (Initial_pen_count + max_Purchasepens + Purchasepens_overseas + Warehouse_overage + way_month)
;

 -- 插入sku只属于一个仓库的数据,盘盈报损等信息不需要分配
insert into erp_data_warehouse.erp_sales_purchasepens_tmp
select   t1.sku
         ,t1.warehouse_id
		 ,t1.ac_date
		 ,0 as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,t1.Purchasepens_transfer as Purchasepens_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,t1.way_last_month as way_last_month -- 上月在途数据
		 ,ifnull(t3.Warehouse_scrap,0) as Warehouse_scrap -- 本仓库sku报废数据 
		 ,ifnull(ifnull(t3.Warehouse_overage,0),0) as Warehouse_overage  -- 本仓库sku盘盈数据
         ,t1.Initial_pen_count AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,t1.Purchasepens as max_Purchasepens -- 最大的采购数量(海外仓没有采购)
		 ,t1.Purchasepens_overseas as Purchasepens_overseas -- 海外仓的调入数据
		 ,t1.way_month as way_month -- 本月在途数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from     erp_data_warehouse.erp_Purchasepens as t1
inner join(select sku,count(1) as zl
          from (select distinct sku,warehouse_id from erp_data_warehouse.erp_Purchasepens) m 
          group by sku) as t2
on        t1.sku = t2.sku
left join erp_data_warehouse.erp_scrap_overage as t3
on        t1.sku = t3.sku
and       t1.ac_date = t3.ac_date
where     t2.zl = 1 
; 

-- 如果销售+调出+上月在途+报损 <= 采购+盘盈+转入+期初+本月在途 则期末=销售+调出+报损+上月在途-(采购+盘盈+期初+转入+本月在途) 否则,期末为0
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + Warehouse_scrap + way_last_month > max_Purchasepens + Warehouse_overage + Purchasepens_overseas + Initial_pen_count + way_month THEN 0
        ELSE (max_Purchasepens + Warehouse_overage + Purchasepens_overseas + Initial_pen_count + way_month) - (Sales_pens + Purchasepens_transfer + Warehouse_scrap + way_last_month)
    END
WHERE
    ac_date = '2017-07-31'
;

-- 把海外仓的本月的期末转换成为上月的期初
 SET @j=1;
 while @j<=3 do
 SELECT @loop_date:=last_day(DATE_add(DATE_FORMAt('2017-07-31','%Y-%m-%d'),INTERVAL @j month));
-- 修改本月期末为上月的期初
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1
        INNER JOIN
    erp_data_warehouse.erp_sales_purchasepens_tmp AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.ac_date = LAST_DAY(DATE_ADD(t2.ac_date, INTERVAL 1 MONTH)) 
SET 
    t1.Initial_pen_count = t2.Final_pen_count
WHERE
    t1.ac_date = @loop_date
;

-- 如果销售+调出+上月在途+报损 <= 采购+盘盈+转入+期初+本月在途 则期末=销售+调出+报损+上月在途-(采购+盘盈+期初+转入+本月在途) 否则,期末为0
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens_tmp AS t1 
SET 
    Final_pen_count = CASE
        WHEN Sales_pens + Purchasepens_transfer + Warehouse_scrap + way_last_month > max_Purchasepens + Warehouse_overage + Purchasepens_overseas + Initial_pen_count + way_month THEN 0
        ELSE (max_Purchasepens + Warehouse_overage + Purchasepens_overseas + Initial_pen_count + way_month) - (Sales_pens + Purchasepens_transfer + Warehouse_scrap + way_last_month)
    END
WHERE
    ac_date = @loop_date
;

-- 循环加1
set @j=@j+1;
end WHILE;

-- 把处理好的深圳仓数据存入到固定的表中,并删除tmp表中深圳仓的数据
insert into erp_data_warehouse.erp_sales_purchasepens
select  * from erp_data_warehouse.erp_sales_purchasepens_tmp
;

-- 删除临时表的数据,存储下一个仓库的数据
 truncate table erp_data_warehouse.erp_sales_purchasepens_tmp;

-- 校验数据是否正确
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_data_warehouse.erp_sales_purchasepens AS t1 
SET 
    t1.difference = Final_pen_count + Sales_pens + Purchasepens_transfer + Warehouse_scrap + way_last_month - (Initial_pen_count + max_Purchasepens + Purchasepens_overseas + Warehouse_overage + way_month)
;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_Purchase_amount
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_Purchase_amount`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_Purchase_amount`(
)
    SQL SECURITY INVOKER
BEGIN

-- 取得2015.1至2017.6月每个采购订单中的总数，用于平摊运费
drop table if EXISTS dd_cg_num;
CREATE TEMPORARY table dd_cg_num
SELECT pp.po_id,sum(pp.op_pro_count_op) as num
FROM erp_procurement_products_20171006 pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
WHERE po_times >='2014-08-01' 
and  po_times< '2017-07-01' 
GROUP BY pp.po_id;

CREATE INDEX a01 on dd_cg_num(po_id);

-- 删除原表数据，重新写入
truncate table erp_Purchase_amount;

INSERT into erp_Purchase_amount(orders_record_year,orders_record_month,procurement_warehouse_id,products_sku,je)
SELECT eor.orders_record_year,eor.orders_record_month,ep.procurement_warehouse_id,eor.products_sku,
/*sku入库总金额=入库数量*单价+运费(平均运费*入库数量)*/
sum(eor.orders_record_count*pp.op_pro_cost+(ep.po_shipping_fee/a.num)*eor.orders_record_count) as je
FROM (select po_id,op_pro_sku,max(op_pro_cost) as op_pro_cost from erp_procurement_products_20171006 GROUP BY po_id,op_pro_sku) as pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
-- LEFT JOIN  erp_procurement_arrivel pa ON pa.erp_procurement_id = pp.po_id AND pa.arrival_sku = pp.op_pro_sku 
left join erp_orders_record eor on eor.products_sku=pp.op_pro_sku and eor.procurement_id =pp.po_id
LEFT JOIN dd_cg_num a on a.po_id=ep.po_id
WHERE ((mustFollowing = 0 and ep.arrival_is_end = 1) or po_status=6) and has_new_arrival = 0 and po_status >= 2 
and orders_record_type in (1,9) 
and orders_record_time >='2015-01-01' 
and  orders_record_time< '2017-07-01' 
GROUP BY eor.orders_record_year,orders_record_month,eor.products_sku,ep.procurement_warehouse_id;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_purchase_amount_details
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_purchase_amount_details`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_purchase_amount_details`(
)
    SQL SECURITY INVOKER
BEGIN

-- 取得2015.1至2017.6月每个采购订单中的总数，用于平摊运费
drop table if EXISTS dd_cg_num;
CREATE TEMPORARY table dd_cg_num
SELECT pp.po_id,sum(pp.op_pro_count_op) as num
FROM erp_procurement_products_20171006 pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
WHERE po_times >='2014-08-01' 
and  po_times< '2017-10-01' 
GROUP BY pp.po_id;

CREATE INDEX a01 on dd_cg_num(po_id);
-- 删除原数据，重新写入
truncate table erp_purchase_amount_details;

INSERT into erp_purchase_amount_details(orders_record_year,orders_record_month,orders_record_time,procurement_warehouse_id,products_sku,orders_record_count,
op_pro_count_op,op_pro_cost,Average_fee,rk_je,po_shipping_fee,num_total,procurement_id)
SELECT eor.orders_record_year,eor.orders_record_month,eor.orders_record_time,ep.procurement_warehouse_id,eor.products_sku,
eor.orders_record_count,pp.op_pro_count_op,pp.op_pro_cost,ep.po_shipping_fee/a.num as Average_fee,
/*sku入库总金额=入库数量*单价+运费(平均运费*入库数量)*/
eor.orders_record_count*pp.op_pro_cost+(ep.po_shipping_fee/a.num)*eor.orders_record_count as rk_je
,ep.po_shipping_fee,a.num as num_total,eor.procurement_id
FROM (select po_id,op_pro_sku,SUM(op_pro_count_op) as op_pro_count_op,max(op_pro_cost) as op_pro_cost from erp_procurement_products_20171006 GROUP BY po_id,op_pro_sku) as pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
-- LEFT JOIN  erp_procurement_arrivel pa ON pa.erp_procurement_id = pp.po_id AND pa.arrival_sku = pp.op_pro_sku 
left join erp_orders_record eor on eor.products_sku=pp.op_pro_sku and eor.procurement_id =pp.po_id
LEFT JOIN dd_cg_num a on a.po_id=ep.po_id
WHERE ((mustFollowing = 0 and ep.arrival_is_end = 1) or po_status=6) and has_new_arrival = 0 and po_status >= 2 
and orders_record_type in (1,9) 
and orders_record_time >='2015-01-01' 
and  orders_record_time< '2017-10-01';

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_purchase_amount_details_gys
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_purchase_amount_details_gys`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_purchase_amount_details_gys`(
)
    SQL SECURITY INVOKER
BEGIN

-- 取得2015.1至2017.6月每个采购订单中的总数，用于平摊运费
drop table if EXISTS dd_cg_num;
CREATE TEMPORARY table dd_cg_num
SELECT pp.po_id,sum(pp.op_pro_count_op) as num
FROM erp_procurement_products_20171006 pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
WHERE po_times >='2014-05-01' 
and  po_times< '2017-10-01' 
GROUP BY pp.po_id;

drop table if EXISTS dd_cg_mx;
CREATE TEMPORARY table dd_cg_mx
select po_id,op_pro_sku,SUM(op_pro_count_op) as op_pro_count_op,max(op_pro_cost) as op_pro_cost 
from erp_procurement_products_20171006 GROUP BY po_id,op_pro_sku;

-- 补充20171006之后数据
INSERT into dd_cg_num
SELECT pp.po_id,sum(pp.op_pro_count_op) as num
FROM erp_procurement_products pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
WHERE pp.op_pro_id>2583788
GROUP BY pp.po_id;

INSERT into dd_cg_mx
select po_id,op_pro_sku,SUM(op_pro_count_op) as op_pro_count_op,max(op_pro_cost) as op_pro_cost 
from erp_procurement_products
WHERE op_pro_id>2583788
GROUP BY po_id,op_pro_sku;

CREATE INDEX a01 on dd_cg_num(po_id);
CREATE INDEX a01 on dd_cg_mx(po_id,op_pro_sku);
-- 删除原数据，重新写入
truncate table erp_purchase_amount_details_gys;

INSERT into erp_purchase_amount_details_gys(orders_record_year,orders_record_month,orders_record_time,procurement_warehouse_id,products_sku,orders_record_count,
op_pro_count_op,op_pro_cost,Average_fee,rk_je,po_shipping_fee,num_total,procurement_id,supplierID)
SELECT eor.orders_record_year,eor.orders_record_month,eor.orders_record_time,ep.procurement_warehouse_id,eor.products_sku,
eor.orders_record_count,pp.op_pro_count_op,pp.op_pro_cost,ep.po_shipping_fee/a.num as Average_fee,
/*sku入库总金额=入库数量*单价+运费(平均运费*入库数量)*/
eor.orders_record_count*pp.op_pro_cost+(ep.po_shipping_fee/a.num)*eor.orders_record_count as rk_je
,ep.po_shipping_fee,a.num as num_total,eor.procurement_id,eor.supplierID
FROM dd_cg_mx as pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
-- LEFT JOIN  erp_procurement_arrivel pa ON pa.erp_procurement_id = pp.po_id AND pa.arrival_sku = pp.op_pro_sku 
left join erp_orders_record eor on eor.procurement_id =pp.po_id and eor.products_sku=pp.op_pro_sku
LEFT JOIN dd_cg_num a on a.po_id=ep.po_id
WHERE ((mustFollowing = 0 and ep.arrival_is_end = 1) or po_status=6) and has_new_arrival = 0 and po_status >= 2 
and orders_record_type in (1,9) 
and orders_record_time >='2015-01-01'
and orders_record_from in('采购入库','特采入库');

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_purchase_amount_details_gys_10mon_after
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_purchase_amount_details_gys_10mon_after`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_purchase_amount_details_gys_10mon_after`(
)
    SQL SECURITY INVOKER
BEGIN
-- 取得2015.1至2017.6月每个采购订单中的总数，用于平摊运费
drop table if EXISTS dd_cg_num;
CREATE TEMPORARY table dd_cg_num
SELECT pp.po_id,sum(pp.op_pro_count_op) as num
FROM erp_procurement_products pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
WHERE po_times >='2014-05-01'
GROUP BY pp.po_id;

CREATE INDEX a01 on dd_cg_num(po_id);
-- 删除原数据，重新写入
-- truncate table erp_purchase_amount_details_gys;

INSERT into erp_purchase_amount_details_gys(orders_record_year,orders_record_month,orders_record_time,procurement_warehouse_id,products_sku,orders_record_count,
op_pro_count_op,op_pro_cost,Average_fee,rk_je,po_shipping_fee,num_total,procurement_id,supplierID)
SELECT eor.orders_record_year,eor.orders_record_month,eor.orders_record_time,ep.procurement_warehouse_id,eor.products_sku,
eor.orders_record_count,pp.op_pro_count_op,pp.op_pro_cost,ep.po_shipping_fee/a.num as Average_fee,
/*sku入库总金额=入库数量*单价+运费(平均运费*入库数量)*/
eor.orders_record_count*pp.op_pro_cost+(ep.po_shipping_fee/a.num)*eor.orders_record_count as rk_je
,ep.po_shipping_fee,a.num as num_total,eor.procurement_id,eor.supplierID
FROM (select po_id,op_pro_sku,SUM(op_pro_count_op) as op_pro_count_op,max(op_pro_cost) as op_pro_cost from erp_procurement_products GROUP BY po_id,op_pro_sku) as pp
LEFT JOIN erp_procurement ep ON ep.po_id = pp.po_id
-- LEFT JOIN  erp_procurement_arrivel pa ON pa.erp_procurement_id = pp.po_id AND pa.arrival_sku = pp.op_pro_sku 
left join erp_orders_record eor on eor.products_sku=pp.op_pro_sku and eor.procurement_id =pp.po_id
LEFT JOIN dd_cg_num a on a.po_id=ep.po_id
WHERE ((mustFollowing = 0 and ep.arrival_is_end = 1) or po_status=6) and has_new_arrival = 0 and po_status >= 2 
and orders_record_type in (1,9) 
and orders_record_time >='2017-12-24' 
and orders_record_from in('采购入库','特采入库');

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_sales_Purchasepens
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_sales_Purchasepens`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_sales_Purchasepens`(
)
    SQL SECURITY INVOKER
BEGIN
-- 创建表
drop table if exists erp_database_newest.erp_sales_purchasepens;
CREATE TABLE erp_database_newest.erp_sales_purchasepens (
    `sku` VARCHAR(50)  COMMENT 'sku',
    `warehouse_id` INT DEFAULT 0 COMMENT '仓库ID',
    `month` INT(11) DEFAULT 0 COMMENT '月份',
    `year` CHAR(4)  COMMENT '年份',
    `Final_pen_count` INT(11) DEFAULT 0 COMMENT '期末笔数',
    `Sales_pens` INT(11) DEFAULT 0 COMMENT '销售笔数',
    `Warehouse_transfer` INT(11) DEFAULT 0 COMMENT '深圳仓库sku调出数据(深圳仓调出海外仓)',
    `Warehouse_scrap` INT(11) DEFAULT 0 COMMENT '本仓库sku报废数据',
    `Purchasepens` INT(11) DEFAULT 0 COMMENT '采购笔数,分服务器时的采购笔数_0',
    `Warehouse_overage` INT(11) DEFAULT 0 COMMENT '本仓库sku盘盈数据',
    `Initial_pen_count` INT(11) DEFAULT 0 COMMENT '期初笔数',
    `max_Purchasepens` INT(11) DEFAULT 0 COMMENT '最大采购数',
    `stock_price` DECIMAL(20 , 4 )  COMMENT '库存价格',
    `difference` INT(11) DEFAULT 0 COMMENT '期末+出-期初-入的差值',
    KEY `erp_sales_Purchasepens` (`sku` , `warehouse_id` , `year` , `month`) USING BTREE,
    KEY `warehouse_id` (`warehouse_id`) USING BTREE,
    KEY `month` (`month`) USING BTREE,
    KEY `year` (`year`) USING BTREE
);
-- 插入2017年的数据     
insert into erp_database_newest.erp_sales_Purchasepens
select   t1.sku
         ,t1.warehouse_id
		 ,t1.month  as month
         ,t1.year  as year  -- @yy
		 ,ifnull(t1.stock_number,0) as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,ifnull(t1.Purchasepens_count_transfer,0) as Warehouse_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,0 as Warehouse_scrap     -- 本仓库sku报废数据 ifnull(t4.other_out_Share_num,0) 
		 ,0 AS Purchasepens -- 采购笔数
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据 ifnull(t4.other_in_Share_num,0)
         ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,ifnull(t1.Purchasepens_count,0)  as max_Purchasepens -- 最大的采购数量,其中如果是深圳仓调入海外仓,则此部分数据为海外仓采购数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from      erp_database_newest.erp_Purchasepens_count as t1
-- where     t1.year = '2017' and t1.month in (1,2,3,4,5,6)
;

 
-- 存储库存数据,根据库存数据推算盘盈,撤单入库和报损,扫描缺货单
drop table if EXISTS erp_database_newest.erp_calculation_stock_in_out;
CREATE TABLE erp_database_newest.erp_calculation_stock_in_out (
    sku VARCHAR(50),
    warehouse_id INT,
    month INT,
    year CHAR(5),
    stock_in INT,
    stock_out INT
);
create index erp_calculation_sales on erp_database_newest.erp_calculation_stock_in_out(sku,warehouse_id);
insert into erp_database_newest.erp_calculation_stock_in_out
select     t2.products_sku as sku,t2.product_warehouse_id as warehouse_id
	       ,date_format(t1.operate_time,'%m') AS month,date_format(t1.operate_time,'%Y') AS Year
           ,sum(ifnull(case when t1.operate_type = 'in' then t1.operate_count else 0 end,0) ) as stock_in
           ,sum(ifnull(case when t1.operate_type = 'out' then t1.operate_count else 0 end,0) ) as stock_out
from       erp_database_newest.erp_stock_detail_operate_record_detail as t1
inner join erp_database_newest.erp_products_data    as t2
on         t1.product_id = t2.products_id
where      t1.operate_time >= '2015-01-01 00:00:00'
and        t1.operate_time <= '2017-06-30 23:59:59'
group by   t2.products_sku,t2.product_warehouse_id
	       ,date_format(t1.operate_time,'%Y'),date_format(t1.operate_time,'%m')
;

-- 插入盘盈,撤单入库,报损,扫描缺货单的数据
drop table if EXISTS erp_database_newest.erp_calculation_scrap_overage;
CREATE TABLE erp_database_newest.erp_calculation_scrap_overage (
    sku VARCHAR(50),
    month INT,
    year CHAR(5),
    Warehouse_scrap INT DEFAULT 0 COMMENT '报损/撤单入库',
    Warehouse_overage INT DEFAULT 0 COMMENT '报损/撤单入库'
);
create index erp_calculation_scrap_overage on erp_database_newest.erp_calculation_scrap_overage(sku);

-- 插入数据
insert into erp_database_newest.erp_calculation_scrap_overage
SELECT    products_sku AS sku,
          DATE_FORMAT(orders_record_time, '%m') AS month,
          DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
          SUM(CASE WHEN orders_record_type IN (3 , 8) THEN orders_record_count ELSE 0 END) AS Warehouse_scrap,
          SUM(CASE WHEN orders_record_type IN (2 , 7) THEN orders_record_count ELSE 0 END) AS Warehouse_overage
FROM      erp_database_newest.erp_orders_record
WHERE     orders_record_type IN (3 , 2, 7, 8)
AND       orders_record_time >= '2015-01-01 00:00:00'
AND       orders_record_time <= '2017-06-30 23:59:59'
GROUP BY  products_sku,DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')
;

-- 根据差值分配盘盈和报损,扫描缺货单
-- 如果本月进入的数据-采购>=盘盈,则不分配,盘盈全部进入此月信息,但是只进入一个仓库(优先分配给取小的)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = t3.Warehouse_overage
WHERE
    t2.stock_in - t1.max_Purchasepens >= t3.Warehouse_overage
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果一个仓,则全部分配
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = t3.Warehouse_overage
WHERE
    t2.stock_in - t1.max_Purchasepens < t3.Warehouse_overage
        AND t4.mmm = 1
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果2个仓,则先满足小的那个,大的那个用剩余值-小的那个
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = (CASE
        WHEN t2.stock_in - t1.max_Purchasepens < 0 THEN 0
        ELSE t2.stock_in - t1.max_Purchasepens
    END)
WHERE
    t2.stock_in - t1.max_Purchasepens < t3.Warehouse_overage
        AND t4.mmm >= 2
;

-- 检查上一步中两个值加起来是否为其盘盈,如果不是,更改大的那个仓库(更改方式是用总数-小仓库号的那个),如果是,则不用管
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            COUNT(DISTINCT warehouse_id) AS mmm,
            MAX(warehouse_id) AS warehouse_id_max
    FROM
        erp_database_newest.erp_sales_Purchasepens
    WHERE
        Warehouse_overage > 0
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        AND t1.warehouse_id = t4.warehouse_id_max
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t5 ON t3.sku = t5.sku AND t3.month = t5.month
        AND t3.year = t5.year
        LEFT JOIN
    (SELECT 
        z1.sku,
            z1.month,
            z1.year,
            SUM(z1.Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_sales_Purchasepens AS z1
    LEFT JOIN (SELECT 
        MAX(warehouse_id) AS warehouse_id, sku, month, year
    FROM
        erp_database_newest.erp_sales_Purchasepens
    WHERE
        Warehouse_overage > 0
    GROUP BY sku , month , year) AS z2 ON z1.sku = z2.sku AND z1.month = z2.month
        AND z1.year = z2.year
        AND z1.warehouse_id = z2.warehouse_id
    WHERE
        z2.sku IS NULL
    GROUP BY z1.sku , z1.month , z1.year) AS t6 ON t1.sku = t6.sku AND t1.month = t6.month
        AND t1.year = t6.year 
SET 
    T1.Warehouse_overage = (CASE
        WHEN t3.Warehouse_overage - t6.Warehouse_overage < 0 THEN 0
        ELSE t3.Warehouse_overage - t6.Warehouse_overage
    END)
WHERE
    t4.mmm >= 2
        AND t3.Warehouse_overage <> t5.Warehouse_overage
;

-- 目前一个sku有三个仓库的情况只有一个,所以暂时不考虑

UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer >= t3.Warehouse_scrap
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果一个仓,则全部分配
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < t3.Warehouse_scrap
        AND t4.mmm = 1
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果2个仓,则先满足小的那个,大的那个用剩余值-小的那个
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = (CASE
        WHEN t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < 0 THEN 0
        ELSE t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer
    END)
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < t3.Warehouse_scrap
        AND t4.mmm >= 2
;

-- 检查上一步中两个值加起来是否为其报损,如果不是,更改大的那个仓库(更改方式是用总数-小仓库号的那个),如果是,则不用管
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            COUNT(DISTINCT warehouse_id) AS mmm,
            MAX(warehouse_id) AS warehouse_id_max
    FROM
        erp_database_newest.erp_sales_Purchasepens
    WHERE
        Warehouse_scrap > 0
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        AND t1.warehouse_id = t4.warehouse_id_max
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year
        INNER JOIN
    (SELECT 
        sku, month, year, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t5 ON t3.sku = t5.sku AND t3.month = t5.month
        AND t3.year = t5.year
        LEFT JOIN
    (SELECT 
        z1.sku,
            z1.month,
            z1.year,
            SUM(z1.Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_sales_Purchasepens AS z1
    LEFT JOIN (SELECT 
        MAX(warehouse_id) AS warehouse_id, sku, month, year
    FROM
        erp_database_newest.erp_sales_Purchasepens
    WHERE
        Warehouse_scrap > 0
    GROUP BY sku , month , year) AS z2 ON z1.sku = z2.sku AND z1.month = z2.month
        AND z1.year = z2.year
        AND z1.warehouse_id = z2.warehouse_id
    WHERE
        z2.sku IS NULL
    GROUP BY z1.sku , z1.month , z1.year) AS t6 ON t1.sku = t6.sku AND t1.month = t6.month
        AND t1.year = t6.year 
SET 
    T1.Warehouse_scrap = (CASE
        WHEN t3.Warehouse_scrap - t6.Warehouse_scrap < 0 THEN 0
        ELSE t3.Warehouse_scrap - t6.Warehouse_scrap
    END)
WHERE
    t4.mmm >= 2
        AND t3.Warehouse_scrap <> t5.Warehouse_scrap
;

-- -- 更改盘亏数据
-- UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
--         INNER JOIN
--     (SELECT 
--         products_sku AS sku,
--             orders_record_count,
--             orders_record_year AS year,
--             orders_record_month AS month,
--             owned_warehouse AS warehouse_id
--     FROM
--         erp_database_newest.erp_orders_record_out
--     WHERE
--         orders_record_type = 3) AS t2 ON t1.sku = t2.sku
--         AND t1.warehouse_id = t2.warehouse_id
--         AND t1.year = t2.year
--         AND t1.month = t2.month 
-- SET 
--     t1.Warehouse_scrap = t1.Warehouse_scrap + IFNULL(t2.orders_record_count, 0)
-- ;

UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage),
    difference = 0
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) >= 0
;

-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈小于0 ,此时期初=0,此时不存在差值
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    Initial_pen_count = 0,
    difference = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) < 0
;

-- 更改本月期末为上月期初的数据
 SET @i=6;
  while @i>=1 do
 -- 更改本月的期末为上月的期初
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_sales_Purchasepens AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = (t2.month - 1)  
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.month = @i 
;
-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈大于0 ,此时期初=期末+销售+调出-采购,此时不存在差值
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage),
    difference = 0
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) >= 0
        AND month = @i
;

-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈小于0 ,此时期初=0,此时不存在差值
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    Initial_pen_count = 0,
    difference = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) < 0
        AND month = @i
;
 set @i=@i-1;
  end while;
   
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_sales_Purchasepens_2016
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_sales_Purchasepens_2016`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_sales_Purchasepens_2016`(
)
    SQL SECURITY INVOKER
BEGIN
--  整合销售数据
 drop table if EXISTS erp_database_newest.erp_calculation_sales_2016;
 create TEMPORARY table erp_database_newest.erp_calculation_sales_2016(
   sku varchar(50),
   warehouse_id int ,
   month int,
   year char(5),
   sales_pens int
   );
 create index erp_calculation_sales_2016 on erp_database_newest.erp_calculation_sales_2016(sku,warehouse_id);
 
 insert into erp_database_newest.erp_calculation_sales_2016
 select    sku,warehouse_id,month,t1.year as year,sales_pens
 from      (select real_sku as sku,warehouse_id,month,year,sum(ifnull(count_real,0) + ifnull(count,0))  as sales_pens
 		  from   erp_database_newest.erp_calculation_sku_sales where year <> '2017'
 		  group by real_sku,warehouse_id,month,year    -- 国内销售
         union all
           select  productSKU as sku,warehouse_id,month,year ,sum(ifnull(orders_num,0)) as sales_pens
           from    erp_database_newest.erp_sales_overseas
           where   part = 3  and year <> '2017' -- 海外销售
           group by productSKU,warehouse_id,month ,year 
           )  as t1
 ;
-- 期末数据可以直接从2017年中取
-- 新建目标表,存储2016年相关数据
drop table if EXISTS erp_database_newest.erp_sales_purchasepens_2016;
CREATE TABLE erp_database_newest.erp_sales_purchasepens_2016 (
    `sku` VARCHAR(50) DEFAULT '' COMMENT 'sku',
    `warehouse_id` INT(11) DEFAULT NULL COMMENT '仓库ID',
    `month` INT(11) DEFAULT NULL COMMENT '月份',
    `year` CHAR(4) DEFAULT '2016' COMMENT '年份',
    `Final_pen_count` INT(11) DEFAULT '0' COMMENT '期末笔数',
    `Sales_pens` INT(11) DEFAULT '0' COMMENT '销售笔数',
    `Warehouse_transfer` INT(11) DEFAULT '0' COMMENT '深圳仓库sku调出数据(深圳仓调出海外仓)',
    `Warehouse_scrap` INT(11) DEFAULT '0' COMMENT '本仓库sku报废数据',
    `Warehouse_overage` INT(11) DEFAULT '0' COMMENT '本仓库sku盘盈数据',
    `Initial_pen_count` INT(11) DEFAULT '0' COMMENT '期初笔数',
    `max_Purchasepens` INT(11) DEFAULT '0' COMMENT '最大采购数',
    `stock_price` DECIMAL(20 , 4 ) DEFAULT NULL COMMENT '库存价格',
    `difference` INT(11) DEFAULT '0' COMMENT '期末+出-期初-入的差值',
    KEY `erp_sales_purchasepens_2016` (`sku` , `warehouse_id`)
);
-- 插入数据2016年数据
insert into erp_database_newest.erp_sales_purchasepens_2016
select    t1.sku
          ,t1.warehouse_id
		  ,t1.month  as month
          ,t1.year  as year 
		  ,case when t1.month = 12 and t1.year = '2016' then ifnull(t3.Initial_pen_count,0) else 0 end as Final_pen_count  -- 期末笔数
          ,ifnull(t2.Sales_pens,0)  as Sales_pens -- 销售笔数
		  ,ifnull(t1.Purchasepens_count_transfer,0) as Warehouse_transfer -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		  ,ifnull(t4.other_out_Share_num,0) + ifnull(t4.scan_orders_Share_num,0)as Warehouse_scrap -- 本仓库sku报废数据(报废数据+扫入缺货单)
		  ,ifnull(t4.other_in_Share_num,0) + ifnull(t4.Cancel_orders_Share_num,0) as Warehouse_overage -- 本仓库sku盘盈数据(盘盈数据+撤单入库数据)
		  ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		  ,ifnull(t1.Purchasepens_count,0)  as max_Purchasepens  -- 最大的采购数量
		  ,0 as stock_price -- 库存价格
		  ,0 as difference -- 差额 期末+出 - (期初+入)的差值
from      erp_database_newest.erp_Purchasepens_count as t1 -- 采购数据,有每个月的采购数据,如果当月没有采购,则补0
left join erp_database_newest.erp_calculation_sales_2016 as t2
on        t1.sku = t2.sku
and       t1.warehouse_id = t2.warehouse_id
and       t1.month = t2.month
and       t1.year = t2.year
left join erp_database_newest.erp_sales_purchasepens_2017 as t3
on        t1.sku = t3.sku
and       t1.warehouse_id = t3.warehouse_id
and       t3.year = '2017' 
and       t3.month = 1
left join erp_database_newest.erp_transfer_other_hz_2016 as t4
on        t1.sku = t4.sku
and       t1.warehouse_id = t4.warehouse_id
and       t1.month = t4.month
and       t1.year = t4.year
where     t1.year in ('2016','2015') 
;

-- 更改盘亏数据
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens_2016 AS t1
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            orders_record_count,
            orders_record_year AS year,
            orders_record_month AS month,
            owned_warehouse AS warehouse_id
    FROM
        erp_database_newest.erp_orders_record_out
    WHERE
        orders_record_type = 3) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.year = t2.year
        AND t1.month = t2.month 
SET 
    t1.Warehouse_scrap = t1.Warehouse_scrap + IFNULL(t2.orders_record_count, 0)
;

-- 如果期末 + 销售 + 转出 + 报废 -最大采购数 - 盘盈 >=0,则最大采购全部分给1.0,期初=期末 + 销售 + 转出 + 报废 - 最大采购数 - 盘盈
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage >= 0
;

-- 如果期末 + 销售 + 转出 + 报废 -最大采购数 - 盘盈 < 0,则分配一部分给1.0,其中期初默认为0,分配给1.0的数据为=期末 + 销售 + 转出 + 报废 - 盘盈
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage < 0
;

-- 本月的期初为上月的期末
 SET @m=23;
 while @m>=1 do
-- 设置参数,使日期从2016年12开始跑到2015年7月份
 set @yy=case when @m>12 then '2016' else '2015' end;
 set @mm=case when @m>12 then (@m-12) else @m end;
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016 AS t1
        INNER JOIN
    erp_database_newest.erp_sales_purchasepens_2016 AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND CASE
        WHEN @m = 12 THEN '2016'
        ELSE t1.year
    END = t2.year
        AND t1.month = CASE
        WHEN @m = 12 THEN (t2.month + 11)
        ELSE (t2.month - 1)
    END 
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.month = @mm AND t1.year = @yy
;
-- 如果期末 + 销售 + 转出 + 报废 -最大采购数 - 盘盈 >=0,则最大采购全部分给1.0,期初=期末 + 销售 + 转出 + 报废 - 最大采购数 - 盘盈
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage >= 0
        AND year = @yy
        AND month = @mm
;

-- 如果期末 + 销售 + 转出 + 报废 -最大采购数 - 盘盈 < 0,则分配一部分给1.0,其中期初默认为0,分配给1.0的数据为=期末 + 销售 + 转出 + 报废
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage < 0
        AND year = @yy
        AND month = @mm
;
 set @m=@m-1;
 end while;
 -- 校验数据
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016 
SET 
    difference = Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - Warehouse_overage - Initial_pen_count - max_Purchasepens
;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_sales_Purchasepens_2016_xb
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_sales_Purchasepens_2016_xb`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_sales_Purchasepens_2016_xb`(
)
    SQL SECURITY INVOKER
BEGIN
--  整合销售数据
 drop table if EXISTS erp_database_newest.erp_calculation_sales_2016_xb;
CREATE TABLE erp_database_newest.erp_calculation_sales_2016_xb (
    sku VARCHAR(50),
    warehouse_id INT,
    month INT,
    year CHAR(5),
    sales_pens INT
);
 create index erp_calculation_sales_2016_xb on erp_database_newest.erp_calculation_sales_2016_xb(sku,warehouse_id);
 
 insert into erp_database_newest.erp_calculation_sales_2016_xb
 select    sku,warehouse_id,month,t1.year as year,sales_pens
 from      (select real_sku as sku,warehouse_id,month,year,sum(ifnull(count_real,0) + ifnull(count,0))  as sales_pens
 		  from   erp_database_newest.erp_calculation_sku_sales where year <> '2017'
 		  group by real_sku,warehouse_id,month,year    -- 国内销售
         union all
           select  productSKU as sku,warehouse_id,month,year ,sum(ifnull(orders_num,0)) as sales_pens
           from    erp_database_newest.erp_sales_overseas
           where   part = 3  and year <> '2017' -- 海外销售
           group by productSKU,warehouse_id,month ,year 
           )  as t1
 ;
-- 期末数据可以直接从2017年中取
-- 新建目标表,存储2016年相关数据
drop table if EXISTS erp_database_newest.erp_sales_purchasepens_2016_xb;
CREATE TABLE erp_database_newest.erp_sales_purchasepens_2016_xb (
    `sku` VARCHAR(50) DEFAULT '' COMMENT 'sku',
    `warehouse_id` INT(11) DEFAULT NULL COMMENT '仓库ID',
    `month` INT(11) DEFAULT NULL COMMENT '月份',
    `year` CHAR(4) DEFAULT '2016' COMMENT '年份',
    `Final_pen_count` INT(11) DEFAULT '0' COMMENT '期末笔数',
    `Sales_pens` INT(11) DEFAULT '0' COMMENT '销售笔数',
    `Warehouse_transfer` INT(11) DEFAULT '0' COMMENT '深圳仓库sku调出数据(深圳仓调出海外仓)',
    `Warehouse_scrap` INT(11) DEFAULT '0' COMMENT '本仓库sku报废数据',
    `Purchasepens` INT(11) DEFAULT '0' COMMENT '采购笔数,分服务器时的采购笔数_0',
    `Warehouse_overage` INT(11) DEFAULT '0' COMMENT '本仓库sku盘盈数据',
    `Initial_pen_count` INT(11) DEFAULT '0' COMMENT '期初笔数',
    `max_Purchasepens` INT(11) DEFAULT '0' COMMENT '最大采购数',
    `stock_price` DECIMAL(20 , 4 ) DEFAULT NULL COMMENT '库存价格',
    `difference` INT(11) DEFAULT '0' COMMENT '期末+出-期初-入的差值',
    KEY `erp_sales_purchasepens_2016_xb` (`sku` , `warehouse_id`)
);
-- 插入数据2016年数据
insert into erp_database_newest.erp_sales_purchasepens_2016_xb
select    t1.sku
          ,t1.warehouse_id
		  ,t1.month  as month
          ,t1.year  as year 
		  ,case when t3.month = 1 then ifnull(t3.Initial_pen_count,0) else 0 end as Final_pen_count  -- 期末笔数
          ,ifnull(t2.Sales_pens,0)  as Sales_pens -- 销售笔数
		  ,ifnull(t1.Purchasepens_count_transfer,0) as Warehouse_transfer -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		  ,0 as Warehouse_scrap -- 本仓库sku报废数据(报废数据+扫入缺货单)
		  ,0 as Purchasepens  -- 分配给1.0的数据
		  ,0 as Warehouse_overage -- 本仓库sku盘盈数据(盘盈数据+撤单入库数据)
		  ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		  ,ifnull(t1.Purchasepens_count,0)  as max_Purchasepens  -- 最大的采购数量
		  ,0 as stock_price -- 库存价格
		  ,0 as difference -- 差额 期末+出 - (期初+入)的差值
from      erp_database_newest.erp_Purchasepens_count as t1 -- 采购数据,有每个月的采购数据,如果当月没有采购,则补0
left join erp_database_newest.erp_calculation_sales_2016_xb as t2
on        t1.sku = t2.sku
and       t1.warehouse_id = t2.warehouse_id
and       t1.month = t2.month
and       t1.year = t2.year
left join erp_database_newest.erp_sales_purchasepens_2017 as t3
on        t1.sku = t3.sku
and       t1.warehouse_id = t3.warehouse_id
and       t3.year = '2017' 
and       t3.month = 1
where     t1.year in ('2016','2015') 
;

-- 存储库存数据,根据库存数据推算盘盈,撤单入库和报损,盘亏
drop table if EXISTS erp_database_newest.erp_calculation_stock_in_out_xb;
CREATE TABLE erp_database_newest.erp_calculation_stock_in_out_xb (
    sku VARCHAR(50),
    warehouse_id INT,
    month INT,
    year CHAR(5),
    stock_in INT,
    stock_out INT
);
create index erp_calculation_stock_in_out_xb on erp_database_newest.erp_calculation_stock_in_out_xb(sku,warehouse_id);
-- 插入数据
insert into erp_database_newest.erp_calculation_stock_in_out_xb
select     t2.products_sku as sku,t2.product_warehouse_id as warehouse_id
	       ,date_format(t1.operate_time,'%m') AS month,date_format(t1.operate_time,'%Y') AS Year
           ,sum(ifnull(case when t1.operate_type = 'in' then t1.operate_count else 0 end,0) ) as stock_in
           ,sum(ifnull(case when t1.operate_type = 'out' then t1.operate_count else 0 end,0) ) as stock_out
from       erp_database_newest.erp_stock_detail_operate_record_detail as t1
inner join erp_database_newest.erp_products_data    as t2
on         t1.product_id = t2.products_id
where      t1.operate_time >= '2015-01-01 00:00:00'
and        t1.operate_time <= '2016-12-31 23:59:59'
group by   t2.products_sku,t2.product_warehouse_id
	       ,date_format(t1.operate_time,'%Y'),date_format(t1.operate_time,'%m')
;

-- 存取盘盈,撤单入库,报损和扫描缺货单的数据
drop table if EXISTS erp_database_newest.erp_in_out_xb;
CREATE TABLE erp_database_newest.erp_in_out_xb (
    sku VARCHAR(50),
    month INT COMMENT '月份',
    year CHAR(5) COMMENT '年份',
    Warehouse_scrap INT COMMENT '其他出',
    Warehouse_overage INT COMMENT '其他入'
); 
create index erp_in_out on erp_database_newest.erp_in_out_xb(sku);
-- 插入数据
insert into erp_database_newest.erp_in_out_xb
SELECT    products_sku AS sku,DATE_FORMAT(orders_record_time, '%m') AS month,
          DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
          SUM(CASE WHEN orders_record_type IN (3 , 8) THEN orders_record_count ELSE 0 END) AS Warehouse_scrap,
          SUM(CASE WHEN orders_record_type IN (2 , 7) THEN orders_record_count ELSE 0 END) AS Warehouse_overage
FROM      erp_database_newest.erp_orders_record
WHERE     orders_record_type IN (3 , 2, 7, 8)
AND       orders_record_time >= '2015-01-01 00:00:00'
AND       orders_record_time <= '2016-12-31 23:59:59'
GROUP BY  products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')
;
-- 根据差值分配盘盈和报损,盘亏
-- 如果本月进入的数据-采购>=盘盈,则不分配,盘盈全部进入此月信息,但是只进入一个仓库(优先分配给取小的)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out_xb AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    erp_database_newest.erp_in_out_xb AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = t3.Warehouse_overage
WHERE
    t2.stock_in - t1.max_Purchasepens >= t3.Warehouse_overage
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果一个仓,则全部分配
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out_xb AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens_2016_xb
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_in_out_xb AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = t3.Warehouse_overage
WHERE
    t2.stock_in - t1.max_Purchasepens < t3.Warehouse_overage
        AND t4.mmm = 1
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果2个仓,则先满足小的那个,大的那个用剩余值-小的那个
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out_xb AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens_2016_xb
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_in_out_xb AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = (CASE
        WHEN t2.stock_in - t1.max_Purchasepens < 0 THEN 0
        ELSE t2.stock_in - t1.max_Purchasepens
    END)
WHERE
    t2.stock_in - t1.max_Purchasepens < t3.Warehouse_overage
        AND t4.mmm >= 2
;

-- 检查上一步中两个值加起来是否为其盘盈,如果不是,更改大的那个仓库(更改方式是用总数-小仓库号的那个),如果是,则不用管
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            COUNT(DISTINCT warehouse_id) AS mmm,
            MAX(warehouse_id) AS warehouse_id_max
    FROM
        erp_database_newest.erp_sales_Purchasepens_2016_xb
    WHERE
        Warehouse_overage > 0
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        AND t1.warehouse_id = t4.warehouse_id_max
        INNER JOIN
    erp_database_newest.erp_in_out_xb AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb
    GROUP BY sku , month , year) AS t5 ON t3.sku = t5.sku AND t3.month = t5.month
        AND t3.year = t5.year
        LEFT JOIN
    (SELECT 
        z1.sku,
            z1.month,
            z1.year,
            SUM(z1.Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb AS z1
    LEFT JOIN (SELECT 
        MAX(warehouse_id) AS warehouse_id, sku, month, year
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb
    WHERE
        Warehouse_overage > 0
    GROUP BY sku , month , year) AS z2 ON z1.sku = z2.sku AND z1.month = z2.month
        AND z1.year = z2.year
        AND z1.warehouse_id = z2.warehouse_id
    WHERE
        z2.sku IS NULL
    GROUP BY z1.sku , z1.month , z1.year) AS t6 ON t1.sku = t6.sku AND t1.month = t6.month
        AND t1.year = t6.year 
SET 
    T1.Warehouse_overage = (CASE
        WHEN t3.Warehouse_overage - t6.Warehouse_overage < 0 THEN 0
        ELSE t3.Warehouse_overage - t6.Warehouse_overage
    END)
WHERE
    t4.mmm >= 2
        AND t3.Warehouse_overage <> t5.Warehouse_overage
;

-- 目前一个sku有三个仓库的情况只有一个,所以暂时不考虑

UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out_xb AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    erp_database_newest.erp_in_out_xb AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer >= t3.Warehouse_scrap
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果一个仓,则全部分配
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out_xb AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_in_out_xb AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < t3.Warehouse_scrap
        AND t4.mmm = 1
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果2个仓,则先满足小的那个,大的那个用剩余值-小的那个
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out_xb AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_in_out_xb AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = (CASE
        WHEN t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < 0 THEN 0
        ELSE t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer
    END)
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < t3.Warehouse_scrap
        AND t4.mmm >= 2
;

-- 检查上一步中两个值加起来是否为其报损,如果不是,更改大的那个仓库(更改方式是用总数-小仓库号的那个),如果是,则不用管
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            COUNT(DISTINCT warehouse_id) AS mmm,
            MAX(warehouse_id) AS warehouse_id_max
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb
    WHERE
        Warehouse_scrap > 0
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        AND t1.warehouse_id = t4.warehouse_id_max
        INNER JOIN
    erp_database_newest.erp_in_out_xb AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year
        INNER JOIN
    (SELECT 
        sku, month, year, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb
    GROUP BY sku , month , year) AS t5 ON t3.sku = t5.sku AND t3.month = t5.month
        AND t3.year = t5.year
        LEFT JOIN
    (SELECT 
        z1.sku,
            z1.month,
            z1.year,
            SUM(z1.Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb AS z1
    LEFT JOIN (SELECT 
        MAX(warehouse_id) AS warehouse_id, sku, month, year
    FROM
        erp_database_newest.erp_sales_purchasepens_2016_xb
    WHERE
        Warehouse_scrap > 0
    GROUP BY sku , month , year) AS z2 ON z1.sku = z2.sku AND z1.month = z2.month
        AND z1.year = z2.year
        AND z1.warehouse_id = z2.warehouse_id
    WHERE
        z2.sku IS NULL
    GROUP BY z1.sku , z1.month , z1.year) AS t6 ON t1.sku = t6.sku AND t1.month = t6.month
        AND t1.year = t6.year 
SET 
    T1.Warehouse_scrap = (CASE
        WHEN t3.Warehouse_scrap - t6.Warehouse_scrap < 0 THEN 0
        ELSE t3.Warehouse_scrap - t6.Warehouse_scrap
    END)
WHERE
    t4.mmm >= 2
        AND t3.Warehouse_scrap <> t5.Warehouse_scrap
;
-- 如果期末 + 销售 + 转出 + 报废 -最大采购数 - 盘盈 >=0,则最大采购全部分给1.0,期初=期末 + 销售 + 转出 + 报废 - 最大采购数 - 盘盈
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage >= 0
;

-- 如果期末 + 销售 + 转出 + 报废 -最大采购数 - 盘盈 < 0,则分配一部分给1.0,其中期初默认为0,分配给1.0的数据为=期末 + 销售 + 转出 + 报废 - 盘盈
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage < 0
;

-- 本月的期初为上月的期末
 SET @m=23;
 while @m>=1 do
-- 设置参数,使日期从2016年12开始跑到2015年7月份
 set @yy=case when @m>12 then '2016' else '2015' end;
 set @mm=case when @m>12 then (@m-12) else @m end;
-- 修改数据,本月的期初为上月的期末
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb AS t1
        INNER JOIN
    erp_database_newest.erp_sales_purchasepens_2016_xb AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND CASE
        WHEN @m = 12 THEN '2016'
        ELSE t1.year
    END = t2.year
        AND t1.month = CASE
        WHEN @m = 12 THEN (t2.month + 11)
        ELSE (t2.month - 1)
    END 
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.month = @mm AND t1.year = @yy
;
-- 如果期末 + 销售 + 转出 + 报废 -最大采购数 - 盘盈 >=0,则最大采购全部分给1.0,期初=期末 + 销售 + 转出 + 报废 - 最大采购数 - 盘盈
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage >= 0
        AND year = @yy
        AND month = @mm
;

-- 如果期末 + 销售 + 转出 + 报废 -最大采购数 - 盘盈 < 0,则分配一部分给1.0,其中期初默认为0,分配给1.0的数据为=期末 + 销售 + 转出 + 报废
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb 
SET 
    Initial_pen_count = 0
WHERE
    Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage < 0
        AND year = @yy
        AND month = @mm
;
 set @m=@m-1;
 end while;
 -- 校验数据
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_purchasepens_2016_xb 
SET 
    difference = Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - Warehouse_overage - Initial_pen_count - max_Purchasepens
;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_sales_Purchasepens_2017
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_sales_Purchasepens_2017`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_sales_Purchasepens_2017`(
)
    SQL SECURITY INVOKER
BEGIN
-- 插入2017年的数据     
insert into erp_database_newest.erp_sales_Purchasepens_2017
select   t1.sku
         ,t1.warehouse_id
		 ,t1.month  as month
         ,t1.year  as year  -- @yy
		 ,ifnull(t1.stock_number,0) as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,ifnull(t1.Purchasepens_count_transfer,0) as Warehouse_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,0 as Warehouse_scrap     -- 本仓库sku报废数据 ifnull(t4.other_out_Share_num,0) 
		 ,0 AS Purchasepens -- 采购笔数
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据 ifnull(t4.other_in_Share_num,0)
         ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,ifnull(t1.Purchasepens_count,0)  as max_Purchasepens -- 最大的采购数量,其中如果是深圳仓调入海外仓,则此部分数据为海外仓采购数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from      erp_database_newest.erp_Purchasepens_count as t1
where     t1.year = '2017' and t1.month in (1,2,3,4,5,6)
;

 
-- 存储库存数据,根据库存数据推算盘盈,撤单入库和报损,盘亏
drop table if EXISTS erp_database_newest.erp_calculation_stock_in_out;
CREATE TABLE erp_database_newest.erp_calculation_stock_in_out (
    sku VARCHAR(50),
    warehouse_id INT,
    month INT,
    year CHAR(5),
    stock_in INT,
    stock_out INT
);
create index erp_calculation_sales on erp_database_newest.erp_calculation_stock_in_out(sku,warehouse_id);
insert into erp_database_newest.erp_calculation_stock_in_out
select     t2.products_sku as sku,t2.product_warehouse_id as warehouse_id
	       ,date_format(t1.operate_time,'%m') AS month,date_format(t1.operate_time,'%Y') AS Year
           ,sum(ifnull(case when t1.operate_type = 'in' then t1.operate_count else 0 end,0) ) as stock_in
           ,sum(ifnull(case when t1.operate_type = 'out' then t1.operate_count else 0 end,0) ) as stock_out
from       erp_database_newest.erp_stock_detail_operate_record_detail as t1
inner join erp_database_newest.erp_products_data    as t2
on         t1.product_id = t2.products_id
where      t1.operate_time >= '2017-01-01 00:00:00'
and        t1.operate_time <= '2017-06-30 23:59:59'
group by   t2.products_sku,t2.product_warehouse_id
	       ,date_format(t1.operate_time,'%Y'),date_format(t1.operate_time,'%m')
;

-- 根据差值分配盘盈和报损,盘亏
-- 如果本月进入的数据-采购>=盘盈,则不分配,盘盈全部进入此月信息,但是只进入一个仓库(优先分配给取小的)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
            DATE_FORMAT(orders_record_time, '%m') AS month,
            SUM(CASE
                WHEN orders_record_type IN (3 , 8) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_scrap,
            SUM(CASE
                WHEN orders_record_type IN (2 , 7) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_overage
    FROM
        erp_database_newest.erp_orders_record
    WHERE
        orders_record_type IN (3 , 2, 7, 8)
            AND orders_record_time >= '2017-01-01 00:00:00'
            AND orders_record_time <= '2017-06-30 23:59:59'
    GROUP BY products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')) AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = t3.Warehouse_overage
WHERE
    t2.stock_in - t1.max_Purchasepens >= t3.Warehouse_overage
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果一个仓,则全部分配
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
            DATE_FORMAT(orders_record_time, '%m') AS month,
            SUM(CASE
                WHEN orders_record_type IN (3 , 8) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_scrap,
            SUM(CASE
                WHEN orders_record_type IN (2 , 7) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_overage
    FROM
        erp_database_newest.erp_orders_record
    WHERE
        orders_record_type IN (3 , 2, 7, 8)
            AND orders_record_time >= '2017-01-01 00:00:00'
            AND orders_record_time <= '2017-06-30 23:59:59'
    GROUP BY products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')) AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = t3.Warehouse_overage
WHERE
    t2.stock_in - t1.max_Purchasepens < t3.Warehouse_overage
        AND t4.mmm = 1
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果2个仓,则先满足小的那个,大的那个用剩余值-小的那个
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
            DATE_FORMAT(orders_record_time, '%m') AS month,
            SUM(CASE
                WHEN orders_record_type IN (3 , 8) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_scrap,
            SUM(CASE
                WHEN orders_record_type IN (2 , 7) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_overage
    FROM
        erp_database_newest.erp_orders_record
    WHERE
        orders_record_type IN (3 , 2, 7, 8)
            AND orders_record_time >= '2017-01-01 00:00:00'
            AND orders_record_time <= '2017-06-30 23:59:59'
    GROUP BY products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')) AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = (CASE
        WHEN t2.stock_in - t1.max_Purchasepens < 0 THEN 0
        ELSE t2.stock_in - t1.max_Purchasepens
    END)
WHERE
    t2.stock_in - t1.max_Purchasepens < t3.Warehouse_overage
        AND t4.mmm >= 2
;

-- 检查上一步中两个值加起来是否为其盘盈,如果不是,更改大的那个仓库(更改方式是用总数-小仓库号的那个),如果是,则不用管
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            COUNT(DISTINCT warehouse_id) AS mmm,
            MAX(warehouse_id) AS warehouse_id_max
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    WHERE
        Warehouse_overage > 0
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        AND t1.warehouse_id = t4.warehouse_id_max
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
            DATE_FORMAT(orders_record_time, '%m') AS month,
            SUM(CASE
                WHEN orders_record_type IN (3 , 8) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_scrap,
            SUM(CASE
                WHEN orders_record_type IN (2 , 7) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_overage
    FROM
        erp_database_newest.erp_orders_record AS z1
    WHERE
        orders_record_type IN (3 , 2, 7, 8)
            AND orders_record_time >= '2017-01-01 00:00:00'
            AND orders_record_time <= '2017-06-30 23:59:59'
    GROUP BY products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')) AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    GROUP BY sku , month , year) AS t5 ON t3.sku = t5.sku AND t3.month = t5.month
        AND t3.year = t5.year
        LEFT JOIN
    (SELECT 
        z1.sku,
            z1.month,
            z1.year,
            SUM(z1.Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017 AS z1
    LEFT JOIN (SELECT 
        MAX(warehouse_id) AS warehouse_id, sku, month, year
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    WHERE
        Warehouse_overage > 0
    GROUP BY sku , month , year) AS z2 ON z1.sku = z2.sku AND z1.month = z2.month
        AND z1.year = z2.year
        AND z1.warehouse_id = z2.warehouse_id
    WHERE
        z2.sku IS NULL
    GROUP BY z1.sku , z1.month , z1.year) AS t6 ON t1.sku = t6.sku AND t1.month = t6.month
        AND t1.year = t6.year 
SET 
    T1.Warehouse_overage = (CASE
        WHEN t3.Warehouse_overage - t6.Warehouse_overage < 0 THEN 0
        ELSE t3.Warehouse_overage - t6.Warehouse_overage
    END)
WHERE
    t4.mmm >= 2
        AND t3.Warehouse_overage <> t5.Warehouse_overage
;

-- 目前一个sku有三个仓库的情况只有一个,所以暂时不考虑

UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
            DATE_FORMAT(orders_record_time, '%m') AS month,
            SUM(CASE
                WHEN orders_record_type IN (3 , 8) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_scrap,
            SUM(CASE
                WHEN orders_record_type IN (2 , 7) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_overage
    FROM
        erp_database_newest.erp_orders_record
    WHERE
        orders_record_type IN (3 , 2, 7, 8)
            AND orders_record_time >= '2017-01-01 00:00:00'
            AND orders_record_time <= '2017-06-30 23:59:59'
    GROUP BY products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')) AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer >= t3.Warehouse_scrap
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果一个仓,则全部分配
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
            DATE_FORMAT(orders_record_time, '%m') AS month,
            SUM(CASE
                WHEN orders_record_type IN (3 , 8) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_scrap,
            SUM(CASE
                WHEN orders_record_type IN (2 , 7) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_overage
    FROM
        erp_database_newest.erp_orders_record
    WHERE
        orders_record_type IN (3 , 2, 7, 8)
            AND orders_record_time >= '2017-01-01 00:00:00'
            AND orders_record_time <= '2017-06-30 23:59:59'
    GROUP BY products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')) AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < t3.Warehouse_scrap
        AND t4.mmm = 1
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果2个仓,则先满足小的那个,大的那个用剩余值-小的那个
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
            DATE_FORMAT(orders_record_time, '%m') AS month,
            SUM(CASE
                WHEN orders_record_type IN (3 , 8) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_scrap,
            SUM(CASE
                WHEN orders_record_type IN (2 , 7) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_overage
    FROM
        erp_database_newest.erp_orders_record
    WHERE
        orders_record_type IN (3 , 2, 7, 8)
            AND orders_record_time >= '2017-01-01 00:00:00'
            AND orders_record_time <= '2017-06-30 23:59:59'
    GROUP BY products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')) AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = (CASE
        WHEN t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < 0 THEN 0
        ELSE t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer
    END)
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < t3.Warehouse_scrap
        AND t4.mmm >= 2
;

-- 检查上一步中两个值加起来是否为其报损,如果不是,更改大的那个仓库(更改方式是用总数-小仓库号的那个),如果是,则不用管
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            COUNT(DISTINCT warehouse_id) AS mmm,
            MAX(warehouse_id) AS warehouse_id_max
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    WHERE
        Warehouse_scrap > 0
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        AND t1.warehouse_id = t4.warehouse_id_max
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
            DATE_FORMAT(orders_record_time, '%m') AS month,
            SUM(CASE
                WHEN orders_record_type IN (3 , 8) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_scrap,
            SUM(CASE
                WHEN orders_record_type IN (2 , 7) THEN orders_record_count
                ELSE 0
            END) AS Warehouse_overage
    FROM
        erp_database_newest.erp_orders_record AS z1
    WHERE
        orders_record_type IN (3 , 2, 7, 8)
            AND orders_record_time >= '2017-01-01 00:00:00'
            AND orders_record_time <= '2017-06-30 23:59:59'
    GROUP BY products_sku , DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')) AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year
        INNER JOIN
    (SELECT 
        sku, month, year, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    GROUP BY sku , month , year) AS t5 ON t3.sku = t5.sku AND t3.month = t5.month
        AND t3.year = t5.year
        LEFT JOIN
    (SELECT 
        z1.sku,
            z1.month,
            z1.year,
            SUM(z1.Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017 AS z1
    LEFT JOIN (SELECT 
        MAX(warehouse_id) AS warehouse_id, sku, month, year
    FROM
        erp_database_newest.erp_sales_Purchasepens_2017
    WHERE
        Warehouse_scrap > 0
    GROUP BY sku , month , year) AS z2 ON z1.sku = z2.sku AND z1.month = z2.month
        AND z1.year = z2.year
        AND z1.warehouse_id = z2.warehouse_id
    WHERE
        z2.sku IS NULL
    GROUP BY z1.sku , z1.month , z1.year) AS t6 ON t1.sku = t6.sku AND t1.month = t6.month
        AND t1.year = t6.year 
SET 
    T1.Warehouse_scrap = (CASE
        WHEN t3.Warehouse_scrap - t6.Warehouse_scrap < 0 THEN 0
        ELSE t3.Warehouse_scrap - t6.Warehouse_scrap
    END)
WHERE
    t4.mmm >= 2
        AND t3.Warehouse_scrap <> t5.Warehouse_scrap
;

-- 更改盘亏数据
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            orders_record_count,
            orders_record_year AS year,
            orders_record_month AS month,
            owned_warehouse AS warehouse_id
    FROM
        erp_database_newest.erp_orders_record_out
    WHERE
        orders_record_type = 3) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.year = t2.year
        AND t1.month = t2.month 
SET 
    t1.Warehouse_scrap = t1.Warehouse_scrap + IFNULL(t2.orders_record_count, 0)
;

-- 根据分配的报损和盘盈,计算期初数据,期初=期末+销售+转出+报损-采购-盘盈
-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈大于0 ,此时期初=期末+销售+调出-采购,此时不存在差值
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage),
    difference = 0
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) >= 0
;

-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈小于0 ,此时期初=0,此时不存在差值
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1 
SET 
    Initial_pen_count = 0,
    difference = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) < 0
;

-- 更改本月期末为上月期初的数据
 SET @i=6;
  while @i>=1 do
 -- 更改本月的期末为上月的期初
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1
        INNER JOIN
    erp_database_newest.erp_sales_Purchasepens_2017 AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = (t2.month - 1)  
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.month = @i 
;
-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈大于0 ,此时期初=期末+销售+调出-采购,此时不存在差值
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage),
    difference = 0
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) >= 0
        AND month = @i
;

-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈小于0 ,此时期初=0,此时不存在差值
UPDATE erp_database_newest.erp_sales_Purchasepens_2017 AS t1 
SET 
    Initial_pen_count = 0,
    difference = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) < 0
        AND month = @i
;
 set @i=@i-1;
  end while;
   
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_sales_purchasepens_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_sales_purchasepens_insert`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_sales_purchasepens_insert`(
)
    SQL SECURITY INVOKER
BEGIN
-- 创建表
drop table if exists erp_database_newest.erp_sales_purchasepens;
CREATE TABLE erp_database_newest.erp_sales_purchasepens (
    `sku` VARCHAR(50)  COMMENT 'sku',
    `warehouse_id` INT DEFAULT 0 COMMENT '仓库ID',
    `month` INT DEFAULT 0 COMMENT '月份',
    `year` CHAR(4)  COMMENT '年份',
    `Final_pen_count` INT DEFAULT 0 COMMENT '期末笔数',
    `Sales_pens` INT DEFAULT 0 COMMENT '销售笔数',
    `Warehouse_transfer` INT DEFAULT 0 COMMENT '深圳仓库sku调出数据(深圳仓调出海外仓)',
    `Warehouse_scrap` INT DEFAULT 0 COMMENT '本仓库sku报废数据',
    `Purchasepens` INT DEFAULT 0 COMMENT '采购笔数,分服务器时的采购笔数_0',
    `Warehouse_overage` INT DEFAULT 0 COMMENT '本仓库sku盘盈数据',
    `Initial_pen_count` INT DEFAULT 0 COMMENT '期初笔数',
    `max_Purchasepens` INT DEFAULT 0 COMMENT '最大采购数',
    `stock_price` DECIMAL(20 , 4 )  COMMENT '库存价格',
    `difference` INT(11) DEFAULT 0 COMMENT '期末+出-期初-入的差值',
    KEY `erp_sales_Purchasepens` (`sku` , `warehouse_id` , `year` , `month`) USING BTREE,
    KEY `warehouse_id` (`warehouse_id`) USING BTREE,
    KEY `month` (`month`) USING BTREE,
    KEY `year` (`year`) USING BTREE
);
-- 插入2017年的数据     
insert into erp_database_newest.erp_sales_Purchasepens
select   t1.sku
         ,t1.warehouse_id
		 ,t1.month  as month
         ,t1.year  as year  -- @yy
		 ,ifnull(t1.stock_number,0) as Final_pen_count  -- 期末笔数
         ,ifnull(t1.sales_pens,0) as Sales_pens -- 销售笔数
		 ,ifnull(t1.Purchasepens_count_transfer,0) as Warehouse_transfer  -- 深圳仓库sku调出数据(深圳仓调出海外仓)
		 ,0 as Warehouse_scrap     -- 本仓库sku报废数据 ifnull(t4.other_out_Share_num,0) 
		 ,0 AS Purchasepens -- 采购笔数
		 ,0 as Warehouse_overage  -- 本仓库sku盘盈数据 ifnull(t4.other_in_Share_num,0)
         ,0 AS Initial_pen_count -- 初笔数  期末笔数 - 销售笔数 + 采购笔数
		 ,ifnull(t1.Purchasepens_count,0)  as max_Purchasepens -- 最大的采购数量,其中如果是深圳仓调入海外仓,则此部分数据为海外仓采购数据
		 ,ifnull(t1.stock_price,0) as stock_price  -- 库存价格
         ,0 as difference  -- 期末+出-期初-入的差值
from      erp_database_newest.erp_Purchasepens_count as t1
-- where     t1.year = '2017' and t1.month in (1,2,3,4,5,6)
;

 
-- 存储库存数据,根据库存数据推算盘盈,撤单入库和报损,扫描缺货单
drop table if EXISTS erp_database_newest.erp_calculation_stock_in_out;
CREATE TABLE erp_database_newest.erp_calculation_stock_in_out (
    sku VARCHAR(50),
    warehouse_id INT,
    month INT,
    year CHAR(5),
    stock_in INT,
    stock_out INT
);
create index erp_calculation_sales on erp_database_newest.erp_calculation_stock_in_out(sku,warehouse_id);
insert into erp_database_newest.erp_calculation_stock_in_out
select     t2.products_sku as sku,t2.product_warehouse_id as warehouse_id
	       ,date_format(t1.operate_time,'%m') AS month,date_format(t1.operate_time,'%Y') AS Year
           ,sum(ifnull(case when t1.operate_type = 'in' then t1.operate_count else 0 end,0) ) as stock_in
           ,sum(ifnull(case when t1.operate_type = 'out' then t1.operate_count else 0 end,0) ) as stock_out
from       erp_database_newest.erp_stock_detail_operate_record_detail as t1
inner join erp_database_newest.erp_products_data    as t2
on         t1.product_id = t2.products_id
where      t1.operate_time >= '2015-01-01 00:00:00'
and        t1.operate_time <= '2017-06-30 23:59:59'
group by   t2.products_sku,t2.product_warehouse_id
	       ,date_format(t1.operate_time,'%Y'),date_format(t1.operate_time,'%m')
;

-- 插入盘盈,撤单入库,报损,扫描缺货单的数据
drop table if EXISTS erp_database_newest.erp_calculation_scrap_overage;
CREATE TABLE erp_database_newest.erp_calculation_scrap_overage (
    sku VARCHAR(50),
    month INT,
    year CHAR(5),
    Warehouse_scrap INT DEFAULT 0 COMMENT '报损/扫描缺货单',
    Warehouse_overage INT DEFAULT 0 COMMENT '盘盈/撤单入库'
);
create index erp_calculation_scrap_overage on erp_database_newest.erp_calculation_scrap_overage(sku);

-- 插入数据
insert into erp_database_newest.erp_calculation_scrap_overage
SELECT    products_sku AS sku,
          DATE_FORMAT(orders_record_time, '%m') AS month,
          DATE_FORMAT(orders_record_time, '%Y') AS YEAR,
          SUM(CASE WHEN orders_record_type IN (3 , 8) THEN orders_record_count ELSE 0 END) AS Warehouse_scrap,
          SUM(CASE WHEN orders_record_type IN (2 , 7) THEN orders_record_count ELSE 0 END) AS Warehouse_overage
FROM      erp_database_newest.erp_orders_record
WHERE     orders_record_type IN (3 , 2, 7, 8)
AND       orders_record_time >= '2015-01-01 00:00:00'
AND       orders_record_time <= '2017-06-30 23:59:59'
GROUP BY  products_sku,DATE_FORMAT(orders_record_time, '%Y') , DATE_FORMAT(orders_record_time, '%m')
;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_sales_Purchasepens_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_sales_Purchasepens_update`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_sales_Purchasepens_update`(
)
    SQL SECURITY INVOKER
BEGIN
-- 根据差值分配盘盈和报损,扫描缺货单
-- 如果本月进入的数据-采购>=盘盈,则不分配,盘盈全部进入此月信息,但是只进入一个仓库(优先分配给取小的)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = t3.Warehouse_overage
WHERE
    t2.stock_in - t1.max_Purchasepens >= t3.Warehouse_overage
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果一个仓,则全部分配
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = t3.Warehouse_overage
WHERE
    t2.stock_in - t1.max_Purchasepens < t3.Warehouse_overage
        AND t4.mmm = 1
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果2个仓,则先满足小的那个,大的那个用剩余值-小的那个
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_overage = (CASE
        WHEN t2.stock_in - t1.max_Purchasepens < 0 THEN 0
        ELSE t2.stock_in - t1.max_Purchasepens
    END)
WHERE
    t2.stock_in - t1.max_Purchasepens < t3.Warehouse_overage
        AND t4.mmm >= 2
;

-- 检查上一步中两个值加起来是否为其盘盈,如果不是,更改大的那个仓库(更改方式是用总数-小仓库号的那个),如果是,则不用管
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            COUNT(DISTINCT warehouse_id) AS mmm,
            MAX(warehouse_id) AS warehouse_id_max
    FROM
        erp_database_newest.erp_sales_Purchasepens
    WHERE
        Warehouse_overage > 0
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        AND t1.warehouse_id = t4.warehouse_id_max
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            SUM(Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t5 ON t3.sku = t5.sku AND t3.month = t5.month
        AND t3.year = t5.year
        LEFT JOIN
    (SELECT 
        z1.sku,
            z1.month,
            z1.year,
            SUM(z1.Warehouse_overage) AS Warehouse_overage
    FROM
        erp_database_newest.erp_sales_Purchasepens AS z1
    LEFT JOIN (SELECT 
        MAX(warehouse_id) AS warehouse_id, sku, month, year
    FROM
        erp_database_newest.erp_sales_Purchasepens
    WHERE
        Warehouse_overage > 0
    GROUP BY sku , month , year) AS z2 ON z1.sku = z2.sku AND z1.month = z2.month
        AND z1.year = z2.year
        AND z1.warehouse_id = z2.warehouse_id
    WHERE
        z2.sku IS NULL
    GROUP BY z1.sku , z1.month , z1.year) AS t6 ON t1.sku = t6.sku AND t1.month = t6.month
        AND t1.year = t6.year 
SET 
    T1.Warehouse_overage = (CASE
        WHEN t3.Warehouse_overage - t6.Warehouse_overage < 0 THEN 0
        ELSE t3.Warehouse_overage - t6.Warehouse_overage
    END)
WHERE
    t4.mmm >= 2
        AND t3.Warehouse_overage <> t5.Warehouse_overage
;

-- 目前一个sku有三个仓库的情况只有一个,所以暂时不考虑
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer >= t3.Warehouse_scrap
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果一个仓,则全部分配
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = t3.Warehouse_scrap
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < t3.Warehouse_scrap
        AND t4.mmm = 1
;

-- 如果本月进入的数据-采购<盘盈,则需要分配,确认此sku有几个仓,如果2个仓,则先满足小的那个,大的那个用剩余值-小的那个
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_calculation_stock_in_out AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = t2.month
        AND t1.year = t2.year
        INNER JOIN
    (SELECT 
        sku, month, year, COUNT(DISTINCT warehouse_id) AS mmm
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year 
SET 
    T1.Warehouse_scrap = (CASE
        WHEN t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < 0 THEN 0
        ELSE t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer
    END)
WHERE
    t2.stock_out - t1.Sales_pens - t1.Warehouse_transfer < t3.Warehouse_scrap
        AND t4.mmm >= 2
;

-- 检查上一步中两个值加起来是否为其报损,如果不是,更改大的那个仓库(更改方式是用总数-小仓库号的那个),如果是,则不用管
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    (SELECT 
        sku,
            month,
            year,
            COUNT(DISTINCT warehouse_id) AS mmm,
            MAX(warehouse_id) AS warehouse_id_max
    FROM
        erp_database_newest.erp_sales_Purchasepens
    WHERE
        Warehouse_scrap > 0
    GROUP BY sku , month , year) AS t4 ON t1.sku = t4.sku AND t1.month = t4.month
        AND t1.year = t4.year
        AND t1.warehouse_id = t4.warehouse_id_max
        INNER JOIN
    erp_database_newest.erp_calculation_scrap_overage AS t3 ON t1.sku = t3.sku AND t1.month = t3.month
        AND t1.year = t3.year
        INNER JOIN
    (SELECT 
        sku, month, year, SUM(Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_sales_Purchasepens
    GROUP BY sku , month , year) AS t5 ON t3.sku = t5.sku AND t3.month = t5.month
        AND t3.year = t5.year
        LEFT JOIN
    (SELECT 
        z1.sku,
            z1.month,
            z1.year,
            SUM(z1.Warehouse_scrap) AS Warehouse_scrap
    FROM
        erp_database_newest.erp_sales_Purchasepens AS z1
    LEFT JOIN (SELECT 
        MAX(warehouse_id) AS warehouse_id, sku, month, year
    FROM
        erp_database_newest.erp_sales_Purchasepens
    WHERE
        Warehouse_scrap > 0
    GROUP BY sku , month , year) AS z2 ON z1.sku = z2.sku AND z1.month = z2.month
        AND z1.year = z2.year
        AND z1.warehouse_id = z2.warehouse_id
    WHERE
        z2.sku IS NULL
    GROUP BY z1.sku , z1.month , z1.year) AS t6 ON t1.sku = t6.sku AND t1.month = t6.month
        AND t1.year = t6.year 
SET 
    T1.Warehouse_scrap = (CASE
        WHEN t3.Warehouse_scrap - t6.Warehouse_scrap < 0 THEN 0
        ELSE t3.Warehouse_scrap - t6.Warehouse_scrap
    END)
WHERE
    t4.mmm >= 2
        AND t3.Warehouse_scrap <> t5.Warehouse_scrap
;

 -- 更改盘亏数据
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    (SELECT 
        products_sku AS sku,
            orders_record_count,
            orders_record_year AS year,
            orders_record_month AS month,
            owned_warehouse AS warehouse_id
    FROM
        erp_database_newest.erp_orders_record_out
    WHERE
        orders_record_type = 3) AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.year = t2.year
        AND t1.month = t2.month 
SET 
    t1.Warehouse_scrap = t1.Warehouse_scrap + IFNULL(t2.orders_record_count, 0)
;

-- 期末+销售+转出+报损 >=采购+盘盈,此时期初=期末+销售+转出+报损 - (采购+盘盈)
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) >= 0

;

-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈小于0 ,此时期初=0,此时不存在差值
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    Initial_pen_count = 0
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) < 0
;

-- 更改本月期末为上月期初的数据
 SET @m=29;
 while @m>=1 do
 --  设置参数,使日期从2015年01开始跑到2017年6月份
 set @yy=(case when @m<=12 then '2015' when 12<@m and @m<=24  then '2016' else '2017' end);
 set @mm=(case when @m<=12 then @m when 12<@m and @m<=24  then @m-12 else @m-24 end);

 -- 更改本月的期末为上月的期初
 SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1
        INNER JOIN
    erp_database_newest.erp_sales_Purchasepens AS t2 ON t1.sku = t2.sku
        AND t1.warehouse_id = t2.warehouse_id
        AND t1.month = CASE
        WHEN @m = 24 THEN (t2.month + 11)
        WHEN @m = 12 THEN (t2.month + 11)
        ELSE (t2.month - 1)
    END
        AND CASE
        WHEN @m = 24 THEN '2017'
        WHEN @m = 12 THEN '2016'
        ELSE t1.year
    END = t2.year 
SET 
    t1.Final_pen_count = t2.Initial_pen_count
WHERE
    t1.month = @mm AND t1.year = @yy
;
-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈大于0 ,此时期初=期末+销售+调出-采购,此时不存在差值
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    Initial_pen_count = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage)
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) >= 0
        AND month = @mm
        AND year = @yy
;

-- 计算期初数据,如果期末+销售+转出+报损-采购-盘盈小于0 ,此时期初=0,此时不存在差值
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    Initial_pen_count = 0
WHERE
    (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage) < 0
        AND month = @mm
        AND year = @yy
;
 set @m=@m-1;
  end while;
   
-- 校验数据
SET SQL_SAFE_UPDATES = 0;
UPDATE erp_database_newest.erp_sales_Purchasepens AS t1 
SET 
    difference = (Final_pen_count + Sales_pens + Warehouse_transfer + Warehouse_scrap - max_Purchasepens - Warehouse_overage - Initial_pen_count)
;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_Storage_sku
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_Storage_sku`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_Storage_sku`(
)
    SQL SECURITY INVOKER
BEGIN
drop table if exists erp_database_newest.erp_Storage_sku;
CREATE TABLE erp_database_newest.erp_Storage_sku (
    sku VARCHAR(200) COMMENT 'sku',
    suppliers_id INT COMMENT '供应商id',
    po_id INT COMMENT '采购单号',
    ac_date DATE COMMENT '入库日期',
    orders_record_count INT COMMENT '入库数量',
    orders_record_money DECIMAL(20 , 4 ) COMMENT '入库金额'
);
create index erp_Storage_sku on erp_database_newest.erp_Storage_sku(ac_date);
create index erp_Storage_sku_01 on erp_database_newest.erp_Storage_sku(suppliers_id);
create index erp_Storage_sku_02 on erp_database_newest.erp_Storage_sku(sku);

SET @m=1;
while @m<=24 do
SELECT @start_date:=DATE_add(DATE_FORMAt('2015-06-01','%Y-%m-%d'),INTERVAL @m month);
SELECT 
    @end_date:=DATE_ADD(DATE_FORMAT('2015-06-01', '%Y-%m-%d'),
        INTERVAL (@m + 1) MONTH);
insert into erp_database_newest.erp_Storage_sku
select    pp.op_pro_sku  as sku
          ,ep.supplierID as suppliers_id
		  ,ep.po_id  as po_id
          ,date_format(orders_record_time,'%Y-%m-%d')  as ac_date
          ,sum(pr.orders_record_count) as orders_record_count
          ,round(sum(pr.orders_record_count * pp.op_pro_cost + (ep.po_shipping_fee / t6.op_count) * pr.orders_record_count),4) as orders_record_money
from      (select  po_id,op_pro_sku,max(op_pro_cost) as op_pro_cost
                   FROM ERP_DATABASE_NEWEST.erp_procurement_products_20171006  group by po_id,op_pro_sku) pp
INNER JOIN ERP_DATABASE_NEWEST.erp_procurement ep 
ON         ep.po_id = pp.po_id
inner JOIN ERP_DATABASE_NEWEST.erp_orders_record pr
on         pp.po_id = pr.procurement_id
and        pp.op_pro_sku = pr.products_sku
inner join (select  po_id,sum(op_pro_count_op) as op_count FROM ERP_DATABASE_NEWEST.erp_procurement_products_20171006 group by po_id) as t6
on         ep.po_id = t6.po_id
WHERE      ep.has_new_arrival = 0  and pr.orders_record_type in (1,9)
AND        ep.po_status >=2
AND        orders_record_time >= @start_date
AND        orders_record_time < @end_date
AND        ((ep.mustFollowing = 0 AND ep.arrival_is_end = 1) OR ep.po_status =6)        
GROUP BY   pp.op_pro_sku,ep.supplierID,ep.po_id,date_format(orders_record_time,'%Y-%m-%d') 
;
set @m=@m+1;
end WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for erp_zys_xuqiu
-- ----------------------------
DROP PROCEDURE IF EXISTS `erp_zys_xuqiu`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `erp_zys_xuqiu`(
)
    SQL SECURITY INVOKER
BEGIN
-- 取1.2销售数据
-- 取海外的sku,但是不是境内的sku及仓库
drop table if exists erp_database_newest.erp_zys_xuqiu_sku;
CREATE TABLE erp_database_newest.erp_zys_xuqiu_sku (
    sku VARCHAR(50) COMMENT 'sku',
    sku_overseas VARCHAR(50) COMMENT '海外sku'
);
create index erp_zys_xuqiu_sku on erp_database_newest.erp_zys_xuqiu_sku(sku);
create index erp_zys_xuqiu_sku_01 on erp_database_newest.erp_zys_xuqiu_sku(sku_overseas);
-- 插入数据
insert into erp_database_newest.erp_zys_xuqiu_sku
select    distinct t1.productSKU,t1.specifiedSKU
from      salamoer_database.sangelfine_warehouse_products as t1  
left join erp_database_newest.erp_products_data as t2
on        t1.specifiedSKU = t2.products_sku
where     t1.warehouseID <> 1000
and       t2.products_sku is null
;
-- 插入境内sku,避免重复
-- 取海外的sku,但是不是境内的sku及仓库
drop table if exists erp_database_newest.erp_zys_xuqiu_sku_Territory;
CREATE TABLE erp_database_newest.erp_zys_xuqiu_sku_Territory (
    products_sku VARCHAR(50) COMMENT 'sku',
    category_name VARCHAR(200) COMMENT 'sku分类'
);
create index erp_zys_xuqiu_sku_Territory on erp_database_newest.erp_zys_xuqiu_sku_Territory(products_sku);
create index erp_zys_xuqiu_sku_Territory_01 on erp_database_newest.erp_zys_xuqiu_sku_Territory(category_name);
-- 插入数据
insert into erp_database_newest.erp_zys_xuqiu_sku_Territory
select distinct products_sku,t2.category_name 
from    erp_database_newest.erp_products_data as t1
inner join erp_database_newest.erp_category as t2
on         t1.products_sort = t2.category_id
;


-- 统计销售数据(境内销售数据)
drop table if exists erp_database_newest.erp_zys_xuqiu;
CREATE TABLE erp_database_newest.erp_zys_xuqiu (
    ac_date DATE COMMENT '时间日期,取每月最后一天',
    orders_type INT COMMENT '平台',
    sales_account VARCHAR(150) COMMENT '店铺',
    category_name VARCHAR(200) COMMENT 'sku大类',
    orders_total DECIMAL(20 , 4 ) COMMENT '销售金额'
);
create index erp_zys_xuqiu on erp_database_newest.erp_zys_xuqiu(ac_date);
create index erp_zys_xuqiu_01 on erp_database_newest.erp_zys_xuqiu(sales_account);

-- 插入数据(其中以采购和销售的并集作为主表)
SET @m=1;
while @m<=30 do
SELECT @start_date:=DATE_SUB(DATE_FORMAt('2017-08-01','%Y-%m-%d'),INTERVAL (@m+1) month);
SELECT 
    @end_date:=DATE_SUB(DATE_FORMAT('2017-08-01', '%Y-%m-%d'),
        INTERVAL @m MONTH);

-- 插入数据 由于数据量太大,所以目前采用分月插入数据
-- 插入境内仓数据(其中只取打印时间不为空的数据)
insert into erp_database_newest.erp_zys_xuqiu
select     last_day(orders_shipping_time) as ac_date
           ,t1.orders_type
           ,t1.sales_account
           ,t3.category_name
           ,round(sum(orders_total/currency_value),4) as orders_total
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id
inner join erp_database_newest.erp_zys_xuqiu_sku_Territory as t3
on         t2.orders_sku = t3.products_sku
where      t1.orders_shipping_time >= @start_date
and        t1.orders_shipping_time < @end_date
and        t1.orders_status = 5 
and        t1.orders_type in (6,13,1,7,15) -- 取需要的店铺
and        t1.orders_is_join = 0 
group by   last_day(orders_shipping_time),t1.orders_type,t1.sales_account,t3.category_name
;
-- 插入境内仓数据(其中只取打印时间为空的数据)
insert into erp_database_newest.erp_zys_xuqiu
select     last_day(orders_export_time) as ac_date
           ,t1.orders_type
           ,t1.sales_account
           ,t3.category_name
           ,round(sum(orders_total/currency_value),4) as orders_total
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id
inner join erp_database_newest.erp_zys_xuqiu_sku_Territory as t3
on         t2.orders_sku = t3.products_sku
where      t1.orders_export_time >= @start_date
and        t1.orders_export_time < @end_date and orders_shipping_time is null
and        t1.orders_status = 5
and        t1.orders_type in (6,13,1,7,15) -- 取需要的店铺
and        t1.orders_is_join = 0 
group by   last_day(orders_export_time),t1.orders_type,t1.sales_account,t3.category_name
;


-- 海外数据(其中只取打印时间不为空的数据)
insert into erp_database_newest.erp_zys_xuqiu
select     last_day(orders_shipping_time) as ac_date
           ,t1.orders_type
           ,t1.sales_account
           ,t5.category_name
           ,round(sum(orders_total/currency_value),4) as orders_total
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id
inner join erp_database_newest.erp_zys_xuqiu_sku as t3
on         t2.orders_sku = t3.sku_overseas
inner join erp_database_newest.erp_zys_xuqiu_sku_Territory as t5
on         t3.sku = t5.products_sku
where      t1.orders_shipping_time >= @start_date
and        t1.orders_shipping_time < @end_date
and        t1.orders_status in (5,8)
and        t1.orders_type in (6,13,1,7,15) -- 取需要的店铺
and        t1.orders_is_join = 0 
group by   last_day(orders_shipping_time),t1.orders_type,t1.sales_account,t5.category_name
;

-- 海外数据(其中只取打印时间为空的数据)
insert into erp_database_newest.erp_zys_xuqiu
select     last_day(orders_export_time) as ac_date
           ,t1.orders_type
           ,t1.sales_account
           ,t5.category_name
           ,round(sum(orders_total/currency_value),4) as orders_total
from       erp_database_newest.erp_orders as t1
inner join erp_database_newest.erp_orders_products as t2
on         t1.erp_orders_id = t2.erp_orders_id
inner join erp_database_newest.erp_zys_xuqiu_sku as t3
on         t2.orders_sku = t3.sku_overseas
inner join erp_database_newest.erp_zys_xuqiu_sku_Territory as t5
on         t3.sku = t5.products_sku
where      t1.orders_export_time >= @start_date
and        t1.orders_export_time < @end_date
and        t1.orders_shipping_time  is null
and        t1.orders_status in (5,8)
and        t1.orders_is_join = 0 
group by   last_day(orders_export_time),t1.orders_type,t1.sales_account,t5.category_name
;
-- 循环加1
set @m=@m+1;
end WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for in_out_stock_check
-- ----------------------------
DROP PROCEDURE IF EXISTS `in_out_stock_check`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `in_out_stock_check`(
)
    SQL SECURITY INVOKER
BEGIN
-- 表1
/*
CREATE table in_out_stock_check
(
rq char(10) default'0' COMMENT '日期',
products_sku varchar(50) default'' COMMENT 'sku',
product_warehouse_id int default 0 COMMENT '仓库ID',
record_in int default 0 COMMENT 'record_入',
stock_in int default 0 COMMENT '实库存入',
stock_in_record int default 0 COMMENT '实库存入减record_入',
record_out int default 0 COMMENT 'record_出',
orders_out int default 0 COMMENT '订单出',
stock_out int default 0 COMMENT '实库存出',
stock_out_record int default 0 COMMENT '实库存出减record_出和订单出',
insert_time datetime DEFAULT '0000-00-00 00:00:00' COMMENT '写入时间',
key idx_sku(products_sku),
key Idx_rq(rq)
);
*/
-- 计算出入库记录中 增加库存的数据
set @rq:=curdate();
IF (select count(*) from in_out_stock_check where rq=date_sub(@rq,interval 1 day))<1
then
drop table if EXISTS crkjl_in;
CREATE table crkjl_in
select date_sub(@rq,interval 1 day) as rq,products_sku,owned_warehouse,sum(orders_record_count) as in_num
from erp_orders_record where orders_record_time>=date_sub(@rq,interval 1 day) 
and orders_record_time<date_sub(@rq,interval 0 day)
and orders_record_type in(1,2,7,9,12)
GROUP BY products_sku,owned_warehouse;

CREATE INDEX a01 on crkjl_in(products_sku(255),owned_warehouse);

-- 计算出入库记录中 减少库存的数据
drop table if EXISTS crkjl_out;
CREATE table crkjl_out
select date_sub(@rq,interval 1 day) as rq,products_sku,owned_warehouse,sum(orders_record_count) as out_num
from erp_orders_record where orders_record_time>=date_sub(@rq,interval 1 day) 
and orders_record_time<date_sub(@rq,interval 0 day)
and orders_record_type in(3,5,10,8,11)
GROUP BY products_sku,owned_warehouse;

CREATE INDEX a02 on crkjl_out(products_sku(255),owned_warehouse);
/*****************************出库****start***************************/
-- 计算订单出库中的sku数量
drop table if EXISTS orders_out;
CREATE TEMPORARY table orders_out
select b.orders_sku,a.orders_warehouse_id,sum(b.item_count) as out_ck
from erp_orders a INNER JOIN erp_orders_products b on a.erp_orders_id=b.erp_orders_id
where a.orders_is_join=0 and a.orders_status in(5,8,6) -- 6 撤单入库的也要计算，应该在实库存变化表里面这些库存是出现过扣减的
and a.orders_shipping_time>=date_sub(@rq,interval 1 day) 
and a.orders_shipping_time<date_sub(@rq,interval 0 day)
GROUP BY b.orders_sku,a.orders_warehouse_id;

CREATE INDEX orders_1 on orders_out(orders_sku,orders_warehouse_id);
/****************************出库***end****************************/
-- 计算实库存变化的in库存
drop table if EXISTS skcbh_in;
CREATE TEMPORARY table skcbh_in
select b.products_sku,b.product_warehouse_id,sum(a.operate_count) as in_shl
from erp_stock_detail_operate_record_detail a INNER JOIN erp_products_data b on a.product_id=b.products_id
where a.operate_time>=date_sub(@rq,interval 1 day) 
and a.operate_time<date_sub(@rq,interval 0 day)
and a.operate_type='in'
GROUP BY b.products_sku,b.product_warehouse_id;

CREATE INDEX skcbh_1 on skcbh_in(products_sku(255),product_warehouse_id);

-- 计算实库存变化的out库存
drop table if EXISTS skcbh_out;
CREATE TEMPORARY table skcbh_out
select b.products_sku,b.product_warehouse_id,sum(a.operate_count) as out_shl 
from erp_stock_detail_operate_record_detail a INNER JOIN erp_products_data b on a.product_id=b.products_id
where a.operate_time>=date_sub(@rq,interval 1 day) 
and a.operate_time<date_sub(@rq,interval 0 day)
and a.operate_type='out'
GROUP BY b.products_sku,b.product_warehouse_id;

CREATE INDEX skcbh_2 on skcbh_out(products_sku(255),product_warehouse_id);

/************************************特采库存**************************************/
-- 计算实库存变化的in库存
drop table if EXISTS tc_skcbh_in;
CREATE TEMPORARY table tc_skcbh_in
select b.products_sku,900 as product_warehouse_id,sum(a.tc_operate_count) as in_shl
from erp_stock_tc_operate_record_detail a INNER JOIN erp_products_data b on a.tc_product_id=b.products_id
where a.tc_operate_time>=date_sub(@rq,interval 1 day) 
and a.tc_operate_time<date_sub(@rq,interval 0 day)
and a.tc_operate_type='in'
GROUP BY b.products_sku;

CREATE INDEX skcbh_1 on tc_skcbh_in(products_sku(255));

-- 计算实库存变化的out库存
drop table if EXISTS tc_skcbh_out;
CREATE TEMPORARY table tc_skcbh_out
select b.products_sku,900 as product_warehouse_id,sum(a.tc_operate_count) as out_shl 
from erp_stock_tc_operate_record_detail a INNER JOIN erp_products_data b on a.tc_product_id=b.products_id
where a.tc_operate_time>=date_sub(@rq,interval 1 day) 
and a.tc_operate_time<date_sub(@rq,interval 0 day)
and a.tc_operate_type='out'
GROUP BY b.products_sku;

CREATE INDEX skcbh_2 on tc_skcbh_out(products_sku(255));

/************************************end************************************/

-- 汇总数据比对
INSERT into in_out_stock_check(rq,products_sku,product_warehouse_id,record_in,stock_in,stock_in_record,
record_out,orders_out,stock_out,stock_out_record,insert_time)
select * from (
select date_sub(@rq,interval 1 day) as rq,a.products_sku,a.product_warehouse_id,
IFNULL(b.in_num,0) as record_入,ifnull(e.in_shl,0) as 实库存入,ifnull(e.in_shl,0)-IFNULL(b.in_num,0) as 实库存入减record_入,
ifnull(c.out_num,0) as record_出,ifnull(d.out_ck,0) as 订单出,ifnull(f.out_shl,0) as 实库存出,
ifnull(f.out_shl,0)-ifnull(c.out_num,0)-ifnull(d.out_ck,0) as 实库存出减record_出和订单出,NOW() as insert_time
from erp_products_data a LEFT JOIN crkjl_in b on a.products_sku=b.products_sku and a.product_warehouse_id=b.owned_warehouse
left JOIN crkjl_out c on a.products_sku=c.products_sku and a.product_warehouse_id=c.owned_warehouse
left JOIN orders_out d on a.products_sku=d.orders_sku and a.product_warehouse_id=d.orders_warehouse_id
left JOIN skcbh_in e on a.products_sku=e.products_sku and a.product_warehouse_id=e.product_warehouse_id
left JOIN skcbh_out f on a.products_sku=f.products_sku and a.product_warehouse_id=f.product_warehouse_id
where ifnull(b.in_num,0)+ifnull(e.in_shl,0)+ifnull(c.out_num,0)+ifnull(d.out_ck,0)+ifnull(f.out_shl,0)>0
UNION -- 特采库存
select date_sub(@rq,interval 1 day) as rq,a.products_sku,900 as product_warehouse_id,
IFNULL(b.in_num,0) as record_入,ifnull(e.in_shl,0) as 特采实库存入,ifnull(e.in_shl,0)-IFNULL(b.in_num,0) as 特采实库存入减record_入,
ifnull(c.out_num,0) as record_出,0 as 订单出,ifnull(f.out_shl,0) as 特采实库存出,
ifnull(f.out_shl,0)-ifnull(c.out_num,0) as 特采实库存出减record_出,NOW() as insert_time
from erp_products_data a LEFT JOIN crkjl_in b on a.products_sku=b.products_sku and b.owned_warehouse=900
left JOIN crkjl_out c on a.products_sku=c.products_sku  and c.owned_warehouse=900
left JOIN tc_skcbh_in e on a.products_sku=e.products_sku
left JOIN tc_skcbh_out f on a.products_sku=f.products_sku
where a.product_warehouse_id=1000
and ifnull(b.in_num,0)+ifnull(e.in_shl,0)+ifnull(c.out_num,0)+ifnull(f.out_shl,0)>0) a
ORDER BY a.product_warehouse_id;

drop table crkjl_in;
drop table crkjl_out;
drop table orders_out;
drop table skcbh_in;
drop table skcbh_out;
 end if;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for kcrbb_tj
-- ----------------------------
DROP PROCEDURE IF EXISTS `kcrbb_tj`;
DELIMITER ;;
CREATE DEFINER=`supengquan`@`%` PROCEDURE `kcrbb_tj`()
BEGIN
select @rq:=curdate();

IF (select count(*) from erp_stock_monitoring where statistical_time=UNIX_TIMESTAMP(date_sub(@rq,interval 1 day)) )<1
then

/* -- erp_stock_detail_operate_record_detail 库存日志映射到erp_rizhi
-- erp_products_data 产品资料映射到 erp_cp
-- erp_procurement_arrivel 收货表映射到 erp_ys
-- erp_procurement 采购订单映射到 erp_ddhz
-- erp_procurement_products 采购订单明细映射到 erp_ddmx
-- erp_stock_detail 库存表映射到 erp_kc
*/

-- 计算三个仓库前一天的出库数据
drop table if EXISTS erp_rizhi2;
CREATE TEMPORARY table erp_rizhi2
select * from erp_stock_detail_operate_record_detail where operate_time>date_sub(@rq,interval 1 day) and operate_time<date_sub(@rq,interval 0 day);

drop table if EXISTS erp_cp2;
CREATE TEMPORARY table erp_cp2
select product_warehouse_id,products_id from erp_products_data;

CREATE INDEX a01 on erp_rizhi2(product_id);
CREATE INDEX a02 on erp_cp2(products_id);

drop table if EXISTS ck;
CREATE TEMPORARY TABLE ck
select b.product_warehouse_id,left(a.operate_time,10) as rq,sum(a.operate_count) as ckshl
from erp_rizhi2 a INNER JOIN erp_cp2 b on a.product_id=b.products_id
where a.operate_type='out' and a.operate_time>date_sub(@rq,interval 1 day) and b.product_warehouse_id in('1000','1025','1035')
GROUP BY b.product_warehouse_id,left(a.operate_time,10);
-- 计算前一天三个仓库的上架数据
drop table if EXISTS erp_ys2;
CREATE TEMPORARY table erp_ys2
select arrival_chk_time,arrival_count_real,erp_procurement_id,arrival_sku from erp_procurement_arrivel
 where arrival_chk_time>date_sub(@rq,interval 1 day) and arrival_chk_time<date_sub(@rq,interval 0 day);

drop table if EXISTS erp_ddhz2;
CREATE TEMPORARY table erp_ddhz2
select procurement_warehouse_id,po_id,po_times from erp_procurement;

CREATE INDEX a03 on erp_ys2(erp_procurement_id);
CREATE INDEX a04 on erp_ddhz2(po_id);

drop table if EXISTS sj;
CREATE TEMPORARY TABLE sj
select left(arrival_chk_time,10) as rq,b.procurement_warehouse_id,sum(a.arrival_count_real) as rkshl
from erp_ys2 a INNER JOIN erp_ddhz2 b on a.erp_procurement_id=b.po_id
where a.arrival_chk_time>date_sub(@rq,interval 1 day) and b.procurement_warehouse_id in('1000','1025','1035')
GROUP BY left(arrival_chk_time,10),b.procurement_warehouse_id;

-- 计算三个仓库的实时总库存

drop table if EXISTS zkc;
CREATE TEMPORARY TABLE zkc
select date_sub(@rq,interval 1 day) as rq,stock_warehouse_id,sum(actual_stock) as stock 
from erp_stock_detail where stock_warehouse_id in ('1000','1025','1035') 
GROUP BY stock_warehouse_id;
-- 计算在途量

drop table if EXISTS ztl;
CREATE TEMPORARY TABLE ztl
select LEFT(a.po_times,10) as rq,a.procurement_warehouse_id,sum(b.op_pro_count_op-IFNULL(c.arrival_count_real,0)) as shl
from erp_ddhz2 a INNER JOIN erp_procurement_products b on a.po_id=b.po_id 
LEFT JOIN erp_ys2 c on a.po_id=c.erp_procurement_id and b.op_pro_sku=c.arrival_sku
where a.po_times>date_sub(@rq,interval 1 day) and a.procurement_warehouse_id in('1000','1025','1035') and IFNULL(c.arrival_count_real,0)=0
GROUP BY a.procurement_warehouse_id,LEFT(a.po_times,10) ORDER BY LEFT(a.po_times,10);

-- 合计前一天库存数据
INSERT into erp_stock_monitoring(statistical_time,warehouse_id,import_total,export_total,true_stock,on_shipping_total,stock_shipped_percent,insert_time)
select UNIX_TIMESTAMP(a.rq),a.product_warehouse_id,b.rkshl as 入库数量,a.ckshl as 出库数量,c.stock as 在库库存,d.shl as 采购在途数量,a.ckshl/c.stock as 发货库存占比,NOW()
from ck a INNER JOIN sj b on a.product_warehouse_id=b.procurement_warehouse_id
INNER JOIN zkc c on c.stock_warehouse_id=a.product_warehouse_id
INNER JOIN ztl d on d.procurement_warehouse_id=c.stock_warehouse_id
where a.rq=date_sub(@rq,interval 1 day) and b.rq=date_sub(@rq,interval 1 day) 
and c.rq=date_sub(@rq,interval 1 day) and d.rq=date_sub(@rq,interval 1 day);

drop table erp_rizhi2;
drop table erp_cp2;
drop table erp_ys2;
drop table erp_ddhz2;

drop table ck;
drop table sj;
drop table zkc;
drop table ztl;
end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for orders_profitRate_Lower_Eight
-- ----------------------------
DROP PROCEDURE IF EXISTS `orders_profitRate_Lower_Eight`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `orders_profitRate_Lower_Eight`(
)
    SQL SECURITY INVOKER
BEGIN
-- 计算昨天销售利润低于8%的订单对应的负责人、订单量、销售金额。每天凌晨02:20计算
-- 计算昨天的销售,利润小于8
set @rq=curdate();

CREATE TEMPORARY table orders_products_lishi
select a.erp_orders_id,a.orders_item_number,a.orders_sku,a.platform_sku,a.orderlineitemid
from erp_orders_products a INNER JOIN erp_orders b on a.erp_orders_id=b.erp_orders_id
where b.orders_export_time<date_sub(@rq,interval 0 day) and b.orders_export_time>=date_sub(@rq,interval 30 day)
and b.orders_type in(1,6,7,13,15,18,19,22,25,26,27,29) 
and b.orders_status IN (1,3,4,5,8) AND b.orders_is_join =0 and b.profitRate<8 and 
a.orders_sku=(select max(orders_sku) from erp_orders_products where erp_orders_products.erp_orders_id=a.erp_orders_id);

CREATE INDEX s01 on orders_products_lishi(erp_orders_id);

-- 取值ebay
create TEMPORARY table Yesterday_xl_1
select d.user_id as erp_user_id,'EBay' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN sf_itemid_sku c on b.orders_item_number=c.itemNumber and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=1 and d.sale_code=substring_index(c.ebaysku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type in(1,26) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY d.user_id;

CREATE INDEX a01 on Yesterday_xl_1(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_1
select d.user_id as erp_user_id,'EBay' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN sf_itemid_sku c on b.orders_item_number=c.itemNumber and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=1 and d.sale_code=substring_index(c.ebaysku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type in(1,26) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY d.user_id;

CREATE INDEX a02 on Seven_day_xl_1(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_1
select d.user_id as erp_user_id,'EBay' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN sf_itemid_sku c on b.orders_item_number=c.itemNumber and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=1 and d.sale_code=substring_index(c.ebaysku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type in(1,26) 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY d.user_id;

CREATE INDEX a03 on Thirty_day_xl_1(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table EBay_xs
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_1 a INNER  JOIN Seven_day_xl_1 b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_1 c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_1;
drop table Seven_day_xl_1;
drop table Thirty_day_xl_1;

/*---------------------------------------以下-AliExpress-----------------------------------------------------------*/
-- 取值 AliExpress
create TEMPORARY table Yesterday_xl_6
select d.user_id as erp_user_id,'AliExpress' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN smt_product_skus c on b.orders_item_number=c.productId and b.orders_sku=c.skuCode
LEFT JOIN erp_smt_user_sale_code d on d.order_type=6 and d.sale_code=substring_index(c.smtSkuCode,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type=6 and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY d.user_id;

CREATE INDEX b01 on Yesterday_xl_6(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_6
select d.user_id as erp_user_id,'AliExpress' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN smt_product_skus c on b.orders_item_number=c.productId and b.orders_sku=c.skuCode
LEFT JOIN erp_smt_user_sale_code d on d.order_type=6 and d.sale_code=substring_index(c.smtSkuCode,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type=6 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY d.user_id;

CREATE INDEX b02 on Seven_day_xl_6(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_6
select d.user_id as erp_user_id,'AliExpress' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN smt_product_skus c on b.orders_item_number=c.productId and b.orders_sku=c.skuCode
LEFT JOIN erp_smt_user_sale_code d on d.order_type=6 and d.sale_code=substring_index(c.smtSkuCode,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type=6 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY d.user_id;

CREATE INDEX b03 on Thirty_day_xl_6(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table AliExpress_xs
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_6 a INNER  JOIN Seven_day_xl_6 b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_6 c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_6;
drop table Seven_day_xl_6;
drop table Thirty_day_xl_6;
/*---------------------------------------以下-Amazon-----------------------------------------------------------*/
-- 取值 Amazon
create TEMPORARY table Yesterday_xl_7
select d.user_id as erp_user_id,'Amazon' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(7,27) and d.sale_code=substring_index(b.platform_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type in(7,27) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY d.user_id;

CREATE INDEX c01 on Yesterday_xl_7(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_7
select d.user_id as erp_user_id,'Amazon' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(7,27) and d.sale_code=substring_index(b.platform_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type in(7,27)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY d.user_id;

CREATE INDEX c02 on Seven_day_xl_7(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_7
select d.user_id as erp_user_id,'Amazon' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(7,27) and d.sale_code=substring_index(b.platform_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type in(7,27)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY d.user_id;

CREATE INDEX c03 on Thirty_day_xl_7(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Amazon_xs
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_7 a INNER  JOIN Seven_day_xl_7 b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_7 c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_7;
drop table Seven_day_xl_7;
drop table Thirty_day_xl_7;
/*---------------------------------------以下-Wish-----------------------------------------------------------*/
-- 取值 Wish
create TEMPORARY table Yesterday_xl_13
select d.user_id as erp_user_id,'Wish' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_wish_product_detail c on b.orders_item_number=c.productID and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(13,25) and d.sale_code=c.sellerID
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type in(13,25) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY d.user_id;

CREATE INDEX d01 on Yesterday_xl_13(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_13
select d.user_id as erp_user_id,'Wish' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_wish_product_detail c on b.orders_item_number=c.productID and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(13,25) and d.sale_code=c.sellerID
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type in(13,25)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY d.user_id;

CREATE INDEX d02 on Seven_day_xl_13(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_13
select d.user_id as erp_user_id,'Wish' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_wish_product_detail c on b.orders_item_number=c.productID and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(13,25) and d.sale_code=c.sellerID
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type in(13,25)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY d.user_id;

CREATE INDEX d03 on Thirty_day_xl_13(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Wish_xs
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_13 a INNER  JOIN Seven_day_xl_13 b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_13 c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_13;
drop table Seven_day_xl_13;
drop table Thirty_day_xl_13;

/*---------------------------------------以下-Lazada-----------------------------------------------------------*/
-- 取值 Lazada
create TEMPORARY table Yesterday_xl_15
select c.erp_user_id,'Lazada' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN (select sku,max(erp_user_id) as erp_user_id from erp_lazada_products GROUP BY sku) c on b.orders_sku=c.sku
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type=15 and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY c.erp_user_id;

CREATE INDEX e01 on Yesterday_xl_15(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_15
select c.erp_user_id,'Lazada' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN (select sku,max(erp_user_id) as erp_user_id from erp_lazada_products GROUP BY sku) c on b.orders_sku=c.sku
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type=15
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY c.erp_user_id;

CREATE INDEX e02 on Seven_day_xl_15(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_15
select c.erp_user_id,'Lazada' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN (select sku,max(erp_user_id) as erp_user_id from erp_lazada_products GROUP BY sku) c on b.orders_sku=c.sku
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type=15
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY c.erp_user_id;

CREATE INDEX e03 on Thirty_day_xl_15(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Lazada_xs
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_15 a INNER  JOIN Seven_day_xl_15 b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_15 c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_15;
drop table Seven_day_xl_15;
drop table Thirty_day_xl_15;
/*---------------------------------------以下-Joom-----------------------------------------------------------*/
-- 取值 Joom
create TEMPORARY table Yesterday_xl_18
select d.user_id as erp_user_id,'Joom' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_joom_product_detail c on b.orders_item_number=c.productId and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=18 and d.sale_code=substring_index(c.original_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type=18 and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY d.user_id;

CREATE INDEX f01 on Yesterday_xl_18(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_18
select d.user_id as erp_user_id,'Joom' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_joom_product_detail c on b.orders_item_number=c.productId and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=18 and d.sale_code=substring_index(c.original_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type=18 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY d.user_id;

CREATE INDEX f02 on Seven_day_xl_18(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_18
select d.user_id as erp_user_id,'Joom' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_joom_product_detail c on b.orders_item_number=c.productId and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=18 and d.sale_code=substring_index(c.original_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type=18 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY d.user_id;

CREATE INDEX f03 on Thirty_day_xl_18(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Joom_xs
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_18 a INNER  JOIN Seven_day_xl_18 b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_18 c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_18;
drop table Seven_day_xl_18;
drop table Thirty_day_xl_18;

/*---------------------------------------以下-Shopee-----------------------------------------------------------*/
-- 取值 Shopee
create TEMPORARY table Yesterday_xl_19
select c.erp_user_id,'Shopee' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_shopee_products c on b.orderlineitemid=c.item_id
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type=19 and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY c.erp_user_id;

CREATE INDEX g01 on Yesterday_xl_19(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_19
select c.erp_user_id,'Shopee' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_shopee_products c on b.orderlineitemid=c.item_id
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type=19
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY c.erp_user_id;

CREATE INDEX g02 on Seven_day_xl_19(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_19
select c.erp_user_id,'Shopee' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_shopee_products c on b.orderlineitemid=c.item_id
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type=19
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY c.erp_user_id;

CREATE INDEX g03 on Thirty_day_xl_19(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Shopee_xs
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_19 a INNER  JOIN Seven_day_xl_19 b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_19 c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_19;
drop table Seven_day_xl_19;
drop table Thirty_day_xl_19;
/*---------------------------------------以下-Walmart-----------------------------------------------------------*/
-- 取值 Walmart
create TEMPORARY table Yesterday_xl_22
select a.erp_user_id,'Walmart' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type in(22,29) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY a.erp_user_id;

CREATE INDEX h01 on Yesterday_xl_22(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_22
select a.erp_user_id,'Walmart' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type in(22,29)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY a.erp_user_id;

CREATE INDEX h02 on Seven_day_xl_22(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_22
select a.erp_user_id,'Walmart' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type in(22,29)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY a.erp_user_id;

CREATE INDEX h03 on Thirty_day_xl_22(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Walmart_xs
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_22 a INNER  JOIN Seven_day_xl_22 b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_22 c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_22;
drop table Seven_day_xl_22;
drop table Thirty_day_xl_22;

/*---------------------------------------以下-其他平台-----------------------------------------------------------*/
-- 取值 其他平台 not in(1,6,7,13,15,18,19,22,25,26,27,29) 
create TEMPORARY table Yesterday_xl_qt
select a.orders_type as erp_user_id,a.orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type not in(1,6,7,13,15,18,19,22,25,26,27,29) 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY a.orders_type;

CREATE INDEX w01 on Yesterday_xl_qt(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_qt
select a.orders_type as erp_user_id,a.orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type not in(1,6,7,13,15,18,19,22,25,26,27,29) 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8 -- 小于利润8
GROUP BY a.orders_type;

CREATE INDEX w02 on Seven_day_xl_qt(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_qt
select a.orders_type as erp_user_id,a.orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type not in(1,6,7,13,15,18,19,22,25,26,27,29) 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 and a.profitRate<8
GROUP BY a.orders_type;

CREATE INDEX w03 on Thirty_day_xl_qt(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table qt_xs
select a.erp_user_id,
 case when a.erp_user_id=1 then 'EBay'  when a.erp_user_id=26 then 'Ebay2'
when a.erp_user_id=7 then 'Amazon'     when a.erp_user_id=27 then 'Amazon2'
when a.erp_user_id=13 then 'Wish'      when a.erp_user_id=25 then 'Wish2'
when a.erp_user_id=6 then 'AliExpress' when a.erp_user_id=18 then 'Joom'
when a.erp_user_id=19 then 'Shopee'    when a.erp_user_id=15 then 'Lazada'
when a.erp_user_id=16 then 'Dhgate'    when a.erp_user_id=17 then 'Cdiscount'
when a.erp_user_id=3 then '线下交易'   when a.erp_user_id=20 then 'Zilingo'
when a.erp_user_id=5 then '补货'       when a.erp_user_id=22 then 'Walmart'
when a.erp_user_id=23 then 'Q10'       when a.erp_user_id=24 then 'Priminister'
when a.erp_user_id=21 then 'Paytm'     when a.erp_user_id=28 then 'AmazonIn' else '其它' end as 负责人,

case when a.orders_type=1 then 'EBay'  when a.orders_type=26 then 'Ebay2'
when a.orders_type=7 then 'Amazon'     when a.orders_type=27 then 'Amazon2'
when a.orders_type=13 then 'Wish'      when a.orders_type=25 then 'Wish2'
when a.orders_type=6 then 'AliExpress' when a.orders_type=18 then 'Joom'
when a.orders_type=19 then 'Shopee'    when a.orders_type=15 then 'Lazada'
when a.orders_type=16 then 'Dhgate'    when a.orders_type=17 then 'Cdiscount'
when a.orders_type=3 then '线下交易'   when a.orders_type=20 then 'Zilingo'
when a.orders_type=5 then '补货'       when a.orders_type=22 then 'Walmart'
when a.orders_type=23 then 'Q10'       when a.orders_type=24 then 'Priminister'
when a.orders_type=21 then 'Paytm'     when a.orders_type=28 then 'AmazonIn' else '其它' end as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_qt a INNER  JOIN Seven_day_xl_qt b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_qt c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_qt;
drop table Seven_day_xl_qt;
drop table Thirty_day_xl_qt;

-- 汇总数据
INSERT into orders_profitRate_Lower_Eight(rq,erp_user_id,name,orders_type,day_orders_num,day_orders_total,day_Profit_margin,
Seven_day_orders_num,Seven_day_orders_total,Seven_day_Profit_margin,
month_orders_num,month_orders_total,month_Profit_margin,inserttime)
select date_sub(@rq,interval 1 day) as rq,erp_user_id,负责人,平台,日订单量,日销售金额,利润率*100,
7日订单量,7日销售金额,7日利润率*100,
30日订单量,30日销售金额,30日利润率*100,NOW()
from (
select * from EBay_xs -- EBay
UNION all
select * from AliExpress_xs -- AliExpress
UNION all
select * from Amazon_xs -- Amazon_xs
UNION ALL
select * from Wish_xs -- Wish_xs
UNION all
select * from Lazada_xs -- Lazada_xs
UNION ALL
select * from Joom_xs -- Joom_xs
UNION all
select * from Shopee_xs -- Shopee_xs
UNION ALL
select * from Walmart_xs -- Walmart_xs
UNION ALL
select * from qt_xs
) a;

-- 释放占用资源
DROP table orders_products_lishi;
DROP table EBay_xs;
DROP table AliExpress_xs;
DROP table Amazon_xs;
DROP table Wish_xs;
DROP table Lazada_xs;
DROP table Joom_xs;
DROP table Shopee_xs;
DROP table Walmart_xs;
DROP table qt_xs;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for orders_profitRate_total
-- ----------------------------
DROP PROCEDURE IF EXISTS `orders_profitRate_total`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `orders_profitRate_total`(
)
    SQL SECURITY INVOKER
BEGIN
-- 计算昨天销售的订单对应的负责人、订单量、销售金额。每天凌晨02:40计算

/*
CREATE TABLE `orders_profitRate_total` (
  `rq` varchar(10) DEFAULT NULL COMMENT '统计日期',
  `erp_user_id` int(11) DEFAULT NULL COMMENT '负责人ID',
  `name` varchar(50) DEFAULT '0' COMMENT '负责人名字',
  `orders_type` varchar(50) DEFAULT NULL COMMENT '平台',
  `day_orders_num` int(11) DEFAULT '0' COMMENT '日订单量',
  `day_orders_total` decimal(14,2) DEFAULT '0.00' COMMENT '日销售金额',
  `day_Profit_margin` float DEFAULT '0' COMMENT '利润率',
  `Seven_day_orders_num` int(11) DEFAULT '0' COMMENT '7日订单量',
  `Seven_day_orders_total` decimal(14,2) DEFAULT '0.00' COMMENT '7日销售金额',
  `Seven_day_Profit_margin` float DEFAULT '0' COMMENT '7日利润率',
  `month_orders_num` int(11) DEFAULT '0' COMMENT '30日订单量',
  `month_orders_total` decimal(14,2) DEFAULT '0.00' COMMENT '30日销售金额',
  `month_Profit_margin` float DEFAULT '0' COMMENT '30日利润率',
  `inserttime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  KEY `rq` (`rq`),
  KEY `orders_type` (`orders_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单负责人销售汇总';
*/

set @rq=curdate();

CREATE TEMPORARY table orders_products_lishi_z
select a.erp_orders_id,a.orders_item_number,a.orders_sku,a.platform_sku,a.orderlineitemid
from erp_orders_products a INNER JOIN erp_orders b on a.erp_orders_id=b.erp_orders_id
where b.orders_export_time<date_sub(@rq,interval 0 day) and b.orders_export_time>=date_sub(@rq,interval 30 day)
and b.orders_type in(1,6,7,13,15,18,19,22,25,26,27,29) 
and b.orders_status IN (1,3,4,5,8) AND b.orders_is_join =0 and 
a.orders_sku=(select max(orders_sku) from erp_orders_products where erp_orders_products.erp_orders_id=a.erp_orders_id);

CREATE INDEX s01 on orders_products_lishi_z(erp_orders_id);

-- 取值ebay
create TEMPORARY table Yesterday_xl_1_z
select d.user_id as erp_user_id,'EBay' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN sf_itemid_sku c on b.orders_item_number=c.itemNumber and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=1 and d.sale_code=substring_index(c.ebaysku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type in(1,26) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX a01 on Yesterday_xl_1_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_1_z
select d.user_id as erp_user_id,'EBay' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN sf_itemid_sku c on b.orders_item_number=c.itemNumber and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=1 and d.sale_code=substring_index(c.ebaysku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type in(1,26) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX a02 on Seven_day_xl_1_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_1_z
select d.user_id as erp_user_id,'EBay' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN sf_itemid_sku c on b.orders_item_number=c.itemNumber and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=1 and d.sale_code=substring_index(c.ebaysku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type in(1,26) 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX a03 on Thirty_day_xl_1_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table EBay_xs_z
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_1_z a INNER  JOIN Seven_day_xl_1_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_1_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_1_z;
drop table Seven_day_xl_1_z;
drop table Thirty_day_xl_1_z;

/*---------------------------------------以下-AliExpress-----------------------------------------------------------*/
-- 取值 AliExpress
create TEMPORARY table Yesterday_xl_6_z
select d.user_id as erp_user_id,'AliExpress' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN smt_product_skus c on b.orders_item_number=c.productId and b.orders_sku=c.skuCode
LEFT JOIN erp_smt_user_sale_code d on d.order_type=6 and d.sale_code=substring_index(c.smtSkuCode,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type=6 and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX b01 on Yesterday_xl_6_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_6_z
select d.user_id as erp_user_id,'AliExpress' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN smt_product_skus c on b.orders_item_number=c.productId and b.orders_sku=c.skuCode
LEFT JOIN erp_smt_user_sale_code d on d.order_type=6 and d.sale_code=substring_index(c.smtSkuCode,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type=6 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX b02 on Seven_day_xl_6_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_6_z
select d.user_id as erp_user_id,'AliExpress' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN smt_product_skus c on b.orders_item_number=c.productId and b.orders_sku=c.skuCode
LEFT JOIN erp_smt_user_sale_code d on d.order_type=6 and d.sale_code=substring_index(c.smtSkuCode,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type=6 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX b03 on Thirty_day_xl_6_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table AliExpress_xs_z
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_6_z a INNER  JOIN Seven_day_xl_6_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_6_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_6_z;
drop table Seven_day_xl_6_z;
drop table Thirty_day_xl_6_z;
/*---------------------------------------以下-Amazon-----------------------------------------------------------*/
-- 取值 Amazon
create TEMPORARY table Yesterday_xl_7_z
select d.user_id as erp_user_id,'Amazon' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(7,27) and d.sale_code=substring_index(b.platform_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type in(7,27) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX c01 on Yesterday_xl_7_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_7_z
select d.user_id as erp_user_id,'Amazon' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(7,27) and d.sale_code=substring_index(b.platform_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type in(7,27)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX c02 on Seven_day_xl_7_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_7_z
select d.user_id as erp_user_id,'Amazon' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(7,27) and d.sale_code=substring_index(b.platform_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type in(7,27)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX c03 on Thirty_day_xl_7_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Amazon_xs_z
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_7_z a INNER  JOIN Seven_day_xl_7_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_7_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_7_z;
drop table Seven_day_xl_7_z;
drop table Thirty_day_xl_7_z;
/*---------------------------------------以下-Wish-----------------------------------------------------------*/
-- 取值 Wish
create TEMPORARY table Yesterday_xl_13_z
select d.user_id as erp_user_id,'Wish' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_wish_product_detail c on b.orders_item_number=c.productID and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(13,25) and d.sale_code=c.sellerID
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type in(13,25) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX d01 on Yesterday_xl_13_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_13_z
select d.user_id as erp_user_id,'Wish' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_wish_product_detail c on b.orders_item_number=c.productID and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(13,25) and d.sale_code=c.sellerID
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type in(13,25)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX d02 on Seven_day_xl_13_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_13_z
select d.user_id as erp_user_id,'Wish' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_wish_product_detail c on b.orders_item_number=c.productID and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type in(13,25) and d.sale_code=c.sellerID
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type in(13,25)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX d03 on Thirty_day_xl_13_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Wish_xs_z
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_13_z a INNER  JOIN Seven_day_xl_13_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_13_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_13_z;
drop table Seven_day_xl_13_z;
drop table Thirty_day_xl_13_z;

/*---------------------------------------以下-Lazada-----------------------------------------------------------*/
-- 取值 Lazada
create TEMPORARY table Yesterday_xl_15_z
select c.erp_user_id,'Lazada' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN (select sku,max(erp_user_id) as erp_user_id from erp_lazada_products GROUP BY sku) c on b.orders_sku=c.sku
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type=15 and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY c.erp_user_id;

CREATE INDEX e01 on Yesterday_xl_15_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_15_z
select c.erp_user_id,'Lazada' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN (select sku,max(erp_user_id) as erp_user_id from erp_lazada_products GROUP BY sku) c on b.orders_sku=c.sku
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type=15
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY c.erp_user_id;

CREATE INDEX e02 on Seven_day_xl_15_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_15_z
select c.erp_user_id,'Lazada' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN (select sku,max(erp_user_id) as erp_user_id from erp_lazada_products GROUP BY sku) c on b.orders_sku=c.sku
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type=15
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY c.erp_user_id;

CREATE INDEX e03 on Thirty_day_xl_15_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Lazada_xs_z
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_15_z a INNER  JOIN Seven_day_xl_15_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_15_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_15_z;
drop table Seven_day_xl_15_z;
drop table Thirty_day_xl_15_z;
/*---------------------------------------以下-Joom-----------------------------------------------------------*/
-- 取值 Joom
create TEMPORARY table Yesterday_xl_18_z
select d.user_id as erp_user_id,'Joom' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_joom_product_detail c on b.orders_item_number=c.productId and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=18 and d.sale_code=substring_index(c.original_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type=18 and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX f01 on Yesterday_xl_18_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_18_z
select d.user_id as erp_user_id,'Joom' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_joom_product_detail c on b.orders_item_number=c.productId and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=18 and d.sale_code=substring_index(c.original_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type=18 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX f02 on Seven_day_xl_18_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_18_z
select d.user_id as erp_user_id,'Joom' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_joom_product_detail c on b.orders_item_number=c.productId and b.orders_sku=c.sku
LEFT JOIN erp_smt_user_sale_code d on d.order_type=18 and d.sale_code=substring_index(c.original_sku,'*',1)
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type=18 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY d.user_id;

CREATE INDEX f03 on Thirty_day_xl_18_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Joom_xs_z
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_18_z a INNER  JOIN Seven_day_xl_18_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_18_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_18_z;
drop table Seven_day_xl_18_z;
drop table Thirty_day_xl_18_z;

/*---------------------------------------以下-Shopee-----------------------------------------------------------*/
-- 取值 Shopee
create TEMPORARY table Yesterday_xl_19_z
select c.erp_user_id,'Shopee' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_shopee_products c on b.orderlineitemid=c.item_id
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type=19 and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY c.erp_user_id;

CREATE INDEX g01 on Yesterday_xl_19_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_19_z
select c.erp_user_id,'Shopee' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_shopee_products c on b.orderlineitemid=c.item_id
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type=19
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY c.erp_user_id;

CREATE INDEX g02 on Seven_day_xl_19_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_19_z
select c.erp_user_id,'Shopee' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
INNER JOIN orders_products_lishi_z b on a.erp_orders_id=b.erp_orders_id 
LEFT JOIN erp_shopee_products c on b.orderlineitemid=c.item_id
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type=19
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY c.erp_user_id;

CREATE INDEX g03 on Thirty_day_xl_19_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Shopee_xs_z
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_19_z a INNER  JOIN Seven_day_xl_19_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_19_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_19_z;
drop table Seven_day_xl_19_z;
drop table Thirty_day_xl_19_z;
/*---------------------------------------以下-Walmart-----------------------------------------------------------*/
-- 取值 Walmart
create TEMPORARY table Yesterday_xl_22_z
select a.erp_user_id,'Walmart' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type in(22,29) and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY a.erp_user_id;

CREATE INDEX h01 on Yesterday_xl_22_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_22_z
select a.erp_user_id,'Walmart' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type in(22,29)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY a.erp_user_id;

CREATE INDEX h02 on Seven_day_xl_22_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_22_z
select a.erp_user_id,'Walmart' as orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type in(22,29)
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY a.erp_user_id;

CREATE INDEX h03 on Thirty_day_xl_22_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table Walmart_xs_z
select a.erp_user_id,d.`name` as 负责人,a.orders_type as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_22_z a INNER  JOIN Seven_day_xl_22_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_22_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_22_z;
drop table Seven_day_xl_22_z;
drop table Thirty_day_xl_22_z;

/*---------------------------------------以下-其他平台-----------------------------------------------------------*/
-- 取值 其他平台 not in(1,6,7,13,15,18,19,22,25,26,27,29) 
create TEMPORARY table Yesterday_xl_qt_z
select a.orders_type as erp_user_id,a.orders_type,
COUNT(DISTINCT a.erp_orders_id) as 日订单量,sum(a.orders_total/a.currency_value) as 日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 1 day)
and a.orders_type not in(1,6,7,13,15,18,19,22,25,26,27,29) 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY a.orders_type;

CREATE INDEX w01 on Yesterday_xl_qt_z(erp_user_id,orders_type);
-- 7天销量,利润小于8
create TEMPORARY table Seven_day_xl_qt_z
select a.orders_type as erp_user_id,a.orders_type,
COUNT(DISTINCT a.erp_orders_id) as 7日订单量,sum(a.orders_total/a.currency_value) as 7日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 7日利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 7 day)
and a.orders_type not in(1,6,7,13,15,18,19,22,25,26,27,29) 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY a.orders_type;

CREATE INDEX w02 on Seven_day_xl_qt_z(erp_user_id,orders_type);
-- 30天销售,利润小于8
create TEMPORARY table Thirty_day_xl_qt_z
select a.orders_type as erp_user_id,a.orders_type,
COUNT(DISTINCT a.erp_orders_id) as 30日订单量,sum(a.orders_total/a.currency_value) as 30日销售金额,sum(a.profitTotal)/sum(a.orders_total/a.currency_value) as 30日利润率
from erp_orders a 
where orders_export_time<date_sub(@rq,interval 0 day) and orders_export_time>=date_sub(@rq,interval 30 day)
and a.orders_type not in(1,6,7,13,15,18,19,22,25,26,27,29) 
and a.orders_status IN (1,3,4,5,8) AND a.orders_is_join =0 
GROUP BY a.orders_type;

CREATE INDEX w03 on Thirty_day_xl_qt_z(erp_user_id,orders_type);
-- 数据汇总
CREATE TEMPORARY table qt_xs_z
select a.erp_user_id,
 case when a.erp_user_id=1 then 'EBay'  when a.erp_user_id=26 then 'Ebay2'
when a.erp_user_id=7 then 'Amazon'     when a.erp_user_id=27 then 'Amazon2'
when a.erp_user_id=13 then 'Wish'      when a.erp_user_id=25 then 'Wish2'
when a.erp_user_id=6 then 'AliExpress' when a.erp_user_id=18 then 'Joom'
when a.erp_user_id=19 then 'Shopee'    when a.erp_user_id=15 then 'Lazada'
when a.erp_user_id=16 then 'Dhgate'    when a.erp_user_id=17 then 'Cdiscount'
when a.erp_user_id=3 then '线下交易'   when a.erp_user_id=20 then 'Zilingo'
when a.erp_user_id=5 then '补货'       when a.erp_user_id=22 then 'Walmart'
when a.erp_user_id=23 then 'Q10'       when a.erp_user_id=24 then 'Priminister'
when a.erp_user_id=21 then 'Paytm'     when a.erp_user_id=28 then 'AmazonIn' else '其它' end as 负责人,

case when a.orders_type=1 then 'EBay'  when a.orders_type=26 then 'Ebay2'
when a.orders_type=7 then 'Amazon'     when a.orders_type=27 then 'Amazon2'
when a.orders_type=13 then 'Wish'      when a.orders_type=25 then 'Wish2'
when a.orders_type=6 then 'AliExpress' when a.orders_type=18 then 'Joom'
when a.orders_type=19 then 'Shopee'    when a.orders_type=15 then 'Lazada'
when a.orders_type=16 then 'Dhgate'    when a.orders_type=17 then 'Cdiscount'
when a.orders_type=3 then '线下交易'   when a.orders_type=20 then 'Zilingo'
when a.orders_type=5 then '补货'       when a.orders_type=22 then 'Walmart'
when a.orders_type=23 then 'Q10'       when a.orders_type=24 then 'Priminister'
when a.orders_type=21 then 'Paytm'     when a.orders_type=28 then 'AmazonIn' else '其它' end as 平台,
日订单量,日销售金额,利润率,7日订单量,7日销售金额,7日利润率,30日订单量,30日销售金额,30日利润率
from Yesterday_xl_qt_z a INNER  JOIN Seven_day_xl_qt_z b on a.erp_user_id=b.erp_user_id and a.orders_type=b.orders_type
INNER JOIN Thirty_day_xl_qt_z c on a.orders_type=c.orders_type and a.erp_user_id=c.erp_user_id
LEFT JOIN erp_manages d on a.erp_user_id=d.id;

-- 释放占用资源
drop table Yesterday_xl_qt_z;
drop table Seven_day_xl_qt_z;
drop table Thirty_day_xl_qt_z;

-- 汇总数据
INSERT into orders_profitRate_total(rq,erp_user_id,name,orders_type,day_orders_num,day_orders_total,day_Profit_margin,
Seven_day_orders_num,Seven_day_orders_total,Seven_day_Profit_margin,
month_orders_num,month_orders_total,month_Profit_margin,inserttime)
select date_sub(@rq,interval 1 day) as rq,erp_user_id,负责人,平台,日订单量,日销售金额,利润率*100,
7日订单量,7日销售金额,7日利润率*100,
30日订单量,30日销售金额,30日利润率*100,NOW()
from (
select * from EBay_xs_z -- EBay_xs_z
UNION all
select * from AliExpress_xs_z -- AliExpress_xs_z
UNION all
select * from Amazon_xs_z -- Amazon_xs_z
UNION ALL
select * from Wish_xs_z -- Wish_xs_z
UNION all
select * from Lazada_xs_z -- Lazada_xs_z
UNION ALL
select * from Joom_xs_z -- Joom_xs_z
UNION all
select * from Shopee_xs_z -- Shopee_xs_z
UNION ALL
select * from Walmart_xs_z -- Walmart_xs_z
UNION ALL
select * from qt_xs_z
) a;

-- 释放占用资源
DROP table orders_products_lishi_z;
DROP table EBay_xs_z;
DROP table AliExpress_xs_z;
DROP table Amazon_xs_z;
DROP table Wish_xs_z;
DROP table Lazada_xs_z;
DROP table Joom_xs_z;
DROP table Shopee_xs_z;
DROP table Walmart_xs_z;
DROP table qt_xs_z;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for orders_sheet
-- ----------------------------
DROP PROCEDURE IF EXISTS `orders_sheet`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `orders_sheet`(
)
    SQL SECURITY INVOKER
begin
-- 删除目标表当天的数据 删除数据的时候每次删除100000条,防止由于删除数据量过大写爆日志
  declare data_quantity int default 0 ; 
SELECT @batch_run_date:=DATE_SUB(CURDATE(),INTERVAL 1 DAY);
SELECT @start_date:=DATE_SUB(DATE_FORMAT(@batch_run_date, '%Y-%m-%d %H:%i:%t'),INTERVAL 1 DAY);
SELECT @end_date:=DATE_SUB(DATE_FORMAT(CURDATE(),'%Y-%m-%d %H:%i:%s'),INTERVAL 1 SECOND); -- 当前结束日期时分秒

SELECT 
    COUNT(1)
INTO data_quantity FROM
    erp_database_newest.orders_sheet
WHERE
    ac_date = @batch_run_date;
 repeat
   delete from erp_database_newest.orders_sheet where ac_date = @batch_run_date limit 100000;
   set data_quantity = data_quantity - 100000;
   until data_quantity <= 0
   end repeat;
   
-- 对每个字段写入相对应的逻辑
insert into erp_database_newest.orders_sheet
select    @batch_run_date -- 日期
          ,T1.new_orders_yesterday   -- 昨日新进订单数  T+1时间新录入的订单总数
          ,t1.new_orders_yesterday + t2.not_order_before_yesterday as total_orders_yesterday -- 昨日总订单数,
          ,t2.not_order_before_yesterday -- 前日未发订单数
          ,round(t2.not_order_before_yesterday / (t1.new_orders_yesterday + t2.not_order_before_yesterday),4) as not_order_rate_before_yesterday -- 前日未发订单比例
          ,t1.owe_order_total_yesterday -- 昨日欠货订单数
          ,round(t1.owe_order_total_yesterday / (t1.new_orders_yesterday + t2.not_order_before_yesterday),4) as owe_order_rate_yesterday -- 昨日欠货订单比例
          ,t3.deliver_order_total_yesterday -- 昨日发货订单数
          ,round(t3.deliver_order_total_yesterday / (t1.new_orders_yesterday + t2.not_order_before_yesterday),4) as delivery_order_rate_yesterday -- 昨日总发货订单比例
          ,t2.not_order_before_3_days  -- 3天以内未发订单数
          ,t2.not_order_3_between_7_days -- 3到7天内未发订单数
          ,t2.not_order_7_days_last -- 7天以上未发订单数
from      (select  @batch_run_date as ac_date,count(erp_orders_id) as new_orders_yesterday -- 昨日新进订单数
                   ,count(case when orders_is_backorder = 1 then erp_orders_id else null end) as owe_order_total_yesterday  -- 昨日欠货订单数
          from     erp_database_newest.erp_orders
          where    orders_status in (1,3,4,5,7,8,9,10,11,12)  -- 新进订单标志
          and      orders_export_time between @start_date and @end_date  -- 订单录入日期为当天
          ) as t1
LEFT JOIN (select  @batch_run_date as ac_date,count(erp_orders_id) as not_order_yesterday -- 昨日未发货订单数
		           ,count(case when orders_export_time <= date_sub(@start_date,interval 1 day) 
                           then erp_orders_id else null end) as not_order_before_yesterday  -- 前日未发货订单
		           ,count(case when orders_export_time between date_sub(@start_date,interval 2 day) and @end_date
                           then erp_orders_id else null end) as not_order_before_3_days  -- 3天以内未发货订单
                   ,count(case when orders_export_time between date_sub(@start_date,interval 6 day) and date_sub(@end_date,interval 3 day)
                           then erp_orders_id else null end) as not_order_3_between_7_days  -- 3到7天内未发订单数
                   ,count(case when orders_export_time between date_sub(@start_date,interval 6 day) and date_sub(@start_date,interval 29 day)
                           then erp_orders_id else null end) as not_order_7_days_last  -- 7天以上未发订单数(到30天截止)
          from     erp_database_newest.erp_orders
          where    orders_status in (1,2,3,4,12)  -- 未发订单标志
		  and      orders_export_time >= date_sub(@start_date,interval 29 day)
		  and      orders_export_time <= @end_date
          ) as t2
on        t1.ac_date = t2.ac_date
left join (select  @batch_run_date as ac_date,count(1) as deliver_order_total_yesterday  -- 昨日发货订单数 
          from     erp_database_newest.erp_orders
          where    orders_status = 5 -- 发货订单标志
          and      orders_shipping_time between @start_date and @end_date -- 订单发货日期为当天
		  and      orders_export_time between date_sub(@start_date,interval 29 day) and @end_date -- 30天以前所录入的订单
          )  as t3
on        t1.ac_date = t3.ac_date
;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for orders_sku_Sale
-- ----------------------------
DROP PROCEDURE IF EXISTS `orders_sku_Sale`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `orders_sku_Sale`(
)
    SQL SECURITY INVOKER
BEGIN
-- 统计sku的每天销售数量，且写入前一天的数据到orders_sku_Sale

INSERT into orders_sku_Sale(date,orders_warehouse_id,orders_sku,orders_num)
select date,orders_warehouse_id,orders_sku,sum(orders_num) as orders_num from
(
-- 14天内速卖通每天的销量
SELECT SUBSTR(a.orders_export_time,1,10) as date,a.orders_warehouse_id,b.orders_sku,sum(b.item_count) as orders_num
FROM erp_orders a INNER JOIN erp_orders_products b ON a.erp_orders_id = b.erp_orders_id
WHERE a.orders_export_time >=date_sub(curdate(),interval 1 day) and a.orders_export_time< date_sub(curdate(),interval 0 day) 
and a.orders_status IN(1,3,4,5) and a.orders_type = 6
and a.orders_is_join= 0 and b.item_count <= 5 
GROUP BY SUBSTR(a.orders_export_time,1,10),b.orders_sku,a.orders_warehouse_id
UNION all
-- 14天内非速卖通每天的销量
SELECT SUBSTR(a.orders_export_time,1,10) as date,a.orders_warehouse_id,b.orders_sku,sum(b.item_count) as orders_num
FROM erp_orders a INNER JOIN erp_orders_products b ON a.erp_orders_id = b.erp_orders_id
WHERE a.orders_export_time >=date_sub(curdate(),interval 1 day) and a.orders_export_time< date_sub(curdate(),interval 0 day) 
and a.orders_status IN(1,3,4,5) and a.orders_type<>6
and a.orders_is_join= 0
GROUP BY SUBSTR(a.orders_export_time,1,10),b.orders_sku,a.orders_warehouse_id
) a 
where NOT EXISTS (select 1 from orders_sku_Sale b where a.date=b.date and a.orders_warehouse_id=b.orders_warehouse_id and a.orders_sku=b.orders_sku)
GROUP BY date,orders_warehouse_id,orders_sku;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Overage_loss_check
-- ----------------------------
DROP PROCEDURE IF EXISTS `Overage_loss_check`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `Overage_loss_check`(
)
    SQL SECURITY INVOKER
BEGIN
-- 表3
/*
CREATE table Overage_loss_check
(
rq char(10) default'0' COMMENT '日期',
product_warehouse_id int default 0 COMMENT '仓库ID',
products_sku varchar(50) default'' COMMENT 'sku',
in_num int default 0 COMMENT '盘盈入',
out_num int default 0 COMMENT '报损出',
insert_time datetime DEFAULT '0000-00-00 00:00:00' COMMENT '写入时间',
key idx_sku(products_sku),
key Idx_rq(rq)
);
*/
-- 计算出入库记录中 盘盈数据
set @rq:=curdate();
IF (select count(*) from Overage_loss_check where rq=date_sub(@rq,interval 1 day))<1
then
drop table if EXISTS crkjl_in;
CREATE TEMPORARY table crkjl_in
select products_sku,owned_warehouse,sum(orders_record_count) as in_num
from erp_orders_record where orders_record_time>=date_sub(@rq,interval 7 day) 
and orders_record_time<date_sub(@rq,interval 0 day)
and orders_record_type in(2,12)
GROUP BY products_sku,owned_warehouse;

CREATE INDEX a01 on crkjl_in(products_sku(255),owned_warehouse);

-- 计算出入库记录中 报损数据
drop table if EXISTS crkjl_out;
CREATE TEMPORARY table crkjl_out
select products_sku,owned_warehouse,sum(orders_record_count) as out_num
from erp_orders_record where orders_record_time>=date_sub(@rq,interval 7 day) 
and orders_record_time<date_sub(@rq,interval 0 day)
and orders_record_type=3
GROUP BY products_sku,owned_warehouse;

CREATE INDEX a02 on crkjl_out(products_sku(255),owned_warehouse);

-- 汇总数据比对
INSERT into Overage_loss_check(rq,products_sku,product_warehouse_id,in_num,out_num,insert_time)
select date_sub(@rq,interval 0 day) as rq,a.products_sku,a.product_warehouse_id,IFNULL(b.in_num,0) as 盘盈入,ifnull(c.out_num,0) as 报损出
,NOW() as insert_time
from erp_products_data a LEFT JOIN crkjl_in b on a.products_sku=b.products_sku and a.product_warehouse_id=b.owned_warehouse
left JOIN crkjl_out c on a.products_sku=c.products_sku and a.product_warehouse_id=c.owned_warehouse
where IFNULL(b.in_num,0)<>0 or ifnull(c.out_num,0)<>0 
ORDER BY a.product_warehouse_id;

drop table crkjl_in;
drop table crkjl_out;

end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Real_stock_check
-- ----------------------------
DROP PROCEDURE IF EXISTS `Real_stock_check`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `Real_stock_check`(
)
    SQL SECURITY INVOKER
BEGIN
-- 表2
/*
CREATE table Real_stock_check
(
rq char(10) default'0' COMMENT '日期',
product_id int default 0 COMMENT '产品ID',
product_warehouse_id int default 0 COMMENT '仓库ID',
products_sku varchar(50) default'' COMMENT 'sku',
products_name varchar(255) default'' COMMENT 'sku中文名',
stock int default 0 COMMENT '现在库存',
Balance_stock int default 0 COMMENT '实库存变化结余库存',
Balance_stock_difference int default 0 COMMENT '现在库存减结余库存',
is_fs char(2) default'N' COMMENT '是否已经发送',
insert_time datetime DEFAULT '0000-00-00 00:00:00' COMMENT '写入时间',
key idx_sku(product_id),
key Idx_rq(rq)
);
*/
-- 取得sku实库存变化的最后序号
set @rq:=curdate();
IF (select count(*) from Real_stock_check where rq=date_sub(@rq,interval 1 day))<1
then
drop table if EXISTS max_record;
create temporary table max_record
select product_id,max(record_id) as record_id
from erp_stock_detail_operate_record_detail 
where operate_time>=date_sub(@rq,interval 1 day) 
GROUP BY product_id;

CREATE INDEX a01 on max_record(product_id);
-- 先取得库存数据，减少时间差
-- 取得库存数据
drop table if EXISTS stock_jl;
create temporary table stock_jl
select products_id,actual_stock from erp_stock_detail;

CREATE INDEX a02 on stock_jl(products_id);
-- 取得实库存变化表结余库存
drop table if EXISTS record_jl;
create temporary table record_jl
select a.product_id,a.stock 
from erp_stock_detail_operate_record_detail a INNER JOIN max_record b on a.record_id=b.record_id;

CREATE INDEX a03 on record_jl(product_id);
-- 实际库存比对 在库库存，不同的显示
INSERT into Real_stock_check(rq,product_id,product_warehouse_id,products_sku,products_name,stock,Balance_stock,Balance_stock_difference,is_fs,insert_time)
select date_sub(@rq,interval 1 day) as rq,a.product_id,c.product_warehouse_id,c.products_sku,c.products_name_cn,IFNULL(actual_stock,0) as 现在库存,a.stock as 实库存变化结余库存,
IFNULL(actual_stock,0)-a.stock as 结余库存的差异,'N' as 是否已发送,NOW() as 记录时间
from record_jl a LEFT JOIN stock_jl b on a.product_id=b.products_id
INNER JOIN erp_products_data c on a.product_id=c.products_id
where a.stock<>IFNULL(actual_stock,0) ORDER BY c.product_warehouse_id,a.product_id;

drop table max_record;
drop table stock_jl;
drop table record_jl;

end if;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for update_wuliu_zx2_fields
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_wuliu_zx2_fields`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `update_wuliu_zx2_fields`(
)
    SQL SECURITY INVOKER
BEGIN 
set @current_date_start='2015-01-01';
set @i=1;

WHILE @i <= 12 do

set @current_date_end=DATE_ADD(@current_date_start,INTERVAL 1 month); 

update wuliu_zx2 wz 
inner join 
erp_products_database_history.erp_orders_2016 o  on wz.shipping_code=o.orders_shipping_code 
set wz.erp_orders_id=o.erp_orders_id,wz.orders_export_time=o.orders_export_time,wz.orders_shipping_time=o.orders_shipping_time,wz.orders_status=o.orders_status,wz.orders_is_join=o.orders_is_join 
where 
 bill_date>=@current_date_start and bill_date<@current_date_end 
and  o.orders_is_join=0 ;

set @current_date_start=@current_date_end;
set @i=@i+1;

end while;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for update_wuliu_zx2_fields_2
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_wuliu_zx2_fields_2`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `update_wuliu_zx2_fields_2`(
)
    SQL SECURITY INVOKER
BEGIN 
set @current_date_start='2015-01-01';
set @current_date_end='2015-01-01';
set @i=1;

-- WHILE @current_date_end <= '2015-10-01' do
WHILE @current_date_end <= '2018-01-01' do

set @current_date_end=DATE_ADD(@current_date_start,INTERVAL 1 month); 

update wuliu_zx2 wz 
inner join 
(
	SELECT 
	o.orders_shipping_code,o.erp_orders_id,o.orders_export_time,o.orders_shipping_time,o.orders_status,o.orders_is_join,o.shipmentAutoMatched,o.orders_old_shipping_code  
	FROM caiwu.orders_2017_15 o
	where o.orders_shipping_time>=@current_date_start and o.orders_shipping_time<@current_date_end 
	-- and o.orders_is_join=0 
) o 
on wz.shipping_code=o.orders_shipping_code 

set 
wz.erp_orders_id=o.erp_orders_id,wz.orders_export_time=o.orders_export_time,
wz.orders_shipping_time=(case when o.orders_shipping_time is null then o.orders_export_time ELSE o.orders_shipping_time end),
wz.orders_status=o.orders_status,wz.orders_is_join=o.orders_is_join,company_name=o.shipmentAutoMatched 

where 1 
-- and  o.orders_is_join=0 
and wz.shipping_code !='';





set @current_date_start=@current_date_end;

end while;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for update_wuliu_zx2_fields_2_orders_old_shipping_code
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_wuliu_zx2_fields_2_orders_old_shipping_code`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `update_wuliu_zx2_fields_2_orders_old_shipping_code`(
)
    SQL SECURITY INVOKER
BEGIN 
set @current_date_start='2015-01-01';
set @current_date_end='2015-01-01';
set @i=1;

-- WHILE @current_date_end <= '2015-10-01' do
WHILE @current_date_end <= '2018-01-01' do

set @current_date_end=DATE_ADD(@current_date_start,INTERVAL 1 month); 

update wuliu_zx2 wz 
inner join 
(
	SELECT 
	o.orders_shipping_code,o.erp_orders_id,o.orders_export_time,o.orders_shipping_time,o.orders_status,o.orders_is_join,o.shipmentAutoMatched,o.orders_old_shipping_code   
	FROM caiwu.orders_2017_15 o
	where o.orders_shipping_time>=@current_date_start and o.orders_shipping_time<@current_date_end 
	-- and o.orders_is_join=0 
) o 
on wz.shipping_code=o.orders_old_shipping_code 

set 
	wz.erp_orders_id=o.erp_orders_id,wz.orders_export_time=o.orders_export_time,
	wz.orders_shipping_time=(case when o.orders_shipping_time is null then o.orders_export_time ELSE o.orders_shipping_time end),
	wz.orders_status=o.orders_status,wz.orders_is_join=o.orders_is_join,company_name=o.shipmentAutoMatched 

where 1 
-- and  o.orders_is_join=0 
and wz.shipping_code !='' and wz.erp_orders_id=0;

set @current_date_start=@current_date_end;

end while;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for wc_wpp_qh_tj
-- ----------------------------
DROP PROCEDURE IF EXISTS `wc_wpp_qh_tj`;
DELIMITER ;;
CREATE DEFINER=`erp`@`%` PROCEDURE `wc_wpp_qh_tj`(
)
    SQL SECURITY INVOKER
BEGIN
-- 计算未拆数量
select @rq:=curdate();
CREATE TEMPORARY table wc_dd
select @rq as rq,COUNT(a.trackNumber) as 未拆总数,sum(a.count) as 未拆总箱数
from erp_parcelsreceived_express a INNER JOIN erp_parcelsreceived b on a.trackNumber=b.trackNumber
where addTime>DATE_SUB(@rq,INTERVAL 30 day)-- and addTime<DATE_SUB(@rq,INTERVAL 1 day) 
and (b.split_id=0 or b.split_id is null); -- 采购单-包裹关联表-快递信息表

-- 计算未匹配数量
CREATE TEMPORARY table wpp_dd
select @rq as rq,COUNT(a.trackNumber) as 未匹配总数,sum(a.count) as 未匹配总箱数
from erp_parcelsreceived_express a INNER JOIN erp_parcelsreceived b on a.trackNumber=b.trackNumber
where addTime>DATE_SUB(@rq,INTERVAL 30 day)-- and addTime<DATE_SUB(@rq,INTERVAL 1 day) 
and (b.trackNumberStatus=0 or b.trackNumberStatus is null); -- 采购单-包裹关联表-快递信息表

/*-----------------------计算 欠货单数、箱数---------------------------------------------*/
-- 获取30天内分配后的运输单
CREATE TEMPORARY table ysjl
select a.trackNumber,a.count,b.procurementId
from erp_parcelsreceived_express a INNER JOIN erp_parcelsreceived b on a.trackNumber=b.trackNumber
where addTime>DATE_SUB(@rq,INTERVAL 30 day)-- and addTime<DATE_SUB(@rq,INTERVAL 1 day) 
and b.trackNumberStatus=1; 
-- 取得运输单中的采购订单号
CREATE TEMPORARY table ysjl_cgd
select a.*,substring_index(substring_index(a.procurementId,',',b.help_topic_id+1),',',-1)  as po_id
from ysjl a  join  mysql.help_topic b  on b.help_topic_id < (length(a.procurementId) - length(replace(a.procurementId,',',''))+1)
order by a.trackNumber;  
-- 取得采购订单中的sku
CREATE INDEX ysjl_cgd_01 on ysjl_cgd(po_id);


CREATE TEMPORARY table ysjl_cgd_sku
select a.*,b.procurement_warehouse_id,c.op_pro_sku
from ysjl_cgd a INNER JOIN erp_procurement b on a.po_id=b.po_id
INNER JOIN erp_procurement_products c on c.po_id=a.po_id;


CREATE INDEX ysjl_cgd_sku_01 on ysjl_cgd_sku(procurement_warehouse_id,op_pro_sku);
-- 取得sku仓库库存
CREATE TEMPORARY table sku_kc
select b.actual_stock,a.* 
from ysjl_cgd_sku a INNER JOIN erp_stock_detail b on a.op_pro_sku=b.products_sku and b.stock_warehouse_id=a.procurement_warehouse_id;

-- 取得已打印 - 已通过 - 新录入 销售订单总数量
CREATE TEMPORARY table orders_shl
SELECT a.orders_warehouse_id,b.orders_sku,sum(b.item_count) as orders_num
FROM erp_orders a INNER JOIN erp_orders_products b ON a.erp_orders_id = b.erp_orders_id
WHERE a.orders_status IN (1,3,4) AND a.orders_is_join =0
GROUP BY a.orders_warehouse_id,b.orders_sku;

CREATE INDEX sku_kc_01 on sku_kc(procurement_warehouse_id,op_pro_sku);
CREATE INDEX orders_shl_01 on orders_shl(orders_warehouse_id,orders_sku);
-- 取得虚库存小于0的单号,虚库存小于0改订单当作欠货。订单总数即是欠货单数；运单sum(count)即是欠货总箱数
CREATE TEMPORARY table ysjl_hz
SELECT a.actual_stock-IFNULL(b.orders_num,'') as xkc,a.* 
from sku_kc a INNER JOIN orders_shl b on a.procurement_warehouse_id=b.orders_warehouse_id and a.op_pro_sku=b.orders_sku
where a.actual_stock-IFNULL(b.orders_num,'')<0;
-- 箱数去重
CREATE TEMPORARY table ysjl_hz_qc
select DISTINCT trackNumber,count from ysjl_hz;

-- 写入erp_parcelsreceived_scan 表
INSERT into erp_parcelsreceived_scan(rq,not_Remove_num,not_Remove_box_num,not_matching_num,not_matching_box_num,Owe_num,Owe_box_num,insert_time)
select a.rq,未拆总数,未拆总箱数,未匹配总数,未匹配总箱数,
(select COUNT(DISTINCT po_id) from ysjl_hz) as 欠货单数,(select SUM(count) from ysjl_hz_qc) as 欠货箱数,NOW()
from wc_dd a INNER JOIN wpp_dd b on a.rq=b.rq;

drop table wc_dd;
drop table wpp_dd;
drop table ysjl;
drop table ysjl_cgd;
drop table ysjl_cgd_sku;
drop table sku_kc;
drop table orders_shl;
drop table ysjl_hz;
drop table ysjl_hz_qc;
END
;;
DELIMITER ;
