-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2026 at 04:22 PM
-- Server version: 10.6.25-MariaDB-cll-lve
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `primabakery`
--
use `primabakery`;
-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `faq_title` varchar(255) NOT NULL,
  `white_faq_name` varchar(255) NOT NULL,
  `white_faq_description` longtext NOT NULL,
  `black_faq_name` varchar(255) NOT NULL,
  `black_faq_description` longtext NOT NULL,
  `social_work_heading` varchar(255) NOT NULL,
  `social_work_title` varchar(255) NOT NULL,
  `social_work_description` longtext NOT NULL,
  `link` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `title`, `description`, `faq_title`, `white_faq_name`, `white_faq_description`, `black_faq_name`, `black_faq_description`, `social_work_heading`, `social_work_title`, `social_work_description`, `link`, `created_at`, `updated_at`) VALUES
(1, 'WELCOME TO ALI FINE FOODS', '<div>Welcome to Ali Fine Foods. We are a company founded and established in Dhaka, BD, created with the purpose of supplying food products to satisfy the continuous and timely stock replenishment of the food industry. We have several years of experience supplying the best products, with the highest quality and the best prices in the market. We are leading company in the marketing and distribution of Bread products, Sauce products, Dairy products and other products derived from grains and cereals, such as corn and quinoa.</div><div><br></div><div>We are proud and privileged for the support from our suppliers, for the fresh and quality in all our products and for the outstanding human capital who has allowed&nbsp;&nbsp;Ali fine Foods Limited. a positive and outstanding expansion of the local market.</div><div><br></div><div>But beyond this, we are pleased that our highly trained and qualified staff is always ready to meet all your needs with a great willingness to build an excellent business relationship with our suppliers and customers that lasts over time.</div>', 'SHOP WITH US, RESTOCK YOUR INVENTORY QUICK & EASY.', 'OUR VISION', 'Company Name was born with the intention of inspiring our customers towards a healthier lifestyle by offering high quality products. This lifestyle is not only nutritious and great tasting, but also practical.', 'OUR MISSION', 'Our company plans on achieving our vision by partnering with the largest and grain agriculture in Bangladesh,', 'SOCIAL WORKING', 'COMPANY - ALWAYS, CLOSE TO YOU.', '<div>We are proud to sponsor the Fundación Franlanqui, a non-profit organization founded more than 5 years ago, made up of a group of people dedicated to help other people who have become homeless or low-income people, by the donation of clothes, medicines, food, water or even economic resources needed to handle health issues. You can be a part of this!, Join us!</div><div><br></div>', 'https://alifinefoods.com/collections', '2023-10-04 03:28:29', '2024-01-03 06:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `access_logs`
--

CREATE TABLE `access_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `page` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `access_logs`
--

INSERT INTO `access_logs` (`id`, `date_time`, `page`, `action`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2026-11-08 07:45:03', 'Purchase', 'Add', 'Create a new purhcase with purchase no ST2611000001 to Mail Dry Store products  Brown Bread - 300gm 1 Packed  on cash', 1, '2026-11-08 07:45:03', '2026-11-08 07:45:03'),
(2, '2026-11-08 07:58:03', 'Purchase', 'Add', 'Create a new purhcase with purchase no ST2611000002 to Mail Dry Store products  Brown Bread - 300gm 24 Packed  on credit', 1, '2026-11-08 07:58:03', '2026-11-08 07:58:03'),
(3, '2026-11-08 07:59:57', 'Purchase', 'Update', 'Update purhcase against purchase no ST2611000002 to Mail Dry Store products :  Brown Bread - 300gm 24.00 Packed  on credit', 1, '2026-11-08 07:59:57', '2026-11-08 07:59:57');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `account_transaction_auto_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) NOT NULL,
  `voucher_type` varchar(20) NOT NULL,
  `voucher_date` date NOT NULL,
  `coa_setup_id` bigint(20) UNSIGNED NOT NULL,
  `coa_head_code` bigint(20) NOT NULL,
  `narration` text NOT NULL,
  `debit_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `credit_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `posted` tinyint(4) NOT NULL DEFAULT 0,
  `approve` tinyint(4) NOT NULL DEFAULT 0,
  `approve_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transaction_autos`
--

CREATE TABLE `account_transaction_autos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) NOT NULL,
  `voucher_type` varchar(20) NOT NULL,
  `voucher_date` date NOT NULL,
  `coa_setup_id` bigint(20) UNSIGNED NOT NULL,
  `coa_head_code` bigint(20) NOT NULL,
  `narration` text NOT NULL,
  `debit_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `credit_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `posted` tinyint(4) NOT NULL DEFAULT 0,
  `approve` tinyint(4) NOT NULL DEFAULT 0,
  `approve_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transaction_autos`
--

INSERT INTO `account_transaction_autos` (`id`, `company_id`, `voucher_no`, `voucher_type`, `voucher_date`, `coa_setup_id`, `coa_head_code`, `narration`, `debit_amount`, `credit_amount`, `posted`, `approve`, `approve_by`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ST2611000001', 'Product Purchase', '2026-11-08', 119, 417, 'Product Purchase Against Purchase No - ST2611000001', 126.65, 0.00, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-11-08 07:45:03', '2026-11-08 07:45:03'),
(2, 1, 'ST2611000001', 'Product Purchase', '2026-11-08', 207, 20107, 'Product Purchase Against Purchase No - ST2611000001', 0.00, 126.65, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-11-08 07:45:03', '2026-11-08 07:45:03'),
(3, 1, 'STP2611000001', 'Vendor Payment', '2026-11-08', 207, 20107, 'Payment Vendor Against PAYMENT NO - STP2611000001', 126.65, 0.00, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-11-08 07:45:03', '2026-11-08 07:45:03'),
(4, 1, 'STP2611000001', 'Vendor Payment', '2026-11-08', 26, 1010201, 'Payment Vendor Against PAYMENT NO - STP2611000001', 0.00, 126.65, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-11-08 07:45:03', '2026-11-08 07:45:03'),
(7, 1, 'ST2611000002', 'Product Purchase', '2026-11-08', 119, 417, 'Product Purchase Against Purchase No - ST2611000002', 3039.60, 0.00, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-11-08 07:59:57', '2026-11-08 07:59:57'),
(8, 1, 'ST2611000002', 'Product Purchase', '2026-11-08', 207, 20107, 'Product Purchase Against Purchase No - ST2611000002', 0.00, 3039.60, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-11-08 07:59:57', '2026-11-08 07:59:57');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delete` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `delete`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Dashboard', 'admin.dashboard', '<i class=\"fad fa-tachometer-alt-fastest\"></i>', 1, 1, 1, '2023-09-19 09:04:28', '2023-09-19 09:04:28'),
(2, 2, NULL, 'System Setting', NULL, '<i class=\"fad fa-users-cog\"></i>', 2, 1, 1, '2023-09-19 09:05:17', '2023-09-19 09:05:17'),
(3, 3, 2, 'Company Setup', 'admin.company.index', NULL, 1, 1, 1, '2023-09-19 09:05:30', '2023-09-19 09:11:55'),
(4, 4, 2, 'Branch Setup', 'admin.branch.index', NULL, 2, 1, 1, '2023-09-19 09:05:39', '2023-09-19 09:12:52'),
(5, 5, 2, 'Role Setup', 'admin.role.index', NULL, 3, 1, 1, '2023-09-19 09:05:48', '2023-09-19 09:13:04'),
(6, 6, 2, 'User Setup', 'admin.user.index', NULL, 4, 1, 1, '2023-09-19 09:05:55', '2023-09-19 09:15:19'),
(7, 7, 2, 'Menu Setup', 'admin.admin-menu.index', NULL, 5, 1, 1, '2023-09-19 09:06:24', '2023-09-19 09:15:35'),
(8, 20, NULL, 'System Setup', NULL, '<i class=\"fad fa-tools\"></i>', 3, 1, 1, '2023-09-19 09:20:32', '2023-09-19 09:20:32'),
(9, 21, 8, 'Sales Group', 'admin.group.index', NULL, 5, 1, 1, '2023-09-19 09:20:46', '2023-09-25 07:50:45'),
(10, 22, 8, 'Store Setup', 'admin.store.index', NULL, 3, 1, 1, '2023-09-19 09:20:59', '2023-09-23 14:49:13'),
(11, 23, 8, 'Product Type', 'admin.category.index', NULL, 8, 1, 1, '2023-09-19 09:21:10', '2023-09-25 05:49:47'),
(12, 24, 8, 'Product Setup', 'admin.product.index', NULL, 9, 1, 1, '2023-09-19 09:21:19', '2023-09-25 14:14:03'),
(13, 25, 8, 'Staff Setup', 'admin.staff.index', NULL, 4, 1, 1, '2023-09-19 09:21:25', '2023-09-23 14:49:31'),
(14, 26, 8, 'Product List', 'admin.product-list.index', NULL, 10, 1, 1, '2023-09-19 09:21:36', '2023-09-30 06:36:17'),
(15, 27, NULL, 'System Configuration', NULL, '<i class=\"fad fa-sliders-h\"></i>', 4, 1, 1, '2023-09-19 09:22:02', '2023-09-19 09:22:02'),
(16, 28, 15, 'Group Sales Target', 'admin.group-target.index', NULL, 1, 1, 1, '2023-09-19 09:22:23', '2023-09-25 15:11:07'),
(17, 29, 15, 'Client Price Setup', 'admin.client-price.index', NULL, 2, 1, 1, '2023-09-19 09:22:33', '2023-09-29 15:44:08'),
(18, 30, NULL, 'Procurement', NULL, '<i class=\"fad fa-cogs\"></i>', 5, 1, 1, '2023-09-19 09:23:13', '2023-09-19 09:23:13'),
(19, 31, 18, 'Transaction', NULL, NULL, 1, 1, 1, '2023-09-19 09:23:22', '2023-09-19 09:23:22'),
(20, 32, 19, 'Vendor Setup', 'admin.vendor.index', NULL, 1, 1, 1, '2023-09-19 09:23:31', '2023-09-25 04:28:11'),
(21, 33, 19, 'Product Lifting', 'admin.lifting.index', NULL, 2, 1, 1, '2023-09-19 09:23:43', '2023-09-30 10:24:00'),
(22, 34, 19, 'Purchase Return', 'admin.lifting-return.index', NULL, 3, 1, 1, '2023-09-19 09:23:55', '2023-10-16 04:46:40'),
(23, 35, 19, 'Vendor Payment', 'admin.vendor-payment.index', NULL, 4, 1, 1, '2023-09-19 09:24:05', '2023-10-16 09:18:55'),
(24, 36, 18, 'Reports', NULL, NULL, 2, 1, 1, '2023-09-19 09:24:13', '2023-09-19 09:24:13'),
(25, 37, 24, 'Lifting Report', 'admin.lifting-history.index', NULL, 1, 1, 1, '2023-09-19 09:24:28', '2023-11-02 10:07:33'),
(26, 38, 24, 'Return Log', 'admin.lifting-return-history.index', NULL, 2, 1, 1, '2023-09-19 09:24:36', '2023-11-02 10:06:27'),
(27, 39, 24, 'Payment Report', 'admin.vendor-payment-history.index', NULL, 3, 1, 1, '2023-09-19 09:24:54', '2023-11-02 10:07:59'),
(28, 40, 24, 'Vendor Statement', 'admin.vendor-statement.index', NULL, 4, 1, 1, '2023-09-19 09:25:06', '2023-10-26 08:58:42'),
(29, 41, NULL, 'Inventory', NULL, '<i class=\"fad fa-analytics\"></i>', 6, 1, 1, '2023-09-19 09:25:29', '2023-09-19 09:25:29'),
(30, 42, 29, 'Transaction', NULL, NULL, 1, 1, 1, '2023-09-19 09:25:38', '2023-09-19 09:25:38'),
(31, 43, 30, 'Product Transfer', 'admin.transfer.index', NULL, 1, 1, 1, '2023-09-19 09:25:55', '2023-10-18 05:08:37'),
(32, 44, 30, 'Transfer Receive', 'admin.transfer-receive.index', NULL, 2, 1, 1, '2023-09-19 09:26:05', '2023-10-18 09:46:37'),
(33, 45, 29, 'Reports', NULL, NULL, 2, 1, 1, '2023-09-19 09:26:14', '2023-09-19 09:26:14'),
(34, 46, 33, 'Closing Stock', NULL, NULL, 1, 0, 1, '2023-09-19 09:26:33', '2023-10-26 15:51:09'),
(35, 47, 33, 'Stock Status', 'admin.stock-status.index', NULL, 2, 1, 1, '2023-09-19 09:26:45', '2023-10-29 17:05:40'),
(36, 48, 33, 'Transfer Log', 'admin.transfer-log.index', NULL, 3, 1, 1, '2023-09-19 09:26:55', '2023-10-26 09:14:26'),
(37, 49, NULL, 'Sales Management', NULL, '<i class=\"fad fa-tasks\"></i>', 7, 1, 1, '2023-09-19 09:28:03', '2023-09-19 09:28:03'),
(38, 50, 37, 'Transaction', NULL, NULL, 1, 1, 1, '2023-09-19 09:28:16', '2023-09-19 09:28:16'),
(39, 51, 8, 'Region Setup', 'admin.region.index', NULL, 0, 1, 1, '2023-09-19 09:28:49', '2023-11-06 13:58:07'),
(40, 52, 8, 'Area Setup', 'admin.area.index', NULL, 1, 1, 1, '2023-09-19 09:29:03', '2023-09-23 14:48:28'),
(41, 53, 8, 'Territory Setup', 'admin.territory.index', NULL, 2, 1, 1, '2023-09-19 09:29:15', '2023-09-23 14:48:48'),
(42, 54, 38, 'Client Setup', 'admin.client.index', NULL, 0, 1, 1, '2023-09-19 09:29:28', '2023-10-13 04:45:32'),
(43, 55, 38, 'Daily Invoice', 'admin.sales.index', NULL, 3, 1, 1, '2023-09-19 09:29:42', '2023-11-20 16:56:35'),
(44, 56, 38, 'Daily Collection', 'admin.collection.index', NULL, 6, 1, 1, '2023-09-19 09:29:54', '2023-10-14 15:58:54'),
(45, 57, 38, 'Bulk Collection', 'admin.bulk-collection.index', NULL, 7, 1, 1, '2023-09-19 09:30:07', '2023-11-23 04:50:42'),
(46, 58, 38, 'Sales Return', 'admin.sales-return.index', NULL, 8, 1, 1, '2023-09-19 09:30:21', '2023-10-15 06:42:46'),
(47, 59, 38, 'Return Approval', 'admin.return-approve.index', NULL, 9, 1, 1, '2023-09-19 09:30:32', '2023-10-18 12:04:00'),
(48, 60, 37, 'Reports', NULL, NULL, 2, 1, 1, '2023-09-19 09:30:42', '2023-09-19 09:30:42'),
(49, 61, 48, 'Sales Report', 'admin.sales-history.index', NULL, 1, 1, 1, '2023-09-19 09:30:51', '2023-11-02 10:03:54'),
(50, 62, 48, 'Collection Report', 'admin.collection-history.index', NULL, 2, 1, 1, '2023-09-19 09:31:08', '2023-11-02 10:04:26'),
(51, 63, 48, 'Return Report', 'admin.return-history.index', NULL, 3, 1, 1, '2023-09-19 09:31:21', '2023-11-02 10:05:03'),
(52, 64, 48, 'Client Statement', 'admin.client-statement.index', NULL, 4, 1, 1, '2023-09-19 09:31:39', '2023-10-26 08:51:35'),
(53, 65, 48, 'Client List', 'admin.client-list.index', NULL, 0, 1, 1, '2023-09-19 09:31:52', '2023-11-14 06:20:12'),
(54, 66, NULL, 'Business Analysis', NULL, '<i class=\"fad fa-chart-pie\"></i>', 9, 1, 1, '2023-09-19 09:33:29', '2023-12-13 12:58:49'),
(55, 67, 54, 'Payment Analysis', 'admin.lifting-realization.index', NULL, 1, 1, 1, '2023-09-19 09:33:39', '2023-10-29 17:06:44'),
(56, 68, 33, 'Stock Valuation', 'admin.stock-valuation.index', NULL, 2, 1, 1, '2023-09-19 09:33:47', '2023-10-29 17:05:51'),
(57, 69, 54, 'Sales Target & Achievement', 'admin.sales-target-achivement.index', NULL, 3, 1, 1, '2023-09-19 09:33:56', '2023-10-30 17:38:25'),
(58, 70, 54, 'Sales Contribution', 'admin.sales-contribution.index', NULL, 4, 1, 1, '2023-09-19 09:34:06', '2023-10-29 17:07:36'),
(59, 71, 54, 'Sales Realization Analysis', 'admin.sales-realization.index', NULL, 5, 1, 1, '2023-09-19 09:34:14', '2023-10-29 17:08:15'),
(60, 72, 54, 'Sales Ageing Report', 'admin.sales-ageing.index', NULL, 6, 1, 1, '2023-09-19 09:34:41', '2023-10-29 17:08:39'),
(61, 73, 54, 'Client Outstanding', 'admin.client-outstanding.index', NULL, 7, 1, 1, '2023-09-19 09:34:53', '2023-10-29 17:09:15'),
(62, 74, 54, 'Product Profit', 'admin.product-wise-profit.index', NULL, 8, 1, 1, '2023-09-19 09:35:10', '2023-11-02 10:03:23'),
(63, 75, NULL, 'Online Order', '#', '<i class=\"fad fa-boxes\"></i>', 10, 1, 1, '2023-09-19 09:36:07', '2023-12-13 12:59:18'),
(64, 76, 38, 'Offline Order', 'admin.offline-order.index', NULL, 1, 1, 1, '2023-09-19 09:36:18', '2023-10-09 03:42:43'),
(66, 78, 38, 'Prepare Gatepass', 'admin.delivery.index', NULL, 4, 1, 1, '2023-09-19 09:38:15', '2023-11-20 16:56:08'),
(68, 80, 48, 'Delivery Statement', 'admin.delivery-statement.index', NULL, 10, 1, 1, '2023-09-19 09:38:34', '2023-10-26 08:52:30'),
(69, 81, 8, 'Client Chain', 'admin.chain-client.index', NULL, 7, 1, 1, '2023-09-23 10:02:09', '2023-09-25 04:14:41'),
(70, 82, 8, 'Client Type', 'admin.client-category.index', NULL, 6, 1, 1, '2023-09-23 10:02:20', '2023-09-23 14:51:25'),
(71, 168, 8, 'Vehicle Setup', 'admin.vehicle.index', NULL, 11, 1, 1, '2023-09-28 06:35:35', '2023-09-28 07:48:02'),
(72, 174, 8, 'Measurement Unit', 'admin.attribute.index', NULL, 12, 1, 1, '2023-09-29 03:11:33', '2023-09-29 03:12:05'),
(73, 180, NULL, 'Website CMS', NULL, '<i class=\"fad fa-window-alt\"></i>', 11, 1, 1, '2023-10-08 15:08:32', '2023-10-08 15:08:32'),
(74, 181, 73, 'Slider', 'admin.slider.index', NULL, 1, 1, 1, '2023-10-08 15:09:27', '2023-10-08 15:14:11'),
(75, 182, 73, 'Site Items', 'admin.site-item.index', NULL, 2, 1, 1, '2023-10-08 15:22:26', '2023-10-08 15:22:26'),
(76, 183, 73, 'Special Item', 'admin.special-food-item.index', NULL, 3, 1, 1, '2023-10-08 15:23:04', '2023-10-18 13:55:44'),
(77, 184, 73, 'Social Working', 'admin.social-working.index', NULL, 4, 1, 1, '2023-10-08 15:23:47', '2023-10-08 15:23:47'),
(78, 185, 73, 'About', 'admin.about.index', NULL, 5, 1, 1, '2023-10-08 15:24:06', '2023-10-08 15:24:06'),
(79, 186, 73, 'Contact', 'admin.contact.index', NULL, 6, 1, 1, '2023-10-08 15:24:27', '2023-10-08 15:24:27'),
(80, 187, 73, 'Testimonial', 'admin.testimonial.index', NULL, 7, 1, 1, '2023-10-08 15:24:57', '2023-10-08 15:24:57'),
(81, 188, 73, 'Client Message', 'admin.client-message.index', NULL, 8, 1, 1, '2023-10-08 15:25:53', '2023-10-08 15:25:53'),
(82, 189, 73, 'Showcase Items', 'admin.showcase-item.index', NULL, 9, 1, 1, '2023-10-08 15:26:21', '2023-10-08 15:26:21'),
(83, 190, 73, 'Details Card', 'admin.details-card.index', NULL, 10, 1, 1, '2023-10-08 15:26:50', '2023-10-08 15:26:50'),
(84, 226, 73, 'Site Settings', 'admin.settings.index', NULL, 11, 1, 1, '2023-10-08 15:50:46', '2023-10-08 15:50:46'),
(85, 291, 63, 'Orders Processing', 'admin.online-order.index', NULL, 1, 1, 1, '2023-11-16 11:58:49', '2023-11-20 12:08:30'),
(86, 292, 63, 'Client Request', 'admin.client-request.index', NULL, 5, 1, 1, '2023-11-16 12:00:00', '2023-11-20 12:11:25'),
(87, 295, 54, 'Access Log', 'admin.access-log.index', NULL, 9, 1, 1, '2023-11-16 12:02:14', '2023-11-16 12:02:56'),
(88, 296, 63, 'Online Dashboard', 'admin.order-dashboard.index', NULL, 0, 1, 1, '2023-11-19 17:02:39', '2023-11-20 12:07:30'),
(89, 299, 63, 'Cancelled Order', 'admin.cancel-order.index', NULL, 4, 1, 1, '2023-11-19 17:06:14', '2023-11-20 12:12:40'),
(90, 301, 63, 'Delivery Gatepass', 'admin.online-order-delivery.index', NULL, 3, 1, 1, '2023-11-19 17:07:36', '2023-11-20 12:10:53'),
(91, 308, 63, 'Delivery Charge', 'admin.delivery-charge.index', NULL, 5, 1, 1, '2023-11-19 17:09:47', '2023-11-19 17:09:47'),
(92, 310, 33, 'Product Statement', 'admin.product-statement.index', NULL, 4, 1, 1, '2023-11-20 16:04:21', '2023-11-20 16:04:21'),
(93, 311, NULL, 'Dashboard', 'client.dashboard.index', '<i class=\"fal fa-tachometer-alt-fast\"></i>', 12, 1, 1, '2023-11-22 17:19:50', '2023-11-22 17:19:50'),
(94, 312, NULL, 'Product Request', 'client.product-request.index', '<i class=\"fas fa-boxes\"></i>', 13, 1, 1, '2023-11-22 17:20:56', '2023-11-22 17:21:48'),
(95, 313, NULL, 'Purchase Log', 'client.purchase-log.index', '<i class=\"fal fa-box-check\"></i>', 14, 1, 1, '2023-11-22 17:22:52', '2023-11-22 17:24:12'),
(96, 314, NULL, 'Return Log', 'client.return-log.index', '<i class=\"fal fa-undo-alt\"></i>', 15, 1, 1, '2023-11-22 17:23:33', '2023-11-22 17:25:29'),
(97, 315, NULL, 'Payment Log', 'client.payment-log.index', '<i class=\"fal fa-receipt\"></i>', 16, 1, 1, '2023-11-22 17:27:46', '2023-11-22 17:27:46'),
(98, 316, NULL, 'Statement', 'client.statement.index', '<i class=\"fal fa-analytics\"></i>', 17, 1, 1, '2023-11-22 17:28:56', '2023-11-22 17:28:56'),
(99, 330, 48, 'Sales Man Performance Flow', 'admin.salesman-flowchart.index', NULL, 11, 1, 1, '2023-11-26 11:18:53', '2023-11-26 11:36:19'),
(100, 331, 48, 'Client Sales Flow', 'admin.client-sales-flow.index', NULL, 12, 1, 1, '2023-11-27 08:53:49', '2023-11-27 08:53:49'),
(101, 332, 48, 'Online Sales History', 'admin.online-sales-history.index', NULL, 13, 1, 1, '2023-11-27 11:16:13', '2023-11-27 11:16:13'),
(102, 333, 73, 'Page Setup', 'admin.page.index', NULL, 12, 1, 1, '2023-11-27 14:58:52', '2023-11-27 14:58:52'),
(103, 334, NULL, 'General Accounting', NULL, '<i class=\"fal fa-ballot-check\"></i>', 8, 1, 1, '2023-12-13 12:04:08', '2023-12-13 12:58:24'),
(104, 335, 103, 'Transaction', NULL, NULL, 1, 1, 1, '2023-12-13 12:04:34', '2023-12-13 12:04:34'),
(105, 336, 104, 'Chart of Accounts', 'admin.coa-setup.index', NULL, 1, 1, 1, '2023-12-13 12:05:02', '2023-12-13 12:05:02'),
(106, 337, 104, 'Debit Voucher Entry', 'admin.debit-voucher-entry.index', NULL, 2, 1, 1, '2023-12-13 12:05:41', '2023-12-13 12:05:41'),
(107, 338, 104, 'Credit Voucher Entry', 'admin.credit-voucher-entry.index', NULL, 3, 1, 1, '2023-12-13 12:05:59', '2023-12-13 12:05:59'),
(108, 339, 104, 'Journal Voucher Entry', 'admin.journal-voucher-entry.index', NULL, 4, 1, 1, '2023-12-13 12:06:21', '2023-12-13 12:06:21'),
(109, 340, 104, 'Voucher Approve', 'admin.voucher-approve.index', NULL, 5, 1, 1, '2023-12-13 12:06:45', '2023-12-13 12:06:45'),
(110, 341, 104, 'Voucher Refuse', 'admin.voucher-reject.index', NULL, 6, 1, 1, '2023-12-13 12:07:04', '2023-12-13 12:07:04'),
(111, 342, 104, 'Posting Automation', 'admin.automation-approve.index', NULL, 7, 1, 1, '2023-12-13 12:09:24', '2023-12-13 12:09:24'),
(112, 343, 104, 'Automation Refuse', 'admin.automation-reject.index', NULL, 8, 1, 1, '2023-12-13 12:09:41', '2023-12-13 12:09:41'),
(113, 371, 103, 'Reports', NULL, NULL, 2, 1, 1, '2023-12-13 16:37:50', '2023-12-13 16:37:50'),
(114, 372, 113, 'Chart of Accounts', 'admin.coa-list.index', NULL, 1, 1, 1, '2023-12-13 16:38:13', '2023-12-13 16:38:13'),
(115, 373, 113, 'Daily Voucher List', 'admin.voucher-list.index', NULL, 2, 1, 1, '2023-12-16 06:26:26', '2023-12-16 06:26:26'),
(116, 374, 113, 'Daily Cash Book', 'admin.cash-book.index', NULL, 3, 1, 1, '2023-12-19 14:46:09', '2023-12-19 14:46:09'),
(117, 375, 113, 'Daily Bank Book', 'admin.bank-book.index', NULL, 4, 1, 1, '2023-12-19 14:46:38', '2023-12-19 14:46:38'),
(118, 376, 113, 'Transaction Ledger', 'admin.transaction-ledger.index', NULL, 5, 1, 1, '2023-12-19 14:47:08', '2023-12-19 14:47:08'),
(119, 377, 113, 'Cash Flow Statement', 'admin.cash-flow-statement.index', NULL, 6, 1, 1, '2023-12-19 14:47:27', '2023-12-19 14:47:27'),
(120, 378, 113, 'General Ledger', 'admin.general-ledger.index', NULL, 7, 1, 1, '2023-12-19 14:47:46', '2023-12-19 14:47:46'),
(121, 379, 113, 'Trial Balance', 'admin.trial-balance.index', NULL, 8, 1, 1, '2023-12-30 16:33:07', '2023-12-30 16:33:07'),
(122, 380, 113, 'Income Statement', 'admin.income-statement.index', NULL, 9, 1, 1, '2023-12-30 16:37:11', '2023-12-30 16:37:11'),
(123, 381, 73, 'Subscribers', 'admin.subscription.index', NULL, 13, 1, 1, '2024-01-23 04:24:23', '2024-01-23 04:24:23'),
(124, 382, 2, 'Admin Settings', 'admin.admin-settings.index', NULL, 6, 1, 1, '2024-02-28 09:38:44', '2024-02-28 09:38:44'),
(125, 383, 113, 'Balance Sheet', 'admin.balance-sheet.index', NULL, 10, 1, 1, '2024-02-28 14:54:09', '2024-02-28 14:54:09'),
(126, 384, NULL, 'Clear cache', 'admin.cache.clear', '<i class=\"fad fa-vacuum\"></i>', 18, 1, 1, '2024-03-03 04:58:09', '2024-03-03 04:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_actions`
--

CREATE TABLE `admin_menu_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `admin_menu_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `route` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_actions`
--

INSERT INTO `admin_menu_actions` (`id`, `permission_id`, `admin_menu_id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 7, 'Create', 'admin.admin-menu.create', 1, '2023-09-19 09:16:56', '2023-09-19 09:16:56'),
(2, 9, 7, 'store', 'admin.admin-menu.store', 1, '2023-09-19 09:17:06', '2023-09-19 09:17:06'),
(3, 10, 7, 'edit', 'admin.admin-menu.edit', 1, '2023-09-19 09:17:10', '2023-09-19 09:17:10'),
(4, 11, 7, 'update', 'admin.admin-menu.update', 1, '2023-09-19 09:17:20', '2023-09-19 09:17:20'),
(5, 12, 7, 'delete', 'admin.admin-menu.destroy', 1, '2023-09-19 09:17:25', '2023-09-19 09:17:25'),
(7, 14, 7, 'action view', 'admin.admin-menuAction.index', 1, '2023-09-19 09:18:18', '2023-09-19 09:18:18'),
(8, 15, 7, 'action create', 'admin.admin-menuAction.create', 1, '2023-09-19 09:18:26', '2023-09-19 09:18:26'),
(9, 16, 7, 'action store', 'admin.admin-menuAction.store', 1, '2023-09-19 09:18:33', '2023-09-19 09:18:33'),
(10, 17, 7, 'action edit', 'admin.admin-menuAction.edit', 1, '2023-09-19 09:18:41', '2023-09-19 09:18:41'),
(11, 18, 7, 'action update', 'admin.admin-menuAction.update', 1, '2023-09-19 09:18:49', '2023-09-19 09:18:49'),
(12, 19, 7, 'action delete', 'admin.admin-menuAction.destroy', 1, '2023-09-19 09:19:02', '2023-09-19 09:19:02'),
(13, 83, 70, 'create', 'admin.client-category.create', 1, '2023-09-25 06:58:14', '2023-09-25 06:58:14'),
(14, 84, 70, 'store', 'admin.client-category.store', 1, '2023-09-25 06:58:24', '2023-09-25 06:58:24'),
(15, 85, 70, 'edit', 'admin.client-category.edit', 1, '2023-09-25 06:58:31', '2023-09-25 06:58:31'),
(16, 86, 70, 'update', 'admin.client-category.update', 1, '2023-09-25 06:58:41', '2023-09-25 06:58:41'),
(17, 87, 70, 'delete', 'admin.client-category.destroy', 1, '2023-09-25 06:58:49', '2023-09-25 06:58:49'),
(18, 88, 69, 'create', 'admin.chain-client.create', 1, '2023-09-25 06:59:35', '2023-09-25 06:59:35'),
(19, 89, 69, 'store', 'admin.chain-client.store', 1, '2023-09-25 06:59:50', '2023-09-25 06:59:50'),
(20, 90, 69, 'edit', 'admin.chain-client.edit', 1, '2023-09-25 06:59:55', '2023-09-25 06:59:55'),
(21, 91, 69, 'update', 'admin.chain-client.update', 1, '2023-09-25 07:00:02', '2023-09-25 07:00:02'),
(22, 92, 69, 'delete', 'admin.chain-client.destroy', 1, '2023-09-25 07:00:19', '2023-09-25 07:00:19'),
(23, 93, 41, 'create', 'admin.territory.create', 1, '2023-09-25 07:00:48', '2023-09-25 07:00:48'),
(24, 94, 41, 'store', 'admin.territory.store', 1, '2023-09-25 07:00:54', '2023-09-25 07:00:54'),
(25, 95, 41, 'edit', 'admin.territory.edit', 1, '2023-09-25 07:00:58', '2023-09-25 07:00:58'),
(26, 96, 41, 'update', 'admin.territory.update', 1, '2023-09-25 07:01:03', '2023-09-25 07:01:03'),
(27, 97, 41, 'delete', 'admin.territory.destroy', 1, '2023-09-25 07:01:09', '2023-09-25 07:01:09'),
(28, 98, 40, 'create', 'admin.area.create', 1, '2023-09-25 07:01:36', '2023-09-25 07:01:36'),
(29, 99, 40, 'store', 'admin.area.store', 1, '2023-09-25 07:01:43', '2023-09-25 07:01:43'),
(30, 100, 40, 'edit', 'admin.area.edit', 1, '2023-09-25 07:01:47', '2023-09-25 07:01:47'),
(31, 101, 40, 'update', 'admin.area.update', 1, '2023-09-25 07:01:52', '2023-09-25 07:01:52'),
(32, 102, 40, 'delete', 'admin.area.destroy', 1, '2023-09-25 07:01:57', '2023-09-25 07:01:57'),
(33, 103, 39, 'create', 'admin.region.create', 1, '2023-09-25 07:02:16', '2023-09-25 07:02:16'),
(34, 104, 39, 'store', 'admin.region.store', 1, '2023-09-25 07:02:22', '2023-09-25 07:02:22'),
(35, 105, 39, 'edit', 'admin.region.edit', 1, '2023-09-25 07:02:26', '2023-09-25 07:02:26'),
(36, 106, 39, 'update', 'admin.region.update', 1, '2023-09-25 07:02:33', '2023-09-25 07:02:33'),
(37, 107, 39, 'delete', 'admin.region.destroy', 1, '2023-09-25 07:02:39', '2023-09-25 07:02:39'),
(38, 108, 20, 'create', 'admin.vendor.create', 1, '2023-09-25 07:03:08', '2023-09-25 07:03:08'),
(39, 109, 20, 'store', 'admin.vendor.store', 1, '2023-09-25 07:03:14', '2023-09-25 07:03:14'),
(40, 110, 20, 'edit', 'admin.vendor.edit', 1, '2023-09-25 07:03:19', '2023-09-25 07:03:19'),
(41, 111, 20, 'update', 'admin.vendor.update', 1, '2023-09-25 07:03:24', '2023-09-25 07:03:24'),
(42, 112, 20, 'delete', 'admin.vendor.destroy', 1, '2023-09-25 07:03:29', '2023-09-25 07:03:29'),
(43, 113, 13, 'create', 'admin.staff.create', 1, '2023-09-25 07:03:49', '2023-09-25 07:03:49'),
(44, 114, 13, 'store', 'admin.staff.store', 1, '2023-09-25 07:03:54', '2023-09-25 07:03:54'),
(45, 115, 13, 'edit', 'admin.staff.edit', 1, '2023-09-25 07:03:58', '2023-09-25 07:03:58'),
(46, 116, 13, 'update', 'admin.staff.update', 1, '2023-09-25 07:04:04', '2023-09-25 07:04:04'),
(47, 117, 13, 'delete', 'admin.staff.destroy', 1, '2023-09-25 07:04:10', '2023-09-25 07:04:10'),
(48, 118, 11, 'create', 'admin.category.create', 1, '2023-09-25 07:04:55', '2023-09-25 07:04:55'),
(49, 119, 11, 'store', 'admin.category.store', 1, '2023-09-25 07:04:59', '2023-09-25 07:04:59'),
(50, 120, 11, 'edit', 'admin.category.edit', 1, '2023-09-25 07:05:03', '2023-09-25 07:05:03'),
(51, 121, 11, 'update', 'admin.category.update', 1, '2023-09-25 07:05:10', '2023-09-25 07:05:10'),
(52, 122, 11, 'delete', 'admin.category.destroy', 1, '2023-09-25 07:05:15', '2023-09-25 07:05:15'),
(53, 123, 10, 'create', 'admin.store.create', 1, '2023-09-25 07:05:43', '2023-09-25 07:05:43'),
(54, 124, 10, 'store', 'admin.store.store', 1, '2023-09-25 07:05:51', '2023-09-25 07:05:51'),
(55, 125, 10, 'edit', 'admin.store.edit', 1, '2023-09-25 07:05:55', '2023-09-25 07:05:55'),
(56, 126, 10, 'update', 'admin.store.update', 1, '2023-09-25 07:06:00', '2023-09-25 07:06:00'),
(57, 127, 10, 'delete', 'admin.store.destroy', 1, '2023-09-25 07:06:05', '2023-09-25 07:06:05'),
(58, 128, 6, 'create', 'admin.user.create', 1, '2023-09-25 07:06:29', '2023-09-25 07:06:29'),
(59, 129, 6, 'store', 'admin.user.store', 1, '2023-09-25 07:06:33', '2023-09-25 07:06:33'),
(60, 130, 6, 'edit', 'admin.user.edit', 1, '2023-09-25 07:06:37', '2023-09-25 07:06:37'),
(61, 131, 6, 'update', 'admin.user.update', 1, '2023-09-25 07:06:42', '2023-09-25 07:06:42'),
(62, 132, 6, 'delete', 'admin.user.destroy', 1, '2023-09-25 07:06:47', '2023-09-25 07:06:47'),
(63, 133, 5, 'create', 'admin.role.create', 1, '2023-09-25 07:07:07', '2023-09-25 07:07:07'),
(64, 134, 5, 'store', 'admin.role.store', 1, '2023-09-25 07:07:12', '2023-09-25 07:07:12'),
(65, 135, 5, 'edit', 'admin.role.edit', 1, '2023-09-25 07:07:17', '2023-09-25 07:07:17'),
(66, 136, 5, 'update', 'admin.role.update', 1, '2023-09-25 07:07:23', '2023-09-25 07:07:23'),
(67, 137, 5, 'delete', 'admin.role.destroy', 1, '2023-09-25 07:07:28', '2023-09-25 07:07:28'),
(68, 138, 4, 'create', 'admin.branch.create', 1, '2023-09-25 07:07:44', '2023-09-25 07:07:44'),
(69, 139, 4, 'store', 'admin.branch.store', 1, '2023-09-25 07:08:29', '2023-09-25 07:08:29'),
(70, 140, 4, 'edit', 'admin.branch.edit', 1, '2023-09-25 07:08:34', '2023-09-25 07:08:34'),
(71, 141, 4, 'update', 'admin.branch.update', 1, '2023-09-25 07:08:39', '2023-09-25 07:08:39'),
(72, 142, 4, 'delete', 'admin.branch.destroy', 1, '2023-09-25 07:08:44', '2023-09-25 07:08:44'),
(73, 143, 3, 'create', 'admin.company.create', 1, '2023-09-25 07:09:19', '2023-09-25 07:09:19'),
(74, 144, 3, 'store', 'admin.company.store', 1, '2023-09-25 07:09:24', '2023-09-25 07:09:24'),
(75, 145, 3, 'edit', 'admin.company.edit', 1, '2023-09-25 07:09:31', '2023-09-25 07:09:31'),
(76, 146, 3, 'update', 'admin.company.update', 1, '2023-09-25 07:09:36', '2023-09-25 07:09:36'),
(77, 147, 3, 'delete', 'admin.company.destroy', 1, '2023-09-25 07:09:41', '2023-09-25 07:09:41'),
(78, 148, 9, 'create', 'admin.group.create', 1, '2023-09-25 07:51:05', '2023-09-25 07:51:05'),
(79, 149, 9, 'store', 'admin.group.store', 1, '2023-09-25 07:51:10', '2023-09-25 07:51:10'),
(80, 150, 9, 'edit', 'admin.group.edit', 1, '2023-09-25 07:51:14', '2023-09-25 07:51:14'),
(81, 151, 9, 'update', 'admin.group.update', 1, '2023-09-25 07:51:20', '2023-09-25 07:51:20'),
(82, 152, 9, 'delete', 'admin.group.destroy', 1, '2023-09-25 07:51:28', '2023-09-25 07:51:28'),
(83, 153, 42, 'create', 'admin.client.create', 1, '2023-09-25 10:09:28', '2023-09-25 10:09:28'),
(84, 154, 42, 'store', 'admin.client.store', 1, '2023-09-25 10:09:33', '2023-09-25 10:09:33'),
(85, 155, 42, 'edit', 'admin.client.edit', 1, '2023-09-25 10:09:38', '2023-09-25 10:09:38'),
(86, 156, 42, 'update', 'admin.client.update', 1, '2023-09-25 10:09:42', '2023-09-25 10:09:42'),
(87, 157, 42, 'delete', 'admin.client.destroy', 1, '2023-09-25 10:09:49', '2023-09-25 10:09:49'),
(88, 158, 12, 'create', 'admin.product.create', 1, '2023-09-25 14:14:40', '2023-09-25 14:14:40'),
(89, 159, 12, 'store', 'admin.product.store', 1, '2023-09-25 14:14:46', '2023-09-25 14:14:46'),
(90, 160, 12, 'edit', 'admin.product.edit', 1, '2023-09-25 14:14:50', '2023-09-25 14:14:50'),
(91, 161, 12, 'update', 'admin.product.update', 1, '2023-09-25 14:14:55', '2023-09-25 14:14:55'),
(92, 162, 12, 'delete', 'admin.product.destroy', 1, '2023-09-25 14:15:02', '2023-09-25 14:15:02'),
(93, 163, 16, 'create', 'admin.group-target.create', 1, '2023-09-25 15:12:45', '2023-09-25 15:12:45'),
(94, 164, 16, 'store', 'admin.group-target.store', 1, '2023-09-25 15:12:50', '2023-09-25 15:12:50'),
(95, 165, 16, 'edit', 'admin.group-target.edit', 1, '2023-09-25 15:12:55', '2023-09-25 15:12:55'),
(96, 166, 16, 'update', 'admin.group-target.update', 1, '2023-09-25 15:13:02', '2023-09-25 15:13:02'),
(97, 167, 16, 'delete', 'admin.group-target.destroy', 1, '2023-09-25 15:13:32', '2023-09-25 15:13:32'),
(98, 169, 71, 'create', 'admin.vehicle.create', 1, '2023-09-28 06:49:24', '2023-09-28 06:49:24'),
(99, 170, 71, 'store', 'admin.vehicle.store', 1, '2023-09-28 06:49:29', '2023-09-28 06:49:29'),
(100, 171, 71, 'edit', 'admin.vehicle.edit', 1, '2023-09-28 06:49:33', '2023-09-28 06:49:33'),
(101, 172, 71, 'update', 'admin.vehicle.update', 1, '2023-09-28 06:49:38', '2023-09-28 06:49:38'),
(102, 173, 71, 'delete', 'admin.vehicle.destroy', 1, '2023-09-28 06:49:44', '2023-09-28 06:49:44'),
(103, 175, 21, 'create', 'admin.lifting.create', 1, '2023-09-30 11:29:14', '2023-09-30 11:29:14'),
(104, 176, 21, 'store', 'admin.lifting.store', 1, '2023-09-30 11:29:19', '2023-09-30 11:29:19'),
(105, 177, 21, 'edit', 'admin.lifting.edit', 1, '2023-09-30 11:29:23', '2023-09-30 11:29:23'),
(106, 178, 21, 'update', 'admin.lifting.update', 1, '2023-09-30 11:29:28', '2023-09-30 11:29:28'),
(107, 179, 21, 'delete', 'admin.lifting.destroy', 1, '2023-09-30 11:29:33', '2023-09-30 11:29:33'),
(108, 191, 74, 'create', 'admin.slider.create', 1, '2023-10-08 15:28:49', '2023-10-08 15:28:49'),
(109, 192, 74, 'store', 'admin.slider.store', 1, '2023-10-08 15:28:54', '2023-10-08 15:28:54'),
(110, 193, 74, 'edit', 'admin.slider.edit', 1, '2023-10-08 15:28:59', '2023-10-08 15:28:59'),
(111, 194, 74, 'update', 'admin.slider.update', 1, '2023-10-08 15:29:07', '2023-10-08 15:29:07'),
(112, 195, 74, 'delete', 'admin.slider.destroy', 1, '2023-10-08 15:29:15', '2023-10-08 15:29:15'),
(113, 196, 76, 'create', 'admin.special-food-item.create', 1, '2023-10-08 15:30:28', '2023-10-08 15:30:28'),
(114, 197, 76, 'store', 'admin.special-food-item.store', 1, '2023-10-08 15:30:37', '2023-10-08 15:30:37'),
(115, 198, 76, 'edit', 'admin.special-food-item.edit', 1, '2023-10-08 15:30:41', '2023-10-08 15:30:41'),
(116, 199, 76, 'update', 'admin.special-food-item.update', 1, '2023-10-08 15:30:47', '2023-10-08 15:30:47'),
(117, 200, 76, 'delete', 'admin.special-food-item.destroy', 1, '2023-10-08 15:30:51', '2023-10-08 15:30:51'),
(118, 201, 77, 'create', 'admin.social-working.create', 1, '2023-10-08 15:31:27', '2023-10-08 15:31:27'),
(119, 202, 77, 'store', 'admin.social-working.store', 1, '2023-10-08 15:31:31', '2023-10-08 15:31:31'),
(120, 203, 77, 'edit', 'admin.social-working.edit', 1, '2023-10-08 15:31:36', '2023-10-08 15:31:36'),
(121, 204, 77, 'update', 'admin.social-working.update', 1, '2023-10-08 15:31:41', '2023-10-08 15:31:41'),
(122, 205, 77, 'delete', 'admin.social-working.destroy', 1, '2023-10-08 15:31:45', '2023-10-08 15:31:45'),
(123, 206, 80, 'create', 'admin.testimonial.create', 1, '2023-10-08 15:33:23', '2023-10-08 15:33:23'),
(124, 207, 80, 'store', 'admin.testimonial.store', 1, '2023-10-08 15:33:28', '2023-10-08 15:33:28'),
(125, 208, 80, 'edit', 'admin.testimonial.edit', 1, '2023-10-08 15:33:32', '2023-10-08 15:33:32'),
(126, 209, 80, 'update', 'admin.testimonial.update', 1, '2023-10-08 15:33:37', '2023-10-08 15:33:37'),
(127, 210, 80, 'delete', 'admin.testimonial.destroy', 1, '2023-10-08 15:34:02', '2023-10-08 15:34:02'),
(128, 211, 81, 'create', 'admin.client-message.create', 1, '2023-10-08 15:34:31', '2023-10-08 15:34:31'),
(129, 212, 81, 'store', 'admin.client-message.store', 1, '2023-10-08 15:34:36', '2023-10-08 15:34:36'),
(130, 213, 81, 'edit', 'admin.client-message.edit', 1, '2023-10-08 15:34:40', '2023-10-08 15:34:40'),
(131, 214, 81, 'update', 'admin.client-message.update', 1, '2023-10-08 15:34:44', '2023-10-08 15:34:44'),
(132, 215, 81, 'delete', 'admin.client-message.destroy', 1, '2023-10-08 15:34:49', '2023-10-08 15:34:49'),
(133, 216, 82, 'create', 'admin.showcase-item.create', 1, '2023-10-08 15:35:20', '2023-10-08 15:35:20'),
(134, 217, 82, 'store', 'admin.showcase-item.store', 1, '2023-10-08 15:35:24', '2023-10-08 15:35:24'),
(135, 218, 82, 'edit', 'admin.showcase-item.edit', 1, '2023-10-08 15:35:28', '2023-10-08 15:35:28'),
(136, 219, 82, 'update', 'admin.showcase-item.update', 1, '2023-10-08 15:35:33', '2023-10-08 15:35:33'),
(137, 220, 82, 'delete', 'admin.showcase-item.destroy', 1, '2023-10-08 15:35:39', '2023-10-08 15:35:39'),
(138, 221, 83, 'create', 'admin.details-card.create', 1, '2023-10-08 15:36:04', '2023-10-08 15:36:04'),
(139, 222, 83, 'store', 'admin.details-card.store', 1, '2023-10-08 15:36:09', '2023-10-08 15:36:09'),
(140, 223, 83, 'edit', 'admin.details-card.edit', 1, '2023-10-08 15:36:13', '2023-10-08 15:36:13'),
(141, 224, 83, 'update', 'admin.details-card.update', 1, '2023-10-08 15:36:17', '2023-10-08 15:36:17'),
(142, 225, 83, 'delete', 'admin.details-card.destroy', 1, '2023-10-08 15:36:22', '2023-10-08 15:36:22'),
(143, 227, 64, 'create', 'admin.offline-order.create', 1, '2023-10-09 03:43:02', '2023-10-09 03:43:02'),
(144, 228, 64, 'store', 'admin.offline-order.store', 1, '2023-10-09 03:43:07', '2023-10-09 03:43:07'),
(145, 229, 64, 'edit', 'admin.offline-order.edit', 1, '2023-10-09 03:43:11', '2023-10-09 03:43:11'),
(146, 230, 64, 'update', 'admin.offline-order.update', 1, '2023-10-09 03:43:19', '2023-10-09 03:43:19'),
(147, 231, 64, 'delete', 'admin.offline-order.destroy', 1, '2023-10-09 03:43:25', '2023-10-09 03:43:25'),
(148, 232, 64, 'print', 'admin.offline-order.show', 1, '2023-10-10 14:19:37', '2023-10-10 14:19:37'),
(149, 233, 43, 'create', 'admin.sales.create', 1, '2023-10-11 08:10:17', '2023-10-11 08:10:17'),
(150, 234, 43, 'store', 'admin.sales.store', 1, '2023-10-11 08:10:22', '2023-10-11 08:10:22'),
(151, 235, 43, 'edit', 'admin.sales.edit', 1, '2023-10-11 08:10:27', '2023-10-11 08:10:27'),
(152, 236, 43, 'update', 'admin.sales.update', 1, '2023-10-11 08:10:32', '2023-10-11 08:10:32'),
(153, 237, 43, 'delete', 'admin.sales.destroy', 1, '2023-10-11 08:10:37', '2023-10-11 08:10:37'),
(154, 238, 44, 'create', 'admin.collection.create', 1, '2023-10-14 16:50:47', '2023-10-14 16:50:47'),
(155, 239, 44, 'store', 'admin.collection.store', 1, '2023-10-14 16:50:51', '2023-10-14 16:50:51'),
(156, 240, 44, 'edit', 'admin.collection.edit', 1, '2023-10-14 16:50:56', '2023-10-14 16:50:56'),
(157, 241, 44, 'update', 'admin.collection.update', 1, '2023-10-14 16:51:00', '2023-10-14 16:51:00'),
(158, 242, 44, 'delete', 'admin.collection.destroy', 1, '2023-10-14 16:51:05', '2023-10-14 16:51:05'),
(159, 243, 46, 'create', 'admin.sales-return.create', 1, '2023-10-15 06:43:17', '2023-10-15 06:43:17'),
(160, 244, 46, 'store', 'admin.sales-return.store', 1, '2023-10-15 06:43:24', '2023-10-15 06:43:24'),
(161, 245, 46, 'edit', 'admin.sales-return.edit', 1, '2023-10-15 06:43:29', '2023-10-15 06:43:29'),
(162, 246, 46, 'update', 'admin.sales-return.update', 1, '2023-10-15 06:43:34', '2023-10-15 06:43:34'),
(163, 247, 46, 'delete', 'admin.sales-return.destroy', 1, '2023-10-15 06:43:39', '2023-10-15 06:43:39'),
(164, 248, 22, 'create', 'admin.lifting-return.create', 1, '2023-10-16 04:47:09', '2023-10-16 04:47:09'),
(165, 249, 22, 'store', 'admin.lifting-return.store', 1, '2023-10-16 04:47:15', '2023-10-16 04:47:15'),
(166, 250, 22, 'edit', 'admin.lifting-return.edit', 1, '2023-10-16 04:47:19', '2023-10-16 04:47:19'),
(167, 251, 22, 'update', 'admin.lifting-return.update', 1, '2023-10-16 04:47:28', '2023-10-16 04:47:28'),
(168, 252, 22, 'delete', 'admin.lifting-return.destroy', 1, '2023-10-16 04:47:34', '2023-10-16 04:47:34'),
(169, 253, 23, 'create', 'admin.vendor-payment.create', 1, '2023-10-16 09:19:38', '2023-10-16 09:19:38'),
(170, 254, 23, 'store', 'admin.vendor-payment.store', 1, '2023-10-16 09:19:42', '2023-10-16 09:19:42'),
(171, 255, 23, 'edit', 'admin.vendor-payment.edit', 1, '2023-10-16 09:19:46', '2023-10-16 09:19:46'),
(172, 256, 23, 'update', 'admin.vendor-payment.update', 1, '2023-10-16 09:19:51', '2023-10-16 09:19:51'),
(173, 257, 23, 'delete', 'admin.vendor-payment.destroy', 1, '2023-10-16 09:20:00', '2023-10-16 09:20:00'),
(174, 258, 31, 'create', 'admin.transfer.create', 1, '2023-10-18 05:08:51', '2023-10-18 05:08:51'),
(175, 259, 31, 'store', 'admin.transfer.store', 1, '2023-10-18 05:09:01', '2023-10-18 05:09:01'),
(176, 260, 31, 'edit', 'admin.transfer.edit', 1, '2023-10-18 05:09:05', '2023-10-18 05:09:05'),
(177, 261, 31, 'update', 'admin.transfer.update', 1, '2023-10-18 05:09:22', '2023-10-18 05:09:22'),
(178, 262, 31, 'delete', 'admin.transfer.destroy', 1, '2023-10-18 05:09:29', '2023-10-18 05:09:29'),
(179, 263, 32, 'view', 'admin.transfer-receive.show', 1, '2023-10-18 09:47:14', '2023-10-18 09:47:14'),
(180, 264, 32, 'approve', 'admin.transfer-receive.edit', 1, '2023-10-18 09:47:49', '2023-10-18 09:47:49'),
(181, 265, 32, 'reject', 'admin.transfer-receive.destroy', 1, '2023-10-18 09:48:01', '2023-10-18 09:48:01'),
(182, 266, 47, 'View', 'admin.return-approve.show', 1, '2023-10-18 12:04:48', '2023-10-18 12:04:48'),
(183, 267, 47, 'Approve', 'admin.return-approve.edit', 1, '2023-10-18 12:05:03', '2023-10-18 12:05:03'),
(184, 268, 47, 'Reject', 'admin.return-approve.destroy', 1, '2023-10-18 12:05:12', '2023-10-18 12:05:12'),
(185, 269, 66, 'edit', 'admin.delivery.edit', 1, '2023-11-07 06:58:42', '2023-11-07 06:58:42'),
(186, 270, 66, 'store', 'admin.delivery.store', 1, '2023-11-07 07:01:19', '2023-11-07 07:01:19'),
(187, 271, 66, 'update', 'admin.delivery.update', 1, '2023-11-07 07:01:31', '2023-11-07 07:01:31'),
(188, 272, 66, 'delete', 'admin.delivery.destroy', 1, '2023-11-07 07:01:37', '2023-11-07 07:01:37'),
(189, 273, 66, 'create', 'admin.delivery.create', 1, '2023-11-07 08:01:58', '2023-11-07 08:01:58'),
(192, 276, 5, 'Permission Edit', 'admin.rolePermission.edit', 1, '2023-11-09 04:05:15', '2023-11-09 04:05:15'),
(193, 277, 5, 'Permission Update', 'admin.rolePermission.update', 1, '2023-11-09 04:05:28', '2023-11-09 04:05:28'),
(198, 282, 72, 'store', 'admin.attribute.store', 1, '2023-11-10 13:05:41', '2023-11-10 13:05:41'),
(199, 283, 72, 'edit', 'admin.attribute.edit', 1, '2023-11-10 13:05:54', '2023-11-10 13:05:54'),
(200, 284, 72, 'update', 'admin.attribute.update', 1, '2023-11-10 13:06:02', '2023-11-10 13:06:02'),
(201, 285, 72, 'delete', 'admin.attribute.destroy', 1, '2023-11-10 13:06:09', '2023-11-10 13:06:09'),
(202, 286, 17, 'create', 'admin.client-price.create', 1, '2023-11-10 13:15:05', '2023-11-10 13:15:05'),
(203, 287, 17, 'store', 'admin.client-price.store', 1, '2023-11-10 13:15:12', '2023-11-10 13:15:12'),
(204, 288, 17, 'edit', 'admin.client-price.edit', 1, '2023-11-10 13:15:40', '2023-11-10 13:15:40'),
(205, 289, 17, 'update', 'admin.client-price.update', 1, '2023-11-10 13:15:44', '2023-11-10 13:15:44'),
(206, 290, 17, 'delete', 'admin.client-price.destroy', 1, '2023-11-10 13:15:50', '2023-11-10 13:15:50'),
(207, 293, 85, 'view', 'admin.online-order.edit', 1, '2023-11-16 12:01:31', '2023-11-16 12:01:31'),
(208, 294, 85, 'print', 'admin.online-order.show', 1, '2023-11-16 12:01:39', '2023-11-16 12:01:39'),
(209, 297, 88, 'Edit Status', 'admin.order-dashboard.edit', 1, '2023-11-19 17:04:37', '2023-11-19 17:04:37'),
(210, 298, 88, 'Update Status', 'admin.order-dashboard.update', 1, '2023-11-19 17:04:50', '2023-11-19 17:04:50'),
(211, 300, 89, 'Approve', 'admin.cancel-order.approve', 1, '2023-11-19 17:06:43', '2023-11-19 17:06:43'),
(212, 302, 90, 'create', 'admin.online-order-delivery.create', 1, '2023-11-19 17:08:03', '2023-11-19 17:08:03'),
(213, 303, 90, 'store', 'admin.online-order-delivery.store', 1, '2023-11-19 17:08:08', '2023-11-19 17:08:08'),
(214, 304, 90, 'edit', 'admin.online-order-delivery.edit', 1, '2023-11-19 17:08:12', '2023-11-19 17:08:12'),
(215, 305, 90, 'update', 'admin.online-order-delivery.update', 1, '2023-11-19 17:08:22', '2023-11-19 17:08:22'),
(216, 306, 90, 'delete', 'admin.online-order-delivery.destroy', 1, '2023-11-19 17:08:29', '2023-11-19 17:08:29'),
(217, 307, 90, 'print', 'admin.online-order-delivery.show', 1, '2023-11-19 17:09:04', '2023-11-19 17:09:04'),
(218, 309, 91, 'Update', 'admin.delivery-charge.update', 1, '2023-11-19 17:10:16', '2023-11-19 17:10:16'),
(219, 317, 94, 'create', 'client.product-request.create', 1, '2023-11-22 17:30:15', '2023-11-22 17:30:15'),
(220, 318, 94, 'store', 'client.product-request.store', 1, '2023-11-22 17:30:23', '2023-11-22 17:30:23'),
(221, 319, 94, 'edit', 'client.product-request.edit', 1, '2023-11-22 17:30:30', '2023-11-22 17:30:30'),
(222, 320, 94, 'update', 'client.product-request.update', 1, '2023-11-22 17:30:38', '2023-11-22 17:30:38'),
(223, 321, 94, 'delete', 'client.product-request.destroy', 1, '2023-11-22 17:30:48', '2023-11-22 17:30:48'),
(224, 322, 94, 'print voucher', 'client.product-request.show', 1, '2023-11-22 17:31:01', '2023-11-22 17:31:01'),
(225, 323, 45, 'create', 'admin.bulk-collection.create', 1, '2023-11-23 04:57:03', '2023-11-23 04:57:03'),
(226, 324, 45, 'store', 'admin.bulk-collection.store', 1, '2023-11-23 04:57:09', '2023-11-23 04:57:09'),
(227, 325, 45, 'edit', 'admin.bulk-collection.edit', 1, '2023-11-23 04:57:14', '2023-11-23 04:57:14'),
(228, 326, 45, 'update', 'admin.bulk-collection.update', 1, '2023-11-23 04:57:20', '2023-11-23 04:57:20'),
(229, 327, 45, 'delete', 'admin.bulk-collection.destroy', 1, '2023-11-23 04:57:29', '2023-11-23 04:57:29'),
(230, 328, 6, 'edit password', 'admin.user.password', 1, '2023-11-26 05:57:38', '2023-11-26 05:57:38'),
(231, 329, 6, 'update password', 'admin.user.password-update', 1, '2023-11-26 05:58:21', '2023-11-26 05:58:21'),
(232, 344, 105, 'store', 'admin.coa-setup.store', 1, '2023-12-13 12:12:03', '2023-12-13 12:12:03'),
(233, 345, 105, 'edit', 'admin.coa-setup.edit', 1, '2023-12-13 12:12:10', '2023-12-13 12:12:10'),
(234, 346, 105, 'update', 'admin.coa-setup.update', 1, '2023-12-13 12:12:17', '2023-12-13 12:12:17'),
(235, 347, 105, 'delete', 'admin.coa-setup.destroy', 1, '2023-12-13 12:12:25', '2023-12-13 12:12:25'),
(236, 348, 106, 'create', 'admin.debit-voucher-entry.create', 1, '2023-12-13 12:13:07', '2023-12-13 12:13:07'),
(237, 349, 106, 'store', 'admin.debit-voucher-entry.store', 1, '2023-12-13 12:13:16', '2023-12-13 12:13:16'),
(238, 350, 106, 'edit', 'admin.debit-voucher-entry.edit', 1, '2023-12-13 12:13:24', '2023-12-13 12:13:24'),
(239, 351, 106, 'update', 'admin.debit-voucher-entry.update', 1, '2023-12-13 12:13:31', '2023-12-13 12:13:31'),
(240, 352, 106, 'delete', 'admin.debit-voucher-entry.destroy', 1, '2023-12-13 12:13:38', '2023-12-13 12:13:38'),
(241, 353, 107, 'create', 'admin.credit-voucher-entry.create', 1, '2023-12-13 12:13:58', '2023-12-13 12:13:58'),
(242, 354, 107, 'store', 'admin.credit-voucher-entry.store', 1, '2023-12-13 12:14:08', '2023-12-13 12:14:08'),
(243, 355, 107, 'edit', 'admin.credit-voucher-entry.edit', 1, '2023-12-13 12:14:14', '2023-12-13 12:14:14'),
(244, 356, 107, 'update', 'admin.credit-voucher-entry.update', 1, '2023-12-13 12:14:21', '2023-12-13 12:14:21'),
(245, 357, 107, 'delete', 'admin.credit-voucher-entry.destroy', 1, '2023-12-13 12:14:27', '2023-12-13 12:14:27'),
(246, 358, 108, 'create', 'admin.journal-voucher-entry.create', 1, '2023-12-13 12:14:55', '2023-12-13 12:14:55'),
(247, 359, 108, 'store', 'admin.journal-voucher-entry.store', 1, '2023-12-13 12:15:01', '2023-12-13 12:15:01'),
(248, 360, 108, 'edit', 'admin.journal-voucher-entry.edit', 1, '2023-12-13 12:15:06', '2023-12-13 12:15:06'),
(249, 361, 108, 'update', 'admin.journal-voucher-entry.update', 1, '2023-12-13 12:15:12', '2023-12-13 12:15:12'),
(250, 362, 108, 'delete', 'admin.journal-voucher-entry.destroy', 1, '2023-12-13 12:15:18', '2023-12-13 12:15:18'),
(251, 363, 109, 'view', 'admin.voucher-approve.show', 1, '2023-12-13 12:16:48', '2023-12-13 12:16:48'),
(252, 364, 109, 'approve', 'admin.voucher-approve.edit', 1, '2023-12-13 12:16:56', '2023-12-13 12:16:56'),
(253, 365, 110, 'View', 'admin.voucher-reject.show', 1, '2023-12-13 12:17:48', '2023-12-13 12:17:48'),
(254, 366, 110, 'Refuse', 'admin.voucher-reject.edit', 1, '2023-12-13 12:18:00', '2023-12-13 12:18:00'),
(255, 367, 111, 'view', 'admin.automation-approve.show', 1, '2023-12-13 12:19:10', '2023-12-13 12:19:10'),
(256, 368, 111, 'approve', 'admin.automation-approve.edit', 1, '2023-12-13 12:19:19', '2023-12-13 12:19:19'),
(257, 369, 112, 'view', 'admin.automation-reject.show', 1, '2023-12-13 12:19:47', '2023-12-13 12:19:47'),
(258, 370, 112, 'Refuse', 'admin.automation-reject.edit', 1, '2023-12-13 12:19:54', '2023-12-13 12:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `secondary_color` varchar(255) DEFAULT NULL,
  `primary_color` varchar(255) DEFAULT NULL,
  `compare_chart_start` date DEFAULT NULL,
  `compare_chart_end` date DEFAULT NULL,
  `accounting` tinyint(4) NOT NULL DEFAULT 0,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `logo`, `favicon`, `title`, `footer_text`, `secondary_color`, `primary_color`, `compare_chart_start`, `compare_chart_end`, `accounting`, `facebook`, `twitter`, `linkedin`, `whatsapp`, `google`, `created_at`, `updated_at`) VALUES
(1, 'media/admin-setting/2026-11-08-IRsq0GU60EGuaIM950WIlSBxVmWlvmcS27abgK9I.webp', 'media/admin-setting/2026-11-08-LoueId8aEGtCuSn3zl7EicgQ0CS5yXHt5Nh4L1jY.webp', 'Bread Pit | Prima Bakery | Baked with Love', '© 2023 Developed by <a target=\"_blank\" href=\"http://www.technoparkbd.com/\">Techno Park Bangladesh</a>', '#0d97a6', '#162bf0', '2024-02-01', '2024-04-30', 1, 'https://www.facebook.com/BreadPitBangladesh/', NULL, NULL, '01738113386', NULL, '2023-09-19 09:03:18', '2026-11-08 07:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `incharge_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `company_id`, `region_id`, `code`, `name`, `incharge_name`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(15, 1, 1, 'ADS', 'Dhaka South', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2023-12-24 05:00:49', '2023-12-24 05:00:49'),
(16, 1, 10, 'ADN', 'Dhaka North', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2023-12-24 05:01:08', '2023-12-24 05:01:08'),
(17, 1, 13, 'BD', 'Bangladesh', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2024-02-11 12:24:03', '2024-02-11 12:24:03'),
(18, 1, 13, 'DKH', 'Dhaka City', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2024-02-29 04:47:41', '2024-02-29 04:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `company_id`, `name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'KG', 1, 1, NULL, NULL, NULL, '2023-09-29 03:25:25', '2023-09-29 03:25:25'),
(2, 1, 'Pcs', 1, 1, NULL, NULL, NULL, '2023-09-29 03:29:41', '2023-09-29 03:29:41'),
(3, 1, 'Packed', 1, 2, NULL, NULL, NULL, '2023-12-27 18:42:52', '2023-12-27 18:42:52'),
(4, 1, 'ML', 1, 2, NULL, NULL, NULL, '2023-12-27 18:43:16', '2023-12-27 18:43:16'),
(5, 1, 'Jar', 1, 2, NULL, NULL, NULL, '2024-01-01 16:57:38', '2024-01-01 16:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `tin` varchar(255) DEFAULT NULL,
  `trade_license` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `company_id`, `prefix`, `name`, `contact_person`, `email`, `phone`, `fax`, `website`, `vat`, `tin`, `trade_license`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'AHQ', 'Head Office', 'Nahid Hasan', 'primabakery.bangladesh@gmail.com', '01738113386', NULL, 'breadpit.bangladesh@gmail.com', NULL, NULL, 'zz', 'Dhaka', 1, 1, 1, 1, NULL, '2023-09-23 06:52:33', '2026-11-08 07:03:10'),
(2, 1, 'ATS', 'Store and Operational Office', 'xyz', 'primabakery.bangladesh@gmail.com', '01738113386', NULL, NULL, NULL, NULL, '12345', 'Dhaka', 1, 2, 1, NULL, NULL, '2023-11-07 07:50:49', '2026-11-08 07:03:25');

-- --------------------------------------------------------

--
-- Table structure for table `bulk_collections`
--

CREATE TABLE `bulk_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulk_collection_lists`
--

CREATE TABLE `bulk_collection_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bulk_collection_id` bigint(20) UNSIGNED NOT NULL,
  `collection_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_amount` decimal(16,2) NOT NULL,
  `paid_amount` decimal(16,2) NOT NULL,
  `money_receipt` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `order` bigint(20) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `show_frontend` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `company_id`, `parent_id`, `name`, `slug`, `image`, `meta_title`, `meta_keyword`, `meta_description`, `featured`, `order`, `status`, `show_frontend`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 1, NULL, 'Potatoes', 'potatoes', 'media/category/2023-11-08-Zk7oqxJAJvBZ2r4iaWiBPQ4Vmc6rGpL66cI2osVi.webp', NULL, NULL, NULL, 0, 0, 1, 1, 1, 2, 1, '2023-12-27 03:55:16', '2023-09-26 04:09:27', '2023-12-27 03:55:16'),
(6, 1, NULL, 'Vegetables', 'vegetables', 'media/category/2023-11-08-tkqpTlVCxROT0rgFJnwAoE56hX4df31vhXZM7OaV.webp', NULL, NULL, NULL, 0, 0, 1, 1, 1, 2, 1, '2023-12-27 03:55:16', '2023-09-26 04:09:58', '2023-12-27 03:55:16'),
(7, 1, NULL, 'Poultry', 'poultry', 'media/category/2023-11-08-Jv9mtxWXwsPw1B8YAxtwE5dXOcsfjmJJUzCGXGbc.webp', NULL, NULL, NULL, 0, 0, 1, 1, 1, 2, 1, '2023-12-27 03:55:16', '2023-10-02 08:48:33', '2023-12-27 03:55:16'),
(8, 1, NULL, 'Dairy', 'dairy', 'media/category/2023-10-19-WB113DAyHZTdjX8FJWUlF2Vq4qoNeAGJLnzZ437w.webp', NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, '2023-12-27 03:55:16', '2023-10-13 04:53:11', '2023-12-27 03:55:16'),
(10, 1, NULL, 'Bakery Item', 'bakery-item', 'media/category/2023-12-31-icCG3Nfl4jMBEnO7XI34spjXovuoUjYLx8ZahFAx.webp', NULL, NULL, NULL, 0, 0, 1, 1, 67, 2, NULL, NULL, '2023-12-30 06:04:20', '2023-12-31 11:53:48'),
(11, 1, NULL, 'Sauce Item', 'sauce-item', 'media/category/2023-12-31-fQUVJ8k0cTuefWZ1vE92Q6oQCpOcK8QkNKsXvLRd.webp', NULL, NULL, NULL, 0, 0, 0, 1, 2, 2, NULL, NULL, '2023-12-31 10:00:35', '2026-11-08 07:26:10'),
(12, 1, NULL, 'Frozen Items', 'frozen-items', 'media/category/2024-01-01-Wq7QwO6dJaAlW6zO5ummv9xPWmb5l891ixalCi5E.webp', NULL, NULL, NULL, 0, 0, 0, 1, 2, NULL, NULL, NULL, '2024-01-01 16:49:51', '2026-11-08 07:26:04'),
(13, 1, NULL, 'Container Jar', 'container-jar', 'media/category/2024-10-27-zSLScHHlboPB9Edw823FwWCP8qcXnyA8AqWHaLrb.webp', NULL, NULL, NULL, 0, 0, 0, 1, 133, NULL, NULL, NULL, '2024-10-27 07:04:06', '2026-11-08 07:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `category_vendors`
--

CREATE TABLE `category_vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_vendors`
--

INSERT INTO `category_vendors` (`id`, `category_id`, `vendor_id`, `created_at`, `updated_at`) VALUES
(26, 9, 1, '2023-10-19 06:38:23', '2023-10-19 06:38:23'),
(27, 8, 1, '2023-10-19 06:40:19', '2023-10-19 06:40:19'),
(30, 5, 1, '2023-11-08 09:46:29', '2023-11-08 09:46:29'),
(31, 6, 1, '2023-11-08 09:47:45', '2023-11-08 09:47:45'),
(32, 7, 1, '2023-12-02 08:21:14', '2023-12-02 08:21:14'),
(33, 7, 3, '2023-12-02 08:21:14', '2023-12-02 08:21:14'),
(39, 10, 1, '2023-12-31 11:52:15', '2023-12-31 11:52:15'),
(42, 11, 3, '2024-01-01 06:40:37', '2024-01-01 06:40:37'),
(43, 12, 3, '2024-01-01 16:49:51', '2024-01-01 16:49:51'),
(44, 13, 4, '2024-10-27 07:04:06', '2024-10-27 07:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `chain_clients`
--

CREATE TABLE `chain_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chain_clients`
--

INSERT INTO `chain_clients` (`id`, `company_id`, `name`, `contact_person`, `email`, `phone`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'KFC', NULL, NULL, NULL, NULL, 1, 2, NULL, 2, '2024-02-11 12:26:01', '2023-11-09 13:50:00', '2024-02-11 12:26:01'),
(2, 1, 'mr. Alamgir', 'Mr. Delower Hussain', NULL, '01715622915', '089796564', 1, 2, NULL, 2, '2024-02-11 12:26:07', '2023-12-21 07:33:34', '2024-02-11 12:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coa_setup_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_by` bigint(20) UNSIGNED DEFAULT NULL,
  `client_category_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `territory_id` bigint(20) UNSIGNED NOT NULL,
  `code` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `credit_limit` decimal(16,2) DEFAULT NULL,
  `bin_no` bigint(20) DEFAULT NULL,
  `chain_client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_chain` tinyint(4) NOT NULL DEFAULT 0,
  `is_vat` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `company_id`, `user_id`, `coa_setup_id`, `reference_by`, `client_category_id`, `area_id`, `territory_id`, `code`, `name`, `contact_person`, `phone`, `email`, `address`, `credit_limit`, `bin_no`, `chain_client_id`, `discount`, `status`, `is_chain`, `is_vat`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3028, 1, 76, 48, 51, 11, 17, 57, 2031, 'Bonton Foods Limited', 'Mr. Rafiqul Islam', '01618 003740', NULL, 'Mogbazar, Dhaka', 4000000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-03 11:06:50', '2026-07-25 04:08:49'),
(3029, 1, 77, 66, 52, 11, 17, 57, 2032, 'Cash Sales', NULL, '01700', NULL, NULL, 25000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-03 11:50:46', '2026-05-23 09:49:38'),
(3030, 1, 78, 50, 52, 11, 16, 51, 2033, 'Dhali Super Shop - Gulshan', 'Mr.', '01711', NULL, NULL, 100000.00, NULL, NULL, 30.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-03 12:11:33', '2024-07-27 09:28:37'),
(3031, 1, 79, 49, 52, 9, 16, 51, 2034, 'Pick & Pay - Baridhara', 'Mr. Rony Sarder', '01728398313', 'ronysarder899@gmail.com', '101, Annanya Shopping Complex, Dhaka-1206', 100000.00, NULL, NULL, 20.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-03 12:12:28', '2024-02-15 05:31:35'),
(3032, 1, 80, 51, 43, 5, 16, 56, 2035, 'Atikur Rahman', '01305845147', '01305845147', NULL, 'Tejgaon, Dhaka-1208', 5000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-04 11:32:39', '2024-02-05 06:36:17'),
(3033, 1, 82, 80, 51, 9, 16, 51, 2036, 'Apon Family Mart - Bashundhara', 'Jahidul Islam Rony', '01711446959', 'jahidulrony@hotmail.com', 'Bashundhara, Dhaka-1229', 100000.00, 59243210101, NULL, 28.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-07 04:56:16', '2024-02-10 13:14:51'),
(3034, 1, 83, 87, 51, 11, 16, 51, 2037, 'Dedar Super Shop', '01316051644', '01316051644', NULL, 'Nort DNCC Market,Gulsan-02', 500000.00, NULL, NULL, 25.00, 1, 0, 0, 68, 2, NULL, NULL, '2024-02-08 09:23:11', '2025-01-02 10:04:54'),
(3035, 1, 85, NULL, 52, 4, 16, 51, 2038, 'FOC (Free of Cost) - Office', NULL, '01844000103', NULL, NULL, 1000.00, NULL, NULL, 100.00, 1, 0, 0, 2, NULL, NULL, NULL, '2024-02-11 05:51:48', '2024-02-11 05:51:48'),
(3036, 1, 92, 98, 52, 11, 16, 58, 2039, 'Mejan General Store- Kawran bazar', NULL, '01726887481', NULL, '165, Kitchen Market, 2nd Floor, Kawran Bazar, Dhaka', 12000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-13 06:06:44', '2024-07-04 05:13:40'),
(3037, 1, 93, 100, 52, 11, 16, 58, 2040, 'Khan Enterprise - Kawran', NULL, '01911722350', NULL, '194, Kitchen Market, 1st Floor, Kawran Bazar, Dhaka', 20000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 68, NULL, NULL, '2024-02-13 07:28:54', '2024-04-22 08:08:52'),
(3038, 1, 94, 99, 52, 11, 16, 58, 2041, 'Altaf General Store- Kawran', NULL, '01311467970', NULL, '104 / 105, Kitchen Market, 1st Floor, Kawran Bazar, Dhaka', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 68, NULL, NULL, '2024-02-13 07:41:43', '2024-05-05 06:41:28'),
(3039, 1, 95, 101, 52, 1, 16, 58, 2042, 'Sonargaon General Store- Kawran Bazar', NULL, '01714323952', NULL, '128/9, Kitchen Market, 1st Floor, Kawran Bazar, Dhaka', 5000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-13 07:43:40', '2024-02-13 08:01:46'),
(3040, 1, 96, 102, 52, 11, 16, 58, 2043, 'Palash Enterprise- kawran bazar', NULL, '01673886595', NULL, '236 & 234, Kitchen Market, 1st Floor, Kawran Bazar, Dhaka', 20000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 133, NULL, NULL, '2024-02-13 07:44:50', '2024-11-19 05:23:23'),
(3041, 1, 97, 103, 52, 11, 16, 51, 2044, 'Sariotpur Enterprise-Gulshan-1', NULL, '01755712559', NULL, 'Shop# 03, DNCC Market, Gulshan-1, Dhaka-1212', 11000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-15 05:35:03', '2024-12-04 06:56:45'),
(3042, 1, 98, 104, 52, 1, 16, 51, 2045, 'M.R Corporation - Gulshan-1', NULL, '01818588499', NULL, 'Shop# 118, DNCC Market, Gulshan-1, Dhaka-1212', 5000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-15 05:37:34', '2024-02-15 05:56:06'),
(3043, 1, 99, 105, 52, 11, 16, 51, 2046, 'Labeeb Corporation - Gulshan-1', NULL, '01715885452', NULL, 'Shop# 73-74, DNCC Market, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 68, NULL, NULL, '2024-02-15 05:40:24', '2024-05-07 06:42:32'),
(3044, 1, 100, 106, 52, 11, 16, 51, 2047, 'Brothers General Store- Gulshan-1', NULL, '01718075099', NULL, 'Shop# 50/51, DNCC Market, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-15 05:44:33', '2024-07-07 05:41:05'),
(3045, 1, 101, 107, 52, 11, 16, 51, 2048, 'R.S.K Traders - Gulshan-1', NULL, '01926724482', NULL, 'Shop #23, Nawab Manshan, Gulshan-01, Dhaka-1212', 20000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 68, NULL, NULL, '2024-02-15 05:50:33', '2024-04-21 10:57:39'),
(3046, 1, 102, 108, 44, 10, 16, 48, 2049, 'Shahi Food Service- Mirpur-02', NULL, '01712595692', NULL, '195, West Monipur, Mirpur-02, Dhaka-1216', 20000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-15 06:39:01', '2024-06-23 10:04:31'),
(3047, 1, 105, 110, 52, 1, 16, 51, 2050, 'Gemini Shopping Center', 'Mr.Mizan', '01730609977', NULL, '41,Banani Commercial Area,Banani,Dhaka-1213', 20000.00, NULL, NULL, 0.00, 1, 0, 0, 68, 68, NULL, NULL, '2024-02-18 06:17:48', '2024-02-18 06:18:10'),
(3048, 1, 106, 111, 52, 1, 16, 48, 2051, 'Salafi traders-Kachukhet', 'Mr.Opu', '01911797573', NULL, 'C-46,Rjanighandha market,kachukhet', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 68, 68, NULL, NULL, '2024-02-20 05:28:26', '2024-02-20 06:07:05'),
(3049, 1, 107, 112, 52, 1, 16, 48, 2052, 'Jahan Enterprise-Kachukhet', NULL, '01726993902', NULL, 'C-55,Rjanighandha market,kachukhet', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 68, 68, NULL, NULL, '2024-02-20 05:30:01', '2024-02-20 06:07:18'),
(3050, 1, 108, 113, 52, 11, 16, 48, 2053, 'Ayesha Enterprise-Kachukhet', NULL, '01617776012', NULL, 'C-54,Rjanighandha market,kachukhet', 12000.00, NULL, NULL, 0.00, 1, 0, 0, 68, 2, NULL, NULL, '2024-02-20 05:35:05', '2024-09-09 04:32:22'),
(3051, 1, 109, 114, 52, 1, 16, 48, 2054, 'Sikder Enterprise-Kachukhet', NULL, '01706333315', NULL, 'Ma-1 west,Rjanighandha market,kachukhet', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 68, 68, NULL, NULL, '2024-02-20 05:39:24', '2024-02-20 06:05:49'),
(3052, 1, 110, 115, 52, 1, 16, 48, 2055, 'Farzana Enterprise-Kachukhet', 'Jahangir Alam', '01720963091', NULL, 'C-48,Rjanighandha market,kachukhet', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 68, NULL, NULL, NULL, '2024-02-20 10:17:36', '2024-02-20 10:17:36'),
(3053, 1, 111, 116, 51, 4, 17, 57, 2056, 'Panda Mart', 'Mr. Reza', '01601540567', NULL, 'Gulshan-2', 5000.00, NULL, NULL, 28.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-02-25 05:15:22', '2024-02-25 05:15:55'),
(3054, 1, 112, 117, 52, 11, 18, 59, 2057, 'Meena Bazar', 'Mr. Abdul Matin', '01841700923', NULL, 'Dhaka', 200000.00, NULL, NULL, 30.00, 1, 0, 0, 2, 68, NULL, NULL, '2024-02-29 04:52:42', '2024-04-21 12:12:14'),
(3055, 1, 114, 121, 44, 11, 16, 58, 2058, 'S A Enterprise,Kawran bazar', '01787772391', '01872720639', NULL, '128/2a kitchen market kawranbazar', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 68, NULL, NULL, NULL, '2024-03-16 07:10:14', '2024-03-16 07:10:14'),
(3056, 1, 115, 122, 44, 11, 16, 58, 2059, 'Noakhali general Store-kawran bazar', '01712158508', '01684732601', NULL, '181/157 kitchen market, Kawran bazar', 90000.00, NULL, NULL, 0.00, 1, 0, 0, 68, 2, NULL, NULL, '2024-03-16 09:20:09', '2024-07-04 05:42:42'),
(3057, 1, 116, 124, 52, 11, 16, 51, 2060, 'Lavender Convenience Store Ltd.', 'Iftekhar Alam', '01791888889', NULL, 'Elegant heights,30/2 Shahjadpur ,Dhaka-1212', 100000.00, NULL, NULL, 0.00, 1, 0, 0, 68, NULL, NULL, NULL, '2024-04-08 07:11:28', '2024-04-08 07:11:28'),
(3058, 1, 117, 125, 52, 11, 16, 51, 2061, 'Devour Limited', '01', '01713029996', NULL, 'Banani,Dhaka', 180000.00, NULL, NULL, 0.00, 1, 0, 0, 68, 2, NULL, NULL, '2024-04-21 10:46:43', '2026-09-20 07:12:55'),
(3059, 1, 119, 131, 52, 11, 18, 59, 2062, 'Agora Limited', 'Mr. Arafat', '01925117638', NULL, 'Mohakhali', 100000.00, NULL, NULL, 0.00, 1, 0, 1, 2, 2, NULL, NULL, '2024-05-15 10:41:27', '2024-05-19 10:54:04'),
(3060, 1, 121, 136, 52, 11, 16, 51, 2063, 'Taj General Store- Gulshan DCC Market', NULL, '01760650650, 01962797611', NULL, '14, DNCC, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-07-03 04:59:18', '2024-07-03 05:08:16'),
(3061, 1, 122, 137, 52, 11, 16, 51, 2064, 'Bhai Bhai General Store- Gulshan DCC', NULL, '01950-453393', NULL, '2/48, DNCC Market, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-07-03 05:01:59', '2024-07-03 05:07:52'),
(3062, 1, 123, 138, 52, 11, 16, 51, 2065, 'Mayer Doya Baniati Store- Gulshan DCC', 'Mr. Julhas', '01731-398419, 01941-118688', NULL, 'Old 96, Present 67, South Gulshan DNCC, Kacha Market, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-07-03 05:04:56', '2024-07-03 05:07:37'),
(3063, 1, 124, 140, 47, 11, 16, 51, 2066, 'Jerin Enterprise - DCC Market', 'Mr. Jakir Hossain', '01814-148996, 01306-682873', NULL, 'Shop# 300/6, 3rd Floor, Gulshan Shoping Market, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-07-04 06:43:17', '2024-07-04 06:43:58'),
(3064, 1, 125, 141, 47, 11, 16, 51, 2067, 'Izaan N Zayan Trade International- DCC Market', NULL, '01611-103790, 01841-103790, 01511-103790', NULL, 'Shop No: B-76, Gulshan-1, DCC Market, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-07-04 06:50:03', '2024-07-04 06:51:03'),
(3065, 1, 126, 142, 47, 11, 16, 51, 2068, 'Jannath General Store - DCC Market', NULL, '01758-978070, 01840-732624', NULL, 'Shop No: 57, DNCC, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-07-04 06:57:14', '2024-07-04 08:11:38'),
(3066, 1, 127, 145, 53, 11, 16, 51, 2069, 'Upohar General Store- DCC Market', NULL, '01865-080806', NULL, 'DNCC Market, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-07-07 05:17:15', '2024-07-07 05:18:01'),
(3067, 1, 128, 146, 47, 11, 16, 51, 2070, 'Nihan Trade Corporation-DCC Market', NULL, '01644466314', 'nihantradecorporation.bd@gmail.com', '125/126, 3rd floor, Gulshan shopping Centre, Gulshan-1, Dhaka-1212', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-07-07 06:11:59', '2024-07-07 06:14:28'),
(3068, 1, 129, 147, 52, 10, 16, 51, 2071, 'Happy Potato - Dhanmondi', 'Mr. Shahin', '01685956653', NULL, 'Dhanmondi', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 1, NULL, NULL, '2024-07-07 06:21:49', '2026-11-08 08:09:20'),
(3069, 1, 131, 160, 53, 11, 15, 50, 2072, 'MN Burger - Khilgaon', NULL, '017567', NULL, 'Khilgaon', 5000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-09-21 13:06:35', '2024-09-23 08:56:46'),
(3070, 1, 134, 161, 54, 11, 18, 59, 2073, 'RFL', NULL, '01558182602', NULL, NULL, 100000.00, NULL, NULL, 0.00, 1, 0, 0, 133, NULL, NULL, NULL, '2024-10-27 06:50:19', '2024-10-27 06:50:19'),
(3071, 1, 135, 199, 51, 11, 17, 57, 2074, 'Mon Cheri - Badda', '0', '0', NULL, 'Pocket Gate, Brac Univercity', 2000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2024-11-19 06:32:51', '2024-11-19 06:33:42'),
(3072, 1, 142, 210, 51, 11, 16, 51, 2075, 'Masud Hossain', NULL, '01772329442', NULL, 'Shahjadpur, Dhaka', 5000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2025-05-29 06:33:39', '2025-05-29 06:36:51'),
(3073, 1, 145, 211, 53, 11, 16, 58, 2076, 'Jahangir Store - Kawran Bazar', 'Mr. Jahangir', '01733732082', NULL, 'Kawran Bazar', 8000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2025-06-21 06:40:56', '2025-07-21 05:20:59'),
(3074, 1, 148, 212, 52, 11, 17, 57, 2077, 'Gweebarra Bakery Ind. Limited (Cooper\'s Bakery)', '01729-076911', '01729-076911', NULL, '147/A, Bijoy Sharani, Old Airport Road, Tejgaon, Dhaka, Bangladesh', 600000.00, 1996190403, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2025-09-01 10:07:43', '2025-10-13 09:53:56'),
(3075, 1, 151, 213, 51, 11, 15, 53, 2078, 'KUDOS', 'Mr. Syed Azizur Rahman', '01650-146568', NULL, NULL, 300000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2025-09-10 05:27:06', '2026-05-26 07:13:07'),
(3076, 1, 155, 214, 51, 11, 15, 52, 2079, 'Brisket & Bistro', '+8801632489500', '+8801632489500', NULL, 'Lavel 5, House 758, green City Center, Shatmosjid Road, Dhanmondi', 70000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2025-11-03 04:19:18', '2026-06-14 05:59:15'),
(3077, 1, 156, 215, 47, 11, 16, 51, 2080, 'Kings Confectionary', 'Mr. Kaiser', '+880 1755-662973', NULL, 'Road# 11, Banani, Dhaka-1213', 50000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2025-11-12 06:21:17', '2025-11-12 06:26:53'),
(3078, 1, 157, 216, 51, 11, 17, 57, 2081, 'Mr. Omair', 'Omair Ahmed Deen', '01963452882', 'ahmed.deen26@gmail.com', '171, Tejgaon, I/A, Dhaka-1208', 5000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2026-01-04 10:02:56', '2026-06-15 12:19:39'),
(3079, 1, 163, 217, 51, 11, 15, 50, 2082, 'Green Lab', NULL, '01787436484', NULL, 'Banasree, Dhaka', 30000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2026-08-23 04:35:52', '2026-09-02 11:49:43'),
(3080, 1, 164, NULL, 52, 11, 16, 48, 2083, 'Kyoto - Mirpur 12', NULL, '01779579928', NULL, 'Mirpur 12 Food Avenue, Dhaka', 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, NULL, 2, '2026-08-28 03:04:26', '2026-08-28 02:57:50', '2026-08-28 03:04:26'),
(3081, 1, 166, 218, 51, 11, 17, 57, 2084, 'Enamul Huq - GM, Bonton Foods Ltd.', NULL, '01618003700', NULL, 'Banasree', 5000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2026-09-21 07:14:11', '2026-09-21 07:14:56'),
(3082, 1, 167, 219, 52, 11, 16, 51, 2085, 'Mollika Snacks - Gulshan', 'Mr. Ratan', '01623756790', NULL, NULL, 10000.00, NULL, NULL, 0.00, 1, 0, 0, 2, 2, NULL, NULL, '2026-10-08 07:09:05', '2026-10-08 07:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `client_categories`
--

CREATE TABLE `client_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_categories`
--

INSERT INTO `client_categories` (`id`, `company_id`, `name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'RETAILER', 1, 1, NULL, NULL, NULL, '2023-09-23 15:05:44', '2023-09-23 15:05:44'),
(2, 1, 'DISTRIBUTOR', 1, 1, NULL, NULL, NULL, '2023-09-23 15:05:10', '2023-09-23 15:05:10'),
(3, 1, 'HOTEL', 1, 1, 2, NULL, NULL, '2023-09-23 15:05:27', '2023-11-07 08:18:49'),
(4, 1, 'CORPORATE', 1, 1, NULL, NULL, NULL, '2023-09-23 15:05:59', '2023-09-23 15:05:59'),
(5, 1, 'OTHERS', 1, 1, NULL, NULL, NULL, '2023-09-23 15:06:18', '2023-09-23 15:06:18'),
(6, 1, 'RESTAURANT', 1, 2, NULL, NULL, NULL, '2023-11-07 08:19:04', '2023-11-07 08:19:04'),
(7, 1, 'Hospital', 1, 2, NULL, NULL, NULL, '2023-11-07 08:19:33', '2023-11-07 08:19:33'),
(8, 1, 'Club', 1, 2, NULL, NULL, NULL, '2023-11-13 04:32:44', '2023-11-13 04:32:44'),
(9, 1, 'Super Shop', 1, 2, NULL, NULL, NULL, '2023-12-27 18:39:54', '2023-12-27 18:39:54'),
(10, 1, 'Wholesaler', 1, 2, NULL, NULL, NULL, '2024-02-15 06:37:38', '2024-02-15 06:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `client_messages`
--

CREATE TABLE `client_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_messages`
--

INSERT INTO `client_messages` (`id`, `product_id`, `name`, `email`, `phone`, `address`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Howardovano', 'your345432mail@gmail.com', '88826813892', 'https://onlinepodbor1.online/azik', 'PEAK CASINO \r\nGIVING AWAY DISENTANGLE SPINS TO ALL FRESH PLAYERS! \r\n \r\nBent to win? Come and prove your fluke at our licensed casino. Gifts pro all chic players! \r\n \r\nEqual-sided bonuses to save efficacious players! \r\nTournaments - play with chips and persuade licit long green! \r\nCancel your winnings without verification. \r\n \r\nJOIN AND WIN-> https://tinyurl.com/3u262fja', 1, '2024-03-06 11:01:36', '2024-03-06 11:01:36'),
(2, NULL, 'Megan Atkinson', 'meganatkinson149@gmail.com', '02.64.81.90.32', '11 Boulevard Aristide Briand', 'Hi there,\r\n\r\nWe run an Instagram growth service, which increases your number of followers both safely and practically. \r\n\r\n- We guarantee to gain you 300-1000+ followers per month.\r\n- People follow you because they are interested in you, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you\'d like to see some of our previous work, let me know, and we can discuss it further.\r\n\r\nKind Regards,\r\nMegan', 1, '2024-03-11 13:06:00', '2024-03-11 13:06:00'),
(3, NULL, 'Apcinside', 'sugarwork78@gmail.com', '88399677388', 'https://srv.surge.sh', 'Big news! We\'ve discovered an amazing method to boost your website\'s security and speed.\r\nBy partnering with Cloudflare, we\'re able to:\r\n\r\nSpeed up the loading speed of your site for your visitors, ensuring a smoother browsing experience.\r\nMaintain its protection from cyber-attacks, ensuring seamless operation.\r\nConceal sensitive information from online threats, safeguarding your data.\r\nSimplify website management, all in one convenient location, making it easier for you.\r\nAnd the cherry on top? It\'s just a one-time payment of $20!\r\nDon\'t let your website fall behind. Get in touch to upgrade now!\r\n\r\nhttps://srv.surge.sh/posts/cf-bot-protection/', 1, '2024-03-18 21:33:30', '2024-03-18 21:33:30'),
(4, NULL, 'Maxim Markin', 'markin@polarseafood.ru', '+79151897118', 'Moscow, Russia', 'Dear Colleagues,\r\n\r\nwe are POLAR SEAFOOD RUSSIA, largest manufacturer of seafood, especially Polar northern cold water shrimps, Commodore squid (Berryteuthis magister), COD Fillets and sea culinary, like fish balls, burgers, fingers, croquetts from salmon, shrimps and cod in Russia. We offer  PL OEM manufacturing of fish / shrimp balls under \"Made in Russia\". When you import seafood, could you please advise where we can send our catalogue.\r\n\r\nBest Regards,\r\nMaxim Markin,\r\nExport manager.\r\nPOLAR SEAFOOD RUSSIA\r\nEU approval: RU-040/DH01288\r\nChina approval: CRUS18PP2307280027\r\n42, Warshavskoe shausse, 115230, Moscow, Russia.\r\nEmail: markin@polarseafood.ru\r\nМоb./WhattsAp: +7 915 189 7118\r\nwww.polarseafood.ru\r\nwww.crossfish.ru', 1, '2024-03-19 14:09:59', '2024-03-19 14:09:59'),
(5, NULL, 'Georgina Haynes', 'georginahaynes620@gmail.com', '9787722661', '47 Christie Way', 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service, which we feel can benefit your site alifinefoods.com.\r\n\r\nCheck out some of our existing videos here:\r\nhttps://www.youtube.com/watch?v=8S4l8_bgcnc\r\nhttps://www.youtube.com/watch?v=bWz-ELfJVEI\r\nhttps://www.youtube.com/watch?v=Y46aNG-Y3rM\r\nhttps://www.youtube.com/watch?v=hJCFX1AjHKk\r\n\r\nOur prices start from as little as $195 and include a professional script and voice-over.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to reply.\r\n\r\nKind Regards,\r\nGeorgina', 1, '2024-03-25 00:40:48', '2024-03-25 00:40:48'),
(6, NULL, 'Dee Godinez', 'dee.godinez@yahoo.com', '25259418', 'Nyborgvej 48', 'Hi\r\n\r\nWe are a venture sales agency that works with you to uncover the best leads for your industry.\r\n\r\nAfter finding targeted leads for you, warm intros are sent to them ensuring a steady steam of viable clients to your website.\r\n\r\nThere are no subscriptions and we only take a small commision on sales that we are able to generate for you.\r\n\r\nFind out more at: https://alifinefoods.leadsmax.biz', 1, '2024-03-28 12:17:04', '2024-03-28 12:17:04'),
(7, NULL, 'Emily Jones', 'emilyjones2250@gmail.com', '6807261983', 'Reinprechtsdorfer Strasse 24', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\nOur focus is on organic growth strategies that nurture a thriving community around your channel. We don\'t use bots or gimmicks, just targeted engagement tactics to help you reach the right people.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nEmily', 1, '2024-04-02 23:31:30', '2024-04-02 23:31:30'),
(8, NULL, 'Chester58', 'sugarwork78@gmail.com', '82539789326', 'https://array.surge.sh', 'Get notified instantly if your website experiences downtime. Use simple tool to stay in control and ensure continuous service for your customers https://array.surge.sh/posts/uptime-kuma/', 1, '2024-04-09 00:21:10', '2024-04-09 00:21:10'),
(9, NULL, 'Bert', 'bert@alifinefoods.com', '1131815278', 'Guarulhos', 'Hi \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF: https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nThe Best, \r\n\r\nBert', 1, '2024-04-13 17:58:15', '2024-04-13 17:58:15'),
(10, NULL, 'Pillsalcop', 'iunskiygipertonik@gmail.com', '89712772165', 'https://true-pill.top/', 'Erectile dysfunction treatments available online from TruePills. \r\nDiscreet, next day delivery and lowest price guarantee. \r\n \r\nViagra is a well-known, branded and common erectile dysfunction (ED) treatment for men. \r\nIt\'s available through our Online TruePills service. \r\n \r\nTrial ED Pack consists of the following ED drugs: \r\n \r\nViagra Active Ingredient: Sildenafil 100mg 5 pills \r\nCialis 20mg 5 pills \r\nLevitra 20mg 5 pills \r\n \r\nhttps://cutt.ly/7wC5m1Id \r\nhttps://docs.inclick.net/api.php?action=https://true-pill.top/\r\nhttp://wwx.tw/debug/frm-s/true-pill.top\r\nhttp://101.43.178.182/zzmyphp/so/?domain=true-pill.top\r\nhttp://alt1.toolbarqueries.google.ac/url?q=https://true-pill.top/\r\nhttps://golfstrim-of.sinara-development.ru/bitrix/rk.php?goto=https://true-pill.top/\r\n \r\n \r\nQital\r\nAlerfan\r\nRopitor\r\nNel\r\nApracal\r\nI-guard\r\nTrawell\r\nCardioprotect\r\nAmovin\r\nUlcizone\r\nAripiprazole\r\nCorixa\r\nDeprexit\r\nActonel\r\nCarzepin\r\nDexamono\r\nAmestral\r\nCesia\r\nDerbicil\r\nFurorese\r\nAmtiba\r\nGlamaryl\r\nZel\r\nCardiacin\r\nAtidon\r\nNeofuradantin\r\nLawarin\r\nZestan\r\nFuros a vet\r\nFemanest\r\nGrenis-oflo\r\nParcopa\r\nTrisulf\r\nExermet\r\nGalantaminum\r\nBrexidol\r\nTazamel\r\nStrategik\r\nCiprofloksacin\r\nFlusapex', 1, '2024-04-15 03:53:53', '2024-04-15 03:53:53'),
(11, NULL, 'Tim Clunies', 'clunies.tim@gmail.com', '474587790', 'Rue Du Bienne 174', 'Hello,\r\n\r\nWe noticed your domain: alifinefoods.com is listed in very few directories.\r\n\r\nDirectories have a very high Page Rank Score and provide really good back links\r\n\r\nCompany visit us on Company Registar and list your domain in all the directories.\r\n\r\nhttps://alifinefoods.companyregistar.org/alifinefoods.com', 1, '2024-04-16 05:29:10', '2024-04-16 05:29:10'),
(12, NULL, 'Ruby Robillard', 'marketing@pcxresponder.com', '7067751823', '77 Trehafod Road', 'Hi,\r\n\r\nI hope this email finds you well. I wanted to reach out to you today to discuss logo products and apparel for your business.\r\n\r\nQuick question: Who would be the best contact to discuss your company logo products and apparel such as:\r\n\r\n-Printed T-shirts\r\n-Logo mugs\r\n-Branded water bottles\r\n-Custom USB flash drives\r\n-Logo pens\r\n-plus 300,000 other products for your business\r\n\r\nhttps://alifinefoods.marketingeee.com/\r\n\r\nWith over two decades of experience in the promotional products industry, our company is dedicated to helping businesses like yours leave a lasting impression.\r\n\r\nOur wide range of custom-branded merchandise is designed to elevate your brand, foster customer loyalty, and drive sales.\r\n\r\nFrom captivating trade show giveaways to thoughtful employee incentive programs and impressive corporate gifts, we have the expertise to create unique promotional items tailored to your specific needs. Our team of promo product specialists will guide you through the entire process, from selecting the perfect items for your business to designing and creating custom logos that speak to your brand identity.\r\n\r\nAs your one-stop-shop for branded merchandise, we ensure top-quality finished products are delivered right to your doorstep, making the process seamless and hassle-free.\r\n\r\nLet\'s connect and explore how our promotional products can enhance your brand awareness and fuel business growth. \r\n\r\n\r\nThank you for your time, and we look forward to hearing from you soon.\r\n\r\nBest regards,\r\nCreative Specialist\r\nBranded Products\r\nhttps://alifinefoods.marketingeee.com/', 1, '2024-04-18 18:12:01', '2024-04-18 18:12:01'),
(13, NULL, 'Scott Gould', 'scott@consumerproductsintl.com', '15615440719', 'Alfaskeid 97', 'By way of introduction, I am Scott Gould with Consumer Products International, a leader in sales, marketing, and distribution, connecting product manufacturers with major retailers within the United States.\r\n\r\nDiscover how we can help you expand your reach and bring your products to American consumers.\r\n\r\nFor more information on distribution please visit: http://go.consumerproductsintl.com/cpi-2019/\r\n\r\nLet\'s explore the possibilities of collaboration. Contact us at 1-561-544-0719', 1, '2024-04-22 12:43:51', '2024-04-22 12:43:51'),
(14, NULL, 'Dustin Bancks', 'order@pcxresponder.com', '527713927', 'Glennerstrasse 97', 'Hi,\r\n\r\nIf I can tell you exactly who visited your website today - would you be interested?\r\n\r\nHere is what I mean.\r\n\r\nYou get 100 visitors today.\r\n\r\n2 of them fill out your form.\r\n1 of them calls you.\r\n97 of them are gone forever... Until Now.\r\n\r\nOur software can track:\r\n\r\n    -Who was on your website\r\n    -How they got there\r\n    -What keyword they searched\r\n    -Their Name, Phone and Email address.\r\n\r\nDon\'t lose any more leads or sales opportunities.\r\n\r\nWe\'ve been in business since 2015 with clients around the world.\r\n\r\nInterested? Send me your name and number for a no cost demo on YOUR website.\r\n\r\nLeadsMax.biz\r\n\r\n\r\nRegards,\r\nWebsite Detective\r\nDon\'t Miss Any Opportunity.', 1, '2024-04-23 08:46:26', '2024-04-23 08:46:26'),
(15, NULL, 'Arianne O\'Meara', 'leadsbox@pcxresponder.com', '537247927', '63 Rue Marie De Medicis', 'Hi,\r\n\r\nDo you have a digital product you would like to see promoted for free?\r\n\r\nDo you target companies with your product?\r\n\r\nWe promote your product for you on a commission basis.\r\n\r\nCome check us out: https://alifinefoods.leadsboy.biz', 1, '2024-04-24 13:28:43', '2024-04-24 13:28:43'),
(16, NULL, 'XRumer23dep', 'xrumer23dep@gmail.com', '81963533127', 'https://dims-tudio.ru', 'Bases for Xrumer https://dims-tudio.ru', 1, '2024-04-26 09:24:13', '2024-04-26 09:24:13'),
(17, NULL, 'Megan Atkinson', 'meganatkinson149@gmail.com', '682306649', 'Gronausevoetpad 117', 'Hi,\r\n\r\nWe\'re just wondering if you\'d be interested in growing your Instagram followers?\r\n\r\nWe run an Instagram growth service, which increases your number of followers both safely and practically. \r\n\r\n1. Organic Growth: We prioritize long-term growth through genuine connections.\r\n2. Targeted Followers: We focus on attracting followers who care about your niche.\r\n3. Engaged Community: Our strategies encourage likes, comments, and shares.\r\n4. Forget about bots and fake accounts. We use safe, manual strategies to ensure your audience is targeted and authentic.\r\n\r\nIf you\'re interested in learning more don\'t hesitate to get in touch.\r\n\r\nKind Regards,\r\nMegan', 1, '2024-04-27 10:13:32', '2024-04-27 10:13:32'),
(18, NULL, 'Jaunita Dalton', 'dalton.jaunita1@googlemail.com', '917211334', 'Untere Bahnhofstrasse 23', 'Hi alifinefoods.com\r\n\r\nWe noticed your website alifinefoods.com is only listed in 9/2,500 directories.\r\n\r\nWe have a service that lists your company in all the directories globally.\r\n\r\nIt supports all countries, all services, to boost your SEO and get you those high quality back links that directories offer.\r\n\r\nWe have a promo running for a one time fee of $99\r\n\r\nVisit us on https://alifinefoods.companyregistar.org/alifinefoods.com to get listed.', 1, '2024-04-29 17:26:16', '2024-04-29 17:26:16'),
(19, NULL, 'May Mcdonough', 'jannes@pcxresponder.com', '3879579540', 'Via Medina 148', 'Hi,\r\n\r\nWe are a provider of premium databases for companies.\r\n\r\nI want to know if you need any sort of data for your business?\r\n\r\nPlease respond to this email and let us know what you are looking for.\r\n\r\nRegards\r\nJannes', 1, '2024-05-06 09:15:49', '2024-05-06 09:15:49'),
(20, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', '7057762604', '1619 Landon Street', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.click/ev/unsubscribe.php?d=alifinefoods.com', 1, '2024-05-06 11:25:22', '2024-05-06 11:25:22'),
(21, NULL, 'Boyd Galloway', 'boyd.galloway@gmail.com', '5016092428', '3411 Masonic Hill Road', 'Hi there,\r\n\r\nI recently came across your website on alifinefoods.com and found it very interesting. I was curious, have you ever considered creating an eBook out of your website content?\r\n\r\nThere are tools available, that allow you to easily convert website content into a well-designed eBook. This could be a great way to repurpose your existing content and potentially reach a new audience.\r\n\r\nOf course, I understand this might not be something you\'re interested in, but I just wanted to share the possibility!\r\n\r\nAnyway, here is the tool I had in mind. It\'s only $16.95 so worth checking out: \r\nhttps://furtherinfo.org/lgb7\r\n\r\nBest regards,\r\nBoyd', 1, '2024-05-07 06:17:44', '2024-05-07 06:17:44'),
(22, NULL, 'XRumer23dep', 'xrumer23dep@gmail.com', '81327247387', 'https://dims-tudio.ru', 'Bases for Xrumer https://dims-tudio.ru', 1, '2024-05-10 02:26:34', '2024-05-10 02:26:34'),
(23, NULL, 'Emily Jones', 'emilyjones2250@gmail.com', '749051975', '74 Buoro Street', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\nWe go beyond just subscriber numbers. We focus on attracting viewers genuinely interested in your niche, leading to long-term engagement with your content. Our approach leverages optimization, community building, and content promotion for sustainable growth, not quick fixes. Additionally, a dedicated team analyzes your channel and creates a personalized plan to unlock your full potential, all without relying on bots.\r\n\r\nOur packages start from just $60 (USD) per month.\r\n\r\nWould this be of interest?\r\n\r\nKind Regards,\r\nEmily', 1, '2024-05-11 07:24:57', '2024-05-11 07:24:57'),
(24, NULL, 'solar_ntmr', 'moplika@morozfs.store', '81319692632', 'https://larpan-mobi4omes.ru/', 'solar panels for mobile home <a href=larpan-mobi4omes.ru>larpan-mobi4omes.ru</a> .', 1, '2024-05-14 22:08:01', '2024-05-14 22:08:01'),
(25, NULL, 'Dave Mchenry', 'dave.mchenry@gmail.com', '9015704598', '109 Lightning Point Drive', 'Hey there,\r\n\r\nAre you tired of spending countless hours on repetitive marketing tasks?\r\n\r\nImagine having a personal AI assistant that can handle everything from writing high-converting copy to creating stunning websites and videos – all within your WordPress dashboard.\r\n\r\nThis revolutionary AI tool can complete hundreds of marketing tasks in seconds, saving you time and money.\r\n\r\n1. Write captivating content: Articles, landing pages, emails, ebooks, and more – all crafted by AI to perfection.\r\n2. Design stunning visuals: Create professional-looking logos, graphics, and websites in seconds.\r\n3. Automate marketing tasks: Build high-converting funnels, manage social media, and generate leads on autopilot.\r\n4. Develop mobile apps: No coding skills needed! WP Genie can build apps you can sell for thousands.\r\n\r\nAnd so much more!\r\n\r\nLearn more: https://furtherinfo.org/genie\r\n\r\nPlus, WP Genie is:\r\n\r\n- 16x faster than ChatGPT\r\n- Always available: No outages like with other AI tools.\r\n- Easy to use: No technical skills required.\r\n\r\nFor a limited time, get our plugin for a one-time price of just $17 (normally $30/month).\r\n\r\nThis offer won\'t last long, so don\'t miss out.\r\n\r\nClick here to learn more and unlock the power of AI for your WordPress site: https://furtherinfo.org/genie\r\n\r\nSincerely,\r\nDave', 1, '2024-05-16 00:25:40', '2024-05-16 00:25:40'),
(26, NULL, 'Leta', 'alifinefoods.com@msn.com', '5522252752', 'Eisdorf', 'Hi there, \r\n\r\nI hope you\'re doing well. I wanted to let you know about our new BANGE backpacks and sling bags that just released.\r\n\r\nThe bags are waterproof and anti-theft, and have a built-in USB cable that can recharge your phone while you\'re on the go.\r\n\r\nBoth bags are made of durable and high-quality materials, and are perfect for everyday use or travel.\r\n\r\nOrder yours now at 50% OFF with FREE Shipping: http://bangeshop.com\r\n\r\nBest regards,\r\n\r\nLeta', 1, '2024-05-20 16:41:54', '2024-05-20 16:41:54'),
(27, NULL, 'Sherryl Bentley', 'sherryl.bentley@gmail.com', '723664440', 'Ul. Energetyczna 75', 'Hey,\r\n\r\nI came across alifinefoods.com and wondered, have you ever considered starting your own online store?\r\n\r\nShopify lets you create a beautiful online store in just 3 minutes, with a free 3-day trial (no credit card needed!).\r\n\r\nYou don\'t need to be a tech whiz. Shopify has lots of customizable templates to get you started, and it takes care of everything from payments and shipping to security.\r\n\r\nIf you\'re even a little bit curious, find out more here: https://furtherinfo.org/y7sz\r\n\r\nNo pressure at all, but hope you decide to try it out.\r\n\r\nBest,\r\nSherryl\r\n\r\nIf you do not wish to be contacted again, click here: https://removeme.click/imp/unsubscribe.php?d=alifinefoods.com', 1, '2024-05-23 20:30:08', '2024-05-23 20:30:08'),
(28, NULL, 'Shella Behrens', 'behrens.shella17@yahoo.com', '3956209863', 'Via Medina 99', 'Hi there,\r\n\r\nAre you tired of paying monthly fees for website hosting, cloud storage, and funnels?\r\n\r\nWe offer a revolutionary solution: host unlimited websites, files, and videos for a single, low one-time fee. No more monthly payments.\r\n\r\nHere\'s what you get:\r\n\r\nUltra-fast hosting powered by Intel® Xeon® CPU technology\r\nUnlimited website hosting\r\nUnlimited cloud storage\r\nUnlimited video hosting\r\nUnlimited funnel creation\r\nFree SSL certificates for all domains and files\r\n99.999% uptime guarantee\r\n24/7 customer support\r\nEasy-to-use cPanel\r\n365-day money-back guarantee\r\n\r\nPlus, get these exclusive bonuses when you act now:\r\n\r\n60+ reseller licenses (sell hosting to your clients!)\r\n10 Fast-Action Bonuses worth over $19,997 (including AI tools, traffic generation, and more!)\r\n\r\nDon\'t miss out on this limited-time offer! The price is about to increase, and this one-time fee won\'t last forever.\r\n\r\nClick here to learn more: https://furtherinfo.org/yarx\r\n\r\nShella', 1, '2024-05-27 18:56:30', '2024-05-27 18:56:30'),
(29, NULL, 'Garfield Luis', 'luis.garfield@hotmail.com', '3195088621', 'Rua Professor Costa Chiabi 1311', 'Hi there,\r\n\r\nI recently came across your website on alifinefoods.com and found it very interesting. I was curious, have you ever considered creating an eBook out of your website content?\r\n\r\nThere are tools available, that allow you to easily convert website content into a well-designed eBook. This could be a great way to repurpose your existing content and potentially reach a new audience.\r\n\r\nOf course, I understand this might not be something you\'re interested in, but I just wanted to share the possibility!\r\n\r\nAnyway, here is the tool I had in mind. It\'s only $16.95 so worth checking out: \r\nhttps://furtherinfo.org/lgb7\r\n\r\nBest regards,\r\nGarfield\r\n\r\nUnsubscribe: https://removeme.click/wp/unsubscribe.php?d=alifinefoods.com', 1, '2024-05-27 22:35:50', '2024-05-27 22:35:50'),
(30, NULL, 'CompanyRegistar.com', 'florence.copland@gmail.com', '489736681', 'Bessenveldstraat 183', 'Hello\r\n\r\nThis will greatly impact your page rank, the more directories your company is listed \r\n\r\nin, locally or globally, the more back links you have and the better you rank in Yahoo - Bing - Google.\r\n\r\nNever has it been easier to promote your site\r\n\r\nJust a few inputs and our software willl do the rest. No more fretting about email \r\n\r\nverification - CAPTCHAs or manual link building.\r\n\r\nWe have automed all that we possibly could to make submitting your domain a \r\n\r\nbreeze.\r\n\r\nSee your online property on the first page.\r\n\r\nWe will submit your website to thousands of directories and give you a full \r\n\r\nreport on the status of each registry. Although we have created an automated system to \r\n\r\na large extent, some of the submissions may require manual action which could cause a slight \r\n\r\ndelay.\r\n\r\nMaking your life easier\r\n\r\nCompanyRegistar.com', 1, '2024-05-31 14:16:27', '2024-05-31 14:16:27'),
(31, NULL, 'Emily Jones', 'emilyjones2250@gmail.com', '341410180', 'Fugger Strasse 88', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nEmily', 1, '2024-05-31 16:56:55', '2024-05-31 16:56:55'),
(32, NULL, 'Ceciliakayah', 'vcehtbazb@farironalds.com', '84972453299', 'https://getb8.us/', 'Don\'t wait any longer to experience the thrill of online slots. Join our <a href=https://usacasinohub.com/slots/>slots online no deposit bonus</a> today and embark on an adventure filled with fun, excitement, and endless opportunities to win. With our wide selection of games, generous bonuses, and secure environment, there\'s no better place to play. Sign up now and start spinning the reels for your chance to hit the jackpot!', 1, '2024-06-01 22:33:06', '2024-06-01 22:33:06'),
(33, NULL, 'Meganslova', 'bzzuoocha@farironalds.com', '83334656143', 'https://usacasinohub.com/', 'Playing at our online casino offers endless entertainment and the chance to win big. With a vast selection of games, exciting bonuses, and a secure environment, there\'s no better place to enjoy the thrill of casino gaming. Join us today and experience the ultimate online casino adventure. \r\nBy choosing to play online casino games with us, you\'re not only opting for fun and excitement but also for a safe and rewarding gaming experience. Don\'t wait any longer – dive into the world of <a href=https://usacasinohub.com/reviews/>casino online bonus</a> and start your journey to success now.', 1, '2024-06-01 22:33:10', '2024-06-01 22:33:10'),
(34, NULL, 'JeanineGooge', 'xoogpgssp@farironalds.com', '89576516623', 'https://usacasinohub.com/', 'Ready to experience the excitement of video poker? Join our <a href=https://usacasinohub.com/video-poker/>poker online free no money</a> and start playing today. Whether you’re a novice or a seasoned poker player, our video poker games offer something for everyone. Embrace the challenge, apply your strategy, and enjoy the thrill of winning.', 1, '2024-06-02 22:47:28', '2024-06-02 22:47:28'),
(35, NULL, 'Search Engine Index', 'submissions@searchindex.site', '4506191825', '906 Rue St-Henri', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://www.domainsubmit1.pro', 1, '2024-06-05 07:06:18', '2024-06-05 07:06:18'),
(36, NULL, 'Pillsalcop', 'iunskiygipertonik@gmail.com', '87934188969', 'https://true-pill.top/', 'Erectile dysfunction treatments available online from TruePills. \r\nDiscreet, next day delivery and lowest price guarantee. \r\n \r\nViagra is a well-known, branded and common erectile dysfunction (ED) treatment for men. \r\nIt\'s available through our Online TruePills service. \r\n \r\nTrial ED Pack consists of the following ED drugs: \r\n \r\nViagra Active Ingredient: Sildenafil 100mg 5 pills \r\nCialis 20mg 5 pills \r\nLevitra 20mg 5 pills \r\n \r\nhttps://true-pill.top/ \r\n \r\nPresonil\r\nXoprin\r\nTavex\r\nTrizole', 1, '2024-06-06 16:02:55', '2024-06-06 16:02:55'),
(37, NULL, 'Pillsalcop', 'iunskiygipertonik@gmail.com', '86583499832', 'https://true-pill.top/', 'Erectile dysfunction treatments available online from TruePills. \r\nDiscreet, next day delivery and lowest price guarantee. \r\n \r\nViagra is a well-known, branded and common erectile dysfunction (ED) treatment for men. \r\nIt\'s available through our Online TruePills service. \r\n \r\nTrial ED Pack consists of the following ED drugs: \r\n \r\nViagra Active Ingredient: Sildenafil 100mg 5 pills \r\nCialis 20mg 5 pills \r\nLevitra 20mg 5 pills \r\n \r\nhttps://true-pill.top/ \r\n \r\nPresonil\r\nXoprin\r\nTavex\r\nTrizole', 1, '2024-06-06 16:02:59', '2024-06-06 16:02:59'),
(38, NULL, 'Pillsalcop', 'iunskiygipertonik@gmail.com', '84124417737', 'https://true-pill.top/', 'Erectile dysfunction treatments available online from TruePills. \r\nDiscreet, next day delivery and lowest price guarantee. \r\n \r\nViagra is a well-known, branded and common erectile dysfunction (ED) treatment for men. \r\nIt\'s available through our Online TruePills service. \r\n \r\nTrial ED Pack consists of the following ED drugs: \r\n \r\nViagra Active Ingredient: Sildenafil 100mg 5 pills \r\nCialis 20mg 5 pills \r\nLevitra 20mg 5 pills \r\n \r\nhttps://true-pill.top/ \r\n \r\nPresonil\r\nXoprin\r\nTavex\r\nTrizole', 1, '2024-06-06 16:03:04', '2024-06-06 16:03:04'),
(39, NULL, 'Pillsalcop', 'iunskiygipertonik@gmail.com', '82788368158', 'https://true-pill.top/', 'Erectile dysfunction treatments available online from TruePills. \r\nDiscreet, next day delivery and lowest price guarantee. \r\n \r\nViagra is a well-known, branded and common erectile dysfunction (ED) treatment for men. \r\nIt\'s available through our Online TruePills service. \r\n \r\nTrial ED Pack consists of the following ED drugs: \r\n \r\nViagra Active Ingredient: Sildenafil 100mg 5 pills \r\nCialis 20mg 5 pills \r\nLevitra 20mg 5 pills \r\n \r\nhttps://true-pill.top/ \r\n \r\nPresonil\r\nXoprin\r\nTavex\r\nTrizole', 1, '2024-06-06 16:03:09', '2024-06-06 16:03:09'),
(40, NULL, 'Pillsalcop', 'iunskiygipertonik@gmail.com', '82277749566', 'https://true-pill.top/', 'Erectile dysfunction treatments available online from TruePills. \r\nDiscreet, next day delivery and lowest price guarantee. \r\n \r\nViagra is a well-known, branded and common erectile dysfunction (ED) treatment for men. \r\nIt\'s available through our Online TruePills service. \r\n \r\nTrial ED Pack consists of the following ED drugs: \r\n \r\nViagra Active Ingredient: Sildenafil 100mg 5 pills \r\nCialis 20mg 5 pills \r\nLevitra 20mg 5 pills \r\n \r\nhttps://true-pill.top/ \r\n \r\nPresonil\r\nXoprin\r\nTavex\r\nTrizole', 1, '2024-06-06 16:03:14', '2024-06-06 16:03:14'),
(41, NULL, 'Nina', 'sales@consistentair.com', '267516633', 'The Channon', 'Hello,\r\n\r\nIf you are one of the sufferers of the common problems nails have, then you are in luck! Our Toenail Clippers is here to help. It has a specially designed clip that can help those with troubles with winding nails, hard nails, two nails, nail cracks, deep nails, and thickened nails.\r\n\r\nWe are confident that our Toenail Clippers will provide you with the results you are looking for.\r\n\r\nGet yours today with 60% OFF: https://podiatristusa.sale\r\n\r\nKind Regards,\r\n\r\nNina', 1, '2024-06-09 14:11:43', '2024-06-09 14:11:43'),
(42, NULL, 'Edmundo Fierro', 'fierro.edmundo@outlook.com', '4898050', 'Tungata 94', 'Hi,\r\n\r\nDo you want to create engaging quiz videos that drive traffic, followers, and sales in MINUTES?\r\n\r\nTubeTrivia AI uses powerful AI to quickly turn a single keyword into hundreds of addictive quiz videos - perfect for YouTube, Instagram and TikTok to gain loads more followers.\r\n\r\nHere\'s what you get:\r\n\r\n1. AI-Powered Quiz Creation: Enter a keyword, our AI does the rest!\r\n2. Proven Traffic Booster: See results fast with our \"3E Formula\" for viral success.\r\n3. Beginner-Friendly: No skills needed, just point and click!\r\n4. Free Commercial License (Limited Time): Resell videos for high profits!\r\n5. Massive Traffic & Commissions: Real results for us and our clients!\r\n\r\nClick here to learn more and start creating viral quizzes today:  https://furtherinfo.org/trivia\r\n\r\nSee you on the other side,\r\n\r\nEdmundo', 1, '2024-06-09 20:57:49', '2024-06-09 20:57:49'),
(43, NULL, 'Eileen Gutman', 'eileen.gutman85@googlemail.com', '473144951', 'Ringlaan 279', 'Hi,\r\n\r\nThis is crazy, we are building mobile Apps for $50.\r\n\r\nGet your iOS and Android App!\r\n\r\nWhy are we doing this? Well, we are building a lot for cheap.\r\n\r\nVisit us PCXLeads.com', 1, '2024-06-11 11:50:29', '2024-06-11 11:50:29'),
(44, NULL, 'plumber_yhKa', 'atcufuncbid1974@morozfs.store', '85249541984', 'https://plumbersan-joseca4.com/', '24/7. \r\nЛучшие решения для вашей сантехники в Сан-Хосе. \r\nНадежные сантехники в Сан-Хосе. \r\nПомощь сантехника в Сан-Хосе. \r\nСпециальные цены на услуги сантехников в Сан-Хосе. \r\nЛучшие сантехники для дома в Сан-Хосе. \r\nРешение проблем с сантехникой в Сан-Хосе. \r\nЭкспертные сантехнические услуги в Сан-Хосе. \r\nВызов сантехника в Сан-Хосе. \r\nБюджетные решения для вашей сантехники в Сан-Хосе. \r\nplumbing supply san jose ca <a href=https://plumbersan-joseca4.com/>https://plumbersan-joseca4.com/</a> .', 1, '2024-06-12 22:33:46', '2024-06-12 22:33:46'),
(45, NULL, 'Emily Jones', 'emilyjones2250@gmail.com', '40503089', 'Fasanenstrasse 29', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\nWe go beyond just subscriber numbers. We focus on attracting viewers genuinely interested in your niche, leading to long-term engagement with your content. Our approach leverages optimization, community building, and content promotion for sustainable growth, not quick fixes. Additionally, a dedicated team analyzes your channel and creates a personalized plan to unlock your full potential, all without relying on bots.\r\n\r\nOur packages start from just $60 (USD) per month.\r\n\r\nWould this be of interest?\r\n\r\nKind Regards,\r\nEmily\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=alifinefoods.com', 1, '2024-06-13 05:59:56', '2024-06-13 05:59:56'),
(46, NULL, 'Neville Priest', 'neville.priest@gmail.com', '425789323', '12 Rue De Strasbourg', 'Struggling with SEO?\r\n\r\nOur AI tool helps to get your website on top of Google, Yahoo & Bing.\r\n\r\n1. Build with voice commands (no coding!)\r\n2. AI-powered content & SEO ranking\r\n3. Secure your website\r\n\r\nLimited time offer: $17 (normally $97)\r\n\r\nClick here: https://furtherinfo.org/6yac\r\n\r\nThanks,\r\nNeville', 1, '2024-06-15 07:09:23', '2024-06-15 07:09:23'),
(47, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', '249160760', '48 Aquatic Road', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', 1, '2024-06-16 05:39:13', '2024-06-16 05:39:13'),
(48, NULL, 'Wendy', 'wendy@alifinefoods.com', '278439429', 'Roumaz', 'Good Morning \r\n\r\nThe New Powerful LED Flashlight is The Perfect Flashlight For Any Situation!\r\n\r\nThe 3,000 Lumens & Adjustable Zoom gives you the wide field of view and brightness other flashlights don’t have.\r\n\r\n50% OFF + Free Shipping!  Get it Now: https://linterna.cc\r\n\r\nRegards, \r\n\r\nWendy', 1, '2024-06-22 05:48:40', '2024-06-22 05:48:40'),
(49, NULL, 'Charles S.', 'pat@aneesho.com', '8102440753', '20 COOPER SQUARE', 'Do you need help with graphic design - brochures, banners, flyers, advertisements, social media posts, logos etc.?\r\n\r\nWe charge a low fixed monthly fee. Let me know if you\'re interested and would like to see our portfolio.', 1, '2024-06-27 06:06:59', '2024-06-27 06:06:59'),
(50, NULL, 'Johan Fourie', 'johan@pcxgroup.com', '7029422781', '67 Town Lane', 'Hello alifinefoods.com\r\n\r\nWe noticed your website alifinefoods.com doesn\'t have a Mobile App for iOS and Android.\r\n\r\nWe are building Android and iOS Apps for $99 each a combo deal of $149 for both\r\n\r\nYou can get a free preview on PCXLeads or email us back and we will send you a mockup for your apps.\r\n\r\nThis promo is valid till end of June 2024.\r\n\r\nRegards,\r\nPCXLeads', 1, '2024-06-27 10:35:21', '2024-06-27 10:35:21'),
(51, NULL, 'Charles S.', 'pat@aneesho.com', '8102440753', '20 COOPER SQUARE', 'Do you need help with graphic design - brochures, banners, flyers, advertisements, social media posts, logos etc.?\r\n\r\nWe charge a low fixed monthly fee. Let me know if you\'re interested and would like to see our portfolio.', 1, '2024-06-28 03:54:30', '2024-06-28 03:54:30'),
(52, NULL, 'Charles S.', 'pat@aneesho.com', '8102440753', '20 COOPER SQUARE', 'Do you need help with graphic design - brochures, banners, flyers, advertisements, social media posts, logos etc.?\r\n\r\nWe charge a low fixed monthly fee. Let me know if you\'re interested and would like to see our portfolio.', 1, '2024-06-28 03:54:30', '2024-06-28 03:54:30'),
(53, NULL, 'Charles S.', 'pat@aneesho.com', '8102440753', '20 COOPER SQUARE', 'Do you need help with graphic design - brochures, banners, flyers, advertisements, social media posts, logos etc.?\r\n\r\nWe charge a low fixed monthly fee. Let me know if you\'re interested and would like to see our portfolio.', 1, '2024-06-28 04:00:31', '2024-06-28 04:00:31'),
(54, NULL, 'Selene Seekamp', 'seekamp.selene@yahoo.com', '497793516', 'Rue Du Cornet 322', 'Want Free business data?\r\n\r\nUsage:\r\n\r\nhttps://leadsbox.biz?query=YourQuery\r\n\r\n(Lawyers in New york for example)\r\n\r\n71 Million business records in 202 countries\r\n\r\nUpdated Daily\r\n\r\nCompany Name\r\ncountryCode\r\ncountryName\r\nstate\r\ncounty\r\ncity\r\nstreet\r\npostalCode\r\nbuilding\r\nlat\r\nlng\r\nCategory\r\nSecondary Category\r\nPersonal contacts\r\nPhones\r\nFax\r\nEmails\r\nReviews\r\nopening hours\r\n\r\nand more\r\n\r\nLeadsBox.biz', 1, '2024-06-28 15:39:24', '2024-06-28 15:39:24'),
(55, NULL, 'Meganslova', '84xrumer1@farironalds.com', '81714651548', 'https://usacasinohub.com/', 'Playing at our online casino offers endless entertainment and the chance to win big. With a vast selection of games, exciting bonuses, and a secure environment, there\'s no better place to enjoy the thrill of casino gaming. Join us today and experience the ultimate online casino adventure. \r\nBy choosing to play online casino games with us, you\'re not only opting for fun and excitement but also for a safe and rewarding gaming experience. Don\'t wait any longer – dive into the world of <a href=https://usacasinohub.com/reviews/>casino online confiavel</a> and start your journey to success now.', 1, '2024-06-28 20:53:08', '2024-06-28 20:53:08'),
(56, NULL, 'Caroljob', 'salo@farironalds.com', '83734699611', 'https://usacasinohub.com/', 'Don\'t wait any longer to experience the thrill of online slots. Join our <a href=https://usacasinohub.com/slots/>real cash casino slots online</a> today and embark on an adventure filled with fun, excitement, and endless opportunities to win. With our wide selection of games, generous bonuses, and secure environment, there\'s no better place to play. Sign up now and start spinning the reels for your chance to hit the jackpot!', 1, '2024-06-28 22:48:22', '2024-06-28 22:48:22'),
(57, NULL, 'DarleneCoels', '34xrumer1@farironalds.com', '85117763532', 'https://usacasinohub.com/', 'Step into the thrilling world of <a href=https://usacasinohub.com/slots/>live dealer blackjack offers</a>, where every card you draw could be the key to victory! Whether you\'re a seasoned player or a newcomer, our online blackjack tables offer endless excitement and the chance to master your skills. Join us now and experience the ultimate blackjack adventure!', 1, '2024-06-30 14:26:48', '2024-06-30 14:26:48'),
(58, NULL, 'Meganslova', '84xrumer2@farironalds.com', '81293989189', 'https://usacasinohub.com/', 'Blackjack is not just a game of luck; it\'s a thrilling challenge that can be mastered with the right strategy. Imagine the excitement of hitting 21 and beating the dealer with confidence. Whether you\'re a novice or an experienced player, learning <a href=https://usacasinohub.com/blackjack/>blackjack pizza</a> can transform your gaming experience and lead to significant wins. Don\'t miss out on the opportunity to improve your skills and enjoy the rewards. Start playing blackjack today and take the first step towards becoming a pro!', 1, '2024-06-30 14:35:15', '2024-06-30 14:35:15'),
(59, NULL, 'Laurieguamy', '20xrumer1@farironalds.com', '81956171544', 'https://usacasinohub.com/', 'Ready to experience the excitement of video poker? Join our <a href=https://usacasinohub.com/video-poker/>video poker online real money</a> and start playing today. Whether you’re a novice or a seasoned poker player, our video poker games offer something for everyone. Embrace the challenge, apply your strategy, and enjoy the thrill of winning.', 1, '2024-06-30 17:17:41', '2024-06-30 17:17:41'),
(60, NULL, 'Emily Jones', 'emilyjones2250@gmail.com', '894860673', '23 Ranworth Road', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nEmily\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=alifinefoods.com', 1, '2024-07-01 23:36:08', '2024-07-01 23:36:08'),
(61, NULL, 'Melisalex', '34xrumer2@farironalds.com', '81784549475', 'https://usacasinohub.com/', 'Step into the thrilling world of <a href=https://usacasinohub.com/roulette/>online blackjack tables</a>, where every card you draw could be the key to victory! Whether you\'re a seasoned player or a newcomer, our online blackjack tables offer endless excitement and the chance to master your skills. Join us now and experience the ultimate blackjack adventure!', 1, '2024-07-02 20:45:06', '2024-07-02 20:45:06'),
(62, NULL, 'SylviaUnags', '20xrumer2@farironalds.com', '86723515258', 'https://usacasinohub.com/', 'Roulette is more than just a game of chance; it\'s a captivating experience that offers endless possibilities. Imagine the rush of placing your bet on red or black and watching the wheel spin in anticipation. Whether you\'re a beginner or a seasoned player, roulette promises excitement and the chance to win big. Embrace the challenge, learn the strategies, and enjoy the thrill of this iconic casino game. Start your journey with <a href=https://usacasinohub.com/roulette/>online roulette casinos</a> today and let the excitement of the wheel propel you towards unforgettable wins!', 1, '2024-07-03 21:28:15', '2024-07-03 21:28:15'),
(63, NULL, 'Kellye Trudel', 'trudel.kellye15@gmail.com', '6995312077', 'Haid 41', 'Hey,\r\n\r\nDo you need data for marketing purposes, seeking new employment, seeking suppliers or other companies to do business with?\r\n\r\nWe have 25 million active companies across all 200 countries in an excel sheet available for you for $1 once off today.\r\n\r\nCome look at our samples!\r\n\r\nhttps://marketingbox.biz/', 1, '2024-07-05 13:22:55', '2024-07-05 13:22:55'),
(64, NULL, 'CompanyRegistar.org', 'kirby.kai@gmail.com', '7719295491', '15 Malcolm Rd', 'Hi \r\n\r\nI see your site is only listed in 9 out of 2421 directories\r\n\r\nThis will severely impact your page rank, the more directories your company is listed in, locally or globally, the greater your back links you have and the higher you rank in Yahoo, Bing, Google. \r\n\r\nNever has it been simpler to promote your website alifinefoods.com\r\n\r\nJust a few inputs and our system willl do the rest. \r\n\r\nNo more worries about email verification, manual link building or CAPTCHAs.\r\n\r\nWeve automed all that we could have to make submitting your domain a breeze.\r\n\r\nSee your site on the first page.\r\n\r\nWe will register your online property to numerous directories and give you a detailed report on the status of each listing. Although we have automated the submission process to a large extent, some of the registries may require manual approval which could cause a slight delay. \r\n\r\nMaking your life easier \r\n\r\nhttps://CompanyRegistar.org', 1, '2024-07-09 13:58:33', '2024-07-09 13:58:33'),
(65, NULL, 'Jonathon Hearn', 'hearn.jonathon@yahoo.com', '653615731', 'Kalverringdijk 4', 'Hi there,\r\n\r\nAre you tired of paying monthly fees for website hosting, cloud storage, and funnels?\r\n\r\nWe offer a revolutionary solution: host unlimited websites, files, and videos for a single, low one-time fee. No more monthly payments.\r\n\r\nHere\'s what you get:\r\n\r\nUltra-fast hosting powered by Intel® Xeon® CPU technology\r\nUnlimited website hosting\r\nUnlimited cloud storage\r\nUnlimited video hosting\r\nUnlimited funnel creation\r\nFree SSL certificates for all domains and files\r\n99.999% uptime guarantee\r\n24/7 customer support\r\nEasy-to-use cPanel\r\n365-day money-back guarantee\r\n\r\nPlus, get these exclusive bonuses when you act now:\r\n\r\n60+ reseller licenses (sell hosting to your clients!)\r\n10 Fast-Action Bonuses worth over $19,997 (including AI tools, traffic generation, and more!)\r\n\r\nDon\'t miss out on this limited-time offer! The price is about to increase, and this one-time fee won\'t last forever.\r\n\r\nClick here to learn more: https://furtherinfo.org/yarx\r\n\r\nJonathon\r\n\r\nIf you do not wish to receive any further offers:\r\nhttps://removeme.click/wp/unsubscribe.php?d=alifinefoods.com', 1, '2024-07-12 04:39:04', '2024-07-12 04:39:04'),
(66, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', '261060455', '83 Faunce Crescent', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.click/ev/unsubscribe.php?d=alifinefoods.com', 1, '2024-07-12 14:43:11', '2024-07-12 14:43:11'),
(67, NULL, 'comajumper', 'ask@supaface.com', '85244441454', 'https://t.me/catizenbot/gameapp?startapp=r_752_15277420', 'Fed up with wasting time online? Transform your attention into earnings with Notcoin! It\'s that simple. Start now: https://ulvis.net/SDC3', 1, '2024-07-13 05:42:23', '2024-07-13 05:42:23'),
(68, NULL, 'Gregorio Bertie', 'gregorio.bertie@outlook.com', '7873523844', '76 Shannon Way', 'Hello,\r\n\r\nIt is with sad regret that after 12 years, LeadsMax.biz is shutting down.\r\n\r\nWe have made all our databases available on our website.\r\n\r\n25 Million companies\r\n527 Million People\r\n\r\nLeadsMax.biz', 1, '2024-07-15 14:12:08', '2024-07-15 14:12:08'),
(69, NULL, 'Gia Scala', 'vinhgrowth@gmail.com', '419735544', 'Via Stazione 79', 'Hi! We run an Instagram growth service, which increases your number of followers both safety\r\n\r\n- Guaranteed: We guarantee to gain you 400-1200+ followers per month\r\n- Real human followers: People follow you because they are interested in your business or niche\r\n- Safe: All actions are made manually. We do not use any bots.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately. If you are interested and would like to see some of our previous work, let me know and we can discuss further.\r\n\r\nPlease visit our homepage for more details : https://vinhgrowth.com\r\n\r\nKind Regards,\r\n\r\nGIA.\r\n\r\nTo Unsubscribe, reply with the word unsubscribe in the subject.', 1, '2024-07-24 14:09:36', '2024-07-24 14:09:36'),
(70, NULL, 'Jeff Minaya', 'jeff.minaya@gmail.com', '0941-5986871', 'Sorasele 36', 'Unlock the power of magic with Extreme Spells! Whether you\'re seeking true love, financial success, or happiness, our experienced Circle of Eight, led by Master Sam Taylor and Psychic Master Lennox, is here to transform your life. Since 1993, we\'ve been casting potent spells tailored to your unique needs, helping countless individuals achieve their dreams.\r\n\r\nDiscover spells to attract your perfect mate, rekindle lost love, draw wealth, and much more. Our spells are safe, effective, and backed by a 100% satisfaction guarantee. Plus, we offer free health spells to those in need because we believe in making positive changes accessible to everyone.\r\n\r\nDon\'t let life\'s challenges hold you back. Embrace the mystical power of Extreme Spells and take control of your destiny today. Visit https://extremespells.com/ to learn more and start your magical journey. Transform your life with the proven power of spell casting!\r\n\r\nAct Now! Click here to unlock love, wealth, and happiness with Extreme Spells. Your dream life is just a spell away!', 1, '2024-07-26 07:22:15', '2024-07-26 07:22:15'),
(71, NULL, 'LeadsMax.biz', 'streit.michael@hotmail.com', '3526637139', 'Via Matteo Schilizzi 93', 'Hello from LeadsMax.biz!!\r\n\r\nWe are shutting down and have made all our data available for all the countries!\r\n\r\nCome check us out and search your business and consumer data for free\r\n\r\nLeadsMax.biz', 1, '2024-07-26 22:04:37', '2024-07-26 22:04:37'),
(72, NULL, 'Fabien Keech', 'morrismi1@outlook.com', '403-585-9922', '669 Maynard Rd', 'Hi there!\r\n\r\nAre you looking to maximize the impact of your YouTube videos? Introducing YTCopyCat, our innovative SaaS tool that converts your YouTube videos into various high-quality written content using advanced AI.\r\nWhat Can Our Tool Do for You?\r\n\r\n    Blog Articles: Turn your videos into blog posts.\r\n    Newsletters: Generate captivating newsletters effortlessly.\r\n    Video Summaries: Create concise summaries.\r\n    Tweets: Produce engaging tweets.\r\n    Custom Content: Use personalized prompts for specific needs.\r\n\r\nHow It Works:\r\n\r\n    Paste your YouTube video link.\r\n    Our AI analyzes and extracts key content.\r\n    Choose your desired format.\r\n\r\nIn just a few clicks, you’ll have top-notch content ready to publish or share. Save time and boost productivity with automated content creation.\r\nWhy Choose YTCopyCat?\r\n\r\n    Time-Saving: Automate your content creation.\r\n    Versatile: Generate multiple content types from one video.\r\n    High Quality: Enjoy superior content with advanced AI.\r\n\r\nSpecial Offer:\r\n\r\nTry YTCopyCat for free and revolutionize your content strategy. Visit https://ytcopycat.com to learn more and start your free trial today. Don’t miss this chance to enhance your content creation!\r\n\r\nCheers,\r\nFabien\r\ncontact@ytcopycat.com', 1, '2024-08-01 18:08:21', '2024-08-01 18:08:21'),
(73, NULL, 'Amelia Brown', 'ameliabrown12784@gmail.com', '6746839928', 'Brandenburgische Str 46', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nAmelia\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=alifinefoods.com', 1, '2024-08-01 21:28:26', '2024-08-01 21:28:26'),
(74, NULL, 'Kasey McKelvey', 'mckelvey.kasey@outlook.com', '666547394', 'Ul. Garczynskiego Jozefa 62', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com', 1, '2024-08-08 17:46:01', '2024-08-08 17:46:01');
INSERT INTO `client_messages` (`id`, `product_id`, `name`, `email`, `phone`, `address`, `message`, `status`, `created_at`, `updated_at`) VALUES
(75, NULL, 'Mason Sandes', 'sandes.mason1@outlook.com', '334002892', '5 Rue De La Republique', 'Hi,\r\n\r\nI hope you’re doing well!\r\n\r\nIn today’s fast-paced digital world, capturing your audience’s attention is more challenging than ever. That’s why I wanted to share with you an innovative solution that can elevate your content strategy—VidBooks AI.\r\n\r\nVidBooks AI is a cutting-edge tool that transforms your written content into engaging, dynamic video books. Imagine taking your blogs, articles, or eBooks and turning them into visually stunning video content in just minutes! It’s the perfect way to stand out and connect with your audience on a deeper level.\r\n\r\nWith VidBooks AI, you can:\r\n\r\n- Convert text into video content quickly and easily\r\n- Enhance your brand’s visibility with interactive videos\r\n- Increase engagement and retention with visually appealing content\r\n- Save time and resources with AI-powered automation\r\n\r\nDon’t miss out on this opportunity to revolutionize the way you present your content.\r\n\r\nTo learn more about how VidBooks AI can help you captivate your audience like never before: https://furtherinfo.org/ike0 \r\n\r\nBest regards,\r\nMason', 1, '2024-08-11 03:30:45', '2024-08-11 03:30:45'),
(76, NULL, 'Imogen Maki', 'imogen.maki@googlemail.com', '6614144008', '1906 Lowndes Hill Park Road', 'Hey,\r\n\r\nIt is with sad regret to inform you that PCXLeads.com is shutting down.\r\n\r\nWe have made our databases available across all the countries, B2B and B2C Data.\r\n\r\nVisit us on PCXLeads.com and try out our databases.', 1, '2024-08-12 19:52:11', '2024-08-12 19:52:11'),
(77, NULL, 'Amelia Brown', 'ameliabrown12784@gmail.com', '7813285293', '37 Nith Street', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\nWe go beyond just subscriber numbers. We focus on attracting viewers genuinely interested in your niche, leading to long-term engagement with your content. Our approach leverages optimization, community building, and content promotion for sustainable growth, not quick fixes. Additionally, a dedicated team analyzes your channel and creates a personalized plan to unlock your full potential, all without relying on bots.\r\n\r\nOur packages start from just $60 (USD) per month.\r\n\r\nWould this be of interest?\r\n\r\nKind Regards,\r\nAmelia', 1, '2024-08-13 09:40:30', '2024-08-13 09:40:30'),
(78, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', '3592478113', 'Via Degli Aldobrandeschi 16', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', 1, '2024-08-15 07:35:52', '2024-08-15 07:35:52'),
(79, NULL, 'Meet women who want to date youвЂ”sign up now - http://xurl.es/n6mvn', 'puschjens@web.de', '86756748859', 'Meet women who want to date youвЂ”sign up now - http://xurl.es/n6mvn', 'Meet singles who are ready for a real relationship - http://xurl.es/0ur6m', 1, '2024-08-17 06:29:17', '2024-08-17 06:29:17'),
(80, NULL, 'Chantal Wainscott', 'chantal.wainscott@googlemail.com', '425059900', '84 Boulevard De Prague', 'Advantages of hiring a Developer:\r\n\r\nSpecialized Expertise\r\nTailored Customization and Control\r\nTime and Cost Efficiency\r\nCustom Plugin Development\r\nSEO Optimization\r\nOngoing Support and Maintenance\r\nSeamless Integration and Migration\r\nScalability for Business Growth\r\n\r\nHire a web developer now from us. Contact us at https://wpexpertspro.co/website/?site=alifinefoods.com', 1, '2024-08-22 19:28:59', '2024-08-22 19:28:59'),
(81, NULL, 'Terri Ellis', 'terri.ellis@gmail.com', '04.23.96.80.42', '63 Rue Du Limas', 'Is your business struggling to find a reliable payment processing solution? Do you deal with high-risk transactions but face constant roadblocks from traditional processors?\r\n\r\nWorldinpay.com is here to help. We provide secure card processing solutions for high-risk businesses worldwide.\r\n\r\nHere\'s what sets us apart:\r\n\r\nGlobal Expertise: We handle transactions across the globe, understanding the unique challenges of high-risk industries.\r\nSeamless Integration: Integrate our processing solution quickly and easily into your existing platform.\r\nInstant Payouts: Get your funds faster with our efficient payout system.\r\nEnhanced Security: Enjoy industry-leading security measures to protect your business and customers.\r\nDedicated Support: Our team is here to answer your questions and provide ongoing support.\r\nDon\'t let payment processing hold your business back.\r\n\r\nContact Worldinpay today !!!\r\n\r\nVisit our website: https://worldinpay.com/\r\n\r\nSincerely,\r\nThe Worldinpay Team\r\nhttps://worldinpay.com/', 1, '2024-09-06 06:40:29', '2024-09-06 06:40:29'),
(82, NULL, 'Oman Dubin', 'dubin.hermelinda@outlook.com', '05.35.62.27.85', '38 Rue Clement Marot', 'Hello,\r\n\r\nAt Cateus Investment Company (CIC), we understand that securing the right funding is crucial for both startups and established businesses. That\'s why we offer flexible financing solutions designed to meet your specific needs.\r\n\r\nHere’s how we can help:\r\n\r\nDebt Financing: 3% annual interest with zero penalties for early repayment.\r\nEquity Financing: Venture capital support with a 10% equity stake—helping you expand while keeping control.\r\nWe’re ready to explore the best option for your business. Simply send us your pitch deck or executive summary, and let’s discuss the ideal investment structure to fuel your growth.\r\n\r\nLooking forward to hearing from you.\r\n\r\nBest regards,\r\nOman Rook\r\nExecutive Investment Consultant/Director\r\nCateus Investment Company (CIC)\r\nPhone: +973-17-585338 | Email: oman-rook@cateusgroup.org or cateusgroup@gmail.com\r\nhttps://cateusinvestmentgroup.com\r\n\r\n\r\nCateus Investment Group | Home\r\nhttps://cateusinvestmentgroup.com', 1, '2024-09-09 14:03:01', '2024-09-09 14:03:01'),
(83, NULL, 'Emilie Collier', 'emilie.collier@outlook.com', '0470 72 09 68', 'Schietboompleinstraat 267', 'Hey  \r\n\r\nNot sure how much money alifinefoods.com  is making, but selling digital products is on fire.\r\n\r\nThe transaction value in the Digital Commerce market is projected to reach US$7.63 trillion in 2024. (Statistica.)\r\nThere is a simple 2-step method to make money selling high-profit, digital products in less than an hour per day.\r\n\r\nStart leveraging from this growing economy.\r\n\r\nLearn how here:\r\nhttps://hoply.io/Q5QNX', 1, '2024-09-11 04:57:04', '2024-09-11 04:57:04'),
(84, NULL, 'Joanna Riggs', 'joannariggs94@gmail.com', '7938024515', '51 Hull Road', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nWe have produced over 500 videos to date and work with both non-animated and animated formats:\r\n\r\nNon-animated example:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\n\r\nAnimated example:\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=alifinefoods.com', 1, '2024-09-12 19:47:28', '2024-09-12 19:47:28'),
(85, NULL, 'Wendy Liddell', 'wendy.liddell46@gmail.com', '50-68-02-36', 'Sondre Havnekaj 53', 'We are proud to present our latest product for business data\r\n\r\nExperience our searches on worldwide b2b data\r\n\r\nThis offer is a comprehensive dataset of each country\r\n\r\nWhich are all kept up to date on a monthly basis\r\n\r\nTry out the open search we offer to see the full extent of our dataset\r\n\r\nYou can never have enough leads\r\nLeadsBox.biz', 1, '2024-09-18 15:35:26', '2024-09-18 15:35:26'),
(86, NULL, 'Amelia Brown', 'ameliabrown12784@gmail.com', '267913632', '92 Plug Street', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically.\r\n\r\nWhat We Offer:\r\n\r\nGuaranteed Results: We guarantee to deliver between 700 and 1500 new subscribers each month, depending on which package you select.\r\nHigh-Quality Subscribers: Our subscribers are real people who are genuinely interested in your content.\r\nSafe and Ethical Practices: We use only ethical methods and avoid automated bots or spam.\r\n\r\nLimited-Time Trial:\r\n\r\nTo give you a taste of our service, we\'re offering a short trial at no cost.\r\n\r\nAs we limit the number of clients we accept per week, we only have 4 spots left.\r\n\r\nTo Apply:\r\n\r\n1. Share Your Channel Link: Please provide the full URL of your YouTube channel.\r\n2. Contact Information: Let us know your preferred method of communication (WhatsApp, Skype, or Telegram).\r\n3. Ask Questions: Feel free to ask any questions you have about our service.\r\n\r\nKind Regards,\r\nAmelia', 1, '2024-09-21 14:50:13', '2024-09-21 14:50:13'),
(87, NULL, 'Novella Dartnell', 'novella.dartnell@hotmail.com', '1631095881', 'Rua Luiz Antonio Musa Juliao 987', 'Hi there,\r\n\r\nWe’re excited to introduce Mintsuite, the ultimate platform to enhance your online presence and drive results. Mintsuite empowers you to create stunning websites, manage social media like a pro, and generate traffic effortlessly.\r\n\r\nCreate Stunning Websites\r\nManage Social Media Effortlessly\r\nGenerate Unlimited Traffic\r\n\r\nGrab Mintsuite now for just $16 (normally $180)!\r\n\r\nCheck out the amazing features of Mintsuite here: https://furtherinfo.info/mint\r\n\r\nThanks for your time,\r\nNovella', 1, '2024-09-24 17:56:20', '2024-09-24 17:56:20'),
(88, NULL, 'Lukas', 'info@rymill.xbags.shop', '484848841', 'Dave', 'New Multifunction Anti-theft Waterproof Sling Bag\r\n\r\nThe best ever SUPER Sling Bag: Drop-proof/Anti-theft/Scratch-resistant/USB Charging\r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED time\r\n\r\nBuy now: https://xbags.shop\r\n\r\nMany Thanks, \r\n\r\nLukas', 1, '2024-09-27 00:15:13', '2024-09-27 00:15:13'),
(89, NULL, '<strong><a href=\"https://pr-site.com\">primer-1</a></strong>', 'thomaskingial13@gmail.com', '81721753525', '<strong><a href=\"https://pr-site.com\">primer-3</a></strong>', '<strong><a href=\"https://pr-site.com\">primer-8</a></strong>', 1, '2024-09-27 16:36:43', '2024-09-27 16:36:43'),
(90, NULL, 'Patti Eather', 'marketingengine55+alifinefoods.com@gmail.com', '071 564 88 87', 'Gerbiweg 34', 'Hello from LeadsBox.biz\r\n\r\nWe are a premium b2b provider of data for almost 66 countries.\r\n\r\nWe have a special running where we have made all our databases available for each country for $29\r\n\r\n1) Unlimited Updates for a year\r\n2) Data is upated every 24 hours\r\n3) Data is delivered once a month\r\n\r\nYou can get all the companies and their phones, emails, industries, categories in each country!\r\n\r\nThis is perfect for your marketing / recruitment / business research needs!\r\n\r\nCome visit us\r\nLeadsBox.biz', 1, '2024-09-29 14:53:59', '2024-09-29 14:53:59'),
(91, NULL, 'Lottie Thompson', 'lottiethompson218@gmail.com', '883305803', '63 Cowcross St', 'Hey\r\n\r\nWe operate a Facebook service, which increases your number of fans/followers safely and practically.\r\n\r\nThis can be for a page, a group, or an individual profile.\r\n\r\n- 400+ followers per month.\r\n- Real people who follow your page/group/profile because they are interested in what you do (no bots/fakes)\r\n- No automated techniques, everything is safe and manual.\r\n\r\nOur price is just $60 (USD) per month, with no contract.\r\n\r\nWe also offer an introductory trial, so you can see the process yourself first, risk-free.\r\n\r\nIf you are interested, just reply back and we can discuss further.\r\n\r\nKind Regards,\r\nLottie', 1, '2024-10-01 02:47:16', '2024-10-01 02:47:16'),
(92, NULL, 'Andrea Hartfield', 'andrea.hartfield@msn.com', '(07) 3616 4951', '51 Hillsdale Road', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com\r\n\r\nStruggling to rank on Google? Our SEO experts can help. Contact es.olus@gmail.com', 1, '2024-10-04 09:17:08', '2024-10-04 09:17:08'),
(93, NULL, 'Gary Charles', 'gary_charles@dominatingkeywords.com', '8185327032', '275 East Hillcrest Drive 160-169', 'Get thousands of clicks per month from Google, Bing and other search engines with less than $10 per day ad budget.\r\nNo SEO and no PPC.\r\nFlat fee per keyword.\r\nAll I need from you is a list of desired keywords and I\'ll send you traffic quotes and details within 24 hours.\r\nYou can get more information and do online demo on our website.', 1, '2024-10-05 13:59:44', '2024-10-05 13:59:44'),
(94, NULL, 'Gary Charles', 'gary_charles@dominatingkeywords.com', '8185327032', '275 East Hillcrest Drive', 'I am not offering you SEO, nor PPC.\r\nIt\'s something completely different.\r\nJust send me keywords of your interest and I\'ll give you traffic guarantees on each of them.\r\nLet me demonstrate how it works and you will be surprised by the results.', 1, '2024-10-05 14:00:07', '2024-10-05 14:00:07'),
(95, NULL, 'CecilBaw', 'sharonforet1900@microoremail.ru', '85819427189', 'https://dseo24.monster', 'Лучшие базы для Xrumer и GSA Search Engine Ranker по самым лучшим ценам \r\nhttps://dseo24.monster \r\nОнлайн магазин баз для Xrumer и GSA     лучшие цены', 1, '2024-10-10 05:09:32', '2024-10-10 05:09:32'),
(96, NULL, 'Dominik', 'alifinefoods.com@live.com', '275321291', 'Dugny', 'Hi there \r\n \r\nDefrost frozen foods in minutes safely and naturally with our THAW KING™. \r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED \r\n\r\nBuy now: https://thawking.shop\r\n \r\nMany Thanks, \r\n \r\nDominik', 1, '2024-10-11 07:45:01', '2024-10-11 07:45:01'),
(97, NULL, 'Steve Cullen', 'steve@consumerprodemail.com', '724700844', 'Ul. Drewsa Romana 7', 'Hello, I\'m Steve Cullen with Consumer Products International ( https://www.consumerproductsintl.com ).\r\n\r\nAt CPI, we specialize in helping domestic and international consumer brands expand their reach in the US market. With decades of experience and billions in generated revenue, we offer a comprehensive solution for manufacturers looking to enter or grow in America\'s consumer market.\r\n\r\nOur services include:\r\n* Distribution to major retailers (C-Stores, Food/Drug/Mass, Home Centers, Online)\r\n* FDA/Regulatory guidance\r\n* Sales and marketing support (TV, Public Relations Campaigns)\r\n* Warehousing and logistics\r\n\r\nWe pride ourselves on our turnkey approach and ability to quickly bring products to market. Our team\'s expertise and established relationships with national and regional retail chains give your brand a competitive edge.\r\n\r\nTo discuss how we can help your brand succeed in the US market, please contact us or schedule a call at https://calendly.com/stevecullen-nutricompanyinc/15-minute-call-cpi \r\n\r\nBest regards,\r\nSteve Cullen\r\nConsumer Products International', 1, '2024-10-15 16:44:23', '2024-10-15 16:44:23'),
(98, NULL, 'Reta Kroeger', 'reta.kroeger@gmail.com', '7807891304', '241 Pine Street', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50', 1, '2024-10-18 05:02:48', '2024-10-18 05:02:48'),
(99, NULL, 'Barbara Hicks', 'barbarahicks@mail.co.uk', '246790481', '68 Albacore Crescent', 'Hi,\r\n\r\nI\'ve visited alifinefoods.com and was wondering if you would be interested in promoting your site to our audience of up to 30 million? \r\nWe can also leverage our 3.4 million social media followers to boost your visibility.\r\n\r\nWe handle the entire process. We safely deliver your message to millions of potential customers across the globe, or specific countries if you prefer.\r\n\r\nIf this is of interested and you would like more information, get in touch.\r\n\r\nIf you are not interested, simply ignore this email.\r\n\r\nThanks,\r\nBarbara\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=alifinefoods.com', 1, '2024-10-19 11:58:09', '2024-10-19 11:58:09'),
(100, NULL, 'Roembeft', 'benrichard899y@outlook.com', '81446194664', 'https://sites.google.com/view/mystory12?embeft', 'Sick of carrying extra weight? Hereâ€™s a secret thatâ€™s changing lives. This morning ritual is helping people drop pounds, and itâ€™s so fast youâ€™ll start seeing results in no time. Tap now to learn the secret.  https://sites.google.com/view/mystory12?embeft \r\n \r\n \r\nRoembeft', 1, '2024-10-20 21:58:36', '2024-10-20 21:58:36'),
(101, NULL, 'Heidi Barron', 'morrismi1@outlook.com', '675658821', 'Ul. Aldony 65', 'My name is Ahmet. I\'m a bank staff in a Turkish bank. I\'ve been looking for someone who has the same nationality as you. A citizen of your country died in the recent earthquake in Turkey, he had in our bank fixed deposit of $11.5 million. \r\n\r\nMy Bank management is yet to know of his death. If my bank executive finds out about his death ,They would use the funds for themselves and get richer and I would like to prevent that from happening only if I get your cooperation, I knew about it because I was his account manager. Last week my bank management held a meeting for the purpose of a bank audit to note the dormant and abandoned deposit accounts.  I know this will happen and that\'s why I\'m looking for a solution to deal with this situation because if my bank discovers his death, they will divert the funds to the board of directors.  I don\'t want that to happen. \r\n \r\nI request your cooperation to introduce you as the kin/heir of the account as you are of the same nationality as him.  There is no risk;  the transaction is carried out under a legal agreement that protects you from infringement. I suggest we split the funds, 60/40 and 40 for me. I need this fund for my daughter\'s surgery so keep this info confidential. email me so i can provide you with more info  ahmetaksoy1925@outlook.com', 1, '2024-10-22 06:23:53', '2024-10-22 06:23:53'),
(102, 140, 'MAHMOOD', 'russel1214@yahoo.com', '01711540810', '6/5, block e, lalmatia, dhaka', 'price pls with delevery', 1, '2024-10-22 07:21:54', '2024-10-22 07:21:54'),
(103, 140, 'MAHMOOD', 'russel1214@yahoo.com', '01711540810', '6/5, block e, lalmatia, dhaka', 'dear,\r\ni need 2.1 ltr. mayonnaise\r\nprice pls with delevery', 1, '2024-10-22 07:23:49', '2024-10-22 07:23:49'),
(104, NULL, 'Joanna Riggs', 'joannariggs94@gmail.com', '3943803470', 'Via Francesco Girardi 140', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nWe have produced over 500 videos to date and work with both non-animated and animated formats:\r\n\r\nNon-animated example:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\n\r\nAnimated example:\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nLet me know if you\'re interested in learning more and/or have any questions.\r\n\r\nRegards,\r\nJoanna', 1, '2024-10-22 12:19:08', '2024-10-22 12:19:08'),
(105, NULL, 'Roembeft', 'emilyjonesg89@gmail.com', '81615131363', 'https://sites.google.com/view/mystory12?embeft', 'Frustrated with diets that donâ€™t work? A new, powerful morning ritual is melting away fat faster than youâ€™ve ever seen, and itâ€™s so simple, anyone can do it. No crazy diet plans, just real results that delivers. Imagine burning fat without starving yourself. Want to see how? Tap now to find out how it works.  https://sites.google.com/view/mystory12?embeft \r\n \r\n \r\nRoembeft', 1, '2024-10-24 16:44:41', '2024-10-24 16:44:41'),
(106, NULL, 'Amelia Brown', 'ameliabrown12784@gmail.com', '6298300653', 'Grosse Praesidenten Str. 89', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\n The price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia', 1, '2024-10-24 23:05:21', '2024-10-24 23:05:21'),
(107, NULL, 'Valeron83dep', 'romabookim@gmail.com', '84639982844', 'http://secure-casinos.com', 'Hello. \r\nSPECIAL SIGN-UP BONUS вЂ“ Enjoy a 100% Match on your first deposit! REFERRAL BONUS вЂ“ Share the excitement and earn rewards! Register here:  https://spiritredirect.com/d8ee9ac13', 1, '2024-11-02 06:01:49', '2024-11-02 06:01:49'),
(108, NULL, 'Felicity Sauncho', 'felicitysauncho@gmail.com', '438851163', '59 Rue De La Hulotais', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\n The price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nFelicity', 1, '2024-11-05 18:56:04', '2024-11-05 18:56:04'),
(109, NULL, 'Heike', 'info@branch.shiningrose.biz', '646468552', 'Roosendaal', 'Hello there \r\n\r\nLooking for a keepsake that will genuinely captivate? Our Enchanted Shining Rose™ combines beauty and magic in one stunning gift. With its soft glow and iridescent rose adorned with delicate lights, it’s a gift that lights up any room—and any heart.\r\n\r\nGift something unforgettable. Great for birthdays, anniversaries, or any occasion or to simply show you care.\r\n\r\nExclusive Deal: Get 50% off, plus free shipping at https://shiningrose.biz\r\n\r\nKind Regards,\r\n\r\nHeike', 1, '2024-11-09 03:43:44', '2024-11-09 03:43:44'),
(110, NULL, 'Danielraw', 'bthnegdxrbx2fn5@tempmail.us.com', '87647279451', 'https://tomyaccount.com', 'tomyAccount.com provides verified accounts that you can trust. Our accounts are secure, reliable, and instantly available. Visit tomyAccount.com and buy with confidence! \r\n \r\nFind out more: \r\n \r\nhttps://tomyAccount.com \r\n \r\nSincere thanks!', 1, '2024-11-11 16:15:12', '2024-11-11 16:15:12'),
(111, NULL, 'Teena Armbruster', 'teena.armbruster2@yahoo.com', '3458640298', 'Via Nuova Del Campo 81', 'Hi, \r\n\r\nWe noticed your alifinefoods.com isn\'t doing well in its online sales.\r\n\r\nWe build successful shopify sites that generate $10k+ a month!\r\n\r\nCome check us out!\r\n\r\nhttps://Marketingeee.com', 1, '2024-11-12 10:27:54', '2024-11-12 10:27:54'),
(112, NULL, 'Raymondmal', 'raymondBAITSABILT@gmail.com', '86654749444', 'https://www.no-site.com', 'Hey! alifinefoods.com \r\n \r\nDid you know that it is possible to send proposal absolutely legitimate way and allowed? \r\nWhen such commercial offers are sent, no personal data is used and messages are sent to forms specifically designed to receive messages and appeals efficiently. Messages through Feedback Forms are not likely to end up in spam, since they are deemed as essential. \r\nYou can now take advantage of our service free of charge. \r\nWe can dispatch up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis letter is automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', 1, '2024-11-12 12:25:12', '2024-11-12 12:25:12'),
(113, NULL, 'Donny Beak', 'oskaroliver2023@outlook.com', '262413362', 'Mittlerer Thalackerweg 102', 'My name is James Broderick, and I am an attorney at Broderick & Associates LLP based in Canada. I am reaching out to discuss matters concerning your late relative payable on death.\r\n\r\nPlease feel free to contact me at your earliest convenience at the email address provided below for more information regarding their payable on death policy. Trust me it is something worthwhile you would like to hear. \r\n\r\nThank you for your attention to this matter. Contact me through my email to share more information with you about the payable on death.  jamesbroderick62@outlook.com\r\n\r\nBest regards,\r\nJames Broderick', 1, '2024-11-12 14:48:03', '2024-11-12 14:48:03'),
(114, NULL, 'Penney Keefer', 'keefer.penney@gmail.com', '414557832', 'Schulstrasse 130', 'Need a way to get millions of people to check out your site on a budget? Get Info http://v41sbu.contactblastingworks.my', 1, '2024-11-13 14:22:11', '2024-11-13 14:22:11'),
(115, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', '243052198', 'Im Wingert 39', 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service, which we feel can benefit your site alifinefoods.com.\r\n\r\nCheck out a couple of our existing videos here:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nOur prices start from as little as $195 and include a professional\r\nscript and voice-over. We also provide other accents and non-English languages.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to reply.\r\n\r\nKind Regards,\r\nJoanna', 1, '2024-11-14 01:57:10', '2024-11-14 01:57:10'),
(116, NULL, 'Della Coombe', 'coombe.della@gmail.com', '2483140145', '4092 Tennessee Avenue', 'Is alifinefoods.com not making the sales it should? \r\n\r\nSetup your Shopify store before black friday and:\r\n\r\nBe Your Own Boss, you WANT a BUSINESS, not a website only!\r\n\r\nThe BEST VALUE for your money (+17000 happy clients)\r\nWe provide you with LIFETIME SUPPORT\r\n\r\n⭐\r\nWe built stores making $10,000/month \r\nYes, we pick BEST Products For You Too!\r\n\r\nNo sale in 30 days? Get a full refund!\r\n\r\nconvertingstore.myshopify.com', 1, '2024-11-14 14:23:14', '2024-11-14 14:23:14'),
(117, NULL, 'Hester', 'info@zahn.thebackpack.biz', '9266959079', 'Mitwitz', 'New Multifunction Waterproof Backpack\r\n\r\nThe best ever SUPER Backpack: Drop-proof/Scratch-resistant/USB Charging/Large capacity storage\r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED time\r\n\r\nBuy now: https://thebackpack.biz\r\n\r\nTo your success, \r\n\r\nHester', 1, '2024-11-18 06:07:44', '2024-11-18 06:07:44'),
(118, NULL, 'Denchaism', 'cheb.akul.ina.k.a.r.as.evn.a@gmail.com', '89651287139', 'https://true-pill.top/', 'Did you know that you can buy Viagra, Cialis without a prescription? If you’re experiencing erectile dysfunction symptoms you can now order Viagra, Cialis. \r\n \r\nYou can request Viagra online quickly and easily without a previous diagnosis or prescription. \r\n \r\nViagra is the most popular tablet for erectile dysfunction. Viagra helps you get an erection by increasing the blood flow to your penis, starts working within 30 minutes, and is effective for 74% of men. \r\n \r\nAn erectile dysfunction treatment which can be bought without a prescription for men aged 18 and over with erectile dysfunction (ED). The treatment works in 25 minutes and lasts up to 4 hours. \r\n \r\nhttps://cutt.ly/KeJfSjzV', 1, '2024-11-18 07:11:47', '2024-11-18 07:11:47'),
(119, NULL, 'Maximilian Carlisle', 'carlisle.maximilian@yahoo.com', '6818508718', 'Wiehtestrasse 54', 'Hi,\r\n\r\nIf you\'ve fallen victim to an investment scam and lost money, you\'re not alone. Scammers are becoming more sophisticated, but there is hope. Our team specializes in helping individuals like you recover lost funds through legal avenues and professional recovery services.\r\n\r\nDon’t let the scam define your future. Contact us today for a confidential consultation. We’ll guide you step-by-step and work hard to help you reclaim what you’ve lost. Click here www.madacovi.co for more details\r\n\r\nTake action now. You deserve justice and a chance to move forward.\r\n\r\nBest regards,\r\nGerard Williams\r\nMadacovi Limited\r\nhelp@madacovi.co\r\nwww.madacovi.co', 1, '2024-11-22 17:28:28', '2024-11-22 17:28:28'),
(120, NULL, 'Adolph', 'info@primeaux.medicopostura.com', '5018441465', 'Jones Mill', 'Morning \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nBest, \r\n\r\nAdolph', 1, '2024-11-23 13:51:27', '2024-11-23 13:51:27'),
(121, NULL, 'Jane Connelly', 'info@increaseorganictraffic.com', '804-715-1479', 'Ul. Gorna 84', 'Hi alifinefoods.com,\r\n\r\nI would like to discuss SEO!\r\n\r\nI can assist in optimizing your website to reach the first page of Google, thereby increasing the leads and sales generated from your site.\r\n\r\nNote: I\'d be happy to discuss SEO services in greater detail with you; we can work together. Drop your best number to reach.\r\n\r\nThanks,\r\n\r\nBests Regards,\r\nJane Connelly\r\nSr SEO consultant\r\nhttps://www.increaseorganictraffic.com\r\nPh. No: 1-804-715-1479\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', 1, '2024-11-27 07:51:19', '2024-11-27 07:51:19'),
(122, NULL, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '73 Golf Road', 'Affiliate marketers rejoice! Our contact form marketing service delivers your ads to millions of websites without restrictions or platform rules. Pay one flat rate and grow your business on your terms.\r\n\r\nContact me today for more details—my info is listed below.\r\n\r\nRegards,\r\nRandall Haddon\r\nEmail: Randall.Haddon@morebiz.my\r\nWebsite: http://me1aru.form-submission-masters.ink\r\nSkype: marketingwithcontactforms', 1, '2024-11-29 02:53:28', '2024-11-29 02:53:28'),
(123, NULL, 'Maxim Markin', 'markin@polarseafood.ru', '+79151897118', 'Moscow, Russia', 'Dear Colleagues,\r\n\r\nwe are POLAR SEAFOOD RUSSIA, largest manufacturer of seafood, especially Polar northern cold water shrimps, Commodore squid (Berryteuthis magister), COD Fillets and sea culinary, like fish balls, burgers, fingers, croquetts from salmon, shrimps and cod in Russia. We offer  PL OEM manufacturing of fish / shrimp balls under \"Made in Russia\". When you import seafood, could you please advise where we can send our catalogue.\r\n\r\nBest Regards,\r\nMaxim Markin,\r\nExport manager.\r\nPOLAR SEAFOOD RUSSIA\r\nEU approval: RU-040/DH01288\r\nChina approval: CRUS18PP2307280027\r\n42, Warshavskoe shausse, 115230, Moscow, Russia.\r\nEmail: markin@polarseafood.ru\r\nМоb./WhattsAp: +7 915 189 7118\r\nwww.polarseafood.ru\r\nwww.crossfish.ru', 1, '2024-11-29 09:41:04', '2024-11-29 09:41:04'),
(124, NULL, 'Maxim Markin', 'markin@polarseafood.ru', '+79151897118', 'Moscow, Russia', 'Dear Colleagues,\r\n\r\nwe are POLAR SEAFOOD RUSSIA, largest manufacturer of seafood, especially Polar northern cold water shrimps, Commodore squid (Berryteuthis magister), COD Fillets and sea culinary, like fish balls, burgers, fingers, croquetts from salmon, shrimps and cod in Russia. We offer  PL OEM manufacturing of fish / shrimp balls under \"Made in Russia\". When you import seafood, could you please advise where we can send our catalogue.\r\n\r\nBest Regards,\r\nMaxim Markin,\r\nExport manager.\r\nPOLAR SEAFOOD RUSSIA\r\nEU approval: RU-040/DH01288\r\nChina approval: CRUS18PP2307280027\r\n42, Warshavskoe shausse, 115230, Moscow, Russia.\r\nEmail: markin@polarseafood.ru\r\nМоb./WhattsAp: +7 915 189 7118\r\nwww.polarseafood.ru\r\nwww.crossfish.ru', 1, '2024-11-29 09:44:53', '2024-11-29 09:44:53'),
(125, NULL, 'Joanna Riggs', 'joannariggs94@gmail.com', '219032613', 'Bergrain 35', 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service, which we feel can benefit your site alifinefoods.com.\r\n\r\nCheck out a couple of our existing videos here:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nOur prices start from as little as $195 and include a professional\r\nscript and voice-over. We also provide other accents and non-English languages.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to reply.\r\n\r\nKind Regards,\r\nJoanna', 1, '2024-11-30 09:07:52', '2024-11-30 09:07:52'),
(126, NULL, 'Patty Betts', 'betts.patty@gmail.com', '261735552', '52 Frencham Street', 'Hi, this is a friendly reminder it\'s your last chance to file your claim for the ERC / Employee Retention Tax Credit. This is money set aside that\'s owed to you by the US Government, which reimburses you up to $32,200 per W2 you kept on payroll during the pandemic. This is your last chance to claim your money: https://claim-erc.net', 1, '2024-11-30 15:14:07', '2024-11-30 15:14:07'),
(127, NULL, 'Mike Dowman', 'mikexxxx@gmail.com', '88319847885', 'https://www.no-site.com', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s SEO health and actionable insights to help improve your rankings. \r\n \r\nTake the first step towards better performance and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues hold you back. Optimize your site today and stay ahead of the competition! \r\n \r\nBest regards, \r\n \r\n \r\nMike Dowman\r\n \r\nSpeed SEO \r\nWhatsapp us: https://www.speed-seo.net/whatsapp-with-us/', 1, '2024-11-30 20:51:28', '2024-11-30 20:51:28'),
(128, NULL, 'Luther', 'info@simms.caredogbest.com', '157187582', 'Pontault-Combault', 'Hello there \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF:  https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nBest, \r\n\r\nLuther', 1, '2024-12-02 22:43:02', '2024-12-02 22:43:02'),
(129, 110, 'Illias', 'ahmedilliasooo@gmail.com', '01751644951', 'House 32/24, road -3, sector -1, Aftabnagar', 'I need 02 Pcs pizza bun 10\" inch', 1, '2024-12-04 14:47:34', '2024-12-04 14:47:34'),
(130, NULL, 'Lars Schmidt', 'mikexxxx@gmail.com', '83464687787', 'https://www.no-site.com', 'Hi there, \r\n \r\nI recently took a look at alifinefoods.com and spotted some areas where we could improve your SEO rankings and overall visibility. Small changes can make a big difference! \r\n \r\nCurious? Create your own free SEO report here: https://www.hilkom-digital.com/get-report/ \r\n \r\nIf you\'re ready to take it further, our tailored SEO plans are designed to help you grow: https://www.hilkom-digital.com/cheap-seo-packages/ \r\n \r\nLet’s chat about getting alifinefoods.com the visibility it deserves. \r\nWhatsApp: https://www.hilkom-digital.com/whatsapp-us/ \r\n \r\nBest, \r\nMike \r\nHilkom Digital', 1, '2024-12-08 06:25:20', '2024-12-08 06:25:20'),
(131, NULL, 'Lillie', 'info@cumpston.bangeshop.com', '3952076074', 'Maschito', 'Hello there, \r\n\r\nI hope you\'re doing well. I wanted to let you know about our new BANGE backpacks and sling bags that just released.\r\n\r\nThe bags are waterproof and anti-theft, and have a built-in USB cable that can recharge your phone while you\'re on the go.\r\n\r\nBoth bags are made of durable and high-quality materials, and are perfect for everyday use or travel.\r\n\r\nOrder yours now at 50% OFF with FREE Shipping: http://bangeshop.com\r\n\r\nThank You,\r\n\r\nLillie', 1, '2024-12-10 00:44:30', '2024-12-10 00:44:30'),
(132, NULL, 'Carmelo Well', 'carmelo.well@gmail.com', '685134182', 'Voorsterstraat 112', 'Hi! \r\n\r\nIs your website not making the sales that it should? \r\n\r\nWe build highly branded shopify stores.  \r\n\r\nBe your own boss, you want a BUSINESS, not a website only! \r\nThe best value for your money (17k happy clients) \r\nWe provide you with lifetime support! \r\n\r\n\r\nNo sales in 30 days from our system? Get a full refund \r\n\r\nCome get your shopify site built for you and dominate your market. \r\nPCX Group.com', 1, '2024-12-10 23:49:45', '2024-12-10 23:49:45'),
(133, NULL, 'Mike Martin Karlsen', 'mikexxxx@gmail.com', '83932766558', 'https://www.no-site.com', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://www.digitalxflow.com/whatsapp-us/ \r\n \r\n \r\nBest regards, \r\nMike Martin Karlsen\r\n \r\nDgital X Flow Team', 1, '2024-12-11 08:40:23', '2024-12-11 08:40:23'),
(134, NULL, 'Shannon Quaife', 'quaife.shannon@yahoo.com', '4386186', 'Austurstraeti 91', 'Simplify Payments for Your Clients\r\nAre you losing potential clients due to high upfront costs? We provide flexible financing solutions through Client Financing (International) and Credee (Tier1 International), designed to make your services more accessible.\r\n\r\n������ Benefits:\r\n\r\nEasier client approvals\r\nIncreased conversions\r\nHassle-free setup\r\nStart today:\r\n\r\nInternational: https://info.clientfinancing.com?fpr=kristi86\r\nTier1 International: https://kristi-ventures.credee.net/\r\n������ Contact Kristi: KristiReed.Funding@gmail.com', 1, '2024-12-11 22:05:11', '2024-12-11 22:05:11'),
(135, NULL, 'Rhonda Schaeffer', 'rhonda.schaeffer@msn.com', '656377241', 'Oever 83', 'Businesses that accepted Visa/Mastercard payments between 2004 and 2019 may qualify for compensation as part of the $5.54 billion class action settlement.\r\nThe deadline is fast approaching: February 4, 2025.\r\nAct now to claim your share!\r\nVisit: http://cardsettlement.top for details and filing assistance.', 1, '2024-12-12 14:32:40', '2024-12-12 14:32:40'),
(136, NULL, 'MichealVex', 'raymondBAITSABILT@gmail.com', '82642258172', 'https://www.no-site.com', 'What’s up? alifinefoods.com \r\n \r\nDid you know that it is possible to send requests legit? \r\nWhen such commercial offers are sent, no personal data is used and messages are sent to forms specifically designed to receive messages and appeals efficiently. Messages through Feedback Forms are not likely to end up in spam, since they are deemed as essential. \r\nYou have the chance to use our service without having to pay anything. \r\nWe are able to send up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis message was automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', 1, '2024-12-12 20:55:36', '2024-12-12 20:55:36'),
(137, NULL, 'Landon Dostie', 'dostie.landon@hotmail.com', '47499985', 'Staversletta 95', 'USA businesses: Did you process Visa/Mastercard payments from 2004 to 2019? If yes, you could be eligible for a portion of a $5.54 billion settlement.\r\nThe filing deadline is February 4, 2025. Don’t leave money on the table!\r\nVisit http://cardsettlement.top to claim your share.', 1, '2024-12-14 16:08:33', '2024-12-14 16:08:33'),
(138, NULL, 'Mike Svein Vincent', 'mikexxxx@gmail.com', '84348522315', 'https://www.no-site.com', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Svein Vincent\r\n \r\nmonkeydigital.co', 1, '2024-12-16 15:01:41', '2024-12-16 15:01:41'),
(139, NULL, 'Mike Erik Weber', 'mikexxxx@gmail.com', '86117951188', 'https://www.no-site.com', 'Hi there \r\n \r\nHaving some bunch of links pointing to alifinefoods.com could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards \r\nMike Erik Weber\r\n \r\nstrictlydigital.net', 1, '2024-12-17 13:29:08', '2024-12-17 13:29:08'),
(140, NULL, 'Katelyn Raiden', 'katelynraiden@gmail.com', '7016558379', '90 Withers Close', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn', 1, '2024-12-18 02:40:16', '2024-12-18 02:40:16'),
(141, NULL, 'Mike Torsten Robertson', 'mikexxxx@gmail.com', '88496172532', 'https://www.no-site.com', 'Hello, \r\n \r\nThis is Mike Backer\r\nfrom Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Torsten Robertson\r\n \r\nmonkeydigital.co', 1, '2024-12-20 07:46:55', '2024-12-20 07:46:55'),
(142, NULL, 'Susannah', 'info@miele.pawtrim.shop', '674996714', 'Liempde', 'Hey \r\n \r\nIs your dog\'s nails getting too long? If you\'re tired of going to the vet or groomer to get them trimmed, why not try PawSafer™? \r\nWith PawSafer™, you can trim your dog\'s nails from the comfort of your own home, and it only takes a few minutes!\r\n\r\nPawSafer™ is the safest and most convenient way to trim your dog\'s nails, and it\'s very affordable. \r\n\r\nGet it while it\'s still 50% OFF + FREE Shipping\r\n\r\nBuy here: https://pawtrim.shop\r\n \r\nTo your success, \r\n \r\nSusannah', 1, '2024-12-21 17:48:22', '2024-12-21 17:48:22'),
(143, NULL, 'Mike Richard Bertrand', 'mikexxxx@gmail.com', '83355694497', 'https://www.no-site.com', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s SEO health and actionable insights to help improve your rankings. \r\n \r\nTake the first step towards better performance and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues hold you back. Optimize your site today and stay ahead of the competition! \r\n \r\nBest regards, \r\n \r\n \r\nMike Richard Bertrand\r\n \r\nSpeed SEO \r\nWhatsapp us: https://www.speed-seo.net/whatsapp-with-us/', 1, '2024-12-23 10:41:10', '2024-12-23 10:41:10'),
(144, NULL, 'Alannah Nichols', 'nichols.alannah@msn.com', '42238132', 'Smith Sundes Veg 248', 'Struggling with low website traffic? RealPPVTraffic gives you the edge you need with 100% real visitors tailored to your niche!  \r\nUnlock the details here: http://realhumanwebtraffic.top', 1, '2024-12-24 15:19:09', '2024-12-24 15:19:09'),
(145, NULL, 'Felicity Sauncho', 'felicitysauncho02@gmail.com', '1251348772', 'Rua Seis 287', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nFelicity\r\n\r\nOpt-out: https://removeme.live/unsubscribe.php?d=alifinefoods.com', 1, '2024-12-25 04:44:57', '2024-12-25 04:44:57'),
(146, NULL, 'Jacquelyn Marron', 'jacquelyn.marron@outlook.com', '121930214', '23 Place De La Madeleine', 'Are you tired of expensive and ineffective marketing strategies? Our service sends your ad text to millions of website contact forms at a flat rate. No extra costs. Your message will be read and noticed.\r\n\r\n Feel free to contact me using the details below if you want to learn more about my approach.\r\n\r\nRegards,\r\nJacquelyn Marron\r\nEmail: Jacquelyn.Marron@uniqueadvertising.pro\r\nWebsite: http://7qny76.advertiseviaforms.my', 1, '2024-12-31 16:32:41', '2024-12-31 16:32:41'),
(147, NULL, 'Mike Ethan Kristiansen', 'info@professionalseocleanup.com', '83841198334', 'https://www.no-site.com', 'Improve your website`s ranks totally free \r\n \r\nMessage: \r\nHi there, \r\n \r\nWhile checking your alifinefoods.com for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\nRegards \r\nMike Ethan Kristiansen\r\n \r\nWhatsapp: https://www.professionalseocleanup.com/whatsapp/ \r\nEmail us: info@professionalseocleanup.com', 1, '2025-01-01 09:59:35', '2025-01-01 09:59:35'),
(148, NULL, 'Alta Motley', 'motley.alta@yahoo.com', '6045817157', '4456 Holdom Avenue', 'Hi,\r\n\r\nI\'m reaching out with an opportunity to enhance your online presence through our established publishing platform. We offer high-quality guest posting opportunities that can help you reach a wider audience and improve your SEO.\r\n\r\nOur website boasts strong domain metrics (Moz DA: 63, Ahrefs DR: 31) and welcomes content across diverse niches. We also offer flexible options to suit your needs:\r\n\r\nContent Creation Options:\r\n\r\n1. You Provide the Article ($30): Maintain full editorial control and see your content published within 48 hours.\r\n\r\n2. We Write the Article ($30 prepaid): Get professional content creation based on your topic and key points.\r\n\r\n3. Link Insertion in Existing Content ($25 prepaid): Achieve strategic link placement within relevant articles for natural content integration.\r\n\r\nTo get started or learn more about our platform, please contact us at backlinks4u2025@gmail.com\r\n\r\nBest regards,\r\nAlta', 1, '2025-01-02 01:59:15', '2025-01-02 01:59:15'),
(149, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', '7392848688', 'Mohrenstrasse 97', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', 1, '2025-01-04 21:28:52', '2025-01-04 21:28:52');
INSERT INTO `client_messages` (`id`, `product_id`, `name`, `email`, `phone`, `address`, `message`, `status`, `created_at`, `updated_at`) VALUES
(150, NULL, 'Danilo', 'info@flaherty.medicopostura.com', '7005046649', 'Collingbourne Kingston', 'Hello \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nHave a great time, \r\n\r\nDanilo', 1, '2025-01-05 23:41:13', '2025-01-05 23:41:13'),
(151, NULL, 'Mike Karl David', 'mikexxxx@gmail.com', '83538531735', 'https://www.no-site.com', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://www.digitalxflow.com/whatsapp-us/ \r\n \r\n \r\nBest regards, \r\nMike Karl David\r\n \r\nDgital X Flow Team', 1, '2025-01-11 15:12:39', '2025-01-11 15:12:39'),
(152, NULL, 'Maddison Penn', 'maddison.penn44@gmail.com', '3213200820', 'Via Palermo 109', 'Are you tired of expensive and ineffective marketing strategies? Our service sends your ad text to millions of website contact forms at a flat rate. No extra costs. Your message will be read and noticed.\r\n\r\n Want more info? Reach out using the details below.\r\n\r\nRegards,\r\nMaddison Penn\r\nEmail: Maddison.Penn@uniqueadvertising.pro\r\nWebsite: http://xqvq5s.marketing-with-contactforms.top', 1, '2025-01-11 17:09:16', '2025-01-11 17:09:16'),
(153, NULL, 'Stephen', 'info@womack.caredogbest.com', '6439200752', 'Geilnau', 'Hello there \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF:  https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nThe Best, \r\n\r\nStephen', 1, '2025-01-12 04:35:41', '2025-01-12 04:35:41'),
(154, NULL, 'Bobby Ryan', 'heyitsbobbyryan@gmail.com', '5142452076', '4490 Papineau Avenue', 'Hey, I noticed an issue on your website and made a report, what\'s a good number to call you on to go over this?', 1, '2025-01-12 19:00:09', '2025-01-12 19:00:09'),
(155, NULL, 'Mike Manfred Bernard', 'info@strictlydigital.net', '82971156345', 'https://www.no-site.com', 'Hi there \r\n \r\nHaving some bunch of links pointing to alifinefoods.com could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards \r\nMike Manfred Bernard\r\n \r\nstrictlydigital.net', 1, '2025-01-14 21:38:46', '2025-01-14 21:38:46'),
(156, NULL, 'Amelia Brown', 'ameliabrown5822@gmail.com', '629335668', 'Sonnenweg 131', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia\r\n\r\nOpt-out: https://removeme.live/unsubscribe.php?d=alifinefoods.com', 1, '2025-01-15 09:22:22', '2025-01-15 09:22:22'),
(157, NULL, 'Lori Shultz', 'vinhgrowth@gmail.com', '2679883031', '4477 Garrett Street', 'Hi. We run a YouTube growth service, which increases your number of subscribers both safety and practically.\r\n\r\n- We guarantee to gain you new 700+ subscribers per month\r\n- People subscribe because they are interested in your videos/channel, increasing video likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any bots.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately. If you are interested and would like to see some of our previous work, let me know and we can discuss further.\r\n\r\nKind Regards,\r\n\r\nTo Unsubscribe, reply with the word unsubscribe in the subject.', 1, '2025-01-16 00:36:29', '2025-01-16 00:36:29'),
(158, NULL, 'Mike Karl-Erik Schulz', 'mike@monkeydigital.co', '87132178822', 'https://www.no-site.com', 'Hello, \r\n \r\nThis is Mike Boolman\r\nfrom Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Karl-Erik Schulz\r\n \r\nmonkeydigital.co', 1, '2025-01-18 04:02:00', '2025-01-18 04:02:00'),
(159, NULL, 'Iesha', 'info@dipietro.medicopostura.com', '9407179776', 'Malgomaj', 'Hi \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nTo your success, \r\n\r\nIesha', 1, '2025-01-18 05:54:04', '2025-01-18 05:54:04'),
(160, NULL, 'Mike Matthias Smith', 'mike@monkeydigital.co', '83991288777', 'https://www.no-site.com', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Matthias Smith\r\n \r\nmonkeydigital.co', 1, '2025-01-19 19:06:00', '2025-01-19 19:06:00'),
(161, NULL, 'Joel Abrahams', 'abrahams.joel@gmail.com', '8067875633', '675 Emma Street', 'Hi,\r\n\r\nCan somebody please contact me on WhatsApp https://api.whatsapp.com/message/EXIZU46XMS3OH1', 1, '2025-01-21 22:51:52', '2025-01-21 22:51:52'),
(162, NULL, 'Hallie Acosta', 'acosta.hallie@gmail.com', '395245628', 'Unter Den Linden 20', 'We improve MOZ  Domain authority 30+ in 15 Days its help to improve google rank, improve your website SEO, and you get traffic from google \r\n\r\nDA - 0 to 30 - (Only $29) - Yes, Limited time !!\r\n\r\n>> 100% Guarantee \r\n>> Improve Ranking \r\n>> White Hat Process \r\n>> Permanent Work\r\n>> 100% Manual Work \r\n>> 0% Spam score increase \r\n\r\n\r\n⚡ From our work your website keyword get rank on google and get organic traffic from google through keywords\r\n\r\nContact now: intrug@gmail.com', 1, '2025-01-22 16:41:14', '2025-01-22 16:41:14'),
(163, NULL, 'Gary Charles', 'gary-charles@dominatingkeywords.com', '8054002077', '275 East Hillcrest Drive 160-169', 'I am not offering you SEO, nor PPC.\r\nThis is something completely different.\r\nJust send us keywords of your interest and your website banner instantly appears number one on Google and Bing search results without Pay Per Click charges.\r\nLet me show you how it works and you will be pleasantly surprised by the results.', 1, '2025-01-22 23:10:56', '2025-01-22 23:10:56'),
(164, NULL, 'Randolph Skertchly', 'skertchly.randolph@gmail.com', '473992917', 'Ramselsesteenweg 36', 'Want results without the usual marketing costs? Send your ad text to millions of website contact forms. One flat rate, no hidden charges, and guaranteed visibility.\r\n\r\n Want more info? Reach out using the details below.\r\n\r\nRegards,\r\nRandolph Skertchly\r\nEmail: Randolph.Skertchly@uniqueadvertising.pro\r\nWebsite: http://yavqja.marketing-with-contactforms.top', 1, '2025-01-23 19:05:59', '2025-01-23 19:05:59'),
(165, NULL, 'Mike Giinter Martinez', 'info@speed-seo.net', '81531713543', 'https://www.no-site.com', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s SEO health and actionable insights to help improve your rankings. \r\n \r\nTake the first step towards better performance and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues hold you back. Optimize your site today and stay ahead of the competition! \r\n \r\nBest regards, \r\n \r\n \r\nMike Giinter Martinez\r\n \r\nSpeed SEO \r\nWhatsapp us: https://www.speed-seo.net/whatsapp-with-us/', 1, '2025-01-25 13:30:43', '2025-01-25 13:30:43'),
(166, NULL, 'Nichol Vickers', 'vickers.nichol@outlook.com', '913783983', 'Lichtmattstrasse 52', 'Hi there,\r\n\r\nWe wanted to introduce you to a revolutionary system that helps you create AI-powered tools to generate steady, qualified leads without paid advertising.\r\n\r\nKey benefits:\r\n\r\nCreate AI tools in minutes with simple copy/paste templates \r\nDrive free, targeted traffic to any niche or offer  \r\nBuilt-in call-to-action system to funnel leads to your sales pages \r\nNo coding or technical experience needed\r\n\r\nWe\'re currently offering a special launch price of $17 (regular $97) which includes bonus training on traffic generation and AI monetization.\r\n\r\nFor more details, check out: https://furtherinfo.info/etb\r\n\r\nThanks,\r\nNichol', 1, '2025-01-25 14:42:52', '2025-01-25 14:42:52'),
(167, NULL, 'Joanna Riggs', 'joannariggs94@gmail.com', '168443286', '96 Place Maurice-Charretier', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work. If you are not interested, just use the link at the bottom.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=alifinefoods.com', 1, '2025-01-30 23:35:17', '2025-01-30 23:35:17'),
(168, NULL, 'Mike Aleksander Svensson', 'info@professionalseocleanup.com', '88717434793', 'https://www.no-site.com', 'Improve your website`s ranks totally free \r\n \r\nMessage: \r\nHi there, \r\n \r\nWhile checking your alifinefoods.com for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\nRegards \r\nMike Aleksander Svensson\r\n \r\nWhatsapp: https://www.professionalseocleanup.com/whatsapp/ \r\nEmail us: info@professionalseocleanup.com', 1, '2025-02-01 12:35:02', '2025-02-01 12:35:02'),
(169, NULL, 'Darby Mcvay', 'mcvay.darby@gmail.com', '488903683', 'Rue De La Poste 401', 'Tired of paying for advertising that doesn\'t work? With our service, you can send your ad text to millions of website contact forms for one flat rate. People will read your message just like you\'re reading this one - and there are no per click costs. Get started today and watch your business grow.\r\n\r\n Reach out using the contact info below to learn more.\r\n\r\nRegards,\r\nDarby Mcvay\r\nEmail: Darby.Mcvay@uniqueadvertising.pro\r\nWebsite: http://q45wvm.advertiseviaforms.my', 1, '2025-02-03 01:48:42', '2025-02-03 01:48:42'),
(170, NULL, 'Luis Alves', 'intl.law7@aol.com', '88639452654', 'https://www.no-site.com', 'Dear Sir/Madam, \r\nIt is my utmost desire in engaging this moment to introduce to you myself as well our Firm. \r\nMy name is Luis Alves, a private investment Consultant. I\'m contacting you to inquire if your company welcomes investors, as we currently offer business finance loans to companies and corporate businesses that need funding to execute their projects. \r\nWe carry out disposals, acquisitions, and financing of companies from USD 10 million up to USD 1 Billion with an APR of 2% per annum. \r\nIf you have a viable business seeking for quick Loan or Funding Partners, kindly get in touch as I look forward to your thoughtful response. \r\nPlease reach out to me, through this following email: luisalves@izafinconsultant.com if you need further details about the funding scheme. \r\nBest regards, \r\nMr. Luis Alves. \r\nE-mail: luisalves@izafinconsultant.com', 1, '2025-02-03 09:33:55', '2025-02-03 09:33:55'),
(171, NULL, 'Madeline Baskin', 'madeline.baskin@outlook.com', '7867234988', '93 Wrexham Road', 'Effective advertising doesn’t have to cost a fortune. Send your ad text to millions of website contact forms for a single flat rate. No more wasting money on pay-per-click. Your message gets read.\r\n\r\n Contact me via the information below for all the details.\r\n\r\nRegards,\r\nMadeline Baskin\r\nEmail: Madeline.Baskin@uniqueadvertising.pro\r\nWebsite: http://pgrs9e.advertiseviaforms.my', 1, '2025-02-03 16:31:15', '2025-02-03 16:31:15'),
(172, NULL, 'Francine', 'info@laycock.bangeshop.com', '317216696', 'Gerzensee', 'Morning, \r\n\r\nI hope you\'re doing well. I wanted to let you know about our new BANGE backpacks and sling bags that just released.\r\n\r\nThe bags are waterproof and anti-theft, and have a built-in USB cable that can recharge your phone while you\'re on the go.\r\n\r\nBoth bags are made of durable and high-quality materials, and are perfect for everyday use or travel.\r\n\r\nOrder yours now at 50% OFF with FREE Shipping: http://bangeshop.com\r\n\r\nTo your success,\r\n\r\nFrancine', 1, '2025-02-07 09:52:44', '2025-02-07 09:52:44'),
(173, NULL, 'Nicholas Doby', 'dobyfinancial@sendnow.win', '86514421875', 'https://no-site.com', 'Greetings, Mr./Ms. \r\n \r\nI’m Nicholas Doby from an investment consultancy. We connect clients globally with low or no-interest loans to help achieve your goals. Whether for personal or business/project funding, we collaborate with reputable investors to turn your proposals into reality. Share your business plan and executive summary with us at: contact@dobyfinancial.com to explore funding options. \r\n \r\nSincerely, \r\nNicholas Doby \r\nSenior Financial Consultant \r\nhttps://dobyfinancial.com', 1, '2025-02-08 05:54:36', '2025-02-08 05:54:36'),
(174, NULL, 'Mike David Persson', 'info@digitalxflow.com', '84764861556', 'https://www.digitalxflow.com/country-backlinks/', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://www.digitalxflow.com/whatsapp-us/ \r\n \r\n \r\nBest regards, \r\nMike David Persson\r\n \r\nDgital X Flow Team', 1, '2025-02-08 17:56:38', '2025-02-08 17:56:38'),
(175, NULL, 'Benjamin Hindley', 'hindley.benjamin@gmail.com', '262933856', 'Quadra 83', 'Discover the proven strategy to triple your Google traffic without spending a dime!\r\n\r\nBegin now https://cutt.ly/Google-traffic-trick', 1, '2025-02-11 22:48:08', '2025-02-11 22:48:08'),
(176, NULL, 'Ruby', 'info@plate.pawtrim.shop', '3814906497', 'Marina Di Campo', 'Is your dog\'s nails getting too long? If you\'re tired of going to the vet or groomer to get them trimmed, why not try PawSafer™? \r\nWith PawSafer™, you can trim your dog\'s nails from the comfort of your own home, and it only takes a few minutes!\r\n\r\nPawSafer™ is the safest and most convenient way to trim your dog\'s nails, and it\'s very affordable. \r\n\r\nGet it while it\'s still 50% OFF + FREE Shipping\r\n\r\nBuy here: https://pawtrim.shop\r\n \r\nBest, \r\n \r\nRuby', 1, '2025-02-12 18:00:33', '2025-02-12 18:00:33'),
(177, NULL, 'Chance Kirsch', 'chance.kirsch@gmail.com', '4430557', 'Kaupangsstrati 23', 'Are you still struggling to rank on Google? Our SEO experts can help. Contact https://hireseogeek.com/?src1=alifinefoods.com', 1, '2025-02-13 12:47:00', '2025-02-13 12:47:00'),
(178, NULL, 'Mike Wolfgang Davies', 'mike@monkeydigital.co', '89536122541', 'https://www.monkeydigital.co/product/country-targeted-traffic/', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Wolfgang Davies\r\n \r\nmonkeydigital.co', 1, '2025-02-13 15:40:53', '2025-02-13 15:40:53'),
(179, NULL, 'Francisco Alden', 'francisco.alden@gmail.com', '353830511', '69 Flax Court', 'If you print important documents on WATERPROOF NON-TEAR SCRATCH-PROOF paper,\r\nyou SAVE TREES.\r\nWe produce WORLD’S TOUGHEST PAPERS for LASER PRINTING.\r\nThese are LIFE LONG DURABLE. No Trees cut. Made from recyclable polyester pulp.\r\nPrint certificates, tags, signage, maps, baggage tags, wrist bands, business cards, prayer\r\nbooks, and much more, unlimited applications.\r\nWe offer 35% Guaranteed lower prices than any US producer. All HP INDIGO Tested and\r\nCertified.\r\nBuyer Protection offered. Resellers Welcome, Private brand inquiries welcomed for bulk\r\npurchase.\r\nAvailable for DIRECT SHIPMENTS. Whatsapp : +91 9833915491\r\nFor USA : www.highhimage.com\r\nUK : www.highhimage.co.uk\r\nEU and Germany :\r\nhttps://www.amazon.de/s?me=A25QCBN7Y1DN8U&amp;language=en&amp;marketplaceID=A1PA6795\r\nUKMFR9\r\nUAE : https://www.amazon.ae/s?me=AQA0LQ9F8VDQC&amp;marketplaceID=A2VIGQ35RCS4UG\r\nAvailable on Walmart and Amazon worldwide.\r\nCheers\r\nHimanshu Lakhani\r\n+91 9833915491 for DIRECT ORDERS on Whatsapp\r\nCEO – B2B and E Commerce\r\nIMAGE STATIONERY LTD.\r\nSalford - London - Mumbai\r\nOther mail ID : imageprint123@gmail.com', 1, '2025-02-14 17:21:20', '2025-02-14 17:21:20'),
(180, NULL, 'Mohamed Naylor', 'mohamed.naylor@gmail.com', '5231493190', 'Bleibtreustrasse 39', 'Tired of SEO tricks that don’t work? Discover how to gain traffic effortlessly!\r\n\r\nDive deeper here https://cutt.ly/Google-traffic-trick', 1, '2025-02-15 09:48:06', '2025-02-15 09:48:06'),
(181, NULL, 'Mike Erik Smit', 'check-message9458@gmail.com', '86641614969', 'http://Check-message-for-details-6829.com', 'Hi there \r\n \r\nHaving some bunch of links pointing to alifinefoods.com could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards \r\nMike Erik Smit\r\n \r\nstrictlydigital.net \r\ninfo@strictlydigital.net', 1, '2025-02-15 18:17:30', '2025-02-15 18:17:30'),
(182, NULL, 'Mike Per Jansen', 'check-message1785@gmail.com', '89719585122', 'http://Check-message-for-details-6451.com', 'Hello, \r\n \r\nThis is Mike MacAdam\r\nfrom Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Per Jansen\r\n \r\nmonkeydigital.co \r\nmike@monkeydigital.co', 1, '2025-02-16 03:00:49', '2025-02-16 03:00:49'),
(183, NULL, 'Your bonus>>> https://krakenpartners.net/ru/track/1174', 'raya.gritsenko.91@mail.ru', '81477339333', 'https://krakenpartners.net/ru/track/1174', 'Start winning with your special bonus—register now!  - https://krakenpartners.net/ru/track/1174', 1, '2025-02-16 13:21:10', '2025-02-16 13:21:10'),
(184, NULL, 'Yasuhiro Yamada', 'rohtopharmaceutical@via.tokyo.jp', '88253788427', 'https://www.no-site.com', 'Greetings, Mr./Ms. \r\n \r\nWith all due respect. We are looking for a Spokesperson/Financial Coordinator for ROHTO Pharmaceutical Co., Ltd. based in the USA, Canada, or Europe. This part-time role offers a minimum $5k salary and requires only a few minutes of your time daily. It will not create any conflicts if you work with other companies. If interested, please contact apply@rohtopharmaceutical.com \r\n \r\nBest regards, \r\nYasuhiro Yamada \r\nSenior Executive Officer \r\nhttps://rohtopharmaceutical.com/', 1, '2025-02-17 13:52:33', '2025-02-17 13:52:33'),
(185, NULL, 'Oman Chaney', 'jefferson.chaney@hotmail.com', '0315 6614852', 'Via Torre Di Mezzavia 29', 'Hello,\r\n\r\nAt Cateus Investment Company (CIC), we understand that securing the right funding is crucial for both startups and established businesses. That\'s why we offer flexible financing solutions designed to meet your specific needs.\r\n\r\nHere’s how we can help:\r\n\r\nDebt Financing: 3% annual interest with zero penalties for early repayment.\r\nEquity Financing: Venture capital support with a 10% equity stake—helping you expand while keeping control.\r\nWe’re ready to explore the best option for your business. Simply send us your pitch deck or executive summary, and let’s discuss the ideal investment structure to fuel your growth.\r\n\r\nLooking forward to hearing from you.\r\n\r\nBest regards,\r\nOman Rook\r\nExecutive Investment Consultant/Director\r\nCateus Investment Company (CIC)\r\n\r\nemail: oman-rook@cateusgroup.org   or cateusgroup@gmail.com \r\nhttps://cateusinvestmentgroup.com', 1, '2025-02-19 22:31:46', '2025-02-19 22:31:46'),
(186, NULL, 'Katelyn Raiden', 'katelynraiden81@gmail.com', '3052373282', '902 Agriculture Lane', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n- Channel Creation: If you haven\'t started your YouTube journey yet, we can create a professional channel for you as part of your initial order.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn', 1, '2025-02-21 18:23:59', '2025-02-21 18:23:59'),
(187, NULL, 'Mike Dieter Eriksson', 'info@speed-seo.net', '82748835128', 'https://www.speed-seo.net/check-site-seo-score/', 'Hello, \r\n \r\nWant to know how your website is ranking? \r\nLearn its pros and cons with our Free SEO Audit! \r\n \r\nIn just 2 minutes, you’ll get a detailed analysis of your search performance and recommendations to boost your visibility. \r\n \r\nTake the first step towards stronger SEO and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let undetected optimization problems hold you back. \r\nImprove your site today and outrank competitors in your industry! \r\n \r\nNeed more info? Whatsapp with a SEO expert: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nLooking forward, \r\n \r\n \r\nMike Dieter Eriksson\r\n \r\nSpeed SEO \r\nPhone/WhatsApp: +1 (833) 454-8622', 1, '2025-02-22 13:12:05', '2025-02-22 13:12:05'),
(188, NULL, 'Marta Runion', 'runion.marta5@gmail.com', '2506153135', '3812 Burdett Avenue', 'Need AI tools for video creation, content generation, or text-to-speech? These 3 Amazing AI Tools are what you need: \r\n**Create videos  \r\n**Generate high-quality content  \r\n**Convert text into speech  \r\nStart using them today! http://3amazingaitools.top/', 1, '2025-02-27 14:11:40', '2025-02-27 14:11:40'),
(189, NULL, 'Mike Sebastien Mertens', 'info@professionalseocleanup.com', '83726813563', 'https://www.professionalseocleanup.com/', 'Hi there, \r\n \r\nWhile checking your alifinefoods.com for its ranks, I have noticed that \r\nthere are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nAsk us how we do it: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nRegards \r\nMike Sebastien Mertens\r\n \r\nPhone: +1 (855) 221-7591', 1, '2025-02-28 04:31:07', '2025-02-28 04:31:07'),
(190, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', '267145563', '41 Balonne Street', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work. If you are not interested, just use the link at the bottom.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=alifinefoods.com', 1, '2025-02-28 19:35:13', '2025-02-28 19:35:13'),
(191, NULL, 'Alfredo Ray', 'alfredo.ray@hotmail.com', '889683515', 'Ul. Bernardynska 24', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com', 1, '2025-03-04 16:28:38', '2025-03-04 16:28:38'),
(192, NULL, '* * * Get Free Bitcoin Now: http://annaitheresaschool.com/upload/ypkcze.php?m9olyb * * * hs=1919776ba0617dc3421972526ffca7f1*', 'pazapz@mailbox.in.ua', '807458093748', 'ppsun8', 'wb3u5o', 1, '2025-03-06 14:44:11', '2025-03-06 14:44:11'),
(193, NULL, '* * * <a href=\"http://annaitheresaschool.com/upload/ypkcze.php?m9olyb\">Unlock Free Spins Today</a> * * * hs=1919776ba0617dc3421972526ffca7f1*', 'pazapz@mailbox.in.ua', '403259174044', 'ihlp9y', '001jrs', 1, '2025-03-06 14:44:16', '2025-03-06 14:44:16'),
(194, NULL, '* * * Win Free Cash Instantly: https://yoursmartit.com/uploads/1vixcw.php?22dyzd * * * hs=86f96ca94da7ed9b457c2fa3e2a6b52a*', 'pazapz@mailbox.in.ua', '359125652465', 'hnfj59', 'nquckj', 1, '2025-03-06 14:44:21', '2025-03-06 14:44:21'),
(195, NULL, '* * * <a href=\"https://yoursmartit.com/uploads/1vixcw.php?22dyzd\">Unlock Free Spins Today</a> * * * hs=86f96ca94da7ed9b457c2fa3e2a6b52a*', 'pazapz@mailbox.in.ua', '357832206905', 'hgaikv', 'yp5cx7', 1, '2025-03-06 14:44:24', '2025-03-06 14:44:24'),
(196, NULL, 'Yetta', 'info@kittelson.medicopostura.com', '681329541', 'Harlingen', 'Good Morning \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nBest Wishes, \r\n\r\nYetta', 1, '2025-03-06 16:56:40', '2025-03-06 16:56:40'),
(197, NULL, 'Amanda Sharp', 'amandasharp053@gmail.com', '+18702711242', 'Unter Den Linden 11', 'Dear  Alifinefoods,\r\n\r\nI recently lost my daughter to leukemia. She was passionate about music and dreamt of becoming a professional pianist. Her Yamaha piano meant the world to her, and I would love for it to find a new home with someone who shares her passion.\r\n\r\nIf you or anyone you know would be interested in continuing her legacy through music, please let me know.\r\n\r\nWarm regards,  \r\nAmanda', 1, '2025-03-06 19:32:54', '2025-03-06 19:32:54'),
(198, NULL, 'Mike Gerard Larsson', 'info@digital-x-press.com', '88399582243', 'https://www.digital-x-press.com/unbeatable-seo/', 'Greetings, \r\n \r\nI realize that many have difficulty accepting that SEO requires time and a strategic long-term commitment. \r\n \r\nUnfortunately, very few webmasters have the patience to witness the slow but steady yet impactful results that can transform their online presence. \r\n \r\nWith Google’s evolving algorithms, a steady, long-term strategy is necessary for getting a positive ROI. \r\n \r\nIf you believe this as the most effective strategy, give us a try! \r\n \r\nCheck out Our Custom SEO Plans \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nReach Out on Live Support \r\nhttps://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe offer unbeatable results for your investment, and you won’t regret choosing us as your growth partner. \r\n \r\nThank you, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', 1, '2025-03-08 13:27:48', '2025-03-08 13:27:48'),
(199, NULL, 'Jayrn Marques', 'laseron.hayley@gmail.com', '624974122', 'Prins Hendrikstraat 199', 'Hi Alifinefoods,\r\n\r\nI still remember sitting at my desk, staring at my sales numbers, wondering why nothing was working. \r\n\r\nI had tried everything—running ads, tweaking my website, and offering discounts—but my results were frustratingly inconsistent. \r\n\r\nOne month would bring a flood of leads, and the next? Crickets.\r\n\r\nThen, I stumbled across a simple shift in strategy that changed everything. \r\n\r\nInstead of chasing customers, I learned how to pull them in naturally—creating messaging and systems that made my business the only logical choice. \r\n\r\nThe impact was immediate, and today, I’m sharing the exact strategies so you can do the same.\r\n\r\nLet\'s dive in: \r\nhttps://marketersmentor.com/attract-customers.php?refer=alifinefoods.com\r\n\r\nTalk soon,\r\nJayrn\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=alifinefoods.com', 1, '2025-03-08 16:06:14', '2025-03-08 16:06:14'),
(200, NULL, 'Lanora Valenti', 'lanora.valenti@gmail.com', '161128823', '72 Rue De Lille', 'Want to get your message in front of millions of potential customers? Our service can help. By sending your ad text to website contact forms, your message will be read just like you\'re reading this one. And with one flat rate, you can reach a massive audience without any per click costs. Start growing your business today.\r\n\r\n Reach out today to find out how this works—my info is below.\r\n\r\nRegards,\r\nLanora Valenti\r\nEmail: Lanora.Valenti@freshnewleads.my\r\nWebsite: http://k25crw.contactformads.top', 1, '2025-03-11 18:30:44', '2025-03-11 18:30:44'),
(201, NULL, 'Mike Dominique Nilsen', 'mike@monkeydigital.co', '87994677642', 'https://www.monkeydigital.co/join-our-affiliate-program/', 'Hey, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am getting in touch regarding a exciting opportunity. \r\n \r\nHow would you like to feature our ads on your website and redirect via your custom referral link towards high-demand services from our website? \r\n \r\nThis way, you earn a recurring 35% profit share, month after month from any purchases that are made from your site. \r\n \r\nThink about it, everyone require SEO, so this is a huge opportunity. \r\n \r\nWe already have over 12,000 affiliates and our payouts are processed every month. \r\nLast month, we reached a significant amount in affiliate earnings to our partners. \r\n \r\nIf you want in, kindly message us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr join us today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nBest Regards, \r\nMike Dominique Nilsen\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', 1, '2025-03-15 08:44:03', '2025-03-15 08:44:03'),
(202, NULL, 'Valeron83dep', 'romabookim@gmail.com', '89294576361', 'http://secure-casinos.com', 'Wager-free bonuses sound too good to be trueвЂ”no wagering requirements, instant cashouts, and pure fun. While rare, these bonuses do exist, often as free spins or small cash rewards for new players. However, always check the terms, as some \"wager-free\" offers may have hidden conditions. At secure-casinos.com, weвЂ™ve investigated the reality of wager-free bonuses in 2025. Discover where to find these rare gems and play without restrictionsвЂ”read our guide now.  https://monixplay.com/he9f83b35', 1, '2025-03-15 11:29:51', '2025-03-15 11:29:51'),
(203, NULL, 'Mike Joshua Willems', 'mike@monkeydigital.co', '82935486865', 'https://www.monkeydigital.co/product/country-targeted-traffic/', 'Hi there, \r\n \r\nI wanted to reach out with something that could seriously boost your website’s traffic. We work with a trusted ad network that allows us to deliver real, geo-targeted social ads traffic for just $10 per 10,000 visits. \r\n \r\nThis isn\'t junk clicks—it’s engaged traffic, tailored to your target country and niche. \r\n \r\nWhat you get: \r\n \r\n10,000+ genuine visitors for just $10 \r\nLocalized traffic for your chosen location \r\nScalability available based on your needs \r\nUsed by marketers—we even use this for our SEO clients! \r\n \r\nReady to scale? Check out the details here: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nOr ask any questions on WhatsApp: \r\nhttps://monkeydigital.co/whatsapp-us/ \r\n \r\nLooking forward to working with you! \r\n \r\nBest, \r\nMike Joshua Willems\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', 1, '2025-03-15 19:18:44', '2025-03-15 19:18:44'),
(204, NULL, 'Mike Emil Wouters', 'info@strictlydigital.net', '82845864311', 'https://www.strictlydigital.net/product/semrush-backlinks/', 'Hello, \r\n \r\nHaving some bunch of links redirecting to alifinefoods.com could have zero worth or worse for your business. \r\n \r\nIt really isn’t important the number of backlinks you have, what matters is the amount of ranking terms those domains appear in search for. \r\n \r\nThat is the most important thing. \r\nNot the meaningless Domain Authority or ahrefs DR score. \r\nThat anyone can do these days. \r\nBUT the volume of high-traffic search terms the sites that link to you rank for. \r\nThat’s what really matters. \r\n \r\nGet these quality links redirect to your site and your site will see real growth! \r\n \r\nWe are offering this powerful offer here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubt, or need more information, chat with us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nSincerely, \r\nMike Emil Wouters\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', 1, '2025-03-16 03:22:47', '2025-03-16 03:22:47'),
(205, NULL, 'Katelyn Raiden', 'katelynraiden81@gmail.com', '2505939233', '1652 Mesa Vista Drive', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n- Channel Creation: If you haven\'t started your YouTube journey yet, we can create a professional channel for you as part of your initial order.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn', 1, '2025-03-17 00:46:52', '2025-03-17 00:46:52'),
(206, NULL, 'Jamaal Carper', 'jamaal.carper@gmail.com', '7808937607', '3916 Jasper Avenue', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 1, '2025-03-17 01:06:33', '2025-03-17 01:06:33'),
(207, NULL, 'Mike Luca Jones', 'info@speed-seo.net', '88442734745', 'https://www.speed-seo.net/check-site-seo-score/', 'Hello, \r\n \r\nCurious about how your site is ranking? \r\nDiscover its strengths and weaknesses with our Free Site Analysis! \r\n \r\nIn just 2 minutes, you’ll get a comprehensive analysis of your site’s optimization and steps to boost your search position. \r\n \r\nGet started towards better performance and online authority. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues damage your rankings. \r\nImprove your website today and stay ahead in search results! \r\n \r\nNeed more info? Whatsapp with a SEO expert: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nLooking forward, \r\n \r\n \r\nMike Luca Jones\r\n \r\nSpeed SEO \r\nPhone/WhatsApp: +1 (833) 454-8622', 1, '2025-03-21 10:40:09', '2025-03-21 10:40:09'),
(208, NULL, 'Orval Sargent', 'orval.sargent12@gmail.com', '377988993', '2 Rue Jean Vilar', 'Limited time offer: DA 40 @ $39 - Only few slots available. contact intrug@gmail.com\r\n\r\nWe improve MOZ  Domain authority 30+ in 25 Days its help to improve google rank, improve your website SEO, and you get traffic from google \r\n\r\nDA - 0 to 30 - (Only $29) - Yes, Limited time !!\r\n\r\n>> 100% Guarantee \r\n>> Improve Ranking \r\n>> White Hat Process \r\n>> Permanent Work\r\n>> 100% Manual Work \r\n>> 0% Spam score increase \r\n\r\n\r\n⚡ From our work your website keyword get rank on google and get organic traffic from google through keywords\r\n\r\nContact now: intrug@gmail.com or Visit us Now : https://open247.chat/DA/\r\n\r\nLimited time offer: DA 40 @ $39 - Only few slots available. contact intrug@gmail.com', 1, '2025-03-22 00:10:47', '2025-03-22 00:10:47'),
(209, NULL, 'Jayrn Marques', 'ivy.noll10@gmail.com', '7815529608', '13 Caerfai Bay Road', 'Hey Alifinefoods,\r\n\r\nThe brutal truth about business success is this:\r\n\r\nHard work alone won’t make you rich.\r\n\r\nYou can hustle 24/7, post on social media, and follow the “trendy” marketing tactics…\r\n\r\n������ Yet STILL struggle to grow your business.\r\n\r\nWhy? Because most entrepreneurs ignore what actually makes money.\r\n\r\nDan Kennedy changed everything for me.\r\n\r\nDan is the go-to guy for the world’s top entrepreneurs when they need to:\r\n✅ Make more sales without relying on social media\r\n✅ Turn cold leads into buyers—FAST\r\n✅ Use no B.S. marketing strategies that actually work\r\n\r\nNow, you can access Dan’s private business insights inside his No B.S. Newsletter…\r\n\r\n������ For a limited time, you can get it (+ exclusive bonuses) at a huge discount.\r\n\r\n⏳ This offer disappears soon—don’t miss it:\r\n\r\n������ Grab it now\r\nhttps://marketersmentor.com/marketing-strategies.php?refer=alifinefoods.com&real=yes\r\n\r\nSee you inside,\r\nJayrn\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=alifinefoods.com&real=yes', 1, '2025-03-22 04:36:45', '2025-03-22 04:36:45'),
(210, NULL, 'Dominick Farrington', 'farrington.dominick@googlemail.com', '1186327178', 'Praca Maria Candida Freitas De Oliveira 1170', 'Hey Alifinefoods,\r\n\r\nImagine launching a product and selling out in 48 hours—without spending a fortune on ads. Sounds like a dream, right?\r\n\r\nThat’s exactly what happened to EcoStride, a sustainable sneaker brand. Instead of relying only on ads, they used a press release to get featured on Yahoo Finance, Google News, and 150+ media sites.\r\n\r\n✅ 11,400+ visitors in 5 days\r\n✅ 300+ sales before ads even started\r\n✅ 100% free organic traffic from media coverage\r\n\r\nAnd the best part? Writing a press release used to be time-consuming and difficult, but now EIN Presswire’s AI Press Release Generator makes it fast and effortless.\r\n\r\nJust enter your details, let AI craft a professional press release, and distribute it to top-tier media instantly.\r\n\r\nLaunch your next product the smart way.\r\n\r\nTry It Today: https://marketersmentor.com/sold-out-product-launch.php?refer=alifinefoods.com&real=yes\r\n\r\nTo your success,\r\nDominick\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=alifinefoods.com&real=yes', 1, '2025-03-27 11:30:53', '2025-03-27 11:30:53'),
(211, NULL, 'Jame Mault', 'mault.jame@hotmail.com', '97342483', 'Rodhetteveien 167', 'Struggling to rank on Google? Low traffic and missed sales hurt your business daily. A weak SEO game could be the culprit. Get your Free SEO Audit now—uncover hidden issues fast! Limited spots—claim yours before midnight tonight and skyrocket your rankings. Click here to start! https://hireseogeek.com/audit.html?src=alifinefoods.com', 1, '2025-03-27 16:39:10', '2025-03-27 16:39:10'),
(212, NULL, 'Marty Steffanoni', 'steffanoni.marty@gmail.com', '457634394', '18 Rue Clement Marot', 'Dear Sir/Madam,\r\nWe are exploring long-term business collaborations and found your company of interest. May we kindly request your product catalog and pricing? Please  contact me via WhatsApp : +44 743 894 2163', 1, '2025-03-27 17:18:12', '2025-03-27 17:18:12'),
(213, NULL, 'Nona Nepean', 'nepean.nona@gmail.com', '6241645939', 'Hermannstrasse 62', 'Stop wasting money on ads that don’t get noticed. We place your message directly in website contact forms for guaranteed visibility. No per-click costs—just results.  \r\n\r\nLet’s talk! Reach out via the contact info below.  \r\n\r\nRegards,  \r\nNona Nepean  \r\nEmail: Nona.Nepean@freshnewleads.my  \r\nWebsite: https://getnewclients.top', 1, '2025-03-31 03:20:46', '2025-03-31 03:20:46'),
(214, NULL, 'Hassan Vanburen', 'vanburen.hassan@yahoo.com', '482677795', 'Rue De Boneffe 283', 'Looking to create engaging videos? Need content that stands out? These 3 Amazing AI Tools can help: \r\n**Create videos in minutes  \r\n**Generate amazing content  \r\n**Convert text into speech  \r\nExperience effortless content creation with AI! http://3amazingaitools.top/', 1, '2025-03-31 22:56:54', '2025-03-31 22:56:54'),
(215, NULL, 'Jessica Langdon', 'jessicalangdon01@gmail.com', '4039236848', '3070 Maynard Rd', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nJess', 1, '2025-04-02 00:40:51', '2025-04-02 00:40:51'),
(216, NULL, 'Dinah Wand', 'wand.dinah@googlemail.com', '651534967', 'Nachtegaalslaantje 104', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 1, '2025-04-02 20:45:06', '2025-04-02 20:45:06'),
(217, NULL, 'Maryjo Drum', 'drum.maryjo@gmail.com', '337567477', 'Landstrasse 97', 'People trust brands they see in the media. If your business isn’t featured, customers might choose someone else. Get noticed now: http://superchargeyourprandmarketing.top/', 1, '2025-04-04 04:10:56', '2025-04-04 04:10:56'),
(218, NULL, 'Steve Cullen', 'steve@consumerprodemail.com', '887900126', '55 Main Street', 'Hello, I\'m Steve Cullen with Consumer Products International ( https://www.consumerproductsintl.com ).\r\n\r\nAt CPI, we specialize in helping domestic and international consumer brands expand their reach in the US market. With decades of experience and billions in generated revenue, we offer a comprehensive solution for manufacturers looking to enter or grow in America\'s consumer market.\r\n\r\nOur services include:\r\n* Distribution to major retailers (C-Stores, Food/Drug/Mass, Home Centers, Online)\r\n* FDA/Regulatory guidance\r\n* Sales and marketing support (TV, Public Relations Campaigns)\r\n* Warehousing and logistics\r\n\r\nWe pride ourselves on our turnkey approach and ability to quickly bring products to market. Our team\'s expertise and established relationships with national and regional retail chains give your brand a competitive edge.\r\n\r\nTo discuss how we can help your brand succeed in the US market, please contact us or schedule a call at https://calendly.com/stevecullen-nutricompanyinc/15-minute-call-cpi \r\n\r\nBest regards,\r\nSteve Cullen\r\nConsumer Products International', 1, '2025-04-04 13:12:32', '2025-04-04 13:12:32');
INSERT INTO `client_messages` (`id`, `product_id`, `name`, `email`, `phone`, `address`, `message`, `status`, `created_at`, `updated_at`) VALUES
(219, NULL, 'Genie Lyke', 'genie.lyke@gmail.com', '3482461649', 'Via Colonnello Galliano 150', 'Dan Kennedy often uses a simple analogy to illustrate a common marketing mistake:\r\n\r\nImagine walking into a store and being swarmed by a salesperson who starts pitching everything they sell—refrigerators, running shoes, blenders—without once asking what you’re actually looking for. It’s frustrating, ineffective… and exactly what most businesses do in their marketing.\r\n\r\nInstead of speaking directly to prospects’ specific needs or concerns, most businesses blast the same generic message to everyone. And according to Dan, that’s a surefire way to water down your impact—and your profits.\r\n\r\nHe points to Weight Watchers as a prime example.\r\n\r\nThey serve two distinct types of customers:\r\n\r\nHealth Buyers – motivated by medical reasons, like a doctor’s orders or an upcoming surgery.\r\n\r\nEvent-Driven Buyers – focused on short-term goals, like fitting into a dress for a wedding or looking good for a vacation.\r\n\r\nThese two audiences have completely different motivations. One wants to avoid a health crisis. The other wants to feel confident on the beach. But for years, Weight Watchers hesitated to segment their leads and tailor their message accordingly—despite the fact that segmentation could’ve easily doubled their effectiveness.\r\n\r\nAnd this issue isn’t limited to weight loss companies.\r\n\r\nAt Magnetic Marketing, Dan Kennedy and his team have identified seven distinct interest categories among their audience—from wealth attraction to direct marketing and beyond. If they tried to send one message to all seven groups, they’d fail to deeply connect with any of them.\r\n\r\nDan compares this to politics: voters often care about one primary issue. Your leads are no different. Some are driven by fear. Others by ambition. And others by a very specific short-term goal.\r\n\r\nConsider three different prospects in the finance space:\r\n\r\nOne fears running out of money in retirement.\r\n\r\nAnother wants to protect wealth for their grandchildren.\r\n\r\nA third wants to maximize investment returns.\r\n\r\nA single message trying to appeal to all three ends up resonating with none of them.\r\n\r\nThat’s why segmentation is so powerful—and profitable.\r\n\r\nBy tailoring messages to meet prospects where they are mentally and emotionally, businesses instantly build trust, create relevance, and position themselves as the only solution that truly gets the customer.\r\n\r\nDan outlines a simple framework for doing this:\r\n\r\n1.Use a Self-Select Mechanism\r\nAsk your audience questions like:\r\n“Are you looking to grow your wealth?”\r\n“Do you want to protect your assets for your family?”\r\n\r\n2.Tailor the Follow-Up\r\nOnce they identify their concern, follow up with stories, testimonials, and offers that directly address it.\r\n\r\n3.Watch Response Rates Soar\r\nA personalized message turns cold leads into warm conversations—and buyers.\r\n\r\nDan stresses this strategy works in every industry. He’s seen it boost performance in colleges, financial firms, info-product businesses, and even local service providers.\r\n\r\nTake colleges, for example. A dad wants to know his kid will get a job after graduation. A mom wants safety and solid food options. The student just wants to know they’ll make friends. Smart schools speak directly to each one—and enrollment improves dramatically.\r\n\r\nIf segmentation sounds like a mystery to you, Dan lays it all out in plain English in The No B.S. Guide to Direct Marketing. In it, he reveals:\r\n\r\nThe art of message-to-market match—how to say the right thing to the right people.\r\n\r\nHow to build self-select mechanisms that get prospects to reveal what they want—without a survey.\r\n\r\nHis exact process for creating segmented campaigns that maximize every dollar spent.\r\n\r\n������ Click Here to Claim Your FREE Copy of The No B.S. Guide to Direct Marketing + $6,193 in Exclusive Bonuses:\r\n\r\nhttps://marketersmentor.com/direct-marketing-book.php?refer=alifinefoods.com&real=yes\r\n\r\nDan Kennedy has watched businesses transform overnight simply by getting smarter with how they segment and speak to their audience.\r\n\r\nDon’t waste another marketing dollar talking to everyone. Start speaking to someone—the right someone—and watch your results soar.\r\n\r\nDedicated to Multiplying Your Income,\r\n\r\nGenie\r\n\r\nP.S. Dan always reminds his clients:\r\nWhoever can spend the most to acquire a customer—wins.Segmentation helps you do just that… profitably.\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=alifinefoods.com&real=yes', 1, '2025-04-09 21:04:57', '2025-04-09 21:04:57'),
(220, NULL, 'Geoffrey Skertchly', 'skertchly.geoffrey@googlemail.com', '629206978', 'Schuepisstrasse 49', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com\r\n\r\nStruggling to rank on Google? Our SEO experts can help. Contact es.olus@gmail.com', 1, '2025-04-10 16:37:12', '2025-04-10 16:37:12'),
(221, NULL, 'Donnie Newport', 'newport.donnie@yahoo.com', '7857834353', '59 Seaford Road', 'Hi there,\r\n\r\nWe wanted to introduce you to a revolutionary system that helps you create AI-powered tools to generate steady, qualified leads without paid advertising.\r\n\r\nKey benefits:\r\n\r\nCreate AI tools in minutes with simple copy/paste templates \r\nDrive free, targeted traffic to any niche or offer  \r\nBuilt-in call-to-action system to funnel leads to your sales pages \r\nNo coding or technical experience needed\r\n\r\nWe\'re currently offering a special launch price of $17 (regular $97) which includes bonus training on traffic generation and AI monetization.\r\n\r\nFor more details, check out: https://furtherinfo.info/etb\r\n\r\nThanks,\r\nDonnie', 1, '2025-04-12 03:07:16', '2025-04-12 03:07:16'),
(222, NULL, 'Dexter Dawe', 'dawe.dexter@gmail.com', '6440352655', 'Hollander Strasse 61', 'Maximize Profits & Get More Clients – FREE!  \r\n\r\n������ Stand out with a Business Credentials Report  \r\n������ Convert more leads with instant credibility  \r\n������ Rank higher on Google & increase sales  \r\n������ 100% Free – No Credit Card Required!  \r\n\r\nDon’t lose customers to unverified competitors!  \r\nJoin today at https://vettedprobusiness.my/', 1, '2025-04-14 12:54:58', '2025-04-14 12:54:58'),
(223, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', '4033219826', '2745 Galts Ave', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=alifinefoods.com', 1, '2025-04-16 09:59:23', '2025-04-16 09:59:23'),
(224, NULL, 'Lonna Cormack', 'lonna.cormack@msn.com', '200360721', '74 Rue Des Six Freres Ruellan', 'Dan Kennedy has seen it time and again—businesses, from small shops to multi-billion-dollar giants, making the same costly mistake: treating advertising, marketing, and sales as three separate, disconnected silos.\r\n\r\nAdvertising is outsourced to an agency. Marketing is tossed to an in-house team that often lacks real direct response chops. And sales? It’s left to operate on its own, often finding out about ad campaigns only after seeing them online or in a magazine.\r\n\r\nDan calls it what it is: an inefficient, expensive mess. And it’s more common than you’d think.\r\n\r\nHere’s the real problem with this disconnected approach:\r\n\r\nWhen advertising and marketing flood the funnel with unqualified leads, it doesn’t just waste money—it drives away your best closers. Instead of focusing on selling, they’re buried in garbage leads. Frustrated and underused, your top performers don’t stick around. They take their talent elsewhere, and you’re left with a mediocre team struggling to hit quota.\r\n\r\nDan Kennedy says the solution is simple—but rarely implemented: Integration.\r\n\r\nYour advertising, marketing, and sales efforts must work in harmony. When they do, your sales team can focus exclusively on what they do best—closing deals.\r\n\r\nHere’s how Dan recommends structuring the process:\r\n\r\nLead Generation brings in only high-quality, pre-qualified prospects.\r\n\r\nMarketing nurtures those leads, building trust and guiding them toward the buying decision.\r\n\r\nSales swoops in at the right moment to close, onboard, and potentially upsell or retain.\r\n\r\nDan often compares it to a world-class hospital. If you’re the Cleveland Clinic, you don’t have your top heart surgeon giving community lectures, screening patients, or sweeping floors. You want them in the operating room doing what only they can do—saving lives.\r\n\r\nThe same logic applies to your sales team.\r\nYour closers should be doing one thing: closing. Not chasing cold leads. Not doing follow-ups. Not dialing dead-end phone numbers. That’s a waste of elite talent.\r\n\r\nTo build a business like this, Dan emphasizes one core principle: start with the end in mind.\r\n\r\nAsk yourself:\r\n\r\nWhat does the ideal, sales-ready lead look like?\r\n\r\nWhat marketing process gets them to that point?\r\n\r\nWhat lead gen strategy attracts those people in the first place?\r\n\r\nOnce you have the answers, you reverse-engineer the system. That’s how you create a high-performance machine—where every part fuels the next, and your best people are doing their highest-value work.\r\n\r\nIf this approach resonates with you—and you’re ready to eliminate the disconnect in your business—Dan Kennedy lays it all out in his book,\r\n“The NO B.S. Direct Marketing for Non-Direct Marketing Businesses.”\r\n\r\n������ Click Here to Claim Your FREE Copy and Unlock Over $6,193 in Bonuses\r\nhttps://marketersmentor.com/direct-marketing-book.php?refer=alifinefoods.com&real=yes\r\n\r\nHere’s what you’ll get when you order today:\r\n\r\nThe Direct Marketing Toolkit – a playbook for building a system that unites lead gen, marketing, and sales.\r\n\r\n4-Hour Elite Marketing Intensive – featuring 21 of the world’s top marketers revealing their #1 ROI-driving strategy.\r\n\r\nClick here to get everything now →\r\nhttps://marketersmentor.com/direct-marketing-book.php?refer=alifinefoods.com&real=yes\r\n\r\nDedicated to Multiplying Your Income,\r\nLonna\r\n\r\nP.S. Dan always says:\r\nWhoever can spend the most money to acquire a customer—wins.\r\nAn integrated system helps you do that with precision and profitability.\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=alifinefoods.com&real=yes', 1, '2025-04-19 16:04:37', '2025-04-19 16:04:37'),
(225, NULL, 'Gary Charles', 'gary.charles@dominatingkeywords.com', '8054002077', '275 East Hillcrest Drive 160-169', 'Let me demonstrate to you how you can get guaranteed thousands of clicks to your website without SEO and without Pay Per Click.\r\nYou will start getting keyword targeted traffic in less than 48 hours.\r\nJust send us your keywords and we\'ll tell you how much monthly clicks we can guarantee without paying for each click and waiting for SEO results.\r\nYou will get exclusive ownership of keywords you choose for flat fee (no Pay Per Click)...', 1, '2025-04-20 23:50:56', '2025-04-20 23:50:56'),
(226, NULL, 'Kiera Sutton', 'sutton.kiera@gmail.com', '255480476', '24 Avenue Millies Lacroix', 'LIMITED TIME OFFER: MOZ DA 40 @ $39 - contact now at intrug@gmail.com\r\n\r\nWe improve MOZ  Domain authority 30+ in 15 Days its help to improve google rank, improve your website SEO, and you get traffic from google \r\n\r\nDA - 0 to 30 - (Only $29) - Yes, Limited time !!\r\n\r\n>> 100% Guarantee \r\n>> Improve Ranking \r\n>> White Hat Process \r\n>> Permanent Work\r\n>> 100% Manual Work \r\n>> 0% Spam score increase \r\n\r\n\r\n⚡ From our work your website keyword get rank on google and get organic traffic from google through keywords\r\n\r\nContact now: intrug@gmail.com or Visit us Now : https://open247.chat/DA/\r\n\r\nLIMITED TIME OFFER: MOZ DA 40 @ $39 - contact now at intrug@gmail.com', 1, '2025-04-23 18:36:59', '2025-04-23 18:36:59'),
(227, NULL, 'Violette Houle', 'houle.violette@yahoo.com', '692751964', 'Zocherstraat 14', 'Hey,\r\n\r\nThere’s a reason smart marketers keep this on their morning reading list.\r\n\r\nIt’s not flashy.\r\nIt’s not some “get-rich-quick” garbage.\r\nBut it’s real. Tactical. Sharp. No fluff.\r\n\r\nFor $1, I got access to insights I’d pay hundreds for.\r\nThings I now actually use in my business.\r\n\r\nYou won’t see this promoted by big-name gurus.\r\nAnd maybe that’s why it works so well.\r\n\r\n������ Click here to see what it’s all about:\r\n\r\nhttps://marketersmentor.com/dan-kennedy.php?refer=alifinefoods.com&real=yes\r\n\r\nYou’ll see what I mean.\r\nViolette\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=alifinefoods.com&real=yes', 1, '2025-04-24 02:23:49', '2025-04-24 02:23:49'),
(228, NULL, 'Anna Vigano', 'vigano.anna@gmail.com', '2142445726', 'Praca Monteiro Baena 792', 'We are currently seeking companies like yours for a potential long-term partnership. Could you kindly share your product offerings along with pricing details? Please  contact me on WhatsApp: +44 7404 788 963', 1, '2025-04-26 08:37:02', '2025-04-26 08:37:02'),
(229, NULL, 'Jade', 'info@jade.caredogbest.com', '608327952', 'Zielona Gora', 'Good day \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF: https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nThe Best, \r\n\r\nJade', 1, '2025-04-26 14:41:24', '2025-04-26 14:41:24'),
(230, NULL, 'Terrence', 'info@olszewski.easerelief.net', '8241839661', 'Buchloe', 'EASE YOUR PAIN IN 10 MINUTES EFFORTLESSLY\r\n\r\nBe Free from sore muscles and joint pain\r\nTry FitRx Wireless Massager & Relieve YOUR Pain Effortlessly In 10 Min!\r\nSave 50% OFF + FREE Priority Shipping\r\n\r\nShop Now: https://EaseRelief.net\r\n\r\nAll the best, \r\n\r\nTerrence', 1, '2025-04-29 19:26:14', '2025-04-29 19:26:14'),
(231, NULL, 'Merlin AI dax', 'risic1497@gazeta.pl', '87183386567', 'https://www.getmerlin.in/chat?ref=nwuxm2n', '- Merlin AI – Your Universal Assistant for Work, Study, and Creativity! ??? \r\n- Merlin is a powerful AI aggregator combining ChatGPT, Claude, DeepSeek, Gemini, Llama, and other top AI models. Now available without VPN for seamless access worldwide! \r\n \r\n-  What Can Merlin AI Do? \r\nText Generation – Create articles, posts, resumes, and marketing materials in seconds! \r\nCode Writing – From simple scripts to complex algorithms, bug fixing, and optimization. \r\nImage Generation – Design unique artwork, logos, and creative concepts. \r\nData Analysis – Structure information, make predictions, and process large datasets. \r\nTranslations & Text Processing – Instant translation into dozens of languages, SEO-friendly text creation. \r\nAI Bot Creation – Develop personalized assistants that handle specific tasks. \r\nBrowser Integration – Instantly analyze web pages and generate content directly in your browser! \r\nhttps://www.getmerlin.in/chat?ref=nwuxm2n \r\n \r\n- Why Choose Merlin? \r\nAll top AI models in one service – ChatGPT, Claude, Gemini, and more. \r\nNo VPN required – Work freely without restrictions or complicated setups. \r\nAffordable access – A fraction of the cost compared to individual AI subscriptions! \r\nConvenient mobile apps – Available on Android and iOS in Russian stores. \r\nFree trial – Message us and try Merlin AI for free! \r\nTry Merlin AI now! Click here and unlock new possibilities with artificial intelligence! ?? \r\n \r\nSign up and get free generations: https://www.getmerlin.in/chat?ref=nwuxm2n \r\n \r\n#MerlinAI #ArtificialIntelligence #AI #ChatGPT #Automation \r\n \r\n \r\n- Merlin AI – Твой универсальный помощник для работы, учебы и творчества! ??? \r\n- Merlin – это мощный агрегатор нейросетей, объединяющий ChatGPT, Claude, DeepSeek, Gemini, Llama и другие топовые AI. Теперь доступ без VPN прямо из России! ???? \r\n- Что умеет Merlin AI? \r\nГенерация текстов – статьи, посты, резюме, рекламные материалы за секунды! \r\nНаписание кода – от простых скриптов до сложных алгоритмов, исправление багов и оптимизация. \r\nГенерация изображений – создавай уникальные арты, логотипы, концепты. \r\nАнализ данных – структурируй информацию, делай прогнозы и анализируй большие объемы данных. \r\nПереводы и работа с текстами – мгновенный перевод на десятки языков, создание SEO-текстов. \r\nСоздание AI-ботов – персонализированные ассистенты, выполняющие нужные задачи. \r\nИнтеграция с браузером – моментальный анализ веб-страниц и генерация контента прямо в браузере! \r\n \r\n- Почему выбирают Merlin? \r\nВсе топовые нейросети в одном сервисе – ChatGPT, Claude, Gemini и другие. \r\nБез VPN – работай без ограничений и сложных настроек. \r\nДоступ в 10 раз дешевле – подписка от 2400 ?/мес вместо сотен долларов! \r\nУдобные приложения – доступно на Android и iOS в российских магазинах. \r\nБесплатный тест – напиши нам и попробуй Merlin AI бесплатно! \r\nПопробуй Merlin AI прямо сейчас! https://www.getmerlin.in/chat?ref=nwuxm2n и открой новые возможности с искусственным интеллектом! ?? \r\n \r\nРегистрация и бесплатные генерации: https://www.getmerlin.in/chat?ref=nwuxm2n \r\n \r\n \r\n \r\nЕсли у вас сложности с оплатой из РФ, то пишите: https://roboex.tilda.ws/ \r\n \r\n#MerlinAI #ИскусственныйИнтеллект #Нейросети #ChatGPT #Автоматизация', 1, '2025-04-29 22:40:39', '2025-04-29 22:40:39'),
(232, NULL, 'Mitch Gould', 'mgould@cpicompanymail.com', '15615440719', '32 Browning Lane', 'Dear Brand Owner,\r\n\r\nIn today\'s competitive market, getting your products onto store shelves shouldn\'t be complicated. Whether you\'re a U.S. startup or an international brand looking to expand, our team at Consumer Products International ( https://www.consumerproductsintl.com ) provides the complete solution you need:\r\n\r\n\r\n* Direct connections to major retailers across all channels\r\n* End-to-end logistics and regulatory compliance\r\n* Marketing that drives consumer demand\r\n* Specialized import/export solutions\r\n\r\n\r\nOur turnkey approach eliminates middlemen, reduces costs, and accelerates your time to market—resulting in higher margins and faster growth.\r\nReady to transform your retail strategy? Let\'s talk.\r\n\r\nhttps://calendly.com/mgould-npi-cpi/15-minutes\r\n\r\nKind Regards,\r\nMitch Gould', 1, '2025-04-30 12:54:01', '2025-04-30 12:54:01'),
(233, NULL, 'Monica Gyday', 'stephaniebuvona@gazeta.pl', '83194771287', 'https://monica.im/invitation-affiliate?ref=ztk2ymi&ref_aff=ztk2ymi', '— Monica  – Your Ultimate AI Assistant for Every Task! \r\nLooking for a way to boost productivity and streamline your daily tasks? Monica.im is your all-in-one AI assistant, integrating top-tier AI models like OpenAI o1-preview, GPT-4o, Claude 3.5, and Gemini 1.5. It helps you with communication, research, writing, and even coding—all accessible through a browser extension for Chrome and Edge, as well as mobile apps for Android and iOS. (monica.im) \r\n \r\n—  Key Features of Monica (https://monica.im/invitation-affiliate?ref=ztk2ymi&ref_aff=ztk2ymi \r\n \r\nAI Chat: Interact with leading AI models in one place. \r\nAI Summarizer: Save up to 90% of your time by instantly summarizing web pages and videos. \r\nAI Writer: Generate or enhance any content 10x faster, from short paragraphs to full-length articles. \r\nAI Search: A powerful search engine with real-time access to the latest information. \r\nAI Translator: Translate entire web pages for seamless bilingual reading. \r\nAI Art Generator: Turn your ideas into stunning images effortlessly. \r\n \r\n—  Why Choose Monica? \r\n \r\nAvailable Across All Platforms: Use Monica on browsers, desktops, or mobile devices. \r\nIntelligent Toolbar: Quickly explain, translate, or summarize any highlighted text. \r\nWriting Assistant: Create, rewrite, or improve text content on any webpage. \r\nEnhanced Web Experience: Get AI-powered answers alongside search results, summarize YouTube videos, and extract key insights with timestamps. \r\n— Start Boosting Your Productivity Today with Monica https://monica.im/invitation-affiliate?ref=ztk2ymi&ref_aff=ztk2ymi) \r\n \r\n— Install for Free: https://monica.im/invitation-affiliate?ref=ztk2ymi&ref_aff=ztk2ymi', 1, '2025-05-06 22:35:05', '2025-05-06 22:35:05'),
(234, NULL, 'Tony Phan', 'sales5@exportvn.com', '84347678416', 'Vietnam', 'Dear Valued Customer,\r\n\r\nThis is Tony from EXPORTVN Modified Starch, specializing in providing cassava (tapioca) starch for sauce products.\r\nWe have exported to over 22 countries \r\nQuality certificates: FSSC, ISO, HACCP, Halal, and Kosher.\r\nLooking forward to cooperating with your company.\r\n\r\nBest regards,\r\nTony Phan (Mr.)\r\n\r\nEmail: sales5@exportvn.com\r\nMob/ WhatsApp: (+84)347678416', 1, '2025-05-13 02:50:23', '2025-05-13 02:50:23'),
(235, NULL, 'Mike Klaus Hoffmann', 'info@speed-seo.net', '85462979246', 'https://www.speed-seo.net/check-site-seo-score/', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Klaus Hoffmann\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', 1, '2025-05-14 04:19:20', '2025-05-14 04:19:20'),
(236, NULL, 'Gary Charles', 'gary.charles@dominatingkeywords.com', '8054002077', '275 East Hillcrest Drive', 'Let me demonstrate to you how you can get guaranteed thousands of clicks to your website without SEO and without Pay Per Click.\r\nYou will start getting keyword targeted traffic in less than 48 hours.\r\nJust send us your keywords and we\'ll tell you how much monthly clicks we can guarantee without paying for each click and waiting for SEO results.\r\nYou will get exclusive ownership of keywords you choose for flat fee (no Pay Per Click)...', 1, '2025-05-23 01:17:01', '2025-05-23 01:17:01'),
(237, NULL, 'Aggregator.top', 'aggregator.top@gmail.com', '86319466234', 'https://aggregator.top/', 'Агрегатор.Топ – независимые гарантии, сравнение цен в один клик от 70+ банков РФ и 6 Международных банков-партнеров. \r\n \r\nСайт https://aggregator.top', 1, '2025-06-09 09:35:08', '2025-06-09 09:35:08'),
(238, NULL, 'Jonathan Mayon', 'hacked@alifinefoods.com', '7887270953', '93 Wern Ddu Lane', 'We have hacked your website https://alifinefoods.com and extracted your databases.\r\n\r\nHow did this happen?\r\n\r\nOur team has found a vulnerability within your site that we were able to exploit. After finding the vulnerability we were able to get your database credentials and extract your entire database and move the information to an offshore server.\r\n\r\nWhat does this mean?\r\n\r\nWe will systematically go through a series of steps of totally damaging your reputation. First your database will be leaked or sold to the highest bidder which they will use with whatever their intentions are. Next if there are e-mails found they will be e-mailed that their information has been sold or leaked and your site https://alifinefoods.com was at fault thusly damaging your reputation and having angry customers/associates with whatever angry customers/associates do. Lastly any links that you have indexed in the search engines will be de-indexed based off of blackhat techniques that we used in the past to de-index Our targets.\r\n\r\nHow do i stop this?\r\n\r\nWe are willing to refrain from destroying your site\'s reputation for a small fee. The current fee is $5000 in bitcoins (0.043 BTC).\r\n\r\nSend the bitcoin to the following Bitcoin address (Make sure to copy and paste):\r\n\r\n bc1qel7v90m26e98a2mlgka5t2087wxk733ssv6u7h \r\n\r\nOnce you have paid we will automatically get informed that it was your payment. Please note that you have to make payment within 5 days after receiving this e-mail or the database leak, e-mails dispatched, and de-index of your site WiLL start!\r\n\r\nHow do i get Bitcoins?\r\n\r\nYou can easily buy bitcoins via several websites or even offline from a Bitcoin-ATM.\r\n\r\nWhat if i don\'t pay?\r\n\r\nWe will start the attack at the indicated date and uphold it until you do, there\'s no counter measure to this, you will Only end up wasting more money trying to find a solution. We will completely destroy your reputation amongst google and your customers.\r\n\r\nThis is not a hoax, do not reply to this email, don\'t try to reason or negotiate, we will not read any replies. Once you have paid we will stop what we were doing and you will never hear from us again!\r\n\r\nPlease note that Bitcoin is anonymous and no one will find out that you have complied.', 1, '2025-07-18 11:44:04', '2025-07-18 11:44:04'),
(239, NULL, 'Renee', 'info@ragland.easerelief.net', '413077488', 'Muotathal', 'EASE YOUR PAIN IN 10 MINUTES EFFORTLESSLY\r\n\r\nBe Free from sore muscles and joint pain\r\nTry FitRx Wireless Massager & Relieve YOUR Pain Effortlessly In 10 Min!\r\nSave 50% OFF + FREE Priority Shipping\r\n\r\nShop Now: https://EaseRelief.net\r\n\r\nKind Regards, \r\n\r\nRenee', 1, '2025-07-31 15:09:45', '2025-07-31 15:09:45'),
(240, NULL, 'Gary Miller', 'garymiller@dominatingkeywords.com', '8054002077', '275 East Hillcrest Drive 160-169', 'I am not offering SEO or Pay Per Click Advertising services. This is something entirely different. Simply send us your desired keywords, and your website will instantly appear at the top of Google and Bing search results, without any Pay Per Click charges. Let me demonstrate to you how it works and you\'ll be pleasantly surprised by the results.', 1, '2025-08-20 02:52:22', '2025-08-20 02:52:22'),
(241, 122, 'Afiya tonoya', 'Uniqueornamentsbymukta@gmail.com', '01984546446', 'South keranigonj standbazar', 'I want to order this', 1, '2025-09-05 08:43:10', '2025-09-05 08:43:10'),
(242, NULL, 'Geoffrey', 'info@alifinefoods.com', '51627013', 'Guldborg', 'Good Morning \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF:  https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nKind Regards, \r\n\r\nGeoffrey', 1, '2025-09-05 10:56:20', '2025-09-05 10:56:20'),
(243, NULL, 'Rick Stephens', 'rick-stephens@dominatebanners.com', '8054002077', '275 East Hillcrest Drive', 'We can place your website on top position in search engines without PPC.\r\nJust fill Online Quote form on our website or send us your keywords and you\'ll get minimum amount of traffic that our technology can guarantee.\r\nDo online demo on our website and see how your website will appear on top of search engines.', 1, '2025-10-09 09:36:47', '2025-10-09 09:36:47'),
(244, NULL, 'Gary Charles', 'gc@dominatingkeywords.com', '8054002077', '275 East Hillcrest Drive', 'I am not offering SEO or Pay Per Click Advertising. This is something entirely different. Simply send us your desired keywords, and your website will instantly appear at the top of Google and Bing search results, without any Pay Per Click charges. You\'ll be pleasantly surprised by the results.', 1, '2025-10-24 21:23:17', '2025-10-24 21:23:17'),
(245, NULL, 'Modesta Colburn', 'modesta.colburn73@googlemail.com', '9151352805', 'Luebeckertordamm 55', 'Here is my site: https://submissiontodirectory.top/', 1, '2025-11-15 22:01:43', '2025-11-15 22:01:43'),
(246, NULL, 'Thomas Walker', 'thomas.walker@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'Our program gets your brand visible in top search results right away - no waiting months for SEO.\r\nWould tomorrow work for a short call?', 1, '2025-11-18 06:46:31', '2025-11-18 06:46:31'),
(247, NULL, 'Eric Warren', 'eric.warren@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'We place your business right where people are already searching for your services - setup usually takes less than 24 hours.\r\nWhat is the best way to reach you?', 1, '2025-11-27 13:40:51', '2025-11-27 13:40:51'),
(248, NULL, 'Shane Dellinger', 'shane@zundee.com', '3259427587', 'Via Antonio Da Legnago 21', 'All the companies in World - Database Special - $29\r\n\r\nThe Database:\r\n\r\n    25 Million Companies Worldwide\r\n    Instantly Delivery\r\n    Last Update: 17 November 2025\r\n    All Their phones, emails, locations, industries, across the entire world!\r\n\r\nCost:\r\n\r\n    All prices are charged in South African Rand (conversion is automatic).\r\n    Total once off cost is : $29 = R495\r\n\r\nQuestions?\r\n\r\nYou can email us on info@zundee.com\r\n\r\n\r\nVisit us here for instantly delivery: https://Shane.zundee.com', 1, '2025-12-01 10:57:13', '2025-12-01 10:57:13'),
(249, NULL, 'Ahmetsox', 'morrismi1@outlook.com', '86728598485', 'https://www.no-site.com', 'I\'m Ahmet, a bank staff in a Turkish bank. I\'ve been looking for someone who has the same nationality as you. A citizen of your country died in the recent earthquake in Turkey, he had in our bank fixed deposit of $11.5 million. \r\n \r\nIf my bank executive finds out about his death ,They would use the funds for themselves, I would like to prevent that from happening only if I get your cooperation, I knew about it because I was his account manager. Last week my bank held a meeting for the purpose of a bank audit to note abandoned deposit accounts. that\'s why I\'m looking for a solution to deal with this situation because if my bank discovers his death, they will divert the funds to the board of directors.  I don\'t want that to happen. \r\n \r\nI request your cooperation to introduce you as the kin/heir of the account as you are of the same nationality as him.  There is no risk;  the transaction is carried out under a legal agreement that protects you from infringement. I suggest we split the funds, 60/40 and 40 for me. I need this fund for my daughter\'s surgery so keep this info confidential. email me so i can provide you with more info  ahmetassky@outlook.com.', 1, '2025-12-06 17:53:34', '2025-12-06 17:53:34'),
(250, NULL, 'Joseph Matthews', 'joseph.matthews@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'If customers are searching for what you offer, your business should show up first. We can make that happen within a day.\r\nWant to see how easy it is?', 1, '2025-12-22 02:02:43', '2025-12-22 02:02:43'),
(251, NULL, 'Shani Gwendolen', 'shani@marketing2.cfd', '4662598', 'Ranargata 99', 'Hi\r\n\r\nTired of spending money on marketing? Lets start 2026 the right way.\r\n\r\n1. Find your competitors\r\n2. Receive their clients\r\n3. Make Money\r\n\r\nWhy do this?\r\nBecause of advertising practices of major platforms like Google, Facebook, and YouTube.\r\n\r\nIt seems quite frustrating that these companies charge advertisers repeatedly for the same leads, especially when they clearly understand the market dynamics.\r\n\r\nIn contrast, we believe in transparency and fair competition. We provide our clients with access to customer data previously purchased by others, they receive details about leads that would have otherwise cost them thousands. \r\n\r\nPlus, we offer daily updates for a month, ensuring they stay informed about their competitive landscape at no extra cost. \r\n\r\nVisit us for a free sample!\r\nhttps://Shani.marketing2.cfd?domain=alifinefoods.com', 1, '2026-01-03 04:53:00', '2026-01-03 04:53:00'),
(252, NULL, 'William Grant', 'william.grant@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'We make it easy for your business to be seen first and chosen first. You pick the keywords, and we put your banner at the top of search results - usually live within 24 hours.\r\n\r\nNo contracts, no long setup - just traffic and visibility.\r\nWould you like me to prepare a few keyword options for your business?', 1, '2026-01-05 09:09:00', '2026-01-05 09:09:00'),
(253, NULL, 'Herman Fredericksen', 'info@aisoftwaremarketing.com', '499358012', 'Molenstraat 235', 'Hi,\r\n\r\n\r\n\r\nThis is Herman from CloudwowX.\r\n\r\n\r\n\r\nI’m reaching out to request a short 30-minute virtual demo meeting with the Director or decision-maker at your company.\r\n\r\n\r\n\r\nWe help businesses increase income and generate more clients by implementing practical AI systems that automate lead capture and follow-ups. This includes AI chat systems, WhatsApp automation, and AI-powered callers that automatically qualify potential clients.\r\n\r\n\r\n\r\nThe meeting is simply a short demonstration to show the software in action and explore how it could realistically benefit your business. There is no obligation.\r\n\r\n\r\n\r\nIf you’re open to taking a look, you can book a time directly here:\r\n\r\n\r\nhttps://calendly.com/cloudwowx/demo\r\n\r\n\r\n\r\nKind regards,\r\n\r\n\r\nHerman\r\n\r\n\r\nproposal@cloudwowx.com\r\n\r\nCloudwowX\r\nhttps://www.cloudwowx.com', 1, '2026-01-24 14:31:13', '2026-01-24 14:31:13'),
(254, NULL, 'Herman Slattery', 'info@aisoftwaremarketing.com', '6044378011', '2689 Tanner Street', 'Hi,\r\n\r\n\r\n\r\nThis is Herman from CloudwowX.\r\n\r\n\r\n\r\nI’m reaching out to request a short 30-minute virtual demo meeting with the Director or decision-maker at your company.\r\n\r\n\r\n\r\nWe help businesses increase income and generate more clients by implementing practical AI systems that automate lead capture and follow-ups. This includes AI chat systems, WhatsApp automation, and AI-powered callers that automatically qualify potential clients.\r\n\r\n\r\n\r\nThe meeting is simply a short demonstration to show the software in action and explore how it could realistically benefit your business. There is no obligation.\r\n\r\n\r\n\r\nIf you’re open to taking a look, you can book a time directly here:\r\n\r\n\r\nhttps://calendly.com/cloudwowx/demo\r\n\r\n\r\n\r\nKind regards,\r\n\r\n\r\nHerman\r\n\r\n\r\nproposal@cloudwowx.com\r\n\r\nCloudwowX\r\nhttps://www.cloudwowx.com', 1, '2026-01-24 21:58:19', '2026-01-24 21:58:19'),
(255, NULL, 'Nathaniel Brooks', 'nathaniel.reid@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'We place your business directly in front of people already searching for what you sell - and it\'s live within 24 hours.\r\nWould you like me to show you a quick demo?', 1, '2026-02-02 01:45:11', '2026-02-02 01:45:11'),
(256, NULL, 'Mike Joshua Brown', 'info@professionalseocleanup.com', '88128948855', 'https://www.professionalseocleanup.com/', 'Hi, \r\nWhile reviewing alifinefoods.com, we spotted toxic backlinks that could put your site at risk of a Google penalty. Especially that this Google SPAM update had a high impact in ranks. This is an easy and quick fix for you. Totally free of charge. No obligations. \r\n \r\nFix it now: \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nNeed help or questions? Chat here: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nBest, \r\nMike Joshua Brown\r\n \r\n+1 (855) 221-7591 \r\ninfo@professionalseocleanup.com', 1, '2026-02-02 02:42:34', '2026-02-02 02:42:34'),
(257, NULL, 'Richard Lawson', 'richard.lawson@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'Imagine showing up first every time someone searches for your type of service - that\'s exactly what our keyword-based advertising system does.\r\nSetup is fast (about 24 hours), and traffic comes straight to your website.\r\nCan we schedule a quick call to review some keywords that would work best for you?', 1, '2026-02-03 13:33:24', '2026-02-03 13:33:24'),
(258, NULL, 'Connie', 'email@econoemail.com', '512-580-9139', '401 East Sonterra Boulevard Ste 375', 'Hi this is Connie, my boss asked me to reach out.\r\n\r\nHave you heard of the FICA Tips Credit?\r\n\r\nIt\'s a new gov tax incentive program - a refund you can claim.\r\n\r\nEssentially you can get back a huge chunk of the FICA money paid on tips you pay out through payroll. Up to 5 years of it.\r\n\r\nFor free, my boss will calculate how much you can get and help you get it if you choose to.\r\n\r\nIf interested, send an email with \"YES\" and I\'ll email back the next step.\r\n\r\nEmail me here:\r\nconnie@econoemail.com\r\n\r\n\r\nBest,\r\n\r\nConnie\r\n\r\n\r\n\r\n\r\n\r\n401 East Sonterra Boulevard Ste 375 San Antonio, TX 78258\r\nTo unsubscribe/remove your website from receiving messages, click this link and follow the instructions:\r\nhttps://docs.google.com/forms/d/e/1FAIpQLSdhKwM0TZQnZDWrMIpst3Zouy8h7yfN656z4l2ZhCR0VKmuYg/viewform?usp=pp_url&entry.1607426182=alifinefoods.com', 1, '2026-02-13 16:49:44', '2026-02-13 16:49:44'),
(259, NULL, 'Marcus Palmer', 'marcus.palmer@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'We help businesses dominate their local market online by showing up first in search results - live within 24 hours.\r\nIt\'s quick, measurable, and flexible - you can change or test new keywords anytime for free.\r\nLet\'s set up a short 10-minute call so I can show you the setup and traffic estimates for your niche.', 1, '2026-02-24 11:25:37', '2026-02-24 11:25:37'),
(260, NULL, 'Clark B.', 'seoclark2024@gmail.com', '21421209', 'Bramstrup 68', 'Hi,\r\n\r\nHope you’re doing well.\r\n\r\nI’ll keep this brief. I can place a link to alifinefoods.com on 5 genuine local business websites (DR30+), completely f.ree. In return, I’d appreciate links to 5 different of my client sites from your side — a simple, mutual SEO benefit.\r\n\r\nIf this sounds of interest, I’m happy to share the site list for your review.\r\n\r\nBest regards,\r\nClark', 1, '2026-03-13 16:59:40', '2026-03-13 16:59:40'),
(261, NULL, 'Samuel Everett', 'samuel.everett@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'Quick note.\r\n\r\nWe are reviewing keyword availability in multiple industries this week. Once a business locks in a phrase, it\'s gone.\r\n\r\nIf there are 2–3 search terms that matter most to you, now is the time.\r\n\r\nReply with:\r\n - Your website\r\n - Your keyword list\r\n\r\nI\'ll confirm what\'s available and send guaranteed traffic projections.\r\n\r\nLet\'s secure them before your competitors do.', 1, '2026-03-19 06:36:57', '2026-03-19 06:36:57'),
(262, NULL, 'Jonathan Pierce', 'jonathan.pierce@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'If your customers are searching for it, you should own it.\r\n\r\nWe place your brand at the top when people search for your chosen keywords.\r\n\r\nReady to see what\'s possible?\r\n\r\nSend your website and keyword list, and I\'ll reply with guaranteed traffic projections and pricing options.\r\n\r\nLet\'s make you the first thing they see.', 1, '2026-04-04 01:44:16', '2026-04-04 01:44:16'),
(263, NULL, 'Andrew Collins', 'andrew.collins@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'Every day people search for the exact services you provide.\r\n\r\nThe only question is — are they landing on your site or someone else\'s?\r\n\r\nWe allow you to secure specific keyword phrases in your industry. When someone searches those terms, your banner appears prominently and drives them directly to your website.\r\n\r\nIf you\'re interested, reply with:\r\n - Your website\r\n - The keywords you want to target\r\n\r\nI\'ll review availability and send guaranteed traffic numbers.', 1, '2026-04-17 21:45:02', '2026-04-17 21:45:02'),
(264, NULL, 'Virgie Haddad', 'haddad.virgie@gmail.com', '261176607', '21 Moruya Road', 'Hi there,\r\n\r\nNot sure who on your team handles Google Ads — could you point me to the right person?\r\n\r\nMy name is Ivan. I specialize in Google Ads and Google Ad Grants (and I share paid-ad strategies on YouTube).\r\n\r\n I visited your website: alifinefoods.com and we are seeing that you guys are currently running Google Ads or have tried in the past.\r\n\r\nIf you guys want, we could help you save a lot of money for a lifetime on the Google Ad Grants account that has a $10K/month free ad spend credit (provided and paid by Google Ads each month), meaning that you don\'t have to spend a dime each month to get free quality leads and sales.\r\n\r\nWith our expertise on Google Ads, we can also help you set up successful ad campaigns, manage and optimize them to get you more customers/clients.\r\n\r\nIf you have any questions private email me at: ivan@doneforyou-campaigns.com\r\n\r\nIf you’re not the right contact, please forward this or let me know who I should contact. Thanks for your time — I appreciate it.\r\n\r\n\r\nLooking forward to hearing from you,\r\n\r\nIvan Ramirez\r\nAd Grants Lab\r\nhttp://10k-youtubevideo.xyz\r\n\r\n\r\n\r\nIf you would like to opt-out of communication with us, visit:https://bit.ly/websiteoptout', 1, '2026-04-18 12:55:47', '2026-04-18 12:55:47'),
(265, NULL, 'AlbertAceri', 'annachusuha@mail.ru', '82334315165', 'https://gastro-tourclub.com/gastronomicheskiy-tur-v-armeniyu', '4 https://gastro-tourclub.com/politika-konfidencialnosti\r\n 4 https://gastro-tourclub.com/bronirovat-gastronomicheskij-tur-v-ispaniyu\r\n 2 https://gastro-tourclub.com/gastrotur-v-stambul\r\n  Нарушать надлежащее функционирование Сайта https://gastro-tourclub.com/gastronomicheskij-tur-v-meksiku\r\n \r\n5 https://gastro-tourclub.com/bronirovat-gastronomicheskij-tur-v-uzbekistan\r\n 4 https://gastro-tourclub.com/gastronomicheskij-tur-v-meksiku\r\n  Настоящее Соглашение распространяет своё действия на все дополнительные положения и условия о покупке Товара и/или оказанию услуг, предоставляемых на Сайте https://gastro-tourclub.com/politika-konfidencialnosti\r\n \r\nПозвоните мне! \r\nПозвоните мне! \r\nОтдых в Турции https://gastro-tourclub.com/gastrotur-v-vengriyu\r\n \r\nХочу поехать в Аквитанию https://gastro-tourclub.com/gastronomicheskij-tur-v-uzbekistan', 1, '2026-04-23 18:45:29', '2026-04-23 18:45:29'),
(266, NULL, 'ScottAvaks', 'margarita.stolyarova.26.05.1995@mail.ru', '84626345521', 'https://berezov-lsk.ru/', 'по расчету стоимости звоните по тел https://berezov-lsk.ru/\r\n  +7 (963) 661-14-82 https://berezov-lsk.ru/\r\n \r\nДа, на все услуги даем гарантию в течение года https://berezov-lsk.ru/\r\n  Если что-то пойдет не так, возместим ущерб – исправим все за наш счет https://berezov-lsk.ru/\r\n \r\nТатьяна Ивлева, 42 года https://berezov-lsk.ru/\r\n \r\nОбщая площадь участка 15 соток https://berezov-lsk.ru/\r\n \r\nГарантия на всё *при нашем уходе https://berezov-lsk.ru/\r\n \r\nКрасивый участок на долгие годы https://berezov-lsk.ru/\r\n  Один раз заплатив за оформление ландшафта, вы больше не будете задумываться о благоустройстве территории https://berezov-lsk.ru/\r\n  Мы тщательно изучили климатические особенности Подмосковья: – знаем, какие растения лучше приживаются; – учитываем увлажненность почвы, теневые области; – рассчитываем размер корневого кома; – готовим оптимальное основание рулонного газона; – используем растительный и строительный материал от надежных российских производителей https://berezov-lsk.ru/', 1, '2026-04-27 02:27:21', '2026-04-27 02:27:21'),
(267, NULL, 'Gabrielle Simmons', 'gabrielle.simmons@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'Serious question.\r\n\r\nWhat is one new client worth in revenue?\r\n\r\nNow imagine consistent targeted traffic from people actively searching for your service.\r\n\r\nThat\'s what we provide — guaranteed in writing and tracked in your Google Analytics.\r\n\r\nIf the math makes sense, we move forward. If it doesn\'t, we don\'t.\r\n\r\nSend me:\r\n - Your website\r\n - Your top keywords\r\n\r\nI\'ll send the numbers and let you decide.', 1, '2026-05-04 09:05:20', '2026-05-04 09:05:20'),
(268, 140, 'Md Hasibur Rahman', 'mhrahman1996@gmail.com', '01708515200', '25/1, Abul Khairat Road, Armanitola', 'Mayonnaise 1.2L', 1, '2026-05-17 10:32:35', '2026-05-17 10:32:35'),
(269, 140, 'vgBVkMAlvMtHrKSJf', 'b.e.c.ul.a.n.i.f.i.ne68@gmail.com', '9859285667', 'ZrQFPokXtpDaGYjQZSxPN', 'jrfZYrCHisOeMkCILbjA', 1, '2026-05-18 05:19:25', '2026-05-18 05:19:25'),
(270, NULL, 'Benjamin Clarke', 'benjamin.clarke@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'Imagine showing up first every time someone searches for your type of service - that\'s exactly what our keyword-based advertising system does.\r\nSetup is fast (about 24 hours), and traffic comes straight to your website.\r\nCan I send you some keywords that would work best for you?', 1, '2026-05-25 07:53:46', '2026-05-25 07:53:46'),
(271, NULL, 'ScottAvaks', 'margarita.stolyarova.26.05.1995@mail.ru', '85896573687', 'https://berezov-lsk.ru/', 'Для рекламодателей Конфиденциальность https://berezov-lsk.ru/\r\n \r\nКак происходит работа по ландшафтному проектированию и дизайну участка? \r\nАнна Митрошникова, 36 https://berezov-lsk.ru/\r\n \r\nРаботаем на совесть https://berezov-lsk.ru/\r\n \r\nКонечно, именно для этого сотрудник приедет к вам, осмотрит участок, отметит все его особенности, проведет съемку, после чего за дело возьмутся дизайнеры, которые «нарисуют» несколько эскизов и вышлют вам на согласование https://berezov-lsk.ru/\r\n  На самом деле, особых ограничений нет (за исключением каких-либо топографических характеристик) для реализации нет: вы сможете выбрать отдельные детали из всех планов и объединить их в один https://berezov-lsk.ru/\r\n  Наши специалисты с радостью обсудят с вами ваши задумки и помогут воплотить их в жизнь https://berezov-lsk.ru/\r\n \r\nК сожалению, нет, так как без проекта невозможно оценить стоимость, рассчитать объем материалов, количество площадок, дорожек, площадь газона, число посадок растений и прочее https://berezov-lsk.ru/\r\n  Проект – это база, некая карта, на основании которой ведутся все расчеты и затраты, выстраивается график реализации, запрашиваются коммерческие предложения у разных подрядчиков и т https://berezov-lsk.ru/\r\n  д https://berezov-lsk.ru/\r\n  В первую очередь необходимо разработать именно проект, а уже затем составлять список дальнейших действий https://berezov-lsk.ru/', 1, '2026-05-30 02:29:09', '2026-05-30 02:29:09'),
(272, NULL, 'Rogerbef', 'pestovafivr1985@mail.ru', '85967891694', 'https://superdenta.ru/implantologiya', 'Врачи высшей категории Качественный осмотр и лечение зубов https://superdenta.ru/awards\r\n \r\n+7 996 43XXXXX https://superdenta.ru/protezirovanie\r\n \r\nКомплексный подход https://superdenta.ru/viniry\r\n \r\nЛечение большинства стоматологических заболеваний, цены в стоматологии приемлемые https://superdenta.ru/esteticheskaya\r\n  Каждый врач-стоматолог имеет высокую квалификацию, у нас современное оборудование и большой опыт https://superdenta.ru/implantologiya\r\n  Челюстно-лицевая хирургия https://superdenta.ru/otbelivanie\r\n  Мы поможем вам решить проблему в челюстно-лицевой области, хирургической стоматологии, дентальной имплантации, даже когда другие разводят руками  https://superdenta.ru/otbelivanie\r\n  Достаточно сложно найти запись к челюстно-лицевому хирургу в Туле, а у нас - 2 специалиста высокого уровня https://superdenta.ru/otzyvy\r\n  Пародонтология – решение проблем с деснами, зубным налетом и зубным камнем, реставрация https://superdenta.ru/ortodontiya\r\n  Визуальный внешний вид ваших зубов станет идеальным при посещении врача, запись на прием к стоматологу ежедневная https://superdenta.ru/control\r\n  Имплантация, в том числе, частичная https://superdenta.ru/akcii\r\n  Один из самых современных и надежных методов восстановления одного или нескольких потерянных зубов https://superdenta.ru/protezirovanie\r\n  Чтобы попасть на прием для имплантации, пройдите запись к стоматологу https://superdenta.ru/profilaktika\r\n  Протезирование https://superdenta.ru/hirurgiya\r\n  Зубные протезы изготавливаются из качественных материалов на современном оборудовании, идеально подходят нашим пациентам https://superdenta.ru/otzyvy\r\n  Вы приятно удивитесь нашим ценам при записи к врачу в стоматологииSEN-clinic https://superdenta.ru/hirurgiya\r\n  , стоимость услуг в стоматологии в SEN-clinic всегда остается приемлемой https://superdenta.ru/terapevticheskaya\r\n \r\nПриём без талонов и ожидания в очередях https://superdenta.ru/hirurgiya\r\n \r\nпосмотрите, Что наши клиенты говорят о нас https://superdenta.ru/', 1, '2026-06-17 14:07:53', '2026-06-17 14:07:53'),
(273, NULL, 'Benjamin Clarke', 'benjamin.clarke@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'If you could appear first every time someone searched for your product or service - would you take that spot?\r\n\r\nThat\'s exactly what we do. It\'s quick to set up (under 24 hours), and you\'ll start seeing visitors right away.\r\nWould you like me to send you more information?', 1, '2026-06-19 13:26:09', '2026-06-19 13:26:09');
INSERT INTO `client_messages` (`id`, `product_id`, `name`, `email`, `phone`, `address`, `message`, `status`, `created_at`, `updated_at`) VALUES
(274, NULL, 'JasonNus', 'maksimsupala@mail.ru', '83715567723', 'https://doctortulyakov.ru/docs/', 'подшивка капсулы — до полутора лет; \r\nЕсли человек активно решает проблему, стереотип жизни у него сильно меняется и алкоголь ему становится не нужен даже без всякого лечения https://doctortulyakov.ru/\r\n  Если же он ждет, когда проблема сама собой разрешится, то желание выпить очень быстро может перерасти в патологическую тягу к алкоголю, и тогда могут не помочь ни кодирование алкоголизма, ни даже инстинкт самосохранения https://doctortulyakov.ru/\r\n \r\nПлюсы фармакологического кодирования: \r\nвозраст до 18 и после 65 лет; \r\nможно выбрать период действия кодировки; \r\nкодирование по методу Довженко — 1–3 года https://doctortulyakov.ru/docs/\r\n \r\n1 https://doctortulyakov.ru/docs/\r\n  Диагностика и осмотр https://doctortulyakov.ru/docs/\r\n  Врач приезжает на дом или принимает в стационаре https://doctortulyakov.ru/\r\n  Проводит осмотр, измеряет давление, пульс, оценивает неврологический статус https://doctortulyakov.ru/docs/\r\n  Собирает анамнез — длительность запоя, хронические заболевания, аллергии https://doctortulyakov.ru/\r\n \r\nПечень и ЖКТ https://doctortulyakov.ru/docs/\r\n  Тошнота, рвота, боли в правом подреберье https://doctortulyakov.ru/\r\n  Обострение гастрита, панкреатита, гепатита https://doctortulyakov.ru/', 1, '2026-06-29 20:08:08', '2026-06-29 20:08:08'),
(275, NULL, 'Alexander Reid', 'alexander.reid@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'We help businesses dominate their local market online by showing up first in search results - live within 24 hours.\r\nIt\'s quick, measurable, and flexible - you can change or test new keywords anytime for free.\r\nLet me know if I can show you the setup and traffic estimates for your niche.', 1, '2026-06-30 09:12:24', '2026-06-30 09:12:24'),
(276, NULL, 'Sarah Lancaster', 'sarahlancaster146@gmail.com', '391344286', '41 Route De Lyon', 'Hi,\r\n\r\nI run an account on X with 800K+ active followers, and wanted to reach out about alifinefoods.com specifically.\r\n\r\nI just opened a $3/mo subscriber tier, and I\'m inviting site owners in before opening it up publicly. The launch bundle includes:\r\n\r\n- A monthly retweet — I\'ll amplify your best post each month to my followers.\r\n- 2 guides (WordPress Optimization + YouTube Traffic) with full resell rights — rebrand, use as lead magnets, or sell and keep 100%.\r\n- A new guide each month, same rights, plus the full back-catalog on signup.\r\n\r\nIf this interests you, reply to this email and I\'ll send over the account + the link — I\'m only reaching out to a small number of sites initially.\r\n\r\nSarah', 1, '2026-07-13 14:59:02', '2026-07-13 14:59:02'),
(277, NULL, 'xjjGlbTKbWBTVTAh', 't.ay.linsv.3@gmail.com', '3002297907', 'CyrwgQjCPmlOEiyf', 'LASaNYZmNxzUgfEUUgUfBt', 1, '2026-07-17 05:57:58', '2026-07-17 05:57:58'),
(278, NULL, 'Mahdi Hasan', 'mahdimahi02@gmail.com', '01569193341', 'Uttara', 'I want to buy premium burger bun in bulk quantity.', 1, '2026-07-18 10:17:59', '2026-07-18 10:17:59'),
(279, 140, 'Masum Shahriar', 'masumshahriar200@gmail.com', '01911773035', 'H#683 10/B, Flat-2A, 2nd Floor, Shaibal Tower, North Kafrul, Ibrahimpur,Dhaka.', 'Urgently Needed 1.2 Ltr Mayonnaise', 1, '2026-07-20 12:54:49', '2026-07-20 12:54:49'),
(280, NULL, 'Richard Lawson', 'richard.lawson@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'If customers are searching for what you offer, your business should show up first. We can make that happen within a day.\r\nWant to see how easy it is?', 1, '2026-07-22 08:31:19', '2026-07-22 08:31:19'),
(281, NULL, 'Casie Erb', 'casie.erb@gmail.com', '50384606', 'Vejlebaksvej 12', 'Hello there from DreamProxies\r\n\r\nFresh proxy promotion: elite, fast speed and unlimited private proxies now even cheaper price!\r\n50% Deals - for all private proxies:\r\n\r\nhttps://tiny.cc/dreamproxies-sales\r\n\r\nComplete Anonymity, Ultimate Quality, Blazing Speed, Unlimited Usage, Reliable Servers, Affordable Prices, Bonus Discounts and many more\r\n\r\n50% Deals for all proxy packages - on DreamProxies.com', 1, '2026-07-29 21:49:12', '2026-07-29 21:49:12'),
(282, NULL, 'Christopher Hughes', 'christopher.hughes@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'If customers are searching for what you offer, your business should show up first. We can make that happen within a day.\r\nWant to see how easy it is?', 1, '2026-07-30 21:01:35', '2026-07-30 21:01:35'),
(283, NULL, 'Md sohan', 'hasanmdali477@gmail.com', '01718475482', 'Akkelpur, Joypurhat', 'Hi,Ali Foods 😊😊😊', 1, '2026-08-06 11:25:45', '2026-08-06 11:25:45'),
(284, 124, 'Md sohan', 'hasanmdali477@gmail.com', '01718475482', 'Akkelpur, Joypurhat', 'Hi 👋👋👋', 1, '2026-08-06 12:39:33', '2026-08-06 12:39:33'),
(285, NULL, 'Raymond Abbott', 'raymond.abbott@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'Most businesses struggle to get noticed online. We solve that by putting your brand above the competition on major search pages for the exact keywords your customers are typing.\r\nSetup takes less than a day, and you\'ll start seeing traffic immediately in your analytics.\r\nWould you like me to send a few keyword suggestions for your business?', 1, '2026-08-17 19:36:14', '2026-08-17 19:36:14'),
(286, NULL, 'Rosabel Edney', 'mapmybiz.mkt@gmail.com', '625356938', 'Ragetenstrasse 69', 'Hey team alifinefoods.com,\r\n\r\nI\'d love to discuss how we can grow your online visibility.\r\n\r\nWe help businesses rank higher on Google while also increasing their presence on AI-powered search platforms like ChatGPT, Gemini, Claude, and Perplexity.\r\n\r\nOur SEO + AEO + GEO strategies help brands get discovered wherever customers search for answers.\r\n\r\nMay I send you a quote & price list?\r\n\r\nCheers,\r\nRosabel Edney | Founder & Project Head', 1, '2026-08-27 09:38:42', '2026-08-27 09:38:42'),
(287, 127, 'Rafia Nusrat', 'rafia278@gmail.com', '01735213847', '78/A jbs shopno chuara south banasree khilgaon Dhaka', '900ml master real mayonnaise', 1, '2026-09-21 08:37:20', '2026-09-21 08:37:20'),
(288, NULL, 'Joanna Riggs', 'joannariggs3@gmail.com', '2178781670', '1168 Little Acres Lane', 'Hi,\r\n\r\nI just visited alifinefoods.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur videos cost just $195 (USD) for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', 1, '2026-09-21 11:37:25', '2026-09-21 11:37:25'),
(289, NULL, 'Brianhed', 'lyokhapolaso@mail.ru', '88995313682', 'https://adentalab.ru/', '•	От 100 000 рублей — покрывной условно-съёмный протез на имплантах https://adentalab.ru/\r\n \r\n•	Несъёмные https://adentalab.ru/\r\n  Фиксируются на оставшихся зубах или имплантах https://adentalab.ru/\r\n  Пациент не снимает конструкцию самостоятельно, врач снимает протез только при необходимости замены или коррекции https://adentalab.ru/\r\n  К несъёмным протезам относят коронки, мосты, протезы на имплантах https://adentalab.ru/\r\n   Условно-съёмные https://adentalab.ru/\r\n  Съёмную челюсть закрепляют на имплантах, такой тип протеза можно снять у стоматолога для проведения необходимых процедур https://adentalab.ru/\r\n   Этапы \r\n2 https://adentalab.ru/\r\n 	Изготовление гипсовой модели https://adentalab.ru/\r\n  На основе слепков изготавливаются гипсовые модели, на которых техник начинает работать над будущей конструкцией протеза https://adentalab.ru/\r\n \r\nДля изготовления зубных протезов используют различные материалы, например: \r\nСтоимость \r\n•	Металлы (золото, палладий, хром, кобальт, никель) — используются для создания бюгельных протезов, коронок, мостов, вкладок https://adentalab.ru/\r\n  Зачастую применяются сплавы различных металлов https://adentalab.ru/', 1, '2026-09-25 18:18:49', '2026-09-25 18:18:49'),
(290, NULL, 'Brayden Merrick', 'info@freeb2bdata.org', '3508164100', 'Via Cavour 28', 'Hello,\r\n\r\nI am Brayden Merrick from FreeB2BData\r\n\r\nIt is with sad regret to inform you that we are shutting down\r\n\r\nWe have over 252 countries and over 33 million companies available in our database with phone numbers, industries, emails, etc.\r\n\r\nPlease come and download your data in the next 24 hours. \r\n\r\nhttps://Brayden.freeb2bdata.org\r\n\r\nRegards,\r\nBrayden Merrick', 1, '2026-09-25 19:31:15', '2026-09-25 19:31:15'),
(291, NULL, 'Shenna Childress', 'info@freeb2bdata.org', '489345721', 'Rue De La Poste 87', 'Hello,\r\n\r\nI am Shenna Childress from FreeB2BData\r\n\r\nIt is with sad regret to inform you that we are shutting down\r\n\r\nWe have over 252 countries and over 33 million companies available in our database with phone numbers, industries, emails, etc.\r\n\r\nPlease come and download your data in the next 24 hours. \r\n\r\nhttps://Shenna.freeb2bdata.org\r\n\r\nRegards,\r\nShenna Childress', 1, '2026-09-25 20:15:01', '2026-09-25 20:15:01'),
(292, NULL, 'Larrynag', 'jicousderu@mail.ru', '83414817452', 'https://белый.москва/zhk-very', 'Если говорить об агентах по недвижимости, то они занимаются покупкой, продажей или обменом недвижимости https://белый.москва/zhk-very\r\n  То есть они выбирают необходимый объект, изучают спрос и предложение на него на рынке, ищут продавцов или покупателей, а также помогают с заключением договора https://белый.москва/zhk-ever\r\n  Можно сказать, что по сути перед ними стоит одна масштабная задача - найти и подобрать недвижимость, чтобы далее ее купили, продали или сдали в аренду https://белый.москва/projects\r\n  Но при этом они также выполняют такие задачи, как поиск клиентов и увеличение клиентской базы, прием звонков и консультирование клиентов, показ объектов, подготовка документов, необходимых для проведения сделки https://белый.москва/zhk-champine\r\n \r\nОбязанности брокера \r\n\r\nАнализ рынка недвижимости и поиск перспективных проектов для девелоперов https://белый.москва/zhk-lunar\r\n \r\n\r\nИз этого становится понятно, что риэлтор имеет больше полномочий, чем агент по недвижимости https://белый.москва/projects\r\n  Например, у него есть возможность заниматься юридическими вопросами, делать запросы в государственные органы, то есть он может досконально проверить квартиру на ее юридическую “чистоту” https://белый.москва/zhk-vnukovo-country-club\r\n  Это зачастую помогает избегать неприятных ситуаций, связанных с наследниками и другими людьми, которые могут претендовать на приобретенное жилье https://белый.москва/zhk-champine\r\n \r\n\r\nОсновные обязанности брокера могут варьироваться в зависимости от специализации https://белый.москва/projects\r\n  Он может работать с недвижимостью различных классов — эконом-класса, бизнес-класса, премиум-класса или загородными домами, а некоторые брокеры занимаются объектами разных категорий https://белый.москва/zhk-vnukovo-country-club\r\n  К числу основных задач относятся:', 1, '2026-10-01 08:02:07', '2026-10-01 08:02:07'),
(293, NULL, 'Priyanka Patel', 'info@priyankaglobalexim.com', '+919833189900', 'Mumbai 400049, Maharashtra, India', 'Dear Sir/Madam,\r\n\r\nI hope you are doing well.\r\n\r\nI am reaching out to introduce Priyanka Global Exim, a Mumbai-based trading and export company specializing in sourcing and supplying high-quality natural and organic ingredients from India.\r\n\r\nWe are currently onboarding international partners for the bulk supply of 100% Organic Moringa Leaf Powder, carefully processed to maintain its natural quality, color, and consistency.\r\n\r\nProduct Specifications\r\n\r\n• Origin: India\r\n• Product: Moringa (Moringa oleifera) Leaf Powder\r\n• Grade: Food / Nutraceutical\r\n• Mesh Size: 60 / 80 / Customized\r\n• Monthly Capacity: Up to 25 MT\r\n• Buyer-specific laboratory testing available\r\n• Packaging: 20kg or 25 kg food-grade bulk packs\r\n\r\nWe can provide:\r\n\r\n✓ COA & Lab Reports\r\n✓ Samples for evaluation\r\n✓ FOB / CIF pricing\r\n✓ MOQ & Lead Time details\r\n\r\nIn addition to Moringa Powder, we can also supply:\r\n\r\n• Moringa Leaf Powder\r\n• Turmeric Fingers & Powder\r\n• Ashwagandha Root Powder\r\n• Gotu Kola Powder\r\n• Cumin Seeds\r\n• Coriander Seeds\r\n• Fenugreek Seeds\r\n• Dry Red Chili\r\n• Green Cardamom\r\n• Dehydrated Garlic – Flakes, Granules, Minced & Powder\r\n• Dehydrated Onion – Flakes, Granules, Minced & Powder\r\n• Vegetable & Botanical Powders\r\n• Rice and other agricultural commodities\r\n• Cow Dung Fertilizer – Cakes/Uple, Powder & Manure\r\n• Freeze Dried Fruits\r\n\r\nWe can also source and supply a wide range of other Indian spices, herbs, botanical powders and natural ingredients according to your specifications and bulk requirements.\r\n\r\nIf Moringa or any other Indian herbs, spices or botanical ingredients are part of your sourcing portfolio, please feel free to share your requirements. We would be happy to source the right product and provide a competitive quotation.\r\n\r\nI look forward to hearing from you.\r\n\r\nWarm regards,\r\n\r\nPriyanka Patel\r\nPriyanka Global Exim\r\nMumbai, India', 1, '2026-10-05 21:24:08', '2026-10-05 21:24:08'),
(294, NULL, 'Benjamin Clarke', 'benjamin.clarke@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'We specialize in putting businesses like yours right at the top of search results. Setup is fast and effortless.\r\nIs this something you\'d like to explore?', 1, '2026-10-06 01:41:06', '2026-10-06 01:41:06'),
(295, NULL, 'Mable Kincaid', 'hello@ultraleadgeneration.com', '4024476072', '1509 Oak Way', 'Hi Alifinefoods Com team,\r\n\r\nThis message came in through your contact form. A real customer would now be waiting for a reply.\r\n\r\nMIT\'s Lead Response Management study found that contacting a web lead within 5 minutes, not 30, makes you roughly 100x more likely to reach them.\r\n\r\nWhen a visitor enters their phone number on your site, we call them in seconds, and you choose who they talk to:\r\n\r\n1. You or your staff: your phone rings and you\'re connected while they\'re still on your site.\r\n2. An AI voice agent: it answers their questions, finds out what they need and books the appointment into your calendar, day or night.\r\n\r\nGo to https://ultraleadgeneration.com, tap the blue phone icon (bottom right) and enter your number. It calls you. The demo you\'ll hear is the AI option.\r\n\r\nIf you like it, there\'s a 14-day free trial, and a real person helps you set it up.\r\n\r\nMable\r\nultra Lead Generation\r\n\r\nNot a fit? Opt out here: https://ultraleadgeneration.com/unsubscribe.aspx?d=alifinefoods.com', 1, '2026-10-10 19:30:23', '2026-10-10 19:30:23'),
(296, NULL, 'Benjamin Clarke', 'benjamin.clarke@jmailservice.com', '8054002077', '275 East Hillcrest Drive', 'If customers are searching for what you offer, your business should show up first. We can make that happen within a day.\r\nWant to see how easy it is?', 1, '2026-10-31 12:46:55', '2026-10-31 12:46:55'),
(297, NULL, 'Lbvedxh Gvuoxh', 'g.im.iyum.e.3.5.0@gmail.com', '8331619594', 'Omeurgdgsl', 'AeMzZQLhXkPcizTskjmEqps', 1, '2026-11-07 02:20:46', '2026-11-07 02:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `client_prices`
--

CREATE TABLE `client_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `default_price` decimal(16,2) NOT NULL,
  `client_price` decimal(16,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_prices`
--

INSERT INTO `client_prices` (`id`, `client_id`, `product_id`, `default_price`, `client_price`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3028, 127, 580.00, 270.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-05-14 06:56:35'),
(2, 3028, 126, 320.00, 145.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-06-10 09:43:11'),
(3, 3028, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(4, 3028, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(5, 3028, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(6, 3028, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(7, 3028, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(8, 3028, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(9, 3028, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(10, 3028, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(11, 3028, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(12, 3028, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(13, 3028, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(14, 3028, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(15, 3028, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(16, 3028, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:13'),
(17, 3028, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(18, 3028, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(19, 3028, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(20, 3028, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(21, 3028, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(22, 3028, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(23, 3028, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(24, 3028, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(25, 3028, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-03 11:10:34', '2024-04-15 10:32:14'),
(26, 3036, 127, 580.00, 330.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(27, 3036, 126, 320.00, 180.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(28, 3036, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(29, 3036, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(30, 3036, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(31, 3036, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(32, 3036, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(33, 3036, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(34, 3036, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(35, 3036, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(36, 3036, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(37, 3036, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(38, 3036, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(39, 3036, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(40, 3036, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(41, 3036, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(42, 3036, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(43, 3036, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(44, 3036, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(45, 3036, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(46, 3036, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(47, 3036, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(48, 3036, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(49, 3036, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(50, 3036, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:14:26', '2025-01-01 05:37:17'),
(51, 3037, 127, 580.00, 320.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(52, 3037, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(53, 3037, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(54, 3037, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(55, 3037, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(56, 3037, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(57, 3037, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(58, 3037, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(59, 3037, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(60, 3037, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(61, 3037, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(62, 3037, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(63, 3037, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(64, 3037, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(65, 3037, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(66, 3037, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(67, 3037, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(68, 3037, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(69, 3037, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(70, 3037, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(71, 3037, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(72, 3037, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(73, 3037, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(74, 3037, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(75, 3037, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:14:58', '2024-02-13 08:14:58'),
(76, 3038, 127, 580.00, 330.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(77, 3038, 126, 320.00, 180.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(78, 3038, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(79, 3038, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(80, 3038, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(81, 3038, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(82, 3038, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(83, 3038, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(84, 3038, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(85, 3038, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(86, 3038, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(87, 3038, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(88, 3038, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(89, 3038, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(90, 3038, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(91, 3038, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(92, 3038, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(93, 3038, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(94, 3038, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(95, 3038, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(96, 3038, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(97, 3038, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(98, 3038, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(99, 3038, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(100, 3038, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:15:25', '2024-12-29 11:26:44'),
(101, 3039, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(102, 3039, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(103, 3039, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(104, 3039, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(105, 3039, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(106, 3039, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(107, 3039, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(108, 3039, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(109, 3039, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(110, 3039, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(111, 3039, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(112, 3039, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(113, 3039, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(114, 3039, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(115, 3039, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(116, 3039, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(117, 3039, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(118, 3039, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(119, 3039, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(120, 3039, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(121, 3039, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(122, 3039, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(123, 3039, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(124, 3039, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(125, 3039, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-13 08:15:48', '2024-02-13 08:15:48'),
(126, 3040, 127, 580.00, 330.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(127, 3040, 126, 320.00, 180.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(128, 3040, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(129, 3040, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(130, 3040, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(131, 3040, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(132, 3040, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(133, 3040, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(134, 3040, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(135, 3040, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(136, 3040, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(137, 3040, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(138, 3040, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(139, 3040, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(140, 3040, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(141, 3040, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(142, 3040, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(143, 3040, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(144, 3040, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(145, 3040, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(146, 3040, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(147, 3040, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(148, 3040, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(149, 3040, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(150, 3040, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-13 08:16:09', '2025-02-09 07:41:51'),
(151, 3041, 127, 580.00, 330.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(152, 3041, 126, 320.00, 180.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(153, 3041, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(154, 3041, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(155, 3041, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(156, 3041, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(157, 3041, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(158, 3041, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(159, 3041, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(160, 3041, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(161, 3041, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(162, 3041, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(163, 3041, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(164, 3041, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(165, 3041, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(166, 3041, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(167, 3041, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(168, 3041, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(169, 3041, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(170, 3041, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(171, 3041, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(172, 3041, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(173, 3041, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(174, 3041, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(175, 3041, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:36:12', '2024-11-06 08:38:13'),
(176, 3042, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(177, 3042, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(178, 3042, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(179, 3042, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(180, 3042, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(181, 3042, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(182, 3042, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(183, 3042, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(184, 3042, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(185, 3042, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(186, 3042, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(187, 3042, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(188, 3042, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(189, 3042, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(190, 3042, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(191, 3042, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(192, 3042, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(193, 3042, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(194, 3042, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(195, 3042, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(196, 3042, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(197, 3042, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(198, 3042, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(199, 3042, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(200, 3042, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:36', '2024-02-15 07:36:36'),
(201, 3043, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(202, 3043, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(203, 3043, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(204, 3043, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(205, 3043, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(206, 3043, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(207, 3043, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(208, 3043, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(209, 3043, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(210, 3043, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(211, 3043, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(212, 3043, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(213, 3043, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(214, 3043, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(215, 3043, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(216, 3043, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(217, 3043, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(218, 3043, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(219, 3043, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(220, 3043, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(221, 3043, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(222, 3043, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(223, 3043, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(224, 3043, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(225, 3043, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:36:59', '2024-02-15 07:36:59'),
(226, 3044, 127, 580.00, 330.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(227, 3044, 126, 320.00, 180.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(228, 3044, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(229, 3044, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(230, 3044, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(231, 3044, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(232, 3044, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(233, 3044, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(234, 3044, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(235, 3044, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(236, 3044, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(237, 3044, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(238, 3044, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(239, 3044, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(240, 3044, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(241, 3044, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(242, 3044, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(243, 3044, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(244, 3044, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(245, 3044, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(246, 3044, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(247, 3044, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(248, 3044, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(249, 3044, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(250, 3044, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-02-15 07:37:23', '2024-12-11 05:55:15'),
(251, 3045, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(252, 3045, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(253, 3045, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(254, 3045, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(255, 3045, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(256, 3045, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(257, 3045, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(258, 3045, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(259, 3045, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(260, 3045, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(261, 3045, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(262, 3045, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(263, 3045, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(264, 3045, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(265, 3045, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(266, 3045, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(267, 3045, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(268, 3045, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(269, 3045, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(270, 3045, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(271, 3045, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(272, 3045, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(273, 3045, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(274, 3045, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(275, 3045, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-02-15 07:37:43', '2024-02-15 07:37:43'),
(276, 3055, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(277, 3055, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(278, 3055, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(279, 3055, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(280, 3055, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(281, 3055, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(282, 3055, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(283, 3055, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(284, 3055, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(285, 3055, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(286, 3055, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(287, 3055, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(288, 3055, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(289, 3055, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(290, 3055, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(291, 3055, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(292, 3055, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(293, 3055, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(294, 3055, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(295, 3055, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(296, 3055, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(297, 3055, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(298, 3055, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(299, 3055, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(300, 3055, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-03-16 07:13:47', '2024-03-16 07:13:47'),
(301, 3056, 127, 580.00, 320.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(302, 3056, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(303, 3056, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(304, 3056, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(305, 3056, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(306, 3056, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(307, 3056, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(308, 3056, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(309, 3056, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(310, 3056, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(311, 3056, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(312, 3056, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(313, 3056, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(314, 3056, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(315, 3056, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(316, 3056, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(317, 3056, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(318, 3056, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(319, 3056, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(320, 3056, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(321, 3056, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(322, 3056, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(323, 3056, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(324, 3056, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(325, 3056, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-03-19 05:47:18', '2024-03-19 05:47:18'),
(326, 3047, 128, 1150.00, 1150.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(327, 3047, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(328, 3047, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(329, 3047, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(330, 3047, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(331, 3047, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(332, 3047, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(333, 3047, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(334, 3047, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(335, 3047, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(336, 3047, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(337, 3047, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(338, 3047, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(339, 3047, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(340, 3047, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(341, 3047, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(342, 3047, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(343, 3047, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(344, 3047, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(345, 3047, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(346, 3047, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(347, 3047, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(348, 3047, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(349, 3047, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(350, 3047, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(351, 3047, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-03-19 09:10:12', '2024-03-19 09:10:12'),
(352, 3028, 128, 1200.00, 715.00, 1, 2, 2, NULL, NULL, '2024-04-15 10:32:14', '2026-11-05 11:20:10'),
(353, 3059, 128, 1150.00, 1150.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(354, 3059, 127, 580.00, 306.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(355, 3059, 126, 320.00, 174.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(356, 3059, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(357, 3059, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(358, 3059, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(359, 3059, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(360, 3059, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(361, 3059, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(362, 3059, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(363, 3059, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(364, 3059, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(365, 3059, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(366, 3059, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(367, 3059, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(368, 3059, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(369, 3059, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(370, 3059, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(371, 3059, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(372, 3059, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(373, 3059, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(374, 3059, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(375, 3059, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(376, 3059, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(377, 3059, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(378, 3059, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-05-19 10:57:32', '2024-05-19 10:57:32'),
(379, 3058, 128, 1200.00, 535.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2026-08-01 05:47:48'),
(380, 3058, 127, 580.00, 580.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(381, 3058, 126, 320.00, 102.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2026-07-14 08:54:08'),
(382, 3058, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(383, 3058, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(384, 3058, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(385, 3058, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(386, 3058, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(387, 3058, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(388, 3058, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(389, 3058, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(390, 3058, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(391, 3058, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(392, 3058, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(393, 3058, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(394, 3058, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(395, 3058, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(396, 3058, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(397, 3058, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(398, 3058, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(399, 3058, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(400, 3058, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(401, 3058, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(402, 3058, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(403, 3058, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(404, 3058, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-06-15 09:19:50', '2024-12-21 04:50:54'),
(405, 3061, 128, 1150.00, 1150.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(406, 3061, 127, 580.00, 330.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(407, 3061, 126, 320.00, 180.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(408, 3061, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(409, 3061, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(410, 3061, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(411, 3061, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(412, 3061, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(413, 3061, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(414, 3061, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(415, 3061, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(416, 3061, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(417, 3061, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(418, 3061, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(419, 3061, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(420, 3061, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(421, 3061, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(422, 3061, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(423, 3061, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(424, 3061, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(425, 3061, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(426, 3061, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(427, 3061, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(428, 3061, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(429, 3061, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(430, 3061, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-07-03 05:35:10', '2024-12-11 05:51:24'),
(431, 3060, 128, 1150.00, 805.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(432, 3060, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(433, 3060, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(434, 3060, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(435, 3060, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(436, 3060, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(437, 3060, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(438, 3060, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(439, 3060, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(440, 3060, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(441, 3060, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(442, 3060, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(443, 3060, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(444, 3060, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(445, 3060, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(446, 3060, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(447, 3060, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(448, 3060, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(449, 3060, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(450, 3060, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(451, 3060, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(452, 3060, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(453, 3060, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(454, 3060, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(455, 3060, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(456, 3060, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:35:40', '2024-07-03 05:35:40'),
(457, 3062, 128, 1150.00, 805.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(458, 3062, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(459, 3062, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(460, 3062, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(461, 3062, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(462, 3062, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(463, 3062, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(464, 3062, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(465, 3062, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(466, 3062, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(467, 3062, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(468, 3062, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(469, 3062, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(470, 3062, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(471, 3062, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(472, 3062, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(473, 3062, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(474, 3062, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(475, 3062, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(476, 3062, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(477, 3062, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(478, 3062, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(479, 3062, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(480, 3062, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(481, 3062, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(482, 3062, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-03 05:36:04', '2024-07-03 05:36:04'),
(483, 3048, 128, 1150.00, 805.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(484, 3048, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(485, 3048, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(486, 3048, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(487, 3048, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(488, 3048, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(489, 3048, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(490, 3048, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(491, 3048, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(492, 3048, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(493, 3048, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(494, 3048, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(495, 3048, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(496, 3048, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(497, 3048, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(498, 3048, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(499, 3048, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(500, 3048, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(501, 3048, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(502, 3048, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(503, 3048, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11');
INSERT INTO `client_prices` (`id`, `client_id`, `product_id`, `default_price`, `client_price`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(504, 3048, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(505, 3048, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(506, 3048, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(507, 3048, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(508, 3048, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-03 08:55:11', '2024-07-03 08:55:11'),
(509, 3065, 128, 1150.00, 805.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(510, 3065, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(511, 3065, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(512, 3065, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(513, 3065, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(514, 3065, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(515, 3065, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(516, 3065, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(517, 3065, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(518, 3065, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(519, 3065, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(520, 3065, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(521, 3065, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(522, 3065, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(523, 3065, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(524, 3065, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(525, 3065, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(526, 3065, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(527, 3065, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(528, 3065, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(529, 3065, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(530, 3065, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(531, 3065, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(532, 3065, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(533, 3065, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(534, 3065, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-04 06:58:16', '2024-07-04 06:58:16'),
(535, 3064, 128, 1150.00, 805.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(536, 3064, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(537, 3064, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(538, 3064, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(539, 3064, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(540, 3064, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(541, 3064, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(542, 3064, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(543, 3064, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(544, 3064, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(545, 3064, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(546, 3064, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(547, 3064, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(548, 3064, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(549, 3064, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(550, 3064, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(551, 3064, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(552, 3064, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(553, 3064, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(554, 3064, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(555, 3064, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(556, 3064, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(557, 3064, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(558, 3064, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(559, 3064, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(560, 3064, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:02:59', '2024-07-04 07:02:59'),
(561, 3063, 128, 1150.00, 805.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(562, 3063, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(563, 3063, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(564, 3063, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(565, 3063, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(566, 3063, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(567, 3063, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(568, 3063, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(569, 3063, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(570, 3063, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(571, 3063, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(572, 3063, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(573, 3063, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(574, 3063, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(575, 3063, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(576, 3063, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(577, 3063, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(578, 3063, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(579, 3063, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(580, 3063, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(581, 3063, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(582, 3063, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(583, 3063, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(584, 3063, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(585, 3063, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(586, 3063, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-04 07:03:24', '2024-07-04 07:03:24'),
(587, 3066, 128, 1150.00, 805.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(588, 3066, 127, 580.00, 330.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(589, 3066, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(590, 3066, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(591, 3066, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(592, 3066, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(593, 3066, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(594, 3066, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(595, 3066, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(596, 3066, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(597, 3066, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(598, 3066, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(599, 3066, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(600, 3066, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(601, 3066, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(602, 3066, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(603, 3066, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(604, 3066, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(605, 3066, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(606, 3066, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(607, 3066, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(608, 3066, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(609, 3066, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(610, 3066, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(611, 3066, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(612, 3066, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-07 05:26:18', '2024-07-07 05:26:18'),
(613, 3067, 128, 1150.00, 805.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(614, 3067, 127, 580.00, 320.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(615, 3067, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(616, 3067, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(617, 3067, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(618, 3067, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(619, 3067, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(620, 3067, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(621, 3067, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(622, 3067, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(623, 3067, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(624, 3067, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(625, 3067, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(626, 3067, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(627, 3067, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(628, 3067, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(629, 3067, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(630, 3067, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(631, 3067, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(632, 3067, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(633, 3067, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(634, 3067, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(635, 3067, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(636, 3067, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(637, 3067, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(638, 3067, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-07-07 06:15:16', '2024-07-07 06:15:16'),
(639, 3068, 128, 1150.00, 805.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(640, 3068, 127, 580.00, 330.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(641, 3068, 126, 320.00, 180.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(642, 3068, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(643, 3068, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(644, 3068, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(645, 3068, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(646, 3068, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(647, 3068, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(648, 3068, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(649, 3068, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(650, 3068, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(651, 3068, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(652, 3068, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(653, 3068, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(654, 3068, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(655, 3068, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(656, 3068, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(657, 3068, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(658, 3068, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(659, 3068, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(660, 3068, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(661, 3068, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(662, 3068, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(663, 3068, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(664, 3068, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2024-07-07 06:22:57', '2024-12-11 05:52:34'),
(665, 3069, 128, 1150.00, 750.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(666, 3069, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(667, 3069, 126, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(668, 3069, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(669, 3069, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(670, 3069, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(671, 3069, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(672, 3069, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(673, 3069, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(674, 3069, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(675, 3069, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(676, 3069, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(677, 3069, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(678, 3069, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(679, 3069, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(680, 3069, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(681, 3069, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(682, 3069, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(683, 3069, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(684, 3069, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(685, 3069, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(686, 3069, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(687, 3069, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(688, 3069, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(689, 3069, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(690, 3069, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2024-09-21 13:08:34', '2024-09-21 13:08:34'),
(691, 3028, 140, 730.00, 367.00, 1, 2, 2, NULL, NULL, '2024-10-18 12:33:18', '2025-08-24 04:35:11'),
(692, 3028, 141, 0.00, 0.00, 1, 2, 2, NULL, NULL, '2024-10-27 16:46:52', '2024-11-03 14:10:05'),
(693, 3041, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2024-11-06 08:38:13', '2024-11-06 08:38:13'),
(694, 3041, 140, 700.00, 700.00, 1, 2, NULL, NULL, NULL, '2024-11-06 08:38:13', '2024-11-06 08:38:13'),
(695, 3041, 128, 1150.00, 820.00, 1, 2, NULL, NULL, NULL, '2024-11-06 08:38:13', '2024-11-06 08:38:13'),
(696, 3061, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2024-12-11 05:51:24', '2024-12-11 05:51:24'),
(697, 3061, 140, 700.00, 420.00, 1, 2, NULL, NULL, NULL, '2024-12-11 05:51:24', '2024-12-11 05:51:24'),
(698, 3068, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2024-12-11 05:52:34', '2024-12-11 05:52:34'),
(699, 3068, 140, 700.00, 420.00, 1, 2, NULL, NULL, NULL, '2024-12-11 05:52:34', '2024-12-11 05:52:34'),
(700, 3044, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2024-12-11 05:55:15', '2024-12-11 05:55:15'),
(701, 3044, 140, 700.00, 420.00, 1, 2, NULL, NULL, NULL, '2024-12-11 05:55:15', '2024-12-11 05:55:15'),
(702, 3044, 128, 1150.00, 1150.00, 1, 2, NULL, NULL, NULL, '2024-12-11 05:55:15', '2024-12-11 05:55:15'),
(703, 3058, 141, 0.00, 0.00, 1, 2, 2, NULL, NULL, '2024-12-21 04:50:54', '2025-01-31 14:35:39'),
(704, 3058, 140, 730.00, 280.00, 1, 2, 2, NULL, NULL, '2024-12-21 04:50:54', '2026-08-01 05:49:33'),
(705, 3038, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2024-12-29 11:26:44', '2024-12-29 11:26:44'),
(706, 3038, 140, 700.00, 420.00, 1, 2, NULL, NULL, NULL, '2024-12-29 11:26:44', '2024-12-29 11:26:44'),
(707, 3038, 128, 1150.00, 1150.00, 1, 2, NULL, NULL, NULL, '2024-12-29 11:26:44', '2024-12-29 11:26:44'),
(708, 3036, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2025-01-01 05:37:17', '2025-01-01 05:37:17'),
(709, 3036, 140, 700.00, 420.00, 1, 2, NULL, NULL, NULL, '2025-01-01 05:37:17', '2025-01-01 05:37:17'),
(710, 3036, 128, 1150.00, 1150.00, 1, 2, NULL, NULL, NULL, '2025-01-01 05:37:17', '2025-01-01 05:37:17'),
(711, 3040, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2025-02-09 07:41:51', '2025-02-09 07:41:51'),
(712, 3040, 140, 700.00, 420.00, 1, 2, NULL, NULL, NULL, '2025-02-09 07:41:51', '2025-02-09 07:41:51'),
(713, 3040, 128, 1150.00, 1150.00, 1, 2, NULL, NULL, NULL, '2025-02-09 07:41:51', '2025-02-09 07:41:51'),
(714, 3072, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(715, 3072, 140, 730.00, 730.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(716, 3072, 128, 1200.00, 1200.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(717, 3072, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(718, 3072, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(719, 3072, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(720, 3072, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(721, 3072, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(722, 3072, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(723, 3072, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(724, 3072, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(725, 3072, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(726, 3072, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(727, 3072, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(728, 3072, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(729, 3072, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(730, 3072, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(731, 3072, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(732, 3072, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(733, 3072, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(734, 3072, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(735, 3072, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(736, 3072, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(737, 3072, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(738, 3072, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(739, 3072, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(740, 3072, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(741, 3072, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2025-05-29 06:38:49', '2025-05-29 06:38:49'),
(742, 3073, 141, 0.00, 0.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(743, 3073, 140, 730.00, 420.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(744, 3073, 128, 1200.00, 1200.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(745, 3073, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(746, 3073, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(747, 3073, 125, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(748, 3073, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(749, 3073, 123, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(750, 3073, 122, 95.00, 95.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(751, 3073, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(752, 3073, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(753, 3073, 119, 120.00, 120.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(754, 3073, 118, 110.00, 110.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(755, 3073, 117, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(756, 3073, 116, 60.00, 60.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(757, 3073, 115, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(758, 3073, 114, 90.00, 90.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(759, 3073, 113, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(760, 3073, 112, 40.00, 40.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(761, 3073, 111, 11.00, 11.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(762, 3073, 110, 35.00, 35.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(763, 3073, 109, 30.00, 30.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(764, 3073, 108, 15.00, 15.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(765, 3073, 107, 13.00, 13.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(766, 3073, 106, 85.00, 85.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(767, 3073, 105, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(768, 3073, 104, 6.50, 6.50, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(769, 3073, 103, 9.00, 9.00, 1, 2, NULL, NULL, NULL, '2025-07-21 05:22:18', '2025-07-21 05:22:18'),
(770, 3074, 141, 0.00, 0.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(771, 3074, 140, 730.00, 465.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(772, 3074, 128, 1200.00, 870.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(773, 3074, 127, 580.00, 580.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(774, 3074, 126, 320.00, 320.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(775, 3074, 125, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(776, 3074, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(777, 3074, 123, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(778, 3074, 122, 95.00, 95.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(779, 3074, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(780, 3074, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(781, 3074, 119, 120.00, 120.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(782, 3074, 118, 110.00, 110.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(783, 3074, 117, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(784, 3074, 116, 60.00, 60.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(785, 3074, 115, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(786, 3074, 114, 90.00, 90.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(787, 3074, 113, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(788, 3074, 112, 40.00, 40.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(789, 3074, 111, 11.00, 11.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(790, 3074, 110, 35.00, 35.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(791, 3074, 109, 30.00, 30.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(792, 3074, 108, 15.00, 15.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(793, 3074, 107, 13.00, 13.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(794, 3074, 106, 85.00, 85.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(795, 3074, 105, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(796, 3074, 104, 6.50, 6.50, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(797, 3074, 103, 9.00, 9.00, 1, 2, 2, NULL, NULL, '2025-09-01 10:35:30', '2025-09-04 05:59:51'),
(798, 3075, 142, 435.00, 454.00, 1, 2, 2, NULL, NULL, '2025-09-10 05:59:48', '2026-06-03 07:19:48'),
(799, 3075, 140, 730.00, 279.00, 1, 2, 2, NULL, NULL, '2025-09-10 05:59:48', '2026-06-03 07:03:40'),
(800, 3075, 128, 1200.00, 535.00, 1, 2, 2, NULL, NULL, '2025-09-10 05:59:48', '2026-06-03 07:02:52'),
(801, 3075, 127, 580.00, 580.00, 1, 2, 2, NULL, NULL, '2025-09-10 05:59:48', '2025-11-04 10:47:13'),
(802, 3075, 126, 320.00, 320.00, 1, 2, 2, NULL, NULL, '2025-09-10 05:59:48', '2025-11-04 10:47:13'),
(803, 3028, 142, 435.00, 369.00, 1, 2, 2, NULL, NULL, '2025-09-11 03:49:02', '2025-11-19 10:13:25'),
(804, 3028, 143, 880.00, 369.00, 1, 2, 2, NULL, NULL, '2025-09-18 03:04:30', '2025-11-19 10:13:25'),
(805, 3076, 143, 880.00, 369.00, 1, 2, 2, NULL, NULL, '2025-11-03 04:23:24', '2026-03-16 07:40:11'),
(806, 3076, 142, 435.00, 369.00, 1, 2, 2, NULL, NULL, '2025-11-03 04:23:24', '2026-03-16 07:40:11'),
(807, 3076, 140, 730.00, 267.00, 1, 2, 2, NULL, NULL, '2025-11-03 04:23:24', '2026-03-16 07:40:11'),
(808, 3076, 128, 1200.00, 535.00, 1, 2, 2, NULL, NULL, '2025-11-03 04:23:24', '2026-06-14 06:00:33'),
(809, 3076, 127, 580.00, 580.00, 1, 2, 2, NULL, NULL, '2025-11-03 04:23:24', '2026-03-16 07:40:11'),
(810, 3076, 126, 320.00, 320.00, 1, 2, 2, NULL, NULL, '2025-11-03 04:23:24', '2026-03-16 07:40:11'),
(811, 3075, 143, 880.00, 401.00, 1, 2, 2, NULL, NULL, '2025-11-04 10:47:13', '2026-06-03 07:22:49'),
(812, 3077, 143, 384.00, 384.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(813, 3077, 142, 399.00, 399.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(814, 3077, 140, 730.00, 730.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(815, 3077, 128, 1200.00, 780.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(816, 3077, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(817, 3077, 126, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(818, 3077, 143, 384.00, 384.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(819, 3077, 142, 399.00, 399.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(820, 3077, 140, 730.00, 730.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(821, 3077, 128, 1200.00, 780.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(822, 3077, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(823, 3077, 126, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2025-11-12 06:28:00', '2025-11-12 06:28:00'),
(824, 3075, 146, 550.00, 209.00, 1, 2, 2, NULL, NULL, '2025-11-15 11:35:19', '2026-06-03 07:22:49'),
(825, 3075, 147, 228.00, 237.00, 1, 2, 2, NULL, NULL, '2025-11-16 03:44:44', '2026-06-03 07:19:48'),
(826, 3028, 147, 228.00, 228.00, 1, 2, 2, NULL, NULL, '2025-11-19 10:13:25', '2025-11-22 07:15:18'),
(827, 3028, 146, 550.00, 550.00, 1, 2, 2, NULL, NULL, '2025-11-19 10:13:25', '2025-11-22 07:15:18'),
(828, 3078, 147, 228.00, 228.00, 1, 2, NULL, NULL, NULL, '2026-01-04 10:04:38', '2026-01-04 10:04:38'),
(829, 3078, 146, 550.00, 550.00, 1, 2, NULL, NULL, NULL, '2026-01-04 10:04:38', '2026-01-04 10:04:38'),
(830, 3078, 143, 880.00, 880.00, 1, 2, NULL, NULL, NULL, '2026-01-04 10:04:38', '2026-01-04 10:04:38'),
(831, 3078, 142, 435.00, 435.00, 1, 2, NULL, NULL, NULL, '2026-01-04 10:04:38', '2026-01-04 10:04:38'),
(832, 3078, 140, 730.00, 730.00, 1, 2, NULL, NULL, NULL, '2026-01-04 10:04:38', '2026-01-04 10:04:38'),
(833, 3078, 128, 1200.00, 1200.00, 1, 2, NULL, NULL, NULL, '2026-01-04 10:04:38', '2026-01-04 10:04:38'),
(834, 3078, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2026-01-04 10:04:38', '2026-01-04 10:04:38'),
(835, 3078, 126, 320.00, 180.00, 1, 2, NULL, NULL, NULL, '2026-01-04 10:04:38', '2026-01-04 10:04:38'),
(836, 3076, 147, 228.00, 228.00, 1, 2, 2, NULL, NULL, '2026-03-16 07:40:11', '2026-06-14 06:00:33'),
(837, 3076, 146, 550.00, 550.00, 1, 2, 2, NULL, NULL, '2026-03-16 07:40:11', '2026-06-14 06:00:33'),
(838, 3075, 150, 320.00, 89.00, 1, 2, 2, NULL, NULL, '2026-04-04 09:13:40', '2026-06-03 07:19:48'),
(839, 3028, 150, 320.00, 320.00, 1, 2, 2, NULL, NULL, '2026-04-08 05:35:11', '2026-04-08 05:36:41'),
(840, 3075, 124, 145.00, 145.00, 1, 2, 2, NULL, NULL, '2026-06-03 07:02:52', '2026-06-03 07:03:40'),
(841, 3075, 121, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2026-06-03 07:02:52', '2026-06-03 07:03:40'),
(842, 3075, 120, 149.00, 149.00, 1, 2, 2, NULL, NULL, '2026-06-03 07:02:52', '2026-06-03 07:03:40'),
(843, 3075, 151, 320.00, 78.00, 1, 2, NULL, NULL, NULL, '2026-06-03 07:28:12', '2026-06-03 07:28:12'),
(844, 3028, 151, 320.00, 320.00, 1, 2, 2, NULL, NULL, '2026-06-07 09:43:16', '2026-06-08 05:20:46'),
(845, 3076, 151, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-06-14 06:00:33', '2026-06-14 06:00:33'),
(846, 3076, 150, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-06-14 06:00:33', '2026-06-14 06:00:33'),
(847, 3076, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2026-06-14 06:00:33', '2026-06-14 06:00:33'),
(848, 3076, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2026-06-14 06:00:33', '2026-06-14 06:00:33'),
(849, 3076, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2026-06-14 06:00:33', '2026-06-14 06:00:33'),
(850, 3058, 151, 320.00, 320.00, 1, 2, 2, NULL, NULL, '2026-07-14 08:54:08', '2026-08-01 05:47:48'),
(851, 3058, 150, 320.00, 320.00, 1, 2, 2, NULL, NULL, '2026-07-14 08:54:08', '2026-08-01 05:47:48'),
(852, 3058, 147, 228.00, 228.00, 1, 2, 2, NULL, NULL, '2026-07-14 08:54:08', '2026-08-01 05:47:48'),
(853, 3058, 146, 550.00, 550.00, 1, 2, 2, NULL, NULL, '2026-07-14 08:54:08', '2026-08-01 05:47:48'),
(854, 3058, 143, 880.00, 880.00, 1, 2, 2, NULL, NULL, '2026-07-14 08:54:08', '2026-08-01 05:47:48'),
(855, 3058, 142, 435.00, 435.00, 1, 2, 2, NULL, NULL, '2026-07-14 08:54:08', '2026-08-01 05:47:48'),
(856, 3079, 151, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(857, 3079, 150, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(858, 3079, 147, 228.00, 228.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(859, 3079, 146, 550.00, 550.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(860, 3079, 143, 880.00, 880.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(861, 3079, 142, 435.00, 435.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(862, 3079, 140, 730.00, 730.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(863, 3079, 128, 1200.00, 780.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(864, 3079, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(865, 3079, 126, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(866, 3079, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(867, 3079, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(868, 3079, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2026-08-23 04:38:41', '2026-08-23 04:38:41'),
(869, 3081, 151, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(870, 3081, 150, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(871, 3081, 147, 228.00, 228.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(872, 3081, 146, 550.00, 550.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(873, 3081, 143, 880.00, 880.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(874, 3081, 142, 435.00, 435.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(875, 3081, 140, 730.00, 730.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(876, 3081, 128, 1200.00, 1200.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(877, 3081, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(878, 3081, 126, 320.00, 100.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(879, 3081, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(880, 3081, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(881, 3081, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2026-09-21 07:16:58', '2026-09-21 07:16:58'),
(882, 3082, 151, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(883, 3082, 150, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(884, 3082, 147, 228.00, 228.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(885, 3082, 146, 550.00, 550.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(886, 3082, 143, 880.00, 880.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(887, 3082, 142, 435.00, 435.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(888, 3082, 140, 730.00, 730.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(889, 3082, 128, 1200.00, 800.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(890, 3082, 127, 580.00, 580.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(891, 3082, 126, 320.00, 320.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(892, 3082, 124, 145.00, 145.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(893, 3082, 121, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44'),
(894, 3082, 120, 149.00, 149.00, 1, 2, NULL, NULL, NULL, '2026-10-08 07:10:44', '2026-10-08 07:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `coa_setups`
--

CREATE TABLE `coa_setups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `head_code` bigint(20) NOT NULL,
  `head_name` varchar(255) NOT NULL,
  `transaction` tinyint(4) NOT NULL DEFAULT 0,
  `general` tinyint(4) NOT NULL DEFAULT 0,
  `head_type` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `updateable` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coa_setups`
--

INSERT INTO `coa_setups` (`id`, `company_id`, `parent_id`, `head_code`, `head_name`, `transaction`, `general`, `head_type`, `status`, `updateable`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'Assets', 0, 0, 'A', 1, 0, 1, 1, NULL, NULL, '2023-12-07 07:14:30', '2024-02-29 04:23:44'),
(2, 1, NULL, 2, 'Liabilities', 0, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2023-12-07 07:14:59', '2024-02-29 04:34:17'),
(3, 1, NULL, 3, 'Income', 0, 0, 'I', 1, 0, 1, NULL, NULL, NULL, '2023-12-07 07:17:15', '2023-12-07 07:17:15'),
(4, 1, NULL, 4, 'Expense', 0, 0, 'E', 1, 0, 1, 2, NULL, NULL, '2023-12-07 07:17:44', '2024-02-07 07:38:13'),
(18, 1, 1, 101, 'Current Asset', 0, 0, 'A', 1, 0, 1, 1, NULL, NULL, '2023-12-12 14:10:35', '2024-02-29 04:23:55'),
(19, 1, 18, 10101, 'Account Receivable', 0, 1, 'A', 1, 0, 1, 1, NULL, NULL, '2023-12-12 14:12:01', '2024-02-29 04:24:53'),
(21, 1, 3, 301, 'Direct Income', 0, 0, 'I', 1, 0, 1, 2, NULL, NULL, '2023-12-12 15:55:05', '2023-12-30 06:50:11'),
(22, 1, 21, 30101, 'Product Sale', 1, 1, 'I', 1, 0, 1, NULL, NULL, NULL, '2023-12-12 15:55:39', '2023-12-12 15:55:39'),
(23, 1, 18, 10102, 'Cash In Hand', 0, 1, 'A', 1, 0, 1, 68, NULL, NULL, '2023-12-13 03:34:03', '2024-02-08 09:08:16'),
(24, 1, 18, 10103, 'Cash In Bank', 0, 1, 'A', 1, 0, 1, 1, NULL, NULL, '2023-12-13 12:55:18', '2024-02-29 04:29:57'),
(26, 1, 23, 1010201, 'Cash in Hand (Dhaka)', 1, 0, 'A', 1, 1, 1, 1, NULL, NULL, '2023-12-13 12:57:46', '2024-02-29 04:26:56'),
(27, 1, 4, 401, 'Administrative Exp', 0, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2023-12-13 13:10:45', '2023-12-13 13:10:45'),
(28, 1, 27, 40101, 'Salary expense', 1, 1, 'E', 1, 1, 1, 68, NULL, NULL, '2023-12-13 13:11:22', '2024-02-05 10:37:26'),
(30, 1, 2, 201, 'Cash Payable', 0, 1, 'L', 1, 0, 1, 68, NULL, NULL, '2023-12-13 13:12:36', '2024-02-05 11:55:52'),
(31, 1, 30, 20101, 'Habib Inds. Limited', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2023-12-13 13:13:14', '2024-02-29 04:34:50'),
(32, 1, 21, 30102, 'Sales Return', 1, 1, 'I', 1, 0, 1, 1, NULL, NULL, '2023-12-13 15:39:24', '2023-12-13 15:39:36'),
(33, 1, 4, 402, 'Raw Metarials Purchase', 0, 1, 'E', 1, 1, 1, 68, NULL, NULL, '2023-12-17 05:47:20', '2024-02-10 05:33:20'),
(34, 1, 2, 202, 'Share Capital', 0, 1, 'L', 1, 1, 2, 1, NULL, NULL, '2023-12-30 06:40:56', '2024-11-30 05:17:42'),
(35, 1, 2, 203, 'Short Term Liability', 0, 1, 'L', 1, 1, 2, 1, NULL, NULL, '2023-12-30 06:41:51', '2024-02-29 04:36:31'),
(36, 1, 1, 102, 'Fixed Asset', 0, 0, 'A', 1, 0, 2, 1, NULL, NULL, '2023-12-30 06:44:47', '2024-02-29 04:33:05'),
(37, 1, 36, 10201, 'Furniture', 1, 1, 'A', 1, 1, 2, 68, NULL, NULL, '2023-12-30 06:45:34', '2024-02-06 06:35:24'),
(38, 1, 36, 10202, 'Machineries', 1, 1, 'A', 1, 1, 2, 68, NULL, NULL, '2023-12-30 06:46:08', '2024-02-06 06:35:29'),
(39, 1, 24, 1010301, 'Ali fine foods (NCC Bank-26743)', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2023-12-30 06:47:26', '2024-02-29 04:30:24'),
(41, 1, 24, 1010302, 'Ali Fine Foods (DBBL 0188731544)', 1, 0, 'A', 1, 1, 2, 2, NULL, NULL, '2023-12-30 06:48:26', '2024-02-03 11:26:56'),
(42, 1, 3, 302, 'Indirect Income', 0, 1, 'I', 1, 1, 2, 120, NULL, NULL, '2023-12-30 06:49:13', '2024-07-01 09:55:29'),
(43, 1, 27, 40102, 'Conveyance Bill', 0, 1, 'E', 1, 1, 2, 68, NULL, NULL, '2023-12-30 06:52:44', '2024-02-05 05:49:52'),
(44, 1, 43, 4010201, 'Con. Mr.Shoaib Azmol', 1, 0, 'E', 1, 1, 2, 1, NULL, NULL, '2023-12-30 06:53:12', '2024-02-29 04:38:59'),
(45, 1, 35, 20301, 'M Shamot Ali (Loan)', 1, 0, 'L', 1, 1, 2, 1, NULL, NULL, '2023-12-30 06:54:30', '2024-02-29 04:36:58'),
(46, 1, 36, 10203, 'IT Infrastructure', 0, 1, 'A', 1, 1, 2, NULL, NULL, NULL, '2023-12-30 07:23:04', '2023-12-30 07:23:04'),
(47, 1, 46, 1020301, 'Software Purchase', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2023-12-30 07:23:21', '2024-02-29 04:33:41'),
(48, 1, 19, 1010101, 'Bonton Foods Limited', 1, 0, 'A', 1, 1, 75, 1, NULL, NULL, '2024-02-03 09:37:09', '2024-02-29 04:24:58'),
(49, 1, 19, 1010102, 'Pick & Pay', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-03 11:23:06', '2024-02-29 04:25:02'),
(50, 1, 19, 1010103, 'Dhali Super Shop', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-03 11:23:35', '2024-02-29 04:25:05'),
(51, 1, 19, 1010104, 'Mr. Atikur Rahman (Client)', 1, 0, 'A', 1, 1, 2, 68, NULL, NULL, '2024-02-03 11:24:08', '2024-03-23 10:14:00'),
(52, 1, 46, 1020302, 'Desktop PC', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-03 11:28:30', '2024-02-29 04:34:01'),
(53, 1, 30, 20102, 'MG Corp. Limted', 1, 0, 'L', 1, 1, 2, 1, NULL, NULL, '2024-02-03 11:29:43', '2024-02-29 04:35:15'),
(54, 1, 30, 20103, 'Techno Park Bangladesh', 1, 0, 'L', 1, 1, 2, 1, NULL, NULL, '2024-02-03 11:30:25', '2024-02-29 04:36:02'),
(55, 1, 4, 403, 'Tissue', 1, 1, 'E', 1, 1, 2, 133, NULL, NULL, '2024-02-03 11:33:53', '2024-10-27 08:51:15'),
(56, 1, 4, 404, 'Office Supplies', 1, 1, 'E', 1, 1, 2, 68, NULL, NULL, '2024-02-03 11:34:42', '2024-02-04 11:17:33'),
(57, 1, 4, 405, 'Lunch bill', 1, 1, 'E', 1, 1, 68, 68, NULL, NULL, '2024-02-04 11:15:20', '2024-02-04 11:17:41'),
(58, 1, 4, 406, 'Mobile bill', 1, 1, 'E', 1, 1, 68, 68, NULL, NULL, '2024-02-04 11:15:53', '2024-02-04 11:17:54'),
(59, 1, 43, 4010202, 'Con.Mr.Atikur rahman', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-05 05:53:16', '2024-02-29 04:39:40'),
(60, 1, 43, 4010203, 'Con.Mr.Sohag Hossain', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-05 05:54:00', '2024-02-29 04:39:45'),
(61, 1, 43, 4010204, 'Con.Mr.Al Amin', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-05 05:54:20', '2024-02-29 04:39:49'),
(62, 1, 43, 4010205, 'Others conveyance', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-05 05:54:47', '2024-02-29 04:39:58'),
(63, 1, 27, 40103, 'Gift & Subscription', 1, 1, 'E', 1, 1, 68, 68, NULL, NULL, '2024-02-05 05:55:53', '2024-02-05 05:59:33'),
(64, 1, 4, 407, 'Entertainment bill', 1, 1, 'E', 1, 1, 68, 68, NULL, NULL, '2024-02-05 05:58:12', '2024-02-05 05:59:26'),
(66, 1, 19, 1010105, 'Cash sales', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-05 06:37:19', '2024-02-29 15:18:36'),
(67, 1, 4, 408, 'Repairing  & Maintenance', 1, 1, 'E', 1, 1, 68, 68, NULL, NULL, '2024-02-05 06:38:42', '2024-02-12 07:39:47'),
(68, 1, 18, 10104, 'Advanced Payment', 0, 1, 'A', 1, 1, 68, 2, NULL, NULL, '2024-02-05 07:39:24', '2024-02-05 07:40:20'),
(69, 1, 68, 1010401, 'Md.Shoaib Azmol (BDM)1002', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-05 07:45:46', '2024-02-29 04:31:26'),
(70, 1, 68, 1010402, 'Advance-Mr.Atikur rahman (1001)', 1, 0, 'A', 1, 1, 68, 133, NULL, NULL, '2024-02-05 07:46:23', '2024-12-04 09:57:01'),
(71, 1, 68, 1010403, 'Md.Al Amin (1009)', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-05 07:47:18', '2024-02-29 04:31:36'),
(72, 1, 68, 1010404, 'Mr.Sohag Hossain(1006)', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-05 07:47:50', '2024-02-29 04:31:44'),
(73, 1, 4, 409, 'Night Allowance', 1, 1, 'E', 1, 1, 68, 133, NULL, NULL, '2024-02-05 08:29:28', '2024-11-02 10:44:45'),
(74, 1, 43, 4010206, 'Con.Mst.Parul Begum(1007)', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-05 09:44:48', '2024-02-29 04:40:01'),
(75, 1, 43, 4010207, 'Con.sekh deluar Hossain (1008)', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-05 09:51:38', '2024-02-29 04:40:05'),
(76, 1, 4, 410, 'Factory Rent', 1, 1, 'E', 1, 1, 68, 68, NULL, NULL, '2024-02-05 10:30:21', '2024-02-05 10:32:05'),
(77, 1, 4, 411, 'Factory Utility expense', 0, 1, 'E', 1, 1, 68, 68, NULL, NULL, '2024-02-05 10:33:40', '2024-02-08 05:28:40'),
(78, 1, 4, 412, 'Mr.Razib Bread pit cash transfer', 1, 1, 'E', 1, 1, 68, 68, NULL, NULL, '2024-02-05 10:43:50', '2024-02-05 10:44:43'),
(79, 1, 35, 20302, 'Loan Patty Cash', 1, 0, 'L', 1, 1, 68, 1, NULL, NULL, '2024-02-06 05:59:13', '2024-02-29 04:37:01'),
(80, 1, 19, 1010106, 'Apon Family Mart', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-07 05:33:08', '2024-02-29 15:17:48'),
(81, 1, 30, 20104, 'RFL plastic', 1, 0, 'L', 1, 1, 68, 2, NULL, NULL, '2024-02-08 05:23:25', '2024-12-04 09:49:28'),
(82, 1, 77, 41101, 'Electricity bill', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-08 05:29:07', '2024-02-29 04:42:51'),
(83, 1, 77, 41102, 'Internet bill', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-08 05:29:39', '2024-02-29 04:42:54'),
(84, 1, 77, 41103, 'Service charge', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-08 05:29:56', '2024-02-29 04:42:56'),
(85, 1, 4, 413, 'Gervase bill', 1, 1, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-08 05:30:28', '2024-02-29 04:43:31'),
(86, 1, 4, 414, 'Renovation work', 1, 1, 'E', 1, 1, 68, NULL, NULL, NULL, '2024-02-08 06:33:20', '2024-02-08 06:33:20'),
(87, 1, 19, 1010107, 'Dedar Super Shop', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-08 09:19:25', '2024-02-29 15:18:20'),
(88, 1, 33, 40201, 'Sugar purchase', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-10 05:33:52', '2024-02-29 04:41:21'),
(89, 1, 33, 40202, 'Soyabin oil purchase', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-10 05:34:17', '2024-02-29 04:41:25'),
(90, 1, 33, 40203, 'Egg purchase', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-10 05:34:39', '2024-02-29 04:41:28'),
(91, 1, 33, 40204, 'others Raw Metarials', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-10 05:35:01', '2024-02-29 04:41:30'),
(92, 1, 4, 415, 'cleaning expense', 1, 1, 'E', 1, 1, 68, NULL, NULL, NULL, '2024-02-10 06:37:18', '2024-02-10 06:37:18'),
(93, 1, 30, 20105, 'Rifat Plastic', 1, 0, 'L', 1, 1, 68, 1, NULL, NULL, '2024-02-10 06:53:28', '2024-02-29 04:36:09'),
(94, 1, 4, 416, 'Packaging expense', 1, 1, 'E', 1, 1, 68, NULL, NULL, NULL, '2024-02-10 07:21:26', '2024-02-10 07:21:26'),
(95, 1, 68, 1010405, 'Goodland', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-11 07:21:46', '2024-02-29 04:31:47'),
(96, 1, 68, 1010406, 'Bread Pit', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-11 07:22:06', '2024-02-29 04:31:51'),
(97, 1, 77, 41104, 'water bill', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-12 07:41:44', '2024-02-29 04:42:59'),
(98, 1, 19, 1010108, 'Mejan General Store-Kawran Bazar', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-13 07:54:07', '2024-02-29 15:19:05'),
(99, 1, 19, 1010109, 'Altaf General Store- Kawran', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-13 07:58:15', '2024-02-29 15:19:12'),
(100, 1, 19, 1010110, 'Khan Enterprise - Kawran', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-13 07:59:24', '2024-02-29 15:19:19'),
(101, 1, 19, 1010111, 'Sonargaon General Store- Kawran Bazar', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-13 08:01:27', '2024-02-29 15:19:23'),
(102, 1, 19, 1010112, 'Palash Enterprise- kawran bazar', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-13 08:02:42', '2024-02-29 15:19:25'),
(103, 1, 19, 1010113, 'Sariotpur Enterprise-Gulshan-1', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-15 05:35:37', '2024-02-29 15:19:27'),
(104, 1, 19, 1010114, 'M.R Corporation - Gulshan-1', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-15 05:37:54', '2024-02-29 15:19:30'),
(105, 1, 19, 1010115, 'Labeeb Corporation - Gulshan-1', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-15 05:40:43', '2024-02-29 15:19:34'),
(106, 1, 19, 1010116, 'Brothers General Store- Gulshan-1', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-15 05:44:51', '2024-02-29 15:19:37'),
(107, 1, 19, 1010117, 'R.S.K Traders - Gulshan-1', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-15 05:50:58', '2024-02-29 15:19:41'),
(108, 1, 19, 1010118, 'Shahi Food Service- Mirpur-02', 1, 0, 'A', 1, 1, 2, 2, NULL, NULL, '2024-02-15 06:39:15', '2024-06-23 10:05:45'),
(109, 1, 43, 4010208, 'Con.Mr.Nahid Hasan', 1, 0, 'E', 1, 1, 68, 1, NULL, NULL, '2024-02-17 10:26:31', '2024-02-29 04:40:08'),
(110, 1, 19, 1010119, 'Gemini Shopping Centre', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-18 06:17:23', '2024-02-29 15:19:47'),
(111, 1, 19, 1010120, 'Salafi Traders-Kachukhet', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-20 05:24:17', '2024-02-29 15:19:50'),
(112, 1, 19, 1010121, 'Jahan Enterprise-Kachukhet', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-20 05:24:53', '2024-02-29 15:19:55'),
(113, 1, 19, 1010122, 'Ayesha Enterprise- Enterprise', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-20 05:31:05', '2024-02-29 15:19:58'),
(114, 1, 19, 1010123, 'Sikder Enterprise-Kachukhet', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-20 05:32:13', '2024-02-29 15:20:01'),
(115, 1, 19, 1010124, 'Farzana Enterprise-Kachukhet', 1, 0, 'A', 1, 1, 68, 1, NULL, NULL, '2024-02-20 10:12:22', '2024-02-29 15:20:05'),
(116, 1, 19, 1010125, 'Panda Mart', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-25 05:15:40', '2024-02-29 15:20:09'),
(117, 1, 19, 1010126, 'Meena Bazar', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-02-29 05:37:11', '2024-02-29 15:20:12'),
(118, 1, 30, 20106, 'Production Cash Expense', 1, 0, 'L', 1, 1, 2, NULL, NULL, NULL, '2024-03-06 05:14:00', '2024-03-06 05:14:00'),
(119, 1, 4, 417, 'Product Purchase', 1, 1, 'E', 1, 1, 1, NULL, NULL, NULL, '2024-03-06 05:29:44', '2024-03-06 05:29:44'),
(120, 1, 4, 418, 'Stationery expense', 1, 1, 'E', 1, 1, 68, NULL, NULL, NULL, '2024-03-09 06:34:31', '2024-03-09 06:34:31'),
(121, 1, 19, 1010127, 'S A Enterprise,Kawran bazar', 1, 0, 'A', 1, 1, 68, NULL, NULL, NULL, '2024-03-16 07:07:22', '2024-03-16 07:07:22'),
(122, 1, 19, 1010128, 'Noakhali General store -Kawran bazar', 1, 0, 'A', 1, 1, 68, NULL, NULL, NULL, '2024-03-16 09:17:52', '2024-03-16 09:17:52'),
(123, 1, 4, 419, 'Delivery expense', 1, 1, 'E', 1, 1, 68, NULL, NULL, NULL, '2024-03-18 09:35:20', '2024-03-18 09:35:20'),
(124, 1, 19, 1010129, 'Lavender Convenience Store Ltd.', 1, 0, 'A', 1, 1, 68, NULL, NULL, NULL, '2024-04-08 07:08:22', '2024-04-08 07:08:22'),
(125, 1, 19, 1010130, 'Davour Limited', 1, 0, 'A', 1, 1, 68, NULL, NULL, NULL, '2024-04-21 10:42:53', '2024-04-21 10:42:53'),
(126, 1, 4, 420, 'Discount Menna bazar', 1, 1, 'E', 1, 1, 68, NULL, NULL, NULL, '2024-04-22 06:57:05', '2024-04-22 06:57:05'),
(127, 1, 4, 421, 'VAT', 1, 1, 'E', 1, 1, 68, 2, NULL, NULL, '2024-04-22 06:57:55', '2024-06-29 09:01:50'),
(128, 1, 4, 422, 'Office work Expense', 1, 1, 'E', 1, 1, 68, NULL, NULL, NULL, '2024-04-25 13:56:01', '2024-04-25 13:56:01'),
(129, 1, 4, 423, 'Labour bill', 1, 1, 'E', 1, 1, 68, NULL, NULL, NULL, '2024-05-04 08:09:25', '2024-05-04 08:09:25'),
(131, 1, 19, 1010131, 'Agora Limited', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-05-15 10:44:05', '2024-05-15 10:44:05'),
(132, 1, 19, 1010132, 'VAT Receivable', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-06-29 09:03:38', '2024-06-29 09:03:38'),
(133, 1, 42, 30201, 'Wastage Sale', 1, 0, 'I', 1, 1, 120, NULL, NULL, NULL, '2024-07-01 09:56:43', '2024-07-01 09:56:43'),
(134, 1, 4, 424, 'Conveyance', 0, 0, 'E', 1, 1, 120, NULL, NULL, NULL, '2024-07-01 10:21:15', '2024-07-01 10:21:15'),
(135, 1, 4, 425, 'Utility Expenses', 1, 1, 'E', 1, 1, 120, 120, NULL, NULL, '2024-07-01 10:54:24', '2024-07-04 09:01:05'),
(136, 1, 19, 1010133, 'Taj General Store- Gulshan DCC Market', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-07-03 05:05:46', '2024-07-03 05:05:46'),
(137, 1, 19, 1010134, 'Bhai Bhai General Store- Gulshan DCC', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-07-03 05:06:51', '2024-07-03 05:06:51'),
(138, 1, 19, 1010135, 'Mayer Doya Baniati Store- Gulshan DCC', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-07-03 05:07:21', '2024-07-03 05:07:21'),
(139, 1, 24, 1010303, 'NRB Bank A/C: 1022210142078', 1, 0, 'A', 1, 1, 120, 2, NULL, NULL, '2024-07-03 09:38:14', '2025-10-30 10:10:04'),
(140, 1, 19, 1010136, 'Jerin Enterprise - DCC Market', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-07-04 06:43:41', '2024-07-04 06:43:41'),
(141, 1, 19, 1010137, 'Izaan N Zayan Trade International- DCC Market', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-07-04 06:50:54', '2024-07-04 06:50:54'),
(142, 1, 19, 1010138, 'Jannath General Store - DCC Market', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-07-04 06:57:32', '2024-07-04 06:57:32'),
(143, 1, 4, 426, 'Indirect Expense', 0, 1, 'E', 1, 1, 120, NULL, NULL, NULL, '2024-07-04 09:04:06', '2024-07-04 09:04:06'),
(144, 1, 143, 42601, 'Conveyance', 1, 0, 'E', 1, 1, 120, NULL, NULL, NULL, '2024-07-04 09:04:36', '2024-07-04 09:04:36'),
(145, 1, 19, 1010139, 'Upohar General Store- DCC Market', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-07-07 05:17:41', '2024-07-07 05:17:41'),
(146, 1, 19, 1010140, 'Nihan Trade Corporation-DCC Market', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-07-07 06:12:50', '2024-07-07 06:12:50'),
(147, 1, 19, 1010141, 'Happy Potato - Dhanmondi', 1, 0, 'A', 1, 1, 2, 1, NULL, NULL, '2024-07-07 06:22:08', '2026-11-08 08:09:04'),
(148, 1, 143, 42602, 'Salary & Allowances', 1, 0, 'E', 1, 1, 120, NULL, NULL, NULL, '2024-07-17 09:14:21', '2024-07-17 09:14:21'),
(149, 1, 143, 42603, 'Wastage Bill', 1, 0, 'E', 1, 1, 120, NULL, NULL, NULL, '2024-07-17 09:18:03', '2024-07-17 09:18:03'),
(150, 1, 143, 42604, 'Printing & Stationery', 1, 0, 'E', 1, 1, 120, NULL, NULL, NULL, '2024-07-29 09:48:20', '2024-07-29 09:48:20'),
(151, 1, 143, 42605, 'Miscellaneous Expense', 1, 0, 'E', 1, 1, 120, NULL, NULL, NULL, '2024-07-29 10:47:52', '2024-07-29 10:47:52'),
(152, 1, 143, 42606, 'Carriage Outward', 1, 0, 'E', 1, 1, 120, NULL, NULL, NULL, '2024-07-29 10:48:15', '2024-07-29 10:48:15'),
(160, 1, 19, 1010142, 'MN Burger - Khilgaon', 1, 0, 'A', 1, 1, 2, 2, NULL, NULL, '2024-09-21 13:10:32', '2024-09-23 08:57:09'),
(161, 1, 19, 1010143, 'RFL', 1, 0, 'A', 1, 1, 133, NULL, NULL, NULL, '2024-10-27 06:45:28', '2024-10-27 06:45:28'),
(162, 1, 143, 42607, 'Trade license renewal fee', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-27 07:45:15', '2024-10-27 07:45:15'),
(163, 1, 43, 4010209, 'Con.Mr.Moajjem Hossain', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-27 08:00:20', '2024-10-27 08:00:20'),
(164, 1, 33, 40205, 'Xanthen Gum', 1, 0, 'E', 1, 1, 133, 133, NULL, NULL, '2024-10-27 08:19:38', '2024-10-29 10:51:37'),
(165, 1, 33, 40206, 'Salt', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-27 08:49:06', '2024-10-27 08:49:06'),
(166, 1, 33, 40207, 'Others Purchae', 1, 0, 'E', 1, 1, 133, 133, NULL, NULL, '2024-10-27 08:54:02', '2024-12-04 10:10:14'),
(167, 1, 68, 1010407, 'Md. Nahid Hasan', 1, 0, 'A', 1, 1, 133, NULL, NULL, NULL, '2024-10-28 09:03:37', '2024-10-28 09:03:37'),
(168, 1, 143, 42608, 'Sampling /Testing Fee', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-28 09:40:59', '2024-10-28 09:40:59'),
(169, 1, 143, 42609, 'Carriage Charges Inword', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 05:26:07', '2024-10-29 05:26:07'),
(170, 1, 143, 42610, 'Office Maintenance Expenses', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 05:44:25', '2024-10-29 05:44:25'),
(171, 1, 33, 40208, 'Acitic Acid Purchase', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 06:02:49', '2024-10-29 06:02:49'),
(172, 1, 33, 40209, 'Potassium Sorbate Purchase', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 06:03:16', '2024-10-29 06:03:16'),
(173, 1, 33, 40210, 'Sodium Benzoate Purchase', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 06:03:43', '2024-10-29 06:03:43'),
(174, 1, 27, 40104, 'Medical Expenses', 0, 0, 'E', 1, 1, 133, 133, NULL, NULL, '2024-10-29 10:09:37', '2024-10-29 10:11:46'),
(175, 1, 27, 40105, 'Medical Expenses', 0, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:13:30', '2024-10-29 10:13:30'),
(176, 1, 143, 42611, 'Medical Expenses', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:14:09', '2024-10-29 10:14:09'),
(177, 1, 33, 40211, 'Tasting Salt', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:22:24', '2024-10-29 10:22:24'),
(178, 1, 33, 40212, 'White Paper Powder', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:23:36', '2024-10-29 10:23:36'),
(179, 1, 33, 40213, 'Chilli Powder', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:24:39', '2024-10-29 10:24:39'),
(180, 1, 33, 40214, 'Garlic Powder', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:24:56', '2024-10-29 10:24:56'),
(181, 1, 33, 40215, 'Musterd Seed', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:25:21', '2024-10-29 10:25:21'),
(182, 1, 33, 40216, 'Zipper Poly', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:39:11', '2024-10-29 10:39:11'),
(183, 1, 143, 42612, 'Online Charges', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-29 10:40:33', '2024-10-29 10:40:33'),
(184, 1, 33, 40217, 'Dish Washer', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-30 11:06:29', '2024-10-30 11:06:29'),
(185, 1, 143, 42613, 'House Rent', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-30 11:28:42', '2024-10-30 11:28:42'),
(186, 1, 33, 40218, 'Container Jar', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-31 10:21:07', '2024-10-31 10:21:07'),
(187, 1, 143, 42614, 'Fuel & Lubricant Expenses', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-31 10:32:27', '2024-10-31 10:32:27'),
(188, 1, 68, 1010408, 'Mr. Abir-GM', 1, 0, 'A', 1, 1, 133, NULL, NULL, NULL, '2024-10-31 10:57:42', '2024-10-31 10:57:42'),
(189, 1, 77, 41105, 'Con.Mr. Ashik-Accounts Officer', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-10-31 11:37:13', '2024-10-31 11:37:13'),
(190, 1, 143, 42615, 'Con.Mr Mehedi', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-11-02 07:47:39', '2024-11-02 07:47:39'),
(191, 1, 143, 42616, 'Postage & Curiar Expenses', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-11-02 07:51:07', '2024-11-02 07:51:07'),
(192, 1, 68, 1010409, 'Mr. Sohel- Qc', 1, 0, 'A', 1, 1, 133, NULL, NULL, NULL, '2024-11-02 08:03:25', '2024-11-02 08:03:25'),
(193, 1, 68, 1010410, 'Mr. Shofiqul', 1, 0, 'A', 1, 1, 133, NULL, NULL, NULL, '2024-11-02 08:03:42', '2024-11-02 08:03:42'),
(194, 1, 143, 42617, 'Con.Mr. Sohel QC', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-11-02 09:03:46', '2024-11-02 09:03:46'),
(195, 1, 143, 42618, 'Software Bill', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-11-02 09:08:38', '2024-11-02 09:08:38'),
(196, 1, 33, 40219, 'Makeup Purchase Expenses', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-11-02 09:10:59', '2024-11-02 09:10:59'),
(197, 1, 68, 1010411, 'Mr. Rifat-Team Member', 1, 0, 'A', 1, 1, 133, NULL, NULL, NULL, '2024-11-03 11:19:22', '2024-11-03 11:19:22'),
(198, 1, 68, 1010412, 'Mr. Ashik-Accounts Officer', 1, 0, 'A', 1, 1, 133, NULL, NULL, NULL, '2024-11-03 11:23:07', '2024-11-03 11:23:07'),
(199, 1, 19, 1010144, 'Mon Cheri - Badda', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2024-11-19 06:33:19', '2024-11-19 06:33:19'),
(200, 1, 2, 210, 'Short Term Loan', 0, 1, 'L', 1, 1, 1, NULL, NULL, NULL, '2024-11-30 03:49:59', '2024-11-30 03:49:59'),
(201, 1, 200, 21001, 'Short Term Loan From Goodland Development', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2024-11-30 03:50:13', '2024-11-30 03:50:13'),
(202, 1, 200, 21002, 'Short Term Loan from Bread Pit', 1, 0, 'L', 1, 1, 1, 133, NULL, NULL, '2024-11-30 03:50:31', '2024-12-04 09:45:13'),
(205, 1, 46, 1020303, 'Computer & Accessories', 1, 0, 'A', 1, 1, 1, NULL, NULL, NULL, '2024-11-30 04:36:38', '2024-11-30 04:36:38'),
(206, 1, 200, 21003, 'Short Term Loan from M Shahmat Ali', 1, 0, 'L', 1, 1, 133, NULL, NULL, NULL, '2024-12-04 09:45:25', '2024-12-04 09:45:25'),
(207, 1, 30, 20107, 'Bread Pit', 1, 0, 'L', 1, 1, 2, NULL, NULL, NULL, '2024-12-04 09:46:43', '2024-12-04 09:46:43'),
(208, 1, 68, 1010413, 'Mr. Nirupon Chowdhury', 1, 0, 'A', 1, 1, 133, NULL, NULL, NULL, '2024-12-05 06:55:48', '2024-12-05 06:55:48'),
(209, 1, 143, 42619, 'Festival/ Holiday Allowance', 1, 0, 'E', 1, 1, 133, NULL, NULL, NULL, '2024-12-05 08:38:36', '2024-12-05 08:38:36'),
(210, 1, 19, 1010145, 'Masud Hossain', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2025-05-29 06:36:31', '2025-05-29 06:36:31'),
(211, 1, 19, 1010146, 'Jahangir Store - Kawran Bazar', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2025-06-21 06:43:25', '2025-06-21 06:43:25'),
(212, 1, 19, 1010147, 'Gweebarra Bakery Ind. Limited (Cooper\'s Bakery)', 1, 0, 'A', 1, 1, 2, 2, NULL, NULL, '2025-09-01 10:08:37', '2025-09-01 11:05:15'),
(213, 1, 19, 1010148, 'KUDOS', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2025-09-10 05:27:30', '2025-09-10 05:27:30'),
(214, 1, 19, 1010149, 'Brisket & Bistro', 1, 0, 'A', 1, 1, 2, 2, NULL, NULL, '2025-11-03 04:20:57', '2026-01-02 19:03:24'),
(215, 1, 19, 1010150, 'Kings Confectionary', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2025-11-12 06:21:58', '2025-11-12 06:21:58'),
(216, 1, 19, 1010151, 'Omair', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2026-01-04 10:03:24', '2026-01-04 10:03:24'),
(217, 1, 19, 1010152, 'Green Lab', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2026-08-23 04:37:13', '2026-08-23 04:37:13'),
(218, 1, 19, 1010153, 'Enamul Huq - GM, Bonton Foods Ltd.', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2026-09-21 07:14:38', '2026-09-21 07:14:38'),
(219, 1, 19, 1010154, 'Mollika Snacks - Gulshan', 1, 0, 'A', 1, 1, 2, NULL, NULL, NULL, '2026-10-08 07:09:33', '2026-10-08 07:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `payment_no` varchar(255) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(255) NOT NULL,
  `collection_type` varchar(255) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `sales_id` bigint(20) UNSIGNED DEFAULT NULL,
  `on_return` tinyint(4) NOT NULL DEFAULT 0,
  `approved` tinyint(4) NOT NULL DEFAULT 0,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_data`
--

CREATE TABLE `collection_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collection_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `tin` varchar(255) DEFAULT NULL,
  `trade_license` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `prefix`, `name`, `username`, `email`, `phone`, `fax`, `website`, `vat`, `tin`, `trade_license`, `address`, `logo`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'PB', 'Prima Bakery (Bread Pit)', 'alifinefoods', 'primabakery.bangladesh@gmail.com', 'Mobile: 01738113386', '01738113386', NULL, '0', '654', 'tradelicense', '103, Al-Helal Club Road, Mendipur, Demra, Dhaka-1360', 'media/company/2024-02-03-uztrGUMrL36yHtLTzcrwRuTvhMVsMyUIMPOAcjzI.webp', 1, 1, NULL, NULL, '2023-09-23 06:52:33', '2026-11-08 07:01:49');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) NOT NULL,
  `title` text DEFAULT NULL,
  `address` text NOT NULL,
  `work_time` text NOT NULL,
  `primary_mobile` varchar(255) NOT NULL,
  `primary_email` varchar(255) NOT NULL,
  `secondary_mobile` varchar(255) NOT NULL,
  `secondary_email` varchar(255) NOT NULL,
  `map_url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `heading`, `title`, `address`, `work_time`, `primary_mobile`, `primary_email`, `secondary_mobile`, `secondary_email`, `map_url`, `created_at`, `updated_at`) VALUES
(1, 'GET IN TOUCH', '<span style=\"color: rgb(30, 41, 59);\">Don’t hesitate to contact us directly so that we can think together about a solution.</span>', '<p>171, Tejgaon, Industrial Area,</p><p><span style=\"background-color: var(--bs-white); text-align: var(--bs-body-text-align);\">Dhaka-1208, Bangladesh</span></p>', '<span segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" medium;\"=\"\" style=\"color: rgb(71, 85, 105);\">Monday to Friday</span><br segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" medium;\"=\"\" style=\"border-width: 0px; border-style: solid; border-color: currentcolor; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(71, 85, 105);\"><span segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" medium;\"=\"\" style=\"color: rgb(71, 85, 105);\">7 a.m. 12 p.m. – 1 p.m. 4 p.m.</span><br segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" medium;\"=\"\" style=\"border-width: 0px; border-style: solid; border-color: currentcolor; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(71, 85, 105);\"><br segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" medium;\"=\"\" style=\"border-width: 0px; border-style: solid; border-color: currentcolor; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(71, 85, 105);\"><span segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" medium;\"=\"\" style=\"color: rgb(71, 85, 105);\">Saturday</span><br segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" medium;\"=\"\" style=\"border-width: 0px; border-style: solid; border-color: currentcolor; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(71, 85, 105);\"><span segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" medium;\"=\"\" style=\"color: rgb(71, 85, 105);\">8 a.m. 2 p.m.</span>', '+880 1738113386', 'info@alifinefoods.com', '+880 1738113386', 'sales@alifinefoods.com', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d116858.24965468793!2d90.36900709326277!3d23.753786657492096!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b1a1d4f8eb13%3A0x94bcb10446c2989e!2sAli%20food%20%26%20beverage%20Private%20Limited!5e0!3m2!1sen!2sbd!4v1709025867592!5m2!1sen!2sbd', '2024-02-27 09:25:49', '2026-05-02 11:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inside_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `outside_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `upto` decimal(8,2) NOT NULL DEFAULT 0.00,
  `charge_for_extra` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_charges`
--

INSERT INTO `delivery_charges` (`id`, `inside_charge`, `outside_charge`, `upto`, `charge_for_extra`, `created_at`, `updated_at`) VALUES
(1, 70.00, 150.00, 0.00, 0.00, '2023-11-18 04:06:32', '2023-11-18 04:10:47');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_lists`
--

CREATE TABLE `delivery_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `sales_list_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `details_cards`
--

CREATE TABLE `details_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `serial` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `details_cards`
--

INSERT INTO `details_cards` (`id`, `title`, `description`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TEST ONE', '<p><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment. </span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment. </span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment. </span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment. </span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment. </span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment. </span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.</span><span style=\"background-color: rgb(241, 245, 249); color: rgb(51, 65, 85); font-family: Figtree, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, \"Noto Sans\", sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; font-size: medium; text-align: center;\"> </span><br></p>', 5, 1, '2023-10-03 13:07:42', '2024-11-23 07:22:25'),
(2, 'A LARGE VARIETY OF PRODUCTS', '<p><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.</span><span style=\"background-color: rgb(241, 245, 249); color: rgb(51, 65, 85); font-family: Figtree, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: medium; text-align: center;\">&nbsp;</span><br></p>', 2, 1, '2023-10-03 13:08:10', '2023-10-03 13:08:10'),
(3, 'A LARGE VARIETY OF PRODUCTS', '<p><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.&nbsp;</span><span style=\"text-align: center;\">We have the freshest foods with the best quality from the food industry segment.</span><span style=\"background-color: rgb(241, 245, 249); color: rgb(51, 65, 85); font-family: Figtree, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: medium; text-align: center;\">&nbsp;</span><br></p>', 3, 1, '2023-10-03 13:08:26', '2023-10-03 13:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `team_leader` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sales_targets`
--

CREATE TABLE `group_sales_targets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `year` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `total_target` decimal(16,2) NOT NULL,
  `total_target_amount` decimal(16,2) NOT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sales_target_categories`
--

CREATE TABLE `group_sales_target_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_sales_target_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `target` decimal(16,2) NOT NULL,
  `target_amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `liftings`
--

CREATE TABLE `liftings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `lifting_no` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL DEFAULT 'credit',
  `voucher_no` varchar(255) NOT NULL,
  `lifting_date` date NOT NULL,
  `total_cost` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `total_paid` decimal(16,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `liftings`
--

INSERT INTO `liftings` (`id`, `company_id`, `store_id`, `vendor_id`, `lifting_no`, `payment_type`, `voucher_no`, `lifting_date`, `total_cost`, `discount`, `total_paid`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'ST2611000001', 'cash', 'Batch 202611081', '2026-11-08', 126.65, 0.00, 126.65, 1, 1, NULL, NULL, NULL, '2026-11-08 07:45:03', '2026-11-08 07:45:03'),
(2, 1, 2, 1, 'ST2611000002', 'credit', '145', '2026-11-08', 3039.60, 0.00, 0.00, 1, 1, 1, NULL, NULL, '2026-11-08 07:58:03', '2026-11-08 07:59:57');

-- --------------------------------------------------------

--
-- Table structure for table `lifting_documents`
--

CREATE TABLE `lifting_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lifting_id` bigint(20) UNSIGNED NOT NULL,
  `document` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lifting_products`
--

CREATE TABLE `lifting_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lifting_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `lifting_price` decimal(16,2) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `qty` decimal(16,2) NOT NULL DEFAULT 1.00,
  `total_amount` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `total_paid` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sold_qty` decimal(8,2) NOT NULL DEFAULT 0.00,
  `sales_return_qty` decimal(16,2) NOT NULL DEFAULT 0.00,
  `return_qty` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transfer_qty` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `all_finished` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lifting_products`
--

INSERT INTO `lifting_products` (`id`, `lifting_id`, `company_id`, `store_id`, `vendor_id`, `product_id`, `lifting_price`, `expiry_date`, `qty`, `total_amount`, `discount`, `total_paid`, `sold_qty`, `sales_return_qty`, `return_qty`, `transfer_qty`, `status`, `all_finished`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1, 120, 126.65, NULL, 1.00, 126.65, 0.00, 126.65, 0.00, 0.00, 0.00, 0.00, 1, 0, 1, '2026-11-08 07:45:03', '2026-11-08 07:45:03'),
(3, 2, 1, 2, 1, 120, 126.65, '2026-11-08', 24.00, 3039.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 0, 1, '2026-11-08 07:59:57', '2026-11-08 07:59:57');

-- --------------------------------------------------------

--
-- Table structure for table `lifting_returns`
--

CREATE TABLE `lifting_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `return_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lifting_return_lists`
--

CREATE TABLE `lifting_return_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `lifting_return_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `lifting_product_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `lifting_price` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `lifting_discount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `delivery_charge` int(11) NOT NULL DEFAULT 0,
  `district` tinyint(4) NOT NULL DEFAULT 0,
  `thana` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `parent_id`, `name`, `delivery_charge`, `district`, `thana`, `created_at`, `updated_at`) VALUES
(13, NULL, 'Dhaka', 60, 0, 0, '2023-02-02 09:23:07', '2023-07-29 09:19:33'),
(14, NULL, 'Rajshahi', 120, 0, 0, '2023-02-02 09:23:30', '2023-07-29 09:20:36'),
(15, NULL, 'Rangpur', 120, 0, 0, '2023-02-02 09:23:45', '2023-07-29 09:20:54'),
(16, NULL, 'Mymensingh', 120, 0, 0, '2023-02-02 09:23:54', '2023-07-29 09:20:03'),
(17, NULL, 'Sylhet', 120, 0, 0, '2023-02-02 09:24:12', '2023-07-29 09:20:13'),
(18, NULL, 'Khulna', 120, 0, 0, '2023-02-02 09:24:30', '2023-07-29 09:19:50'),
(19, NULL, 'Barisal', 120, 0, 0, '2023-02-02 09:24:39', '2023-07-29 09:21:06'),
(20, NULL, 'Chittagong', 120, 0, 0, '2023-02-02 09:24:49', '2023-07-29 09:18:42'),
(28, 19, 'Barguna', 0, 1, 0, NULL, NULL),
(29, 19, 'Barisal', 0, 1, 0, NULL, NULL),
(30, 19, 'Bhola', 0, 1, 0, NULL, NULL),
(31, 19, 'Jhalokati', 0, 1, 0, NULL, NULL),
(32, 19, 'Patuakhali', 0, 1, 0, NULL, NULL),
(33, 19, 'Pirojpur', 0, 1, 0, NULL, NULL),
(34, 20, 'Bandarban', 0, 1, 0, NULL, NULL),
(35, 20, 'Brahmanbaria', 0, 1, 0, NULL, NULL),
(36, 20, 'Chandpur', 0, 1, 0, NULL, NULL),
(37, 20, 'Chittagong', 0, 1, 0, NULL, NULL),
(38, 20, 'Comilla', 0, 1, 0, NULL, NULL),
(39, 20, 'Cox\'s Bazar', 0, 1, 0, NULL, NULL),
(40, 20, 'Feni', 0, 1, 0, NULL, NULL),
(41, 20, 'Khagrachhari', 0, 1, 0, NULL, NULL),
(42, 20, 'Lakshmipur', 0, 1, 0, NULL, NULL),
(43, 20, 'Noakhali', 0, 1, 0, NULL, NULL),
(44, 20, 'Rangamati', 0, 1, 0, NULL, NULL),
(45, 13, 'Dhaka', 0, 1, 0, NULL, NULL),
(46, 13, 'Faridpur', 0, 1, 0, NULL, NULL),
(47, 13, 'Gazipur', 0, 1, 0, NULL, NULL),
(48, 13, 'Gopalganj', 0, 1, 0, NULL, NULL),
(49, 13, 'Jamalpur', 0, 1, 0, NULL, NULL),
(50, 13, 'Kishoreganj', 0, 1, 0, NULL, NULL),
(51, 13, 'Madaripur', 0, 1, 0, NULL, NULL),
(52, 13, 'Manikganj', 0, 1, 0, NULL, NULL),
(53, 13, 'Munshiganj', 0, 1, 0, NULL, NULL),
(54, 13, 'Mymensingh', 0, 1, 0, NULL, NULL),
(55, 13, 'Narayanganj', 0, 1, 0, NULL, NULL),
(56, 13, 'Narsingdi', 0, 1, 0, NULL, NULL),
(57, 13, 'Netrokona', 0, 1, 0, NULL, NULL),
(58, 13, 'Rajbari', 0, 1, 0, NULL, NULL),
(59, 13, 'Shariatpur', 0, 1, 0, NULL, NULL),
(60, 13, 'Sherpur', 0, 1, 0, NULL, NULL),
(61, 13, 'Tangail', 0, 1, 0, NULL, NULL),
(62, 18, 'Bagerhat', 0, 1, 0, NULL, NULL),
(63, 18, 'Chuadanga', 0, 1, 0, NULL, NULL),
(64, 18, 'Jessore', 0, 1, 0, NULL, NULL),
(65, 18, 'Jhenaidah', 0, 1, 0, NULL, NULL),
(66, 18, 'Khulna', 0, 1, 0, NULL, NULL),
(67, 18, 'Kushtia', 0, 1, 0, NULL, NULL),
(68, 18, 'Magura', 0, 1, 0, NULL, NULL),
(69, 18, 'Meherpur', 0, 1, 0, NULL, NULL),
(70, 18, 'Narail', 0, 1, 0, NULL, NULL),
(71, 18, 'Satkhira', 0, 1, 0, NULL, NULL),
(72, 14, 'Bogra', 0, 1, 0, NULL, NULL),
(73, 14, 'Joypurhat', 0, 1, 0, NULL, NULL),
(74, 14, 'Naogaon', 0, 1, 0, NULL, NULL),
(75, 14, 'Natore', 0, 1, 0, NULL, NULL),
(76, 14, 'Nawabganj', 0, 1, 0, NULL, NULL),
(77, 14, 'Pabna', 0, 1, 0, NULL, NULL),
(78, 14, 'Rajshahi', 0, 1, 0, NULL, NULL),
(79, 14, 'Sirajganj', 0, 1, 0, NULL, NULL),
(80, 15, 'Dinajpur', 0, 1, 0, NULL, NULL),
(81, 15, 'Gaibandha', 0, 1, 0, NULL, NULL),
(82, 15, 'Kurigram', 0, 1, 0, NULL, NULL),
(83, 15, 'Lalmonirhat', 0, 1, 0, NULL, NULL),
(84, 15, 'Nilphamari', 0, 1, 0, NULL, NULL),
(85, 15, 'Panchagarh', 0, 1, 0, NULL, NULL),
(86, 15, 'Rangpur', 0, 1, 0, NULL, NULL),
(87, 15, 'Thakurgaon', 0, 1, 0, NULL, NULL),
(88, 17, 'Habiganj', 0, 1, 0, NULL, NULL),
(89, 17, 'Moulvibazar', 0, 1, 0, NULL, NULL),
(90, 17, 'Sunamganj', 0, 1, 0, NULL, NULL),
(91, 17, 'Sylhet', 0, 1, 0, NULL, NULL),
(92, 73, 'Akkelpur', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(93, 73, 'Joypurhat Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(94, 73, 'Kalai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(95, 73, 'Khetlal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(96, 73, 'Panchbibi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(97, 72, 'Adamdighi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(98, 72, 'Bogra Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(99, 72, 'Dhunat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(100, 72, 'Dhupchanchia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(101, 72, 'Gabtali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(102, 72, 'Kahaloo ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(103, 72, 'Nandigram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(104, 72, 'Sariakandi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(105, 72, 'Shajahanpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(106, 72, 'Sherpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(107, 72, 'Shibganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(108, 72, 'Sonatola ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(109, 74, 'Atrai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(110, 74, 'Badalgachhi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(111, 74, 'Manda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(112, 74, 'Dhamoirhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(113, 74, 'Mohadevpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(114, 74, 'Naogaon Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(115, 74, 'Niamatpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(116, 74, 'Patnitala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(117, 74, 'Porsha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(118, 74, 'Raninagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(119, 74, 'Sapahar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(120, 75, 'Bagatipara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(121, 75, 'Baraigram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(122, 75, 'Gurudaspur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(123, 75, 'Lalpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(124, 75, 'Natore Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(125, 75, 'Singra ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(126, 75, 'Naldanga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(127, 76, 'Bholahat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(128, 76, 'Gomastapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(129, 76, 'Nachole ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(130, 76, 'Nawabganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(131, 76, 'Shibganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(132, 77, 'Ataikula ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(133, 77, 'Atgharia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(134, 77, 'Bera ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(135, 77, 'Bhangura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(136, 77, 'Chatmohar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(137, 77, 'Faridpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(138, 77, 'Ishwardi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(139, 77, 'Pabna Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(140, 77, 'Santhia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(141, 77, 'Sujanagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(142, 79, 'Belkuchi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(143, 79, 'Chauhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(144, 79, 'Kamarkhanda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(145, 79, 'Kazipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(146, 79, 'Raiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(147, 79, 'Shahjadpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(148, 79, 'Sirajganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(149, 79, 'Tarash ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(150, 79, 'Ullahpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(151, 78, 'Bagha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(152, 78, 'Bagmara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(153, 78, 'Charghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(154, 78, 'Durgapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(155, 78, 'Godagari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(156, 78, 'Mohanpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(157, 78, 'Paba ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(158, 78, 'Puthia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(159, 78, 'Tanore ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(160, 78, 'Boalia Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(161, 78, 'Matihar Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(162, 78, 'Rajpara Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(163, 78, 'Shah Mokdum Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(164, 80, 'Birampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(165, 80, 'Birganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(166, 80, 'Biral ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(167, 80, 'Bochaganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(168, 80, 'Chirirbandar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(169, 80, 'Phulbari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(170, 80, 'Ghoraghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(171, 80, 'Hakimpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(172, 80, 'Kaharole ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(173, 80, 'Khansama ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(174, 80, 'Dinajpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(175, 80, 'Nawabganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(176, 80, 'Parbatipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(177, 81, 'Phulchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(178, 81, 'Gaibandha Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(179, 81, 'Gobindaganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(180, 81, 'Palashbari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(181, 81, 'Sadullapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(182, 81, 'Sughatta ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(183, 81, 'Sundarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(184, 82, 'Bhurungamari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(185, 82, 'Char Rajibpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(186, 82, 'Chilmari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(187, 82, 'Phulbari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(188, 82, 'Kurigram Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(189, 82, 'Nageshwari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(190, 82, 'Rajarhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(191, 82, 'Raomari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(192, 82, 'Ulipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(193, 83, 'Aditmari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(194, 83, 'Hatibandha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(195, 83, 'Kaliganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(196, 83, 'Lalmonirhat Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(197, 83, 'Patgram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(198, 84, 'Dimla ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(199, 84, 'Domar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(200, 84, 'Jaldhaka ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(201, 84, 'Kishoreganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(202, 84, 'Nilphamari Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(203, 84, 'Saidpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(204, 85, 'Atwari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(205, 85, 'Boda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(206, 85, 'Debiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(207, 85, 'Panchagarh Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(208, 85, 'Tetulia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(209, 86, 'Badarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(210, 86, 'Gangachhara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(211, 86, 'Kaunia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(212, 86, 'Rangpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(213, 86, 'Mithapukur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(214, 86, 'Pirgachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(215, 86, 'Pirganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(216, 86, 'Taraganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(217, 87, 'Baliadangi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(218, 87, 'Haripur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(219, 87, 'Pirganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(220, 87, 'Ranisankail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(221, 87, 'Thakurgaon Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(222, 28, 'Amtali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(223, 28, 'Bamna ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(224, 28, 'Barguna Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(225, 28, 'Betagi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(226, 28, 'Patharghata ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(227, 28, 'Taltoli ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(228, 29, 'Agailjhara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(229, 29, 'Babuganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(230, 29, 'Bakerganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(231, 29, 'Banaripara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(232, 29, 'Gaurnadi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(233, 29, 'Hizla ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(234, 29, 'Barisal Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(235, 29, 'Mehendiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(236, 29, 'Muladi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(237, 29, 'Wazirpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(238, 30, 'Bhola Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(239, 30, 'Burhanuddin ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(240, 30, 'Char Fasson ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(241, 30, 'Daulatkhan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(242, 30, 'Lalmohan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(243, 30, 'Manpura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(244, 30, 'Tazumuddin ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(245, 31, 'Jhalokati Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(246, 31, 'Kathalia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(247, 31, 'Nalchity ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(248, 31, 'Rajapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(249, 32, 'Bauphal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(250, 32, 'Dashmina ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(251, 32, 'Galachipa ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(252, 32, 'Kalapara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(253, 32, 'Mirzaganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(254, 32, 'Patuakhali Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(255, 32, 'Rangabali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(256, 32, 'Dumki ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(257, 33, 'Bhandaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(258, 33, 'Kawkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(259, 33, 'Mathbaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(260, 33, 'Nazirpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(261, 33, 'Pirojpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(262, 33, 'Nesarabad (Swarupkati) ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(263, 33, 'Zianagor ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(264, 34, 'Ali Kadam ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(265, 34, 'Bandarban Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(266, 34, 'Lama ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(267, 34, 'Naikhongchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(268, 34, 'Rowangchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(269, 34, 'Ruma ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(270, 34, 'Thanchi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(271, 35, 'Akhaura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(272, 35, 'Bancharampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(273, 35, 'Brahmanbaria Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(274, 35, 'Kasba ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(275, 35, 'Nabinagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(276, 35, 'Nasirnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(277, 35, 'Sarail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(278, 35, 'Ashuganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(279, 35, 'Bijoynagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(280, 36, 'Chandpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(281, 36, 'Faridganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(282, 36, 'Haimchar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(283, 36, 'Haziganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(284, 36, 'Kachua ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(285, 36, 'Matlab Dakshin ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(286, 36, 'Matlab Uttar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(287, 36, 'Shahrasti ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(288, 37, 'Anwara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(289, 37, 'Banshkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(290, 37, 'Boalkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(291, 37, 'Chandanaish ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(292, 37, 'Fatikchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(293, 37, 'Hathazari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(294, 37, 'Lohagara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(295, 37, 'Mirsharai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(296, 37, 'Patiya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(297, 37, 'Rangunia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(298, 37, 'Raozan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(299, 37, 'Sandwip ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(300, 37, 'Satkania ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(301, 37, 'Sitakunda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(302, 37, 'Bandor (Chittagong Port) Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(303, 37, 'Chandgaon Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(304, 37, 'Double Mooring Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(305, 37, 'Kotwali Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(306, 37, 'Pahartali Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(307, 37, 'Panchlaish Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(308, 38, 'Barura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(309, 38, 'Brahmanpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(310, 38, 'Burichang ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(311, 38, 'Chandina ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(312, 38, 'Chauddagram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(313, 38, 'Daudkandi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(314, 38, 'Debidwar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(315, 38, 'Homna ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(316, 38, 'Laksam ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(317, 38, 'Muradnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(318, 38, 'Nangalkot ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(319, 38, 'Comilla Adarsha Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(320, 38, 'Meghna ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(321, 38, 'Titas ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(322, 38, 'Monohargonj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(323, 38, 'Comilla Sadar Dakshin ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(324, 39, 'Chakaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(325, 39, 'Cox\'s Bazar Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(326, 39, 'Kutubdia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(327, 39, 'Maheshkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(328, 39, 'Ramu ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(329, 39, 'Teknaf ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(330, 39, 'Ukhia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(331, 39, 'Pekua ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(332, 40, 'Chhagalnaiya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(333, 40, 'Daganbhuiyan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(334, 40, 'Feni Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(335, 40, 'Parshuram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(336, 40, 'Sonagazi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(337, 40, 'Fulgazi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(338, 41, 'Dighinala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(339, 41, 'Khagrachhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(340, 41, 'Lakshmichhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(341, 41, 'Mahalchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(342, 41, 'Manikchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(343, 41, 'Matiranga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(344, 41, 'Panchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(345, 41, 'Ramgarh ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(346, 42, 'Lakshmipur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(347, 42, 'Raipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(348, 42, 'Ramganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(349, 42, 'Ramgati ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(350, 42, 'Kamalnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(351, 43, 'Begumganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(352, 43, 'Noakhali Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(353, 43, 'Chatkhil ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(354, 43, 'Companiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(355, 43, 'Hatiya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(356, 43, 'Senbagh ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(357, 43, 'Sonaimuri ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(358, 43, 'Subarnachar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(359, 43, 'Kabirhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(360, 44, 'Bagaichhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(361, 44, 'Barkal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(362, 44, 'Kawkhali (Betbunia) ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(363, 44, 'Belaichhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(364, 44, 'Kaptai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(365, 44, 'Juraichhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(366, 44, 'Langadu ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(367, 44, 'Naniyachar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(368, 44, 'Rajasthali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(369, 44, 'Rangamati Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(370, 45, 'Dhamrai ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(371, 45, 'Dohar ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(372, 45, 'Dhaka City Corporation Area', 80, 0, 1, NULL, '2023-08-14 07:55:43'),
(373, 45, 'Keraniganj ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(374, 45, 'Nawabganj ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(375, 45, 'Savar ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(376, 46, 'Alfadanga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(377, 46, 'Bhanga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(378, 46, 'Boalmari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(379, 46, 'Charbhadrasan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(380, 46, 'Faridpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(381, 46, 'Madhukhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(382, 46, 'Nagarkanda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(383, 46, 'Sadarpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(384, 46, 'Saltha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(385, 47, 'Gazipur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(386, 47, 'Kaliakair ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(387, 47, 'Kaliganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(388, 47, 'Kapasia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(389, 47, 'Sreepur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(390, 48, 'Gopalganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(391, 48, 'Kashiani ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(392, 48, 'Kotalipara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(393, 48, 'Muksudpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(394, 48, 'Tungipara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(395, 49, 'Baksiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(396, 49, 'Dewanganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(397, 49, 'Islampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(398, 49, 'Jamalpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(399, 49, 'Madarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(400, 49, 'Melandaha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(401, 49, 'Sarishabari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(402, 50, 'Astagram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(403, 50, 'Bajitpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(404, 50, 'Bhairab ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(405, 50, 'Hossainpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(406, 50, 'Itna ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(407, 50, 'Karimganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(408, 50, 'Katiadi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(409, 50, 'Kishoreganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(410, 50, 'Kuliarchar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(411, 50, 'Mithamain ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(412, 50, 'Nikli ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(413, 50, 'Pakundia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(414, 50, 'Tarail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(415, 51, 'Rajoir ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(416, 51, 'Madaripur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(417, 51, 'Kalkini ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(418, 51, 'Shibchar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(419, 52, 'Daulatpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(420, 52, 'Ghior ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(421, 52, 'Harirampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(422, 52, 'Manikgonj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(423, 52, 'Saturia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(424, 52, 'Shivalaya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(425, 52, 'Singair ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(426, 53, 'Gazaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(427, 53, 'Lohajang ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(428, 53, 'Munshiganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(429, 53, 'Sirajdikhan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(430, 53, 'Sreenagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(431, 53, 'Tongibari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(432, 54, 'Bhaluka ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(433, 54, 'Dhobaura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(434, 54, 'Fulbaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(435, 54, 'Gaffargaon ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(436, 54, 'Gauripur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(437, 54, 'Haluaghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(438, 54, 'Ishwarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(439, 54, 'Mymensingh Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(440, 54, 'Muktagachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(441, 54, 'Nandail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(442, 54, 'Phulpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(443, 54, 'Trishal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(444, 54, 'Tara Khanda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(445, 55, 'Araihazar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(446, 55, 'Bandar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(447, 55, 'Narayanganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(448, 55, 'Rupganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(449, 55, 'Sonargaon ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(450, 57, 'Atpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(451, 57, 'Barhatta ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(452, 57, 'Durgapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(453, 57, 'Khaliajuri ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(454, 57, 'Kalmakanda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(455, 57, 'Kendua ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(456, 57, 'Madan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(457, 57, 'Mohanganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(458, 57, 'Netrokona Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(459, 57, 'Purbadhala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(460, 58, 'Baliakandi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(461, 58, 'Goalandaghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(462, 58, 'Pangsha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(463, 58, 'Rajbari Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(464, 58, 'Kalukhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(465, 59, 'Bhedarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(466, 59, 'Damudya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(467, 59, 'Gosairhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(468, 59, 'Naria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(469, 59, 'Shariatpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(470, 59, 'Zanjira ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(471, 59, 'Shakhipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(472, 60, 'Jhenaigati ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(473, 60, 'Nakla ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(474, 60, 'Nalitabari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(475, 60, 'Sherpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(476, 60, 'Sreebardi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(477, 61, 'Gopalpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(478, 61, 'Basail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(479, 61, 'Bhuapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(480, 61, 'Delduar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(481, 61, 'Ghatail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(482, 61, 'Kalihati ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(483, 61, 'Madhupur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(484, 61, 'Mirzapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(485, 61, 'Nagarpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(486, 61, 'Sakhipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(487, 61, 'Dhanbari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(488, 61, 'Tangail Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(489, 56, 'Narsingdi Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(490, 56, 'Belabo ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(491, 56, 'Monohardi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(492, 56, 'Palash ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(493, 56, 'Raipura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(494, 56, 'Shibpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(495, 62, 'Bagerhat Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(496, 62, 'Chitalmari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(497, 62, 'Fakirhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(498, 62, 'Kachua ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(499, 62, 'Mollahat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(500, 62, 'Mongla ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(501, 62, 'Morrelganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(502, 62, 'Rampal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(503, 62, 'Sarankhola ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(504, 63, 'Alamdanga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(505, 63, 'Chuadanga Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(506, 63, 'Damurhuda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(507, 63, 'Jibannagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(508, 64, 'Abhaynagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(509, 64, 'Bagherpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(510, 64, 'Chaugachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(511, 64, 'Jhikargachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(512, 64, 'Keshabpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(513, 64, 'Jessore Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(514, 64, 'Manirampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(515, 64, 'Sharsha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(516, 65, 'Harinakunda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(517, 65, 'Jhenaidah Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(518, 65, 'Kaliganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(519, 65, 'Kotchandpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(520, 65, 'Maheshpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(521, 65, 'Shailkupa ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(522, 66, 'Batiaghata ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(523, 66, 'Dacope ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(524, 66, 'Dumuria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(525, 66, 'Dighalia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(526, 66, 'Koyra ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(527, 66, 'Paikgachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(528, 66, 'Phultala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(529, 66, 'Rupsha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(530, 66, 'Terokhada ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(531, 66, 'Daulatpur Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(532, 66, 'Khalishpur Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(533, 66, 'Khan Jahan Ali Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(534, 66, 'Kotwali Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(535, 66, 'Sonadanga Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(536, 66, 'Harintana Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(537, 67, 'Bheramara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(538, 67, 'Daulatpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(539, 67, 'Khoksa ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(540, 67, 'Kumarkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(541, 67, 'Kushtia Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(542, 67, 'Mirpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(543, 67, 'Shekhpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(544, 68, 'Magura Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(545, 68, 'Mohammadpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(546, 68, 'Shalikha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(547, 68, 'Sreepur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(548, 69, 'Gangni ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(549, 69, 'Meherpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(550, 69, 'Mujibnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(551, 70, 'Kalia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(552, 70, 'Lohagara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(553, 70, 'Narail Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(554, 70, 'Naragati Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(555, 71, 'Assasuni ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(556, 71, 'Debhata ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(557, 71, 'Kalaroa ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(558, 71, 'Kaliganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(559, 71, 'Satkhira Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(560, 71, 'Shyamnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(561, 71, 'Tala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(562, 88, 'Ajmiriganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(563, 88, 'Bahubal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(564, 88, 'Baniyachong ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(565, 88, 'Chunarughat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(566, 88, 'Habiganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(567, 88, 'Lakhai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(568, 88, 'Madhabpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(569, 88, 'Nabiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(570, 89, 'Barlekha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(571, 89, 'Kamalganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(572, 89, 'Kulaura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(573, 89, 'Moulvibazar Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(574, 89, 'Rajnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(575, 89, 'Sreemangal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(576, 89, 'Juri ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(577, 90, 'Bishwamvarpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(578, 90, 'Chhatak ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(579, 90, 'Derai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(580, 90, 'Dharampasha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(581, 90, 'Dowarabazar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(582, 90, 'Jagannathpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(583, 90, 'Jamalganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(584, 90, 'Sullah ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(585, 90, 'Sunamganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(586, 90, 'Tahirpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(587, 90, 'South Sunamganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(588, 91, 'Balaganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(589, 91, 'Beanibazar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(590, 91, 'Bishwanath ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(591, 91, 'Companigonj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(592, 91, 'Fenchuganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(593, 91, 'Golapganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(594, 91, 'Gowainghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(595, 91, 'Jaintiapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(596, 91, 'Kanaighat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(597, 91, 'Sylhet Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(598, 91, 'Zakiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(599, 91, 'South Shurma ', 120, 0, 1, NULL, '2023-08-14 07:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_26_070249_create_permission_tables', 1),
(6, '2023_04_29_104538_create_admin_menus_table', 1),
(7, '2023_04_30_095422_create_jobs_table', 1),
(8, '2023_06_04_103415_create_admin_menu_actions_table', 1),
(9, '2023_07_16_193339_create_settings_table', 1),
(11, '2023_08_05_220022_create_menus_table', 1),
(12, '2023_08_05_220028_create_menu_items_table', 1),
(13, '2023_08_08_095304_create_admin_settings_table', 1),
(14, '2023_08_09_115019_create_categories_table', 1),
(15, '2023_08_09_161545_create_products_table', 1),
(16, '2023_08_09_163637_create_brands_table', 1),
(17, '2023_08_09_175745_create_product_prices_table', 1),
(20, '2023_08_23_083356_create_portfolios_table', 1),
(21, '2023_08_30_114536_create_home_product_sections_table', 1),
(22, '2023_09_02_152658_create_attributes_table', 1),
(23, '2023_09_02_153152_create_attribute_values_table', 1),
(25, '2023_09_06_182742_create_shipping_addresses_table', 1),
(26, '2023_09_09_111028_create_locations_table', 1),
(27, '2023_09_09_183847_create_wishlists_table', 1),
(28, '2023_09_12_122146_create_flashdeals_table', 1),
(30, '2023_09_13_175745_create_reviews_table', 1),
(31, '2023_09_19_135706_create_companies_table', 1),
(32, '2023_09_19_141057_create_branches_table', 1),
(33, '2023_09_19_141630_create_stores_table', 1),
(34, '2023_09_20_105200_create_sliders_table', 1),
(35, '2023_09_23_101053_create_staff_table', 1),
(36, '2023_09_23_111539_create_regions_table', 1),
(37, '2023_09_23_123145_create_areas_table', 1),
(38, '2023_09_23_131123_create_territories_table', 1),
(39, '2023_09_23_181613_create_client_categories_table', 1),
(40, '2023_09_25_100436_create_chain_clients_table', 1),
(41, '2023_09_25_103202_create_vendors_table', 1),
(42, '2023_09_25_122043_create_category_vendors_table', 1),
(43, '2023_09_25_133234_create_groups_table', 1),
(44, '2023_09_25_133955_create_group_members_table', 1),
(45, '2023_09_25_155205_create_clients_table', 1),
(48, '2023_09_28_123659_create_vehicles_table', 1),
(53, '2023_10_03_165212_create_static_site_items_table', 1),
(54, '2023_10_03_172718_create_special_food_items_table', 1),
(55, '2023_10_03_182643_create_details_cards_table', 1),
(56, '2023_10_03_213106_create_showcase_items_table', 1),
(57, '2023_10_03_222638_create_client_messages_table', 1),
(58, '2023_10_03_224230_create_contacts_table', 1),
(59, '2023_10_04_081821_create_testimonials_table', 1),
(60, '2023_10_04_085027_create_abouts_table', 1),
(61, '2023_10_04_093333_create_social_works_table', 1),
(101, '2023_09_05_104150_create_product_stocks_table', 22),
(102, '2023_09_12_122242_create_flashdeal_products_table', 23),
(103, '2023_09_25_203513_create_group_sales_targets_table', 24),
(104, '2023_09_25_203644_create_group_sales_target_categories_table', 25),
(105, '2023_09_29_213551_create_client_prices_table', 26),
(106, '2023_09_30_152737_create_liftings_table', 27),
(107, '2023_09_30_152744_create_lifting_products_table', 28),
(108, '2023_09_30_162737_create_lifting_documents_table', 29),
(109, '2023_10_11_125908_create_sales_table', 30),
(110, '2023_10_11_125939_create_sales_lists_table', 31),
(111, '2023_10_12_175550_create_sales_product_data_table', 32),
(112, '2023_10_11_130353_create_collections_table', 33),
(113, '2023_10_15_090533_create_collection_data_table', 34),
(114, '2023_10_15_125909_create_sales_returns_table', 35),
(115, '2023_10_15_131506_create_sales_return_lists_table', 36),
(116, '2023_10_16_103106_create_lifting_returns_table', 37),
(117, '2023_10_16_103114_create_lifting_return_lists_table', 38),
(118, '2023_10_16_144752_create_vendor_payments_table', 39),
(119, '2023_10_16_145441_create_vendor_payment_data_table', 40),
(120, '2023_10_17_213643_create_deliveries_table', 41),
(121, '2023_10_17_213739_create_delivery_lists_table', 42),
(124, '2023_10_18_102801_create_transfers_table', 45),
(125, '2023_10_18_102810_create_transfer_products_table', 46),
(126, '2023_10_31_182322_create_transfer_data_table', 47),
(127, '2023_08_10_115126_create_orders_table', 48),
(128, '2023_08_10_115133_create_order_products_table', 49),
(129, '2023_11_01_182317_create_order_data_table', 50),
(130, '2023_08_02_000217_create_pages_table', 51);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 75),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 10),
(4, 'App\\Models\\User', 67),
(5, 'App\\Models\\User', 13),
(5, 'App\\Models\\User', 14),
(5, 'App\\Models\\User', 81),
(5, 'App\\Models\\User', 113),
(6, 'App\\Models\\User', 15),
(7, 'App\\Models\\User', 12),
(7, 'App\\Models\\User', 138),
(8, 'App\\Models\\User', 11),
(8, 'App\\Models\\User', 68),
(8, 'App\\Models\\User', 120),
(8, 'App\\Models\\User', 133),
(10, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 25),
(11, 'App\\Models\\User', 26),
(11, 'App\\Models\\User', 27),
(11, 'App\\Models\\User', 28),
(11, 'App\\Models\\User', 40),
(11, 'App\\Models\\User', 76),
(11, 'App\\Models\\User', 77),
(11, 'App\\Models\\User', 78),
(11, 'App\\Models\\User', 79),
(11, 'App\\Models\\User', 80),
(11, 'App\\Models\\User', 82),
(11, 'App\\Models\\User', 83),
(11, 'App\\Models\\User', 85),
(11, 'App\\Models\\User', 92),
(11, 'App\\Models\\User', 93),
(11, 'App\\Models\\User', 94),
(11, 'App\\Models\\User', 95),
(11, 'App\\Models\\User', 96),
(11, 'App\\Models\\User', 97),
(11, 'App\\Models\\User', 98),
(11, 'App\\Models\\User', 99),
(11, 'App\\Models\\User', 100),
(11, 'App\\Models\\User', 101),
(11, 'App\\Models\\User', 102),
(11, 'App\\Models\\User', 105),
(11, 'App\\Models\\User', 106),
(11, 'App\\Models\\User', 107),
(11, 'App\\Models\\User', 108),
(11, 'App\\Models\\User', 109),
(11, 'App\\Models\\User', 110),
(11, 'App\\Models\\User', 111),
(11, 'App\\Models\\User', 112),
(11, 'App\\Models\\User', 114),
(11, 'App\\Models\\User', 115),
(11, 'App\\Models\\User', 116),
(11, 'App\\Models\\User', 117),
(11, 'App\\Models\\User', 119),
(11, 'App\\Models\\User', 121),
(11, 'App\\Models\\User', 122),
(11, 'App\\Models\\User', 123),
(11, 'App\\Models\\User', 124),
(11, 'App\\Models\\User', 125),
(11, 'App\\Models\\User', 126),
(11, 'App\\Models\\User', 127),
(11, 'App\\Models\\User', 128),
(11, 'App\\Models\\User', 129),
(11, 'App\\Models\\User', 131),
(11, 'App\\Models\\User', 134),
(11, 'App\\Models\\User', 135),
(11, 'App\\Models\\User', 142),
(11, 'App\\Models\\User', 145),
(11, 'App\\Models\\User', 148),
(11, 'App\\Models\\User', 151),
(11, 'App\\Models\\User', 155),
(11, 'App\\Models\\User', 156),
(11, 'App\\Models\\User', 157),
(11, 'App\\Models\\User', 163),
(11, 'App\\Models\\User', 164),
(11, 'App\\Models\\User', 166),
(11, 'App\\Models\\User', 167),
(12, 'App\\Models\\User', 165);

-- --------------------------------------------------------

--
-- Table structure for table `online_deliveries`
--

CREATE TABLE `online_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_delivery_lists`
--

CREATE TABLE `online_delivery_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `online_delivery_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_code` varchar(255) NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `shipping_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_charge` decimal(16,2) DEFAULT NULL,
  `sub_total` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `total` decimal(16,2) NOT NULL,
  `paid` decimal(16,2) NOT NULL,
  `due` decimal(16,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(255) NOT NULL DEFAULT 'cod',
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `order_type` varchar(255) NOT NULL DEFAULT 'offline',
  `pending_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `processing_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `successed_at` timestamp NULL DEFAULT NULL,
  `canceled_at` timestamp NULL DEFAULT NULL,
  `return_at` timestamp NULL DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `cancel_approve` tinyint(4) NOT NULL DEFAULT 0,
  `gate_pass` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `flash_deal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `flash_deal_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sale_price` decimal(16,2) NOT NULL,
  `regular_price` decimal(16,2) NOT NULL,
  `discount_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `order_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `quantity` decimal(16,2) NOT NULL,
  `sold` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `sub_title`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Terms & Conditions', 'TERMS & CONDITIONS', 'terms-conditions', '<p><br></p>', 1, '2023-11-27 15:00:21', '2026-05-02 11:14:45'),
(2, 'Privacy Policy', 'Privacy Policy', 'privacy-policy', '<p style=\"outline: 0px; padding: 0px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\"><br></p>', 1, '2023-11-27 15:11:23', '2026-05-02 11:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'web', '2023-09-19 09:04:28', '2023-09-19 09:04:28'),
(2, 'System Setting', 'web', '2023-09-19 09:05:17', '2023-09-19 09:05:17'),
(3, 'Company Setup', 'web', '2023-09-19 09:05:30', '2023-09-19 09:05:30'),
(4, 'Branch Setup', 'web', '2023-09-19 09:05:39', '2023-09-19 09:05:39'),
(5, 'Role Setup', 'web', '2023-09-19 09:05:48', '2023-09-19 09:05:48'),
(6, 'User Setup', 'web', '2023-09-19 09:05:54', '2023-09-19 09:05:54'),
(7, 'Menu Setup', 'web', '2023-09-19 09:06:24', '2023-09-19 09:06:24'),
(8, 'admin.admin-menu.create', 'web', '2023-09-19 09:16:56', '2023-09-19 09:16:56'),
(9, 'admin.admin-menu.store', 'web', '2023-09-19 09:17:06', '2023-09-19 09:17:06'),
(10, 'admin.admin-menu.edit', 'web', '2023-09-19 09:17:10', '2023-09-19 09:17:10'),
(11, 'admin.admin-menu.update', 'web', '2023-09-19 09:17:20', '2023-09-19 09:17:20'),
(12, 'admin.admin-menu.destroy', 'web', '2023-09-19 09:17:25', '2023-09-19 09:17:25'),
(14, 'admin.admin-menuAction.index', 'web', '2023-09-19 09:18:18', '2023-09-19 09:18:18'),
(15, 'admin.admin-menuAction.create', 'web', '2023-09-19 09:18:26', '2023-09-19 09:18:26'),
(16, 'admin.admin-menuAction.store', 'web', '2023-09-19 09:18:33', '2023-09-19 09:18:33'),
(17, 'admin.admin-menuAction.edit', 'web', '2023-09-19 09:18:41', '2023-09-19 09:18:41'),
(18, 'admin.admin-menuAction.update', 'web', '2023-09-19 09:18:49', '2023-09-19 09:18:49'),
(19, 'admin.admin-menuAction.destroy', 'web', '2023-09-19 09:19:02', '2023-09-19 09:19:02'),
(20, 'System Setup', 'web', '2023-09-19 09:20:32', '2023-09-19 09:20:32'),
(21, 'Sales Group', 'web', '2023-09-19 09:20:46', '2023-09-23 14:50:24'),
(22, 'Store Setup', 'web', '2023-09-19 09:20:59', '2023-09-19 09:20:59'),
(23, 'Product Type', 'web', '2023-09-19 09:21:10', '2023-09-23 14:53:14'),
(24, 'Product Setup', 'web', '2023-09-19 09:21:19', '2023-09-19 09:21:19'),
(25, 'Staff Setup', 'web', '2023-09-19 09:21:25', '2023-09-19 09:21:25'),
(26, 'Product List', 'web', '2023-09-19 09:21:36', '2023-09-19 09:21:36'),
(27, 'System Configuration', 'web', '2023-09-19 09:22:02', '2023-09-19 09:22:02'),
(28, 'Group Sales Target', 'web', '2023-09-19 09:22:23', '2023-09-19 09:22:23'),
(29, 'Client Price Setup', 'web', '2023-09-19 09:22:33', '2023-09-19 09:22:33'),
(30, 'Procurement', 'web', '2023-09-19 09:23:13', '2023-09-19 09:23:13'),
(31, 'Transaction', 'web', '2023-09-19 09:23:22', '2023-09-19 09:23:22'),
(32, 'Vendor Setup', 'web', '2023-09-19 09:23:31', '2023-09-19 09:23:31'),
(33, 'Product Lifting', 'web', '2023-09-19 09:23:43', '2023-09-19 09:23:43'),
(34, 'Purchase Return', 'web', '2023-09-19 09:23:55', '2023-09-19 09:23:55'),
(35, 'Vendor Payment', 'web', '2023-09-19 09:24:05', '2023-09-19 09:24:05'),
(36, 'Reports', 'web', '2023-09-19 09:24:13', '2023-09-19 09:24:13'),
(37, 'Lifting Report', 'web', '2023-09-19 09:24:28', '2023-11-02 10:07:33'),
(38, 'Return Log', 'web', '2023-09-19 09:24:36', '2023-11-02 10:06:27'),
(39, 'Payment Report', 'web', '2023-09-19 09:24:54', '2023-11-02 10:07:59'),
(40, 'Vendor Statement', 'web', '2023-09-19 09:25:06', '2023-09-19 09:25:06'),
(41, 'Inventory', 'web', '2023-09-19 09:25:29', '2023-09-19 09:25:29'),
(42, 'Transaction 2', 'web', '2023-09-19 09:25:38', '2023-09-19 09:25:38'),
(43, 'Product Transfer', 'web', '2023-09-19 09:25:55', '2023-09-19 09:25:55'),
(44, 'Transfer Receive', 'web', '2023-09-19 09:26:05', '2023-09-19 09:26:05'),
(45, 'Reports 2', 'web', '2023-09-19 09:26:14', '2023-09-19 09:26:14'),
(46, 'Closing Stock', 'web', '2023-09-19 09:26:33', '2023-09-19 09:26:33'),
(47, 'Stock Status', 'web', '2023-09-19 09:26:45', '2023-09-19 09:26:45'),
(48, 'Transfer Log', 'web', '2023-09-19 09:26:55', '2023-09-19 09:26:55'),
(49, 'Sales Management', 'web', '2023-09-19 09:28:03', '2023-09-19 09:28:03'),
(50, 'Transaction 3', 'web', '2023-09-19 09:28:16', '2023-09-19 09:28:16'),
(51, 'Region Setup', 'web', '2023-09-19 09:28:49', '2023-09-19 09:28:49'),
(52, 'Area Setup', 'web', '2023-09-19 09:29:03', '2023-09-19 09:29:03'),
(53, 'Territory Setup', 'web', '2023-09-19 09:29:15', '2023-09-19 09:29:15'),
(54, 'Client Setup', 'web', '2023-09-19 09:29:28', '2023-09-19 09:29:28'),
(55, 'Daily Invoice', 'web', '2023-09-19 09:29:42', '2023-11-02 13:07:13'),
(56, 'Daily Collection', 'web', '2023-09-19 09:29:54', '2023-09-19 09:29:54'),
(57, 'Bulk Collection', 'web', '2023-09-19 09:30:07', '2023-09-19 09:30:07'),
(58, 'Sales Return', 'web', '2023-09-19 09:30:21', '2023-09-19 09:30:21'),
(59, 'Return Approval', 'web', '2023-09-19 09:30:32', '2023-09-19 09:30:32'),
(60, 'Reports 3', 'web', '2023-09-19 09:30:42', '2023-09-19 09:30:42'),
(61, 'Sales Report', 'web', '2023-09-19 09:30:51', '2023-11-02 10:03:54'),
(62, 'Collection Report', 'web', '2023-09-19 09:31:08', '2023-11-02 10:04:26'),
(63, 'Return Report', 'web', '2023-09-19 09:31:21', '2023-11-02 10:05:03'),
(64, 'Client Statement', 'web', '2023-09-19 09:31:39', '2023-09-19 09:31:39'),
(65, 'Client List', 'web', '2023-09-19 09:31:52', '2023-09-19 09:31:52'),
(66, 'Business Analysis', 'web', '2023-09-19 09:33:29', '2023-09-19 09:33:29'),
(67, 'Payment Analysis', 'web', '2023-09-19 09:33:39', '2023-09-19 09:33:39'),
(68, 'Stock Valuation', 'web', '2023-09-19 09:33:47', '2023-09-19 09:33:47'),
(69, 'Sales Target & Achievement', 'web', '2023-09-19 09:33:56', '2023-09-19 09:33:56'),
(70, 'Sales Contribution', 'web', '2023-09-19 09:34:06', '2023-09-19 09:34:06'),
(71, 'Sales Realization Analysis', 'web', '2023-09-19 09:34:14', '2023-09-19 09:34:14'),
(72, 'Sales Ageing Report', 'web', '2023-09-19 09:34:41', '2023-09-19 09:34:41'),
(73, 'Client Outstanding', 'web', '2023-09-19 09:34:53', '2023-10-29 17:09:15'),
(74, 'Product Profit', 'web', '2023-09-19 09:35:10', '2023-11-02 10:03:23'),
(75, 'Online Order', 'web', '2023-09-19 09:36:07', '2023-09-19 09:36:07'),
(76, 'Offline Order', 'web', '2023-09-19 09:36:18', '2023-09-23 10:00:01'),
(78, 'Prepare Gatepass', 'web', '2023-09-19 09:38:15', '2023-10-18 13:57:45'),
(80, 'Delivery Statement', 'web', '2023-09-19 09:38:34', '2023-10-18 13:58:25'),
(81, 'Client Chain', 'web', '2023-09-23 10:02:09', '2023-09-23 14:46:48'),
(82, 'Client Type', 'web', '2023-09-23 10:02:20', '2023-09-23 14:45:32'),
(83, 'admin.client-category.create', 'web', '2023-09-25 06:58:14', '2023-09-25 06:58:14'),
(84, 'admin.client-category.store', 'web', '2023-09-25 06:58:24', '2023-09-25 06:58:24'),
(85, 'admin.client-category.edit', 'web', '2023-09-25 06:58:31', '2023-09-25 06:58:31'),
(86, 'admin.client-category.update', 'web', '2023-09-25 06:58:40', '2023-09-25 06:58:40'),
(87, 'admin.client-category.destroy', 'web', '2023-09-25 06:58:49', '2023-09-25 06:58:49'),
(88, 'admin.chain-client.create', 'web', '2023-09-25 06:59:35', '2023-09-25 06:59:35'),
(89, 'admin.chain-client.store', 'web', '2023-09-25 06:59:50', '2023-09-25 06:59:50'),
(90, 'admin.chain-client.edit', 'web', '2023-09-25 06:59:55', '2023-09-25 06:59:55'),
(91, 'admin.chain-client.update', 'web', '2023-09-25 07:00:02', '2023-09-25 07:00:02'),
(92, 'admin.chain-client.destroy', 'web', '2023-09-25 07:00:19', '2023-09-25 07:00:19'),
(93, 'admin.territory.create', 'web', '2023-09-25 07:00:48', '2023-09-25 07:00:48'),
(94, 'admin.territory.store', 'web', '2023-09-25 07:00:54', '2023-09-25 07:00:54'),
(95, 'admin.territory.edit', 'web', '2023-09-25 07:00:58', '2023-09-25 07:00:58'),
(96, 'admin.territory.update', 'web', '2023-09-25 07:01:03', '2023-09-25 07:01:03'),
(97, 'admin.territory.destroy', 'web', '2023-09-25 07:01:09', '2023-09-25 07:01:09'),
(98, 'admin.area.create', 'web', '2023-09-25 07:01:36', '2023-09-25 07:01:36'),
(99, 'admin.area.store', 'web', '2023-09-25 07:01:43', '2023-09-25 07:01:43'),
(100, 'admin.area.edit', 'web', '2023-09-25 07:01:47', '2023-09-25 07:01:47'),
(101, 'admin.area.update', 'web', '2023-09-25 07:01:52', '2023-09-25 07:01:52'),
(102, 'admin.area.destroy', 'web', '2023-09-25 07:01:57', '2023-09-25 07:01:57'),
(103, 'admin.region.create', 'web', '2023-09-25 07:02:16', '2023-09-25 07:02:16'),
(104, 'admin.region.store', 'web', '2023-09-25 07:02:22', '2023-09-25 07:02:22'),
(105, 'admin.region.edit', 'web', '2023-09-25 07:02:26', '2023-09-25 07:02:26'),
(106, 'admin.region.update', 'web', '2023-09-25 07:02:33', '2023-09-25 07:02:33'),
(107, 'admin.region.destroy', 'web', '2023-09-25 07:02:39', '2023-09-25 07:02:39'),
(108, 'admin.vendor.create', 'web', '2023-09-25 07:03:08', '2023-09-25 07:03:08'),
(109, 'admin.vendor.store', 'web', '2023-09-25 07:03:14', '2023-09-25 07:03:14'),
(110, 'admin.vendor.edit', 'web', '2023-09-25 07:03:19', '2023-09-25 07:03:19'),
(111, 'admin.vendor.update', 'web', '2023-09-25 07:03:24', '2023-09-25 07:03:24'),
(112, 'admin.vendor.destroy', 'web', '2023-09-25 07:03:29', '2023-09-25 07:03:29'),
(113, 'admin.staff.create', 'web', '2023-09-25 07:03:49', '2023-09-25 07:03:49'),
(114, 'admin.staff.store', 'web', '2023-09-25 07:03:54', '2023-09-25 07:03:54'),
(115, 'admin.staff.edit', 'web', '2023-09-25 07:03:58', '2023-09-25 07:03:58'),
(116, 'admin.staff.update', 'web', '2023-09-25 07:04:04', '2023-09-25 07:04:04'),
(117, 'admin.staff.destroy', 'web', '2023-09-25 07:04:10', '2023-09-25 07:04:10'),
(118, 'admin.category.create', 'web', '2023-09-25 07:04:55', '2023-09-25 07:04:55'),
(119, 'admin.category.store', 'web', '2023-09-25 07:04:59', '2023-09-25 07:04:59'),
(120, 'admin.category.edit', 'web', '2023-09-25 07:05:03', '2023-09-25 07:05:03'),
(121, 'admin.category.update', 'web', '2023-09-25 07:05:10', '2023-09-25 07:05:10'),
(122, 'admin.category.destroy', 'web', '2023-09-25 07:05:15', '2023-09-25 07:05:15'),
(123, 'admin.store.create', 'web', '2023-09-25 07:05:43', '2023-09-25 07:05:43'),
(124, 'admin.store.store', 'web', '2023-09-25 07:05:51', '2023-09-25 07:05:51'),
(125, 'admin.store.edit', 'web', '2023-09-25 07:05:55', '2023-09-25 07:05:55'),
(126, 'admin.store.update', 'web', '2023-09-25 07:06:00', '2023-09-25 07:06:00'),
(127, 'admin.store.destroy', 'web', '2023-09-25 07:06:05', '2023-09-25 07:06:05'),
(128, 'admin.user.create', 'web', '2023-09-25 07:06:29', '2023-09-25 07:06:29'),
(129, 'admin.user.store', 'web', '2023-09-25 07:06:33', '2023-09-25 07:06:33'),
(130, 'admin.user.edit', 'web', '2023-09-25 07:06:37', '2023-09-25 07:06:37'),
(131, 'admin.user.update', 'web', '2023-09-25 07:06:42', '2023-09-25 07:06:42'),
(132, 'admin.user.destroy', 'web', '2023-09-25 07:06:47', '2023-09-25 07:06:47'),
(133, 'admin.role.create', 'web', '2023-09-25 07:07:07', '2023-09-25 07:07:07'),
(134, 'admin.role.store', 'web', '2023-09-25 07:07:12', '2023-09-25 07:07:12'),
(135, 'admin.role.edit', 'web', '2023-09-25 07:07:17', '2023-09-25 07:07:17'),
(136, 'admin.role.update', 'web', '2023-09-25 07:07:23', '2023-09-25 07:07:23'),
(137, 'admin.role.destroy', 'web', '2023-09-25 07:07:28', '2023-09-25 07:07:28'),
(138, 'admin.branch.create', 'web', '2023-09-25 07:07:44', '2023-09-25 07:07:44'),
(139, 'admin.branch.store', 'web', '2023-09-25 07:08:29', '2023-09-25 07:08:29'),
(140, 'admin.branch.edit', 'web', '2023-09-25 07:08:34', '2023-09-25 07:08:34'),
(141, 'admin.branch.update', 'web', '2023-09-25 07:08:39', '2023-09-25 07:08:39'),
(142, 'admin.branch.destroy', 'web', '2023-09-25 07:08:44', '2023-09-25 07:08:44'),
(143, 'admin.company.create', 'web', '2023-09-25 07:09:19', '2023-09-25 07:09:19'),
(144, 'admin.company.store', 'web', '2023-09-25 07:09:24', '2023-09-25 07:09:24'),
(145, 'admin.company.edit', 'web', '2023-09-25 07:09:31', '2023-09-25 07:09:31'),
(146, 'admin.company.update', 'web', '2023-09-25 07:09:36', '2023-09-25 07:09:36'),
(147, 'admin.company.destroy', 'web', '2023-09-25 07:09:41', '2023-09-25 07:09:41'),
(148, 'admin.group.create', 'web', '2023-09-25 07:51:05', '2023-09-25 07:51:05'),
(149, 'admin.group.store', 'web', '2023-09-25 07:51:10', '2023-09-25 07:51:10'),
(150, 'admin.group.edit', 'web', '2023-09-25 07:51:14', '2023-09-25 07:51:14'),
(151, 'admin.group.update', 'web', '2023-09-25 07:51:20', '2023-09-25 07:51:20'),
(152, 'admin.group.destroy', 'web', '2023-09-25 07:51:28', '2023-09-25 07:51:28'),
(153, 'admin.client.create', 'web', '2023-09-25 10:09:28', '2023-09-25 10:09:28'),
(154, 'admin.client.store', 'web', '2023-09-25 10:09:33', '2023-09-25 10:09:33'),
(155, 'admin.client.edit', 'web', '2023-09-25 10:09:38', '2023-09-25 10:09:38'),
(156, 'admin.client.update', 'web', '2023-09-25 10:09:42', '2023-09-25 10:09:42'),
(157, 'admin.client.destroy', 'web', '2023-09-25 10:09:49', '2023-09-25 10:09:49'),
(158, 'admin.product.create', 'web', '2023-09-25 14:14:40', '2023-09-25 14:14:40'),
(159, 'admin.product.store', 'web', '2023-09-25 14:14:46', '2023-09-25 14:14:46'),
(160, 'admin.product.edit', 'web', '2023-09-25 14:14:50', '2023-09-25 14:14:50'),
(161, 'admin.product.update', 'web', '2023-09-25 14:14:55', '2023-09-25 14:14:55'),
(162, 'admin.product.destroy', 'web', '2023-09-25 14:15:02', '2023-09-25 14:15:02'),
(163, 'admin.group-target.create', 'web', '2023-09-25 15:12:45', '2023-09-25 15:12:45'),
(164, 'admin.group-target.store', 'web', '2023-09-25 15:12:50', '2023-09-25 15:12:50'),
(165, 'admin.group-target.edit', 'web', '2023-09-25 15:12:55', '2023-09-25 15:12:55'),
(166, 'admin.group-target.update', 'web', '2023-09-25 15:13:02', '2023-09-25 15:13:02'),
(167, 'admin.group-target.destroy', 'web', '2023-09-25 15:13:32', '2023-09-25 15:13:32'),
(168, 'Vehicle Setup', 'web', '2023-09-28 06:35:35', '2023-09-28 06:35:35'),
(169, 'admin.vehicle.create', 'web', '2023-09-28 06:49:24', '2023-09-28 06:49:24'),
(170, 'admin.vehicle.store', 'web', '2023-09-28 06:49:29', '2023-09-28 06:49:29'),
(171, 'admin.vehicle.edit', 'web', '2023-09-28 06:49:33', '2023-09-28 06:49:33'),
(172, 'admin.vehicle.update', 'web', '2023-09-28 06:49:38', '2023-09-28 06:49:38'),
(173, 'admin.vehicle.destroy', 'web', '2023-09-28 06:49:44', '2023-09-28 06:49:44'),
(174, 'Measurement Unit', 'web', '2023-09-29 03:11:33', '2023-09-29 03:11:33'),
(175, 'admin.lifting.create', 'web', '2023-09-30 11:29:14', '2023-09-30 11:29:14'),
(176, 'admin.lifting.store', 'web', '2023-09-30 11:29:19', '2023-09-30 11:29:19'),
(177, 'admin.lifting.edit', 'web', '2023-09-30 11:29:23', '2023-09-30 11:29:23'),
(178, 'admin.lifting.update', 'web', '2023-09-30 11:29:27', '2023-09-30 11:29:27'),
(179, 'admin.lifting.destroy', 'web', '2023-09-30 11:29:33', '2023-09-30 11:29:33'),
(180, 'Website CMS', 'web', '2023-10-08 15:08:32', '2023-10-08 15:08:32'),
(181, 'Slider', 'web', '2023-10-08 15:09:27', '2023-10-08 15:14:11'),
(182, 'Site Items', 'web', '2023-10-08 15:22:26', '2023-10-08 15:22:26'),
(183, 'Special Item', 'web', '2023-10-08 15:23:03', '2023-10-18 13:55:44'),
(184, 'Social Working', 'web', '2023-10-08 15:23:47', '2023-10-08 15:23:47'),
(185, 'About', 'web', '2023-10-08 15:24:06', '2023-10-08 15:24:06'),
(186, 'Contact', 'web', '2023-10-08 15:24:27', '2023-10-08 15:24:27'),
(187, 'Testimonial', 'web', '2023-10-08 15:24:57', '2023-10-08 15:24:57'),
(188, 'Client Message', 'web', '2023-10-08 15:25:53', '2023-10-08 15:25:53'),
(189, 'Showcase Items', 'web', '2023-10-08 15:26:21', '2023-10-08 15:26:21'),
(190, 'Details Card', 'web', '2023-10-08 15:26:50', '2023-10-08 15:26:50'),
(191, 'admin.slider.create', 'web', '2023-10-08 15:28:49', '2023-10-08 15:28:49'),
(192, 'admin.slider.store', 'web', '2023-10-08 15:28:54', '2023-10-08 15:28:54'),
(193, 'admin.slider.edit', 'web', '2023-10-08 15:28:59', '2023-10-08 15:28:59'),
(194, 'admin.slider.update', 'web', '2023-10-08 15:29:07', '2023-10-08 15:29:07'),
(195, 'admin.slider.destroy', 'web', '2023-10-08 15:29:15', '2023-10-08 15:29:15'),
(196, 'admin.special-food-item.create', 'web', '2023-10-08 15:30:28', '2023-10-08 15:30:28'),
(197, 'admin.special-food-item.store', 'web', '2023-10-08 15:30:37', '2023-10-08 15:30:37'),
(198, 'admin.special-food-item.edit', 'web', '2023-10-08 15:30:41', '2023-10-08 15:30:41'),
(199, 'admin.special-food-item.update', 'web', '2023-10-08 15:30:47', '2023-10-08 15:30:47'),
(200, 'admin.special-food-item.destroy', 'web', '2023-10-08 15:30:51', '2023-10-08 15:30:51'),
(201, 'admin.social-working.create', 'web', '2023-10-08 15:31:27', '2023-10-08 15:31:27'),
(202, 'admin.social-working.store', 'web', '2023-10-08 15:31:31', '2023-10-08 15:31:31'),
(203, 'admin.social-working.edit', 'web', '2023-10-08 15:31:36', '2023-10-08 15:31:36'),
(204, 'admin.social-working.update', 'web', '2023-10-08 15:31:41', '2023-10-08 15:31:41'),
(205, 'admin.social-working.destroy', 'web', '2023-10-08 15:31:45', '2023-10-08 15:31:45'),
(206, 'admin.testimonial.create', 'web', '2023-10-08 15:33:23', '2023-10-08 15:33:23'),
(207, 'admin.testimonial.store', 'web', '2023-10-08 15:33:28', '2023-10-08 15:33:28'),
(208, 'admin.testimonial.edit', 'web', '2023-10-08 15:33:32', '2023-10-08 15:33:32'),
(209, 'admin.testimonial.update', 'web', '2023-10-08 15:33:37', '2023-10-08 15:33:37'),
(210, 'admin.testimonial.destroy', 'web', '2023-10-08 15:34:02', '2023-10-08 15:34:02'),
(211, 'admin.client-message.create', 'web', '2023-10-08 15:34:31', '2023-10-08 15:34:31'),
(212, 'admin.client-message.store', 'web', '2023-10-08 15:34:36', '2023-10-08 15:34:36'),
(213, 'admin.client-message.edit', 'web', '2023-10-08 15:34:40', '2023-10-08 15:34:40'),
(214, 'admin.client-message.update', 'web', '2023-10-08 15:34:44', '2023-10-08 15:34:44'),
(215, 'admin.client-message.destroy', 'web', '2023-10-08 15:34:49', '2023-10-08 15:34:49'),
(216, 'admin.showcase-item.create', 'web', '2023-10-08 15:35:20', '2023-10-08 15:35:20'),
(217, 'admin.showcase-item.store', 'web', '2023-10-08 15:35:24', '2023-10-08 15:35:24'),
(218, 'admin.showcase-item.edit', 'web', '2023-10-08 15:35:28', '2023-10-08 15:35:28'),
(219, 'admin.showcase-item.update', 'web', '2023-10-08 15:35:33', '2023-10-08 15:35:33'),
(220, 'admin.showcase-item.destroy', 'web', '2023-10-08 15:35:39', '2023-10-08 15:35:39'),
(221, 'admin.details-card.create', 'web', '2023-10-08 15:36:04', '2023-10-08 15:36:04'),
(222, 'admin.details-card.store', 'web', '2023-10-08 15:36:09', '2023-10-08 15:36:09'),
(223, 'admin.details-card.edit', 'web', '2023-10-08 15:36:13', '2023-10-08 15:36:13'),
(224, 'admin.details-card.update', 'web', '2023-10-08 15:36:17', '2023-10-08 15:36:17'),
(225, 'admin.details-card.destroy', 'web', '2023-10-08 15:36:22', '2023-10-08 15:36:22'),
(226, 'Site Settings', 'web', '2023-10-08 15:50:45', '2023-10-08 15:50:45'),
(227, 'admin.offline-order.create', 'web', '2023-10-09 03:43:02', '2023-10-09 03:43:02'),
(228, 'admin.offline-order.store', 'web', '2023-10-09 03:43:07', '2023-10-09 03:43:07'),
(229, 'admin.offline-order.edit', 'web', '2023-10-09 03:43:11', '2023-10-09 03:43:11'),
(230, 'admin.offline-order.update', 'web', '2023-10-09 03:43:19', '2023-10-09 03:43:19'),
(231, 'admin.offline-order.destroy', 'web', '2023-10-09 03:43:25', '2023-10-09 03:43:25'),
(232, 'admin.offline-order.show', 'web', '2023-10-10 14:19:37', '2023-10-10 14:19:37'),
(233, 'admin.sales.create', 'web', '2023-10-11 08:10:17', '2023-10-11 08:10:17'),
(234, 'admin.sales.store', 'web', '2023-10-11 08:10:22', '2023-10-11 08:10:22'),
(235, 'admin.sales.edit', 'web', '2023-10-11 08:10:27', '2023-10-11 08:10:27'),
(236, 'admin.sales.update', 'web', '2023-10-11 08:10:32', '2023-10-11 08:10:32'),
(237, 'admin.sales.destroy', 'web', '2023-10-11 08:10:37', '2023-10-11 08:10:37'),
(238, 'admin.collection.create', 'web', '2023-10-14 16:50:47', '2023-10-14 16:50:47'),
(239, 'admin.collection.store', 'web', '2023-10-14 16:50:51', '2023-10-14 16:50:51'),
(240, 'admin.collection.edit', 'web', '2023-10-14 16:50:56', '2023-10-14 16:50:56'),
(241, 'admin.collection.update', 'web', '2023-10-14 16:51:00', '2023-10-14 16:51:00'),
(242, 'admin.collection.destroy', 'web', '2023-10-14 16:51:05', '2023-10-14 16:51:05'),
(243, 'admin.sales-return.create', 'web', '2023-10-15 06:43:17', '2023-10-15 06:43:17'),
(244, 'admin.sales-return.store', 'web', '2023-10-15 06:43:24', '2023-10-15 06:43:24'),
(245, 'admin.sales-return.edit', 'web', '2023-10-15 06:43:29', '2023-10-15 06:43:29'),
(246, 'admin.sales-return.update', 'web', '2023-10-15 06:43:34', '2023-10-15 06:43:34'),
(247, 'admin.sales-return.destroy', 'web', '2023-10-15 06:43:39', '2023-10-15 06:43:39'),
(248, 'admin.lifting-return.create', 'web', '2023-10-16 04:47:09', '2023-10-16 04:47:09'),
(249, 'admin.lifting-return.store', 'web', '2023-10-16 04:47:15', '2023-10-16 04:47:15'),
(250, 'admin.lifting-return.edit', 'web', '2023-10-16 04:47:19', '2023-10-16 04:47:19'),
(251, 'admin.lifting-return.update', 'web', '2023-10-16 04:47:28', '2023-10-16 04:47:28'),
(252, 'admin.lifting-return.destroy', 'web', '2023-10-16 04:47:34', '2023-10-16 04:47:34'),
(253, 'admin.vendor-payment.create', 'web', '2023-10-16 09:19:38', '2023-10-16 09:19:38'),
(254, 'admin.vendor-payment.store', 'web', '2023-10-16 09:19:42', '2023-10-16 09:19:42'),
(255, 'admin.vendor-payment.edit', 'web', '2023-10-16 09:19:46', '2023-10-16 09:19:46'),
(256, 'admin.vendor-payment.update', 'web', '2023-10-16 09:19:51', '2023-10-16 09:19:51'),
(257, 'admin.vendor-payment.destroy', 'web', '2023-10-16 09:20:00', '2023-10-16 09:20:00'),
(258, 'admin.transfer.create', 'web', '2023-10-18 05:08:51', '2023-10-18 05:08:51'),
(259, 'admin.transfer.store', 'web', '2023-10-18 05:09:01', '2023-10-18 05:09:01'),
(260, 'admin.transfer.edit', 'web', '2023-10-18 05:09:05', '2023-10-18 05:09:05'),
(261, 'admin.transfer.update', 'web', '2023-10-18 05:09:22', '2023-10-18 05:09:22'),
(262, 'admin.transfer.destroy', 'web', '2023-10-18 05:09:29', '2023-10-18 05:09:29'),
(263, 'admin.transfer-receive.show', 'web', '2023-10-18 09:47:14', '2023-10-18 09:47:14'),
(264, 'admin.transfer-receive.edit', 'web', '2023-10-18 09:47:49', '2023-10-18 09:47:49'),
(265, 'admin.transfer-receive.destroy', 'web', '2023-10-18 09:48:01', '2023-10-18 09:48:01'),
(266, 'admin.return-approve.show', 'web', '2023-10-18 12:04:48', '2023-10-18 12:04:48'),
(267, 'admin.return-approve.edit', 'web', '2023-10-18 12:05:03', '2023-10-18 12:05:03'),
(268, 'admin.return-approve.destroy', 'web', '2023-10-18 12:05:12', '2023-10-18 12:05:12'),
(269, 'admin.delivery.edit', 'web', '2023-11-07 06:58:42', '2023-11-07 06:58:42'),
(270, 'admin.delivery.store', 'web', '2023-11-07 07:01:19', '2023-11-07 07:01:19'),
(271, 'admin.delivery.update', 'web', '2023-11-07 07:01:31', '2023-11-07 07:01:31'),
(272, 'admin.delivery.destroy', 'web', '2023-11-07 07:01:37', '2023-11-07 07:01:37'),
(273, 'admin.delivery.create', 'web', '2023-11-07 08:01:58', '2023-11-07 08:01:58'),
(276, 'admin.rolePermission.edit', 'web', '2023-11-09 04:05:15', '2023-11-09 04:05:15'),
(277, 'admin.rolePermission.update', 'web', '2023-11-09 04:05:28', '2023-11-09 04:05:28'),
(282, 'admin.attribute.store', 'web', '2023-11-10 13:05:41', '2023-11-10 13:05:41'),
(283, 'admin.attribute.edit', 'web', '2023-11-10 13:05:54', '2023-11-10 13:05:54'),
(284, 'admin.attribute.update', 'web', '2023-11-10 13:06:02', '2023-11-10 13:06:02'),
(285, 'admin.attribute.destroy', 'web', '2023-11-10 13:06:09', '2023-11-10 13:06:09'),
(286, 'admin.client-price.create', 'web', '2023-11-10 13:15:05', '2023-11-10 13:15:05'),
(287, 'admin.client-price.store', 'web', '2023-11-10 13:15:12', '2023-11-10 13:15:12'),
(288, 'admin.client-price.edit', 'web', '2023-11-10 13:15:40', '2023-11-10 13:15:40'),
(289, 'admin.client-price.update', 'web', '2023-11-10 13:15:44', '2023-11-10 13:15:44'),
(290, 'admin.client-price.destroy', 'web', '2023-11-10 13:15:50', '2023-11-10 13:15:50'),
(291, 'Orders Processing', 'web', '2023-11-16 11:58:49', '2023-11-20 12:08:30'),
(292, 'Client Request', 'web', '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(293, 'admin.online-order.edit', 'web', '2023-11-16 12:01:31', '2023-11-16 12:01:31'),
(294, 'admin.online-order.show', 'web', '2023-11-16 12:01:39', '2023-11-16 12:01:39'),
(295, 'Access Log', 'web', '2023-11-16 12:02:14', '2023-11-16 12:02:14'),
(296, 'Online Dashboard', 'web', '2023-11-19 17:02:39', '2023-11-20 12:07:30'),
(297, 'admin.order-dashboard.edit', 'web', '2023-11-19 17:04:37', '2023-11-19 17:04:37'),
(298, 'admin.order-dashboard.update', 'web', '2023-11-19 17:04:50', '2023-11-19 17:04:50'),
(299, 'Cancelled Order', 'web', '2023-11-19 17:06:14', '2023-11-20 12:12:40'),
(300, 'admin.cancel-order.approve', 'web', '2023-11-19 17:06:43', '2023-11-19 17:06:43'),
(301, 'Delivery Gatepass', 'web', '2023-11-19 17:07:36', '2023-11-20 12:10:17'),
(302, 'admin.online-order-delivery.create', 'web', '2023-11-19 17:08:03', '2023-11-19 17:08:03'),
(303, 'admin.online-order-delivery.store', 'web', '2023-11-19 17:08:08', '2023-11-19 17:08:08'),
(304, 'admin.online-order-delivery.edit', 'web', '2023-11-19 17:08:12', '2023-11-19 17:08:12'),
(305, 'admin.online-order-delivery.update', 'web', '2023-11-19 17:08:22', '2023-11-19 17:08:22'),
(306, 'admin.online-order-delivery.destroy', 'web', '2023-11-19 17:08:29', '2023-11-19 17:08:29'),
(307, 'admin.online-order-delivery.show', 'web', '2023-11-19 17:09:04', '2023-11-19 17:09:04'),
(308, 'Delivery Charge', 'web', '2023-11-19 17:09:47', '2023-11-19 17:09:47'),
(309, 'admin.delivery-charge.update', 'web', '2023-11-19 17:10:16', '2023-11-19 17:10:16'),
(310, 'Product Statement', 'web', '2023-11-20 16:04:21', '2023-11-20 16:04:21'),
(311, 'Dashboard 2', 'web', '2023-11-22 17:19:50', '2023-11-22 17:19:50'),
(312, 'Product Request', 'web', '2023-11-22 17:20:56', '2023-11-22 17:20:56'),
(313, 'Purchase Log', 'web', '2023-11-22 17:22:52', '2023-11-22 17:22:52'),
(314, 'Return Log 2', 'web', '2023-11-22 17:23:33', '2023-11-22 17:23:33'),
(315, 'Payment Log', 'web', '2023-11-22 17:27:46', '2023-11-22 17:27:46'),
(316, 'Statement', 'web', '2023-11-22 17:28:55', '2023-11-22 17:28:55'),
(317, 'client.product-request.create', 'web', '2023-11-22 17:30:15', '2023-11-22 17:30:15'),
(318, 'client.product-request.store', 'web', '2023-11-22 17:30:23', '2023-11-22 17:30:23'),
(319, 'client.product-request.edit', 'web', '2023-11-22 17:30:30', '2023-11-22 17:30:30'),
(320, 'client.product-request.update', 'web', '2023-11-22 17:30:38', '2023-11-22 17:30:38'),
(321, 'client.product-request.destroy', 'web', '2023-11-22 17:30:48', '2023-11-22 17:30:48'),
(322, 'client.product-request.show', 'web', '2023-11-22 17:31:01', '2023-11-22 17:31:01'),
(323, 'admin.bulk-collection.create', 'web', '2023-11-23 04:57:03', '2023-11-23 04:57:03'),
(324, 'admin.bulk-collection.store', 'web', '2023-11-23 04:57:09', '2023-11-23 04:57:09'),
(325, 'admin.bulk-collection.edit', 'web', '2023-11-23 04:57:14', '2023-11-23 04:57:14'),
(326, 'admin.bulk-collection.update', 'web', '2023-11-23 04:57:20', '2023-11-23 04:57:20'),
(327, 'admin.bulk-collection.destroy', 'web', '2023-11-23 04:57:29', '2023-11-23 04:57:29'),
(328, 'admin.user.password', 'web', '2023-11-26 05:57:38', '2023-11-26 05:57:38'),
(329, 'admin.user.password-update', 'web', '2023-11-26 05:58:21', '2023-11-26 05:58:21'),
(330, 'Sales Man Performance Flow', 'web', '2023-11-26 11:18:53', '2023-11-26 11:18:53'),
(331, 'Client Sales Flow', 'web', '2023-11-27 08:53:49', '2023-11-27 08:53:49'),
(332, 'Online Sales History', 'web', '2023-11-27 11:16:13', '2023-11-27 11:16:13'),
(333, 'Page Setup', 'web', '2023-11-27 14:58:52', '2023-11-27 14:58:52'),
(334, 'General Accounting', 'web', '2023-12-13 12:04:08', '2023-12-13 12:04:08'),
(335, 'Transaction 4', 'web', '2023-12-13 12:04:34', '2023-12-13 12:04:34'),
(336, 'Chart of Accounts', 'web', '2023-12-13 12:05:02', '2023-12-13 12:05:02'),
(337, 'Debit Voucher Entry', 'web', '2023-12-13 12:05:40', '2023-12-13 12:05:40'),
(338, 'Credit Voucher Entry', 'web', '2023-12-13 12:05:59', '2023-12-13 12:05:59'),
(339, 'Journal Voucher Entry', 'web', '2023-12-13 12:06:21', '2023-12-13 12:06:21'),
(340, 'Voucher Approve', 'web', '2023-12-13 12:06:45', '2023-12-13 12:06:45'),
(341, 'Voucher Refuse', 'web', '2023-12-13 12:07:04', '2023-12-13 12:07:04'),
(342, 'Posting Automation', 'web', '2023-12-13 12:09:24', '2023-12-13 12:09:24'),
(343, 'Automation Refuse', 'web', '2023-12-13 12:09:41', '2023-12-13 12:09:41'),
(344, 'admin.coa-setup.store', 'web', '2023-12-13 12:12:03', '2023-12-13 12:12:03'),
(345, 'admin.coa-setup.edit', 'web', '2023-12-13 12:12:10', '2023-12-13 12:12:10'),
(346, 'admin.coa-setup.update', 'web', '2023-12-13 12:12:17', '2023-12-13 12:12:17'),
(347, 'admin.coa-setup.destroy', 'web', '2023-12-13 12:12:25', '2023-12-13 12:12:25'),
(348, 'admin.debit-voucher-entry.create', 'web', '2023-12-13 12:13:07', '2023-12-13 12:13:07'),
(349, 'admin.debit-voucher-entry.store', 'web', '2023-12-13 12:13:16', '2023-12-13 12:13:16'),
(350, 'admin.debit-voucher-entry.edit', 'web', '2023-12-13 12:13:24', '2023-12-13 12:13:24'),
(351, 'admin.debit-voucher-entry.update', 'web', '2023-12-13 12:13:30', '2023-12-13 12:13:30'),
(352, 'admin.debit-voucher-entry.destroy', 'web', '2023-12-13 12:13:38', '2023-12-13 12:13:38'),
(353, 'admin.credit-voucher-entry.create', 'web', '2023-12-13 12:13:58', '2023-12-13 12:13:58'),
(354, 'admin.credit-voucher-entry.store', 'web', '2023-12-13 12:14:08', '2023-12-13 12:14:08'),
(355, 'admin.credit-voucher-entry.edit', 'web', '2023-12-13 12:14:14', '2023-12-13 12:14:14'),
(356, 'admin.credit-voucher-entry.update', 'web', '2023-12-13 12:14:21', '2023-12-13 12:14:21'),
(357, 'admin.credit-voucher-entry.destroy', 'web', '2023-12-13 12:14:27', '2023-12-13 12:14:27'),
(358, 'admin.journal-voucher-entry.create', 'web', '2023-12-13 12:14:55', '2023-12-13 12:14:55'),
(359, 'admin.journal-voucher-entry.store', 'web', '2023-12-13 12:15:01', '2023-12-13 12:15:01'),
(360, 'admin.journal-voucher-entry.edit', 'web', '2023-12-13 12:15:06', '2023-12-13 12:15:06'),
(361, 'admin.journal-voucher-entry.update', 'web', '2023-12-13 12:15:12', '2023-12-13 12:15:12'),
(362, 'admin.journal-voucher-entry.destroy', 'web', '2023-12-13 12:15:18', '2023-12-13 12:15:18'),
(363, 'admin.voucher-approve.show', 'web', '2023-12-13 12:16:48', '2023-12-13 12:16:48'),
(364, 'admin.voucher-approve.edit', 'web', '2023-12-13 12:16:56', '2023-12-13 12:16:56'),
(365, 'admin.voucher-reject.show', 'web', '2023-12-13 12:17:48', '2023-12-13 12:17:48'),
(366, 'admin.voucher-reject.edit', 'web', '2023-12-13 12:18:00', '2023-12-13 12:18:00'),
(367, 'admin.automation-approve.show', 'web', '2023-12-13 12:19:10', '2023-12-13 12:19:10'),
(368, 'admin.automation-approve.edit', 'web', '2023-12-13 12:19:19', '2023-12-13 12:19:19'),
(369, 'admin.automation-reject.show', 'web', '2023-12-13 12:19:47', '2023-12-13 12:19:47'),
(370, 'admin.automation-reject.edit', 'web', '2023-12-13 12:19:54', '2023-12-13 12:20:22'),
(371, 'Reports 4', 'web', '2023-12-13 16:37:50', '2023-12-13 16:37:50'),
(372, 'Chart of Accounts 2', 'web', '2023-12-13 16:38:13', '2023-12-13 16:38:13'),
(373, 'Daily Voucher List', 'web', '2023-12-16 06:26:26', '2023-12-16 06:26:26'),
(374, 'Daily Cash Book', 'web', '2023-12-19 14:46:09', '2023-12-19 14:46:09'),
(375, 'Daily Bank Book', 'web', '2023-12-19 14:46:38', '2023-12-19 14:46:38'),
(376, 'Transaction Ledger', 'web', '2023-12-19 14:47:08', '2023-12-19 14:47:08'),
(377, 'Cash Flow Statement', 'web', '2023-12-19 14:47:26', '2023-12-19 14:47:26'),
(378, 'General Ledger', 'web', '2023-12-19 14:47:45', '2023-12-19 14:47:45'),
(379, 'Trial Balance', 'web', '2023-12-30 16:33:07', '2023-12-30 16:33:07'),
(380, 'Income Statement', 'web', '2023-12-30 16:37:10', '2023-12-30 16:37:10'),
(381, 'Subscribers', 'web', '2024-01-23 04:24:23', '2024-01-23 04:24:23'),
(382, 'Admin Settings', 'web', '2024-02-28 09:38:44', '2024-02-28 09:38:44'),
(383, 'Balance Sheet', 'web', '2024-02-28 14:54:09', '2024-02-28 14:54:09'),
(384, 'Clear cache', 'web', '2024-03-03 04:58:09', '2024-03-03 04:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `technologies` varchar(255) DEFAULT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `attribute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `more_images` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `additional_info` longtext DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `alert_quantity` bigint(20) DEFAULT NULL,
  `min_order` bigint(20) NOT NULL DEFAULT 1,
  `max_order` bigint(20) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `ctn_size` float NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `on_request` tinyint(4) NOT NULL DEFAULT 0,
  `show_on_website` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `company_id`, `vendor_id`, `attribute_id`, `category_id`, `brand_id`, `name`, `code`, `slug`, `thumbnail`, `more_images`, `short_description`, `description`, `additional_info`, `meta_title`, `meta_description`, `meta_keyword`, `alert_quantity`, `min_order`, `max_order`, `video`, `video_id`, `ctn_size`, `status`, `on_request`, `show_on_website`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(103, 1, 1, 2, 10, NULL, 'Burger Bun - 65gm', '14202', 'burger-bun-65gm', 'media/product/2023-12-31-65hsZXO6c91cKMbbQPnBpXXPegcT1q3WC23APCaP.webp', NULL, '<p>Burger Bun - 65gm </p>', '<p>4 Inch</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 0, 1, 0, 1, 67, 1, NULL, NULL, '2023-12-30 06:07:13', '2026-11-08 07:13:13'),
(104, 1, 1, 2, 10, NULL, 'Mini Burger Bun - 50 gm', '14201', 'mini-burger-bun-50-gm', 'media/product/2023-12-31-bJiyKMI6rzTMcaBW5Cp0uctMxL5gpb0MjiVYl7Jh.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2023-12-31 10:30:25', '2026-11-08 07:09:02'),
(105, 1, 1, 2, 10, NULL, 'Hot Dog Bun - 50gm', '14234', 'hot-dog-bun-50gm', 'media/product/2024-01-02-49xfdOdaHSI4Pi8gUfjDWDUdR1URI9yCBUlEAHfr.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 22.5, 1, 0, 1, 2, 2, NULL, NULL, '2023-12-31 10:35:19', '2026-11-08 07:08:00'),
(106, 1, 1, 3, 10, NULL, 'Sandwich Bread - 850gm', '14218', 'sandwich-bread-850gm', 'media/product/2023-12-31-ipA82dYwXK1m8aMq8FsV9Y2TSwv22tLE2FNC54h4.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2023-12-31 11:12:38', '2026-11-08 07:09:27'),
(107, 1, 1, 2, 10, NULL, 'Sub Bun - 120gm', '14210', 'sub-bun-120gm', 'media/product/2023-12-31-mmApMMB9AdJ7KodCXkXW89Zhk1JoGus5oJsvID1q.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2023-12-31 11:13:53', '2026-11-08 07:09:32'),
(108, 1, 1, 2, 10, NULL, 'Pizza Bread - 6\"', '14244', 'pizza-bread-6', 'media/product/2023-12-31-3EpICh25EgwohNiz8XC985wwQESwS5KZYZusG3XW.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2023-12-31 11:27:49', '2026-11-08 07:09:18'),
(109, 1, 1, 2, 10, NULL, 'Pizza Bread 8\"', '14242', 'pizza-bread-8', 'media/product/2023-12-31-XTF8VPPjjiXAHVBMdF0n0Vfbt1aD6LrepvfIofFG.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, NULL, NULL, NULL, '2023-12-31 11:32:23', '2026-11-08 07:09:22'),
(110, 1, 1, 2, 10, NULL, 'Pizza Bread 10\"', '14243', 'pizza-bread-10', 'media/product/2023-12-31-w37zdQXaKCbbkRZQK0S1n56CfPAv6LNX4LiK1mRW.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, NULL, NULL, NULL, '2023-12-31 11:33:31', '2026-11-08 07:09:20'),
(111, 1, 1, 2, 10, NULL, 'Burger Bun - 85gm', '14204', 'burger-bun-85gm', 'media/product/2023-12-31-q6JygcXvSF1AYh0WoyL25SisWEbSFnnQSDjzeiF1.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 1, NULL, NULL, '2023-12-31 11:38:52', '2026-11-08 07:13:26'),
(112, 1, 1, 3, 10, NULL, 'Flat Bread (4pcs Pack) - 250gm', '14231', 'flat-bread-4pcs-pack-250gm', 'media/product/2024-01-02-3oxxISeCvrR7xAy32jwm0njH84rNCi2LNQtG7AwW.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2023-12-31 11:41:26', '2026-11-08 07:07:58'),
(113, 1, 1, 2, 10, NULL, 'Dinner Roll - 50gm', '14212', 'dinner-roll-50gm', 'media/product/2024-01-01-1kpkrDveW1DXZgbBXF2ECTcL1gVCQUl5R6BL7Nu0.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2023-12-31 11:43:27', '2026-11-08 07:07:53'),
(114, 1, 1, 3, 10, NULL, 'Burger Bun (4pcs Pack) - 260gm', '14224', 'burger-bun-4pcs-pack-260gm', 'media/product/2024-01-01-NVvF3QH4JPJP6BTeUiwnHYB4szIYuyiifeG2IFlK.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:00:36', '2026-11-08 07:07:47'),
(115, 1, 1, 3, 10, NULL, 'Hot Dog Bun (4pcs Pack) - 200gm', '14225', 'hot-dog-bun-4pcs-pack-200gm', 'media/product/2024-01-01-u0P3woocFCqclYpDinWpSWgP63pIK6VDbcWnW7mX.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:05:10', '2026-11-08 07:08:03'),
(116, 1, 1, 3, 10, NULL, 'Mini Burger Bun (4pcs Pack) - 180gm', '14232', 'mini-burger-bun-4pcs-pack-180gm', 'media/product/2024-01-02-77Bo8PKeb2t0kfYl1l4xT3BXCRoaFOUcrTvLfBgJ.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:06:56', '2026-11-08 07:09:15'),
(117, 1, 1, 3, 10, NULL, 'Dinner Roll (4pcs Pack) - 200gm', '14233', 'dinner-roll-4pcs-pack-200gm', 'media/product/2024-01-01-4sSkNXZiOBmgZvoUMA1Gqvne7dgF5npAab9gISOO.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:08:41', '2026-11-08 07:07:55'),
(118, 1, 1, 3, 10, NULL, 'Sandwich Bread - 500gm', '14219', 'sandwich-bread-500gm', 'media/product/2024-01-01-y34YdleZCrquwik68P725NnTQqxYeJB55S77MJiD.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:10:15', '2026-11-08 07:09:25'),
(119, 1, 1, 3, 10, NULL, 'Soft Milk Bread - 300gm', '14221', 'soft-milk-bread-300gm', 'media/product/2024-01-01-LZKNtoJq2xdFtO8MlqPfECIoxB6AhPBLvV8GNU12.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:13:42', '2026-11-08 07:09:30'),
(120, 1, 1, 3, 10, NULL, 'Brown Bread - 300gm', '14222', 'brown-bread-300gm', 'media/product/2024-01-01-iH4VyiidZShL4840UsnXVHa3PtGGcs18EKqJeA4W.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:18:20', '2026-05-02 11:15:33'),
(121, 1, 1, 3, 10, NULL, 'Super Seeded Multigrain Bread-300gm', '14223', 'super-seeded-multigrain-bread-300gm', 'media/product/2024-01-01-4Ws09ZslvmwPGbqCiAcwZCxwPvMDL3a1WWdkNZRw.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:19:57', '2026-05-02 11:16:05'),
(122, 1, 1, 3, 10, NULL, 'Sugar Free Bread - 400gm', '14237', 'sugar-free-bread-400gm', 'media/product/2024-01-01-J9E0H2DfF4E5X2S3MQVTmdTOmGpA9izVKqmoZ0A8.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:22:03', '2026-11-08 07:09:35'),
(123, 1, 1, 3, 10, NULL, 'Sandwich Bread - 300gm', '14239', 'sandwich-bread-300gm', 'media/product/2024-01-01-CeZqhevyRbXTPorTY8fW4RB78kii0K9hDAZhC1sg.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 1, NULL, NULL, '2024-01-01 12:23:49', '2026-11-08 07:12:32'),
(124, 1, 1, 3, 10, NULL, 'Whole Wheat Bread - 300gm', '14241', 'whole-wheat-bread-300gm', 'media/product/2024-01-01-vq2IhIwcdAtfkhNqgyqeyhdqXr9YzKY0SIidI5rf.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:29:54', '2026-05-02 11:16:10'),
(125, 1, 1, 3, 10, NULL, 'Mini Burger Bun (2pcs Pack) - 90gm', '14253', 'mini-burger-bun-2pcs-pack-90gm', 'media/product/2024-01-02-wPb5nMzhJhVuJojpjpDT3S4ckStV6ybf61fkjCgQ.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, NULL, NULL, '2024-01-01 12:34:51', '2026-11-08 07:09:12'),
(126, 1, 3, 5, 11, NULL, 'Mayonnaise - 450ml', '0710497311458', 'mayonnaise-450ml', 'media/product/2024-01-02-JzsQYV2GDHSQ5E6TjgS4dzgQIhk63JQSyB6J7bKN.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, 1, '2026-11-08 07:08:46', '2024-01-01 16:44:37', '2026-11-08 07:08:46'),
(127, 1, 3, 5, 11, NULL, 'Mayonnaise - 900ml', '0710497311465', 'mayonnaise-900ml', 'media/product/2024-01-02-BPQEhRzpnqptUAjApHG1Phba6pTLwr7LkX6fJe0e.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, 1, '2026-11-08 07:08:56', '2024-01-01 16:46:02', '2026-11-08 07:08:56'),
(128, 1, 3, 5, 11, NULL, 'Mayonnaise - 2.3L', '1710497311458', 'mayonnaise-23l', 'media/product/2025-11-16-WEwKec7ueOutzV9imBNRF7riPtuuiR8Jwz69VYAF.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 0, 1, 2, 2, 1, '2026-11-08 07:08:25', '2024-03-19 08:33:08', '2026-11-08 07:08:25'),
(139, 1, NULL, 5, 10, NULL, 'Mayonnaise - 1.2L', NULL, 'mayonnaise-12l', 'media/product/2024-10-08-CkNz2vjsI3iUyF4XEDCjRFHjKKCEDwDn7hbmwLZR.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 1, 1, 1, 2, 2, '2024-10-08 09:41:09', '2024-10-08 09:32:51', '2024-10-08 09:41:09'),
(140, 1, 3, 5, 11, NULL, 'Mayonnaise - 1.2L', '710497311465', 'mayonnaise-12l-2', 'media/product/2024-10-08-7RMvOyS9x1RB35McydJ9zJY6JDsXWxdHXSQ8MIws.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 1, 1, 2, 2, 1, '2026-11-08 07:08:12', '2024-10-08 09:42:03', '2026-11-08 07:08:12'),
(141, 1, 4, 2, 13, NULL, 'Container Jar', NULL, 'container-jar', 'media/product/2024-10-27-3SkVREa87MSoq672a3ovfFURCZZuKMsZsZHB8Bsi.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, 0, 0, 133, 1, 1, '2026-11-08 07:07:50', '2024-10-27 07:08:19', '2026-11-08 07:07:50'),
(142, 1, 3, 5, 11, NULL, 'Mayonnaise - 2.3L - Honey Mustard', 'KUDOS0710497311465', 'mayonnaise-23l-honey-mustard', 'media/product/2025-11-16-9STGlIWekaOesAObtTKOG8aG2vUJegvcArJBmKcI.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 1, 0, 2, 2, 1, '2026-11-08 07:08:38', '2025-09-10 05:55:42', '2026-11-08 07:08:38'),
(143, 1, 3, 2, 11, NULL, 'Mayonnaise - 2.3L - Meat Mayo', 'KUDOS0710497311458', 'mayonnaise-23l-meat-mayo', 'media/product/2025-11-16-jWvY5IcMIGVCvwdPE0jCdd9b8OHz7gnCiRdRH6dp.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 1, 0, 2, 2, 1, '2026-11-08 07:08:43', '2025-09-16 11:24:14', '2026-11-08 07:08:43'),
(146, 1, 3, 5, 11, NULL, 'Mayonnaise - 1.2L - Meat Mayo', 'KUDOS0710497311467', 'mayonnaise-12l-meat-mayo', 'media/product/2025-11-15-dZiunoG3ONgmtIltYbCS7gUjbB2eNpLOsbePCC6Z.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 8, 1, 1, 0, 2, 2, 1, '2026-11-08 07:08:21', '2025-11-15 11:33:26', '2026-11-08 07:08:21'),
(147, 1, 3, 5, 11, NULL, 'Mayonnaise - 1.2L - Honey Mustard', 'KUDOS0710497311444', 'mayonnaise-12l-honey-mustard', 'media/product/2025-11-16-bX4xRmzlKG9gBXA1QoCEdFcAlZ5e7Z8P1mTD9uDR.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 1, 0, 2, NULL, 1, '2026-11-08 07:08:17', '2025-11-16 03:36:47', '2026-11-08 07:08:17'),
(150, 1, 3, 5, 11, NULL, 'Mayonnaise - 450ml - Honey Mustard', 'KUDOS07104973116055', 'mayonnaise-450ml-honey-mustard', 'media/product/2026-04-04-5ysWHrySufwQXpm6mAGnyecZGp1ETfwYZhLrqjTp.webp', 'media/product/2026-04-04-8zcUXKJiYvImEIaQuggMp6WD39uyzDIQb2nby7b6.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 12, 1, 1, 0, 2, 2, 1, '2026-11-08 07:08:50', '2026-04-04 09:12:56', '2026-11-08 07:08:50'),
(151, 1, 3, 5, 11, NULL, 'Mayonnaise - 450ml - Meat Mayo', 'KUDOS0710497311450', 'mayonnaise-450ml-meat-mayo', 'media/product/2026-06-03-T6J1HpyFlhuGWUp3SwP8mZrIOhqSFtCDbXlOWTW7.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, 0, 0, 2, NULL, 1, '2026-11-08 07:08:53', '2026-06-03 07:27:35', '2026-11-08 07:08:53'),
(152, 1, 1, 2, 10, NULL, 'Brioche Bun - 60gm', '14256', 'brioche-bun-60gm', 'media/product/2026-11-08-gTBYbDEFKzZLbQsTADzLYFmWqFzRrWRv9tM6HJXs.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 1, 1, 1, NULL, NULL, NULL, '2026-11-08 07:38:44', '2026-11-08 07:38:44'),
(153, 1, 1, 3, 10, NULL, 'Brioche Bun - (4pcs Pack) - 240gm', '14257', 'brioche-bun-4pcs-pack-240gm', 'media/product/2026-11-08-aicFKrYenWaLj6eBYqT9f5WhEPqpDDA0D8x93poT.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 1, 1, 1, NULL, NULL, NULL, '2026-11-08 07:40:18', '2026-11-08 07:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `lifting_price` decimal(16,2) NOT NULL,
  `sale_price` decimal(16,2) NOT NULL,
  `online_price` decimal(8,2) DEFAULT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_tk` decimal(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `lifting_price`, `sale_price`, `online_price`, `discount`, `discount_tk`, `created_at`, `updated_at`) VALUES
(94, 103, 7.65, 11.25, 22.50, 0.00, 0.00, '2023-12-30 06:07:13', '2026-11-08 07:13:13'),
(95, 104, 5.10, 6.50, 15.00, 0.00, 0.00, '2023-12-31 10:30:25', '2024-01-01 11:56:34'),
(96, 105, 7.65, 9.00, 0.00, 0.00, 0.00, '2023-12-31 10:35:19', '2024-01-01 18:35:10'),
(97, 106, 72.25, 85.00, 140.00, 0.00, 0.00, '2023-12-31 11:12:38', '2023-12-31 11:23:50'),
(98, 107, 11.05, 13.00, 25.00, 0.00, 0.00, '2023-12-31 11:13:53', '2023-12-31 11:26:16'),
(99, 108, 12.75, 15.00, 25.00, 0.00, 0.00, '2023-12-31 11:27:49', '2023-12-31 11:30:33'),
(100, 109, 25.50, 30.00, 55.00, 0.00, 0.00, '2023-12-31 11:32:23', '2023-12-31 11:32:23'),
(101, 110, 29.75, 35.00, 65.00, 0.00, 0.00, '2023-12-31 11:33:31', '2023-12-31 11:33:31'),
(102, 111, 9.35, 14.00, 25.00, 0.00, 0.00, '2023-12-31 11:38:52', '2026-11-08 07:13:26'),
(103, 112, 34.00, 40.00, 85.00, 0.00, 0.00, '2023-12-31 11:41:26', '2024-01-01 18:33:59'),
(104, 113, 5.53, 6.50, 15.00, 0.00, 0.00, '2023-12-31 11:43:27', '2024-01-01 16:30:22'),
(105, 114, 76.50, 90.00, 90.00, 0.00, 0.00, '2024-01-01 12:00:36', '2024-01-01 16:29:25'),
(106, 115, 76.50, 90.00, 90.00, 0.00, 0.00, '2024-01-01 12:05:10', '2024-01-01 16:31:02'),
(107, 116, 51.00, 60.00, 60.00, 0.00, 0.00, '2024-01-01 12:06:56', '2024-01-01 18:28:04'),
(108, 117, 51.00, 60.00, 60.00, 0.00, 0.00, '2024-01-01 12:08:41', '2024-01-01 16:30:41'),
(109, 118, 93.50, 110.00, 110.00, 0.00, 0.00, '2024-01-01 12:10:15', '2024-01-01 16:33:59'),
(110, 119, 102.00, 120.00, 120.00, 0.00, 0.00, '2024-01-01 12:13:42', '2024-01-01 16:34:31'),
(111, 120, 126.65, 149.00, 149.00, 0.00, 0.00, '2024-01-01 12:18:20', '2024-01-01 16:28:12'),
(112, 121, 126.65, 149.00, 149.00, 0.00, 0.00, '2024-01-01 12:19:57', '2024-01-01 16:35:20'),
(113, 122, 80.75, 95.00, 100.00, 0.00, 0.00, '2024-01-01 12:22:03', '2024-01-01 16:35:00'),
(114, 123, 55.25, 60.00, 60.00, 0.00, 0.00, '2024-01-01 12:23:49', '2026-11-08 07:21:30'),
(115, 124, 123.25, 145.00, 145.00, 0.00, 0.00, '2024-01-01 12:29:54', '2024-01-01 16:38:28'),
(116, 125, 29.75, 35.00, 35.00, 0.00, 0.00, '2024-01-01 12:34:51', '2024-01-03 11:32:28'),
(117, 126, 89.77, 320.00, 320.00, 0.00, 0.00, '2024-01-01 16:44:37', '2024-02-03 11:53:41'),
(118, 127, 162.76, 580.00, 580.00, 0.00, 0.00, '2024-01-01 16:46:02', '2024-02-03 11:54:42'),
(119, 128, 375.00, 1200.00, 1200.00, 0.00, 0.00, '2024-03-19 08:33:08', '2025-11-16 03:39:27'),
(121, 139, 0.00, 0.00, 0.00, 0.00, 0.00, '2024-10-08 09:32:51', '2024-10-08 09:40:11'),
(122, 140, 201.00, 730.00, 730.00, 0.00, 0.00, '2024-10-08 09:42:03', '2025-04-27 06:59:50'),
(123, 141, 10.00, 0.00, 0.00, 0.00, 0.00, '2024-10-27 07:08:19', '2024-10-27 12:51:24'),
(124, 142, 317.00, 435.00, 0.00, 0.00, 0.00, '2025-09-10 05:55:42', '2025-11-16 03:37:39'),
(125, 143, 215.00, 880.00, 384.00, 0.00, 0.00, '2025-09-16 11:24:14', '2025-11-16 03:39:02'),
(126, 146, 180.00, 550.00, 268.00, 0.00, 0.00, '2025-11-15 11:33:26', '2025-11-15 11:34:31'),
(127, 147, 180.00, 228.00, 228.00, 0.00, 0.00, '2025-11-16 03:36:47', '2025-11-16 03:36:47'),
(128, 150, 50.00, 320.00, 320.00, 0.00, 0.00, '2026-04-04 09:12:56', '2026-04-23 08:08:40'),
(129, 151, 60.00, 320.00, 320.00, 0.00, 0.00, '2026-06-03 07:27:35', '2026-06-03 07:27:35'),
(130, 152, 21.00, 30.00, 30.00, 0.00, 0.00, '2026-11-08 07:38:44', '2026-11-08 07:38:44'),
(131, 153, 44.00, 120.00, 120.00, 0.00, 0.00, '2026-11-08 07:40:18', '2026-11-08 07:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `incharge_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `company_id`, `code`, `name`, `incharge_name`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ADS', 'Dhaka South', 'xxxxx', '1111', 'xxxxx@gmail.com', 'address will goes here', 1, 1, 2, NULL, NULL, '2023-09-23 06:53:22', '2023-12-21 05:24:46'),
(6, 1, 'DHK', 'Dhaka', NULL, NULL, NULL, NULL, 1, 1, 2, NULL, NULL, '2023-09-24 04:09:44', '2024-02-29 04:46:17'),
(10, 1, 'ADN', 'Dhaka North', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, '2023-11-06 09:24:54', '2023-12-21 05:24:36'),
(13, 1, 'BD', 'Bangladesh', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2024-02-11 12:23:17', '2024-02-11 12:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `star` tinyint(4) NOT NULL DEFAULT 1,
  `title` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `images` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `company_id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'System Admin', 'web', '2023-10-24 06:03:09', '2023-10-24 06:03:09'),
(4, 1, 'CRM', 'web', '2023-11-07 03:50:58', '2023-11-07 03:50:58'),
(5, 1, 'MANAGEMENT', 'web', '2023-11-07 03:51:19', '2023-11-07 04:11:24'),
(6, 1, 'MIS', 'web', '2023-11-07 03:51:30', '2023-11-07 03:51:30'),
(7, 1, 'STORE', 'web', '2023-11-07 03:57:58', '2023-11-07 03:57:58'),
(8, 1, 'AFM', 'web', '2023-11-07 03:58:06', '2023-11-07 03:58:06'),
(9, 1, 'SALES MANAGEMENT', 'web', '2023-11-07 03:58:19', '2023-11-07 03:58:19'),
(10, NULL, 'Software Admin', 'web', '2023-11-09 03:59:06', '2023-11-09 03:59:06'),
(11, NULL, 'Client', 'web', '2023-11-22 17:17:13', '2023-11-22 17:17:13'),
(12, NULL, 'Accounts', 'web', '2026-09-05 08:14:45', '2026-11-08 07:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(2, 1),
(2, 5),
(2, 6),
(2, 10),
(3, 1),
(3, 5),
(3, 6),
(3, 10),
(4, 1),
(4, 5),
(4, 6),
(4, 10),
(5, 1),
(5, 5),
(5, 6),
(5, 10),
(6, 1),
(6, 5),
(6, 6),
(6, 10),
(7, 6),
(7, 10),
(8, 6),
(8, 10),
(9, 6),
(9, 10),
(10, 6),
(10, 10),
(11, 6),
(11, 10),
(12, 6),
(12, 10),
(14, 6),
(14, 10),
(15, 6),
(15, 10),
(16, 6),
(16, 10),
(17, 6),
(17, 10),
(18, 6),
(18, 10),
(19, 6),
(19, 10),
(20, 1),
(20, 5),
(20, 6),
(20, 10),
(21, 1),
(21, 5),
(21, 6),
(21, 10),
(22, 1),
(22, 5),
(22, 6),
(22, 10),
(23, 1),
(23, 5),
(23, 6),
(23, 10),
(24, 1),
(24, 5),
(24, 6),
(24, 10),
(25, 1),
(25, 5),
(25, 6),
(25, 10),
(26, 1),
(26, 5),
(26, 6),
(26, 10),
(27, 1),
(27, 5),
(27, 6),
(27, 10),
(28, 1),
(28, 5),
(28, 6),
(28, 10),
(29, 1),
(29, 5),
(29, 6),
(29, 10),
(30, 1),
(30, 5),
(30, 6),
(30, 8),
(30, 10),
(31, 1),
(31, 5),
(31, 6),
(31, 8),
(31, 10),
(32, 1),
(32, 5),
(32, 6),
(32, 8),
(32, 10),
(33, 1),
(33, 5),
(33, 6),
(33, 8),
(33, 10),
(34, 1),
(34, 5),
(34, 6),
(34, 8),
(34, 10),
(35, 1),
(35, 5),
(35, 6),
(35, 8),
(35, 10),
(36, 1),
(36, 5),
(36, 6),
(36, 8),
(36, 10),
(37, 1),
(37, 5),
(37, 6),
(37, 8),
(37, 10),
(38, 1),
(38, 5),
(38, 6),
(38, 8),
(38, 10),
(39, 1),
(39, 5),
(39, 6),
(39, 8),
(39, 10),
(40, 1),
(40, 5),
(40, 6),
(40, 8),
(40, 10),
(41, 1),
(41, 4),
(41, 5),
(41, 6),
(41, 7),
(41, 8),
(41, 9),
(41, 10),
(42, 1),
(42, 5),
(42, 6),
(42, 7),
(42, 8),
(42, 10),
(43, 1),
(43, 5),
(43, 6),
(43, 7),
(43, 8),
(43, 10),
(44, 1),
(44, 5),
(44, 6),
(44, 7),
(44, 8),
(44, 10),
(45, 1),
(45, 4),
(45, 5),
(45, 6),
(45, 7),
(45, 8),
(45, 9),
(45, 10),
(47, 1),
(47, 4),
(47, 5),
(47, 6),
(47, 7),
(47, 8),
(47, 9),
(47, 10),
(48, 1),
(48, 4),
(48, 5),
(48, 6),
(48, 7),
(48, 8),
(48, 9),
(48, 10),
(49, 1),
(49, 4),
(49, 5),
(49, 6),
(49, 7),
(49, 8),
(49, 9),
(49, 10),
(49, 12),
(50, 1),
(50, 4),
(50, 5),
(50, 6),
(50, 7),
(50, 8),
(50, 9),
(50, 10),
(50, 12),
(51, 1),
(51, 5),
(51, 6),
(51, 10),
(52, 1),
(52, 5),
(52, 6),
(52, 10),
(53, 1),
(53, 5),
(53, 6),
(53, 10),
(54, 1),
(54, 4),
(54, 5),
(54, 6),
(54, 8),
(54, 9),
(54, 10),
(54, 12),
(55, 1),
(55, 4),
(55, 5),
(55, 6),
(55, 8),
(55, 9),
(55, 10),
(55, 12),
(56, 1),
(56, 4),
(56, 5),
(56, 6),
(56, 8),
(56, 9),
(56, 10),
(56, 12),
(57, 1),
(57, 4),
(57, 5),
(57, 6),
(57, 9),
(57, 10),
(57, 12),
(58, 1),
(58, 4),
(58, 5),
(58, 6),
(58, 8),
(58, 9),
(58, 10),
(58, 12),
(59, 1),
(59, 5),
(59, 6),
(59, 7),
(59, 10),
(59, 12),
(60, 1),
(60, 4),
(60, 5),
(60, 6),
(60, 7),
(60, 8),
(60, 9),
(60, 10),
(60, 12),
(61, 1),
(61, 4),
(61, 5),
(61, 6),
(61, 7),
(61, 8),
(61, 9),
(61, 10),
(61, 12),
(62, 1),
(62, 4),
(62, 5),
(62, 6),
(62, 7),
(62, 8),
(62, 9),
(62, 10),
(62, 12),
(63, 1),
(63, 4),
(63, 5),
(63, 6),
(63, 7),
(63, 8),
(63, 9),
(63, 10),
(63, 12),
(64, 1),
(64, 4),
(64, 5),
(64, 6),
(64, 7),
(64, 8),
(64, 9),
(64, 10),
(64, 12),
(65, 1),
(65, 4),
(65, 5),
(65, 6),
(65, 7),
(65, 8),
(65, 9),
(65, 10),
(65, 12),
(66, 1),
(66, 4),
(66, 5),
(66, 6),
(66, 7),
(66, 8),
(66, 9),
(66, 10),
(67, 1),
(67, 4),
(67, 5),
(67, 6),
(67, 7),
(67, 8),
(67, 9),
(67, 10),
(68, 1),
(68, 4),
(68, 5),
(68, 6),
(68, 7),
(68, 8),
(68, 9),
(68, 10),
(69, 1),
(69, 4),
(69, 5),
(69, 6),
(69, 7),
(69, 8),
(69, 9),
(69, 10),
(70, 1),
(70, 4),
(70, 5),
(70, 6),
(70, 7),
(70, 8),
(70, 9),
(70, 10),
(71, 1),
(71, 4),
(71, 5),
(71, 6),
(71, 7),
(71, 8),
(71, 9),
(71, 10),
(72, 1),
(72, 4),
(72, 5),
(72, 6),
(72, 7),
(72, 8),
(72, 9),
(72, 10),
(73, 1),
(73, 4),
(73, 5),
(73, 6),
(73, 7),
(73, 8),
(73, 9),
(73, 10),
(74, 1),
(74, 4),
(74, 5),
(74, 6),
(74, 7),
(74, 8),
(74, 9),
(74, 10),
(75, 1),
(75, 4),
(75, 6),
(75, 9),
(75, 10),
(76, 1),
(76, 4),
(76, 5),
(76, 6),
(76, 8),
(76, 9),
(76, 10),
(76, 12),
(78, 1),
(78, 4),
(78, 5),
(78, 6),
(78, 10),
(78, 12),
(80, 1),
(80, 4),
(80, 5),
(80, 6),
(80, 7),
(80, 8),
(80, 9),
(80, 10),
(80, 12),
(81, 1),
(81, 5),
(81, 6),
(81, 10),
(82, 1),
(82, 5),
(82, 6),
(82, 10),
(83, 1),
(83, 5),
(83, 6),
(83, 10),
(84, 1),
(84, 5),
(84, 6),
(84, 10),
(85, 1),
(85, 5),
(85, 6),
(85, 10),
(86, 1),
(86, 5),
(86, 6),
(86, 10),
(87, 1),
(87, 6),
(87, 10),
(88, 1),
(88, 5),
(88, 6),
(88, 10),
(89, 1),
(89, 5),
(89, 6),
(89, 10),
(90, 1),
(90, 5),
(90, 6),
(90, 10),
(91, 1),
(91, 5),
(91, 6),
(91, 10),
(92, 1),
(92, 6),
(92, 10),
(93, 1),
(93, 5),
(93, 6),
(93, 10),
(94, 1),
(94, 5),
(94, 6),
(94, 10),
(95, 1),
(95, 5),
(95, 6),
(95, 10),
(96, 1),
(96, 5),
(96, 6),
(96, 10),
(97, 1),
(97, 6),
(97, 10),
(98, 1),
(98, 5),
(98, 6),
(98, 10),
(99, 1),
(99, 5),
(99, 6),
(99, 10),
(100, 1),
(100, 5),
(100, 6),
(100, 10),
(101, 1),
(101, 5),
(101, 6),
(101, 10),
(102, 1),
(102, 6),
(102, 10),
(103, 1),
(103, 5),
(103, 6),
(103, 10),
(104, 1),
(104, 5),
(104, 6),
(104, 10),
(105, 1),
(105, 5),
(105, 6),
(105, 10),
(106, 1),
(106, 5),
(106, 6),
(106, 10),
(107, 1),
(107, 6),
(107, 10),
(108, 1),
(108, 5),
(108, 6),
(108, 8),
(108, 10),
(109, 1),
(109, 5),
(109, 6),
(109, 8),
(109, 10),
(110, 1),
(110, 5),
(110, 6),
(110, 8),
(110, 10),
(111, 1),
(111, 5),
(111, 6),
(111, 10),
(112, 1),
(112, 6),
(112, 10),
(113, 1),
(113, 5),
(113, 6),
(113, 10),
(114, 1),
(114, 5),
(114, 6),
(114, 10),
(115, 1),
(115, 5),
(115, 6),
(115, 10),
(116, 1),
(116, 5),
(116, 6),
(116, 10),
(117, 1),
(117, 6),
(117, 10),
(118, 1),
(118, 5),
(118, 6),
(118, 10),
(119, 1),
(119, 5),
(119, 6),
(119, 10),
(120, 1),
(120, 5),
(120, 6),
(120, 10),
(121, 1),
(121, 5),
(121, 6),
(121, 10),
(122, 1),
(122, 6),
(122, 10),
(123, 1),
(123, 5),
(123, 6),
(123, 10),
(124, 1),
(124, 5),
(124, 6),
(124, 10),
(125, 1),
(125, 5),
(125, 6),
(125, 10),
(126, 1),
(126, 5),
(126, 6),
(126, 10),
(127, 1),
(127, 6),
(127, 10),
(128, 1),
(128, 5),
(128, 6),
(128, 10),
(129, 1),
(129, 5),
(129, 6),
(129, 10),
(130, 1),
(130, 5),
(130, 6),
(130, 10),
(131, 1),
(131, 5),
(131, 6),
(131, 10),
(132, 1),
(132, 6),
(132, 10),
(133, 1),
(133, 5),
(133, 6),
(133, 10),
(134, 1),
(134, 5),
(134, 6),
(134, 10),
(135, 1),
(135, 5),
(135, 6),
(135, 10),
(136, 1),
(136, 5),
(136, 6),
(136, 10),
(137, 1),
(137, 6),
(137, 10),
(138, 1),
(138, 5),
(138, 6),
(138, 10),
(139, 1),
(139, 5),
(139, 6),
(139, 10),
(140, 1),
(140, 5),
(140, 6),
(140, 10),
(141, 1),
(141, 5),
(141, 6),
(141, 10),
(142, 1),
(142, 6),
(142, 10),
(143, 6),
(143, 10),
(144, 6),
(144, 10),
(145, 1),
(145, 5),
(145, 6),
(145, 10),
(146, 1),
(146, 5),
(146, 6),
(146, 10),
(147, 6),
(147, 10),
(148, 1),
(148, 5),
(148, 6),
(148, 10),
(149, 1),
(149, 5),
(149, 6),
(149, 10),
(150, 1),
(150, 5),
(150, 6),
(150, 10),
(151, 1),
(151, 5),
(151, 6),
(151, 10),
(152, 1),
(152, 6),
(152, 10),
(153, 1),
(153, 4),
(153, 5),
(153, 6),
(153, 8),
(153, 9),
(153, 10),
(153, 12),
(154, 1),
(154, 4),
(154, 5),
(154, 6),
(154, 8),
(154, 9),
(154, 10),
(154, 12),
(155, 1),
(155, 4),
(155, 5),
(155, 6),
(155, 8),
(155, 9),
(155, 10),
(155, 12),
(156, 1),
(156, 4),
(156, 5),
(156, 6),
(156, 8),
(156, 9),
(156, 10),
(156, 12),
(157, 1),
(157, 6),
(157, 9),
(157, 10),
(158, 1),
(158, 5),
(158, 6),
(158, 10),
(159, 1),
(159, 5),
(159, 6),
(159, 10),
(160, 1),
(160, 5),
(160, 6),
(160, 10),
(161, 1),
(161, 5),
(161, 6),
(161, 10),
(162, 1),
(162, 6),
(162, 10),
(163, 1),
(163, 5),
(163, 6),
(163, 10),
(164, 1),
(164, 5),
(164, 6),
(164, 10),
(165, 1),
(165, 5),
(165, 6),
(165, 10),
(166, 1),
(166, 5),
(166, 6),
(166, 10),
(167, 1),
(167, 6),
(167, 10),
(168, 1),
(168, 5),
(168, 6),
(168, 10),
(169, 1),
(169, 5),
(169, 6),
(169, 10),
(170, 1),
(170, 5),
(170, 6),
(170, 10),
(171, 1),
(171, 5),
(171, 6),
(171, 10),
(172, 1),
(172, 5),
(172, 6),
(172, 10),
(173, 1),
(173, 6),
(173, 10),
(174, 1),
(174, 5),
(174, 6),
(174, 10),
(175, 1),
(175, 5),
(175, 6),
(175, 8),
(175, 10),
(176, 1),
(176, 5),
(176, 6),
(176, 8),
(176, 10),
(177, 1),
(177, 5),
(177, 6),
(177, 10),
(178, 1),
(178, 5),
(178, 6),
(178, 10),
(179, 1),
(179, 6),
(179, 10),
(180, 1),
(180, 6),
(180, 10),
(181, 1),
(181, 6),
(181, 10),
(182, 1),
(182, 6),
(182, 10),
(183, 1),
(183, 6),
(183, 10),
(184, 1),
(184, 6),
(184, 10),
(185, 1),
(185, 6),
(185, 10),
(186, 1),
(186, 6),
(186, 10),
(187, 1),
(187, 6),
(187, 10),
(188, 1),
(188, 6),
(188, 10),
(189, 1),
(189, 6),
(189, 10),
(190, 1),
(190, 6),
(190, 10),
(191, 1),
(191, 6),
(191, 10),
(192, 1),
(192, 6),
(192, 10),
(193, 1),
(193, 6),
(193, 10),
(194, 1),
(194, 6),
(194, 10),
(195, 1),
(195, 6),
(195, 10),
(196, 1),
(196, 6),
(196, 10),
(197, 1),
(197, 6),
(197, 10),
(198, 1),
(198, 6),
(198, 10),
(199, 1),
(199, 6),
(199, 10),
(200, 1),
(200, 6),
(200, 10),
(201, 1),
(201, 6),
(201, 10),
(202, 1),
(202, 6),
(202, 10),
(203, 1),
(203, 6),
(203, 10),
(204, 1),
(204, 6),
(204, 10),
(205, 1),
(205, 6),
(205, 10),
(206, 1),
(206, 6),
(206, 10),
(207, 1),
(207, 6),
(207, 10),
(208, 1),
(208, 6),
(208, 10),
(209, 1),
(209, 6),
(209, 10),
(210, 1),
(210, 6),
(210, 10),
(211, 1),
(211, 6),
(211, 10),
(212, 1),
(212, 6),
(212, 10),
(213, 1),
(213, 6),
(213, 10),
(214, 1),
(214, 6),
(214, 10),
(215, 1),
(215, 6),
(215, 10),
(216, 1),
(216, 6),
(216, 10),
(217, 1),
(217, 6),
(217, 10),
(218, 1),
(218, 6),
(218, 10),
(219, 1),
(219, 6),
(219, 10),
(220, 1),
(220, 6),
(220, 10),
(221, 1),
(221, 6),
(221, 10),
(222, 1),
(222, 6),
(222, 10),
(223, 1),
(223, 6),
(223, 10),
(224, 1),
(224, 6),
(224, 10),
(225, 1),
(225, 6),
(225, 10),
(226, 1),
(226, 6),
(226, 10),
(227, 1),
(227, 4),
(227, 5),
(227, 6),
(227, 8),
(227, 9),
(227, 10),
(227, 12),
(228, 1),
(228, 4),
(228, 5),
(228, 6),
(228, 8),
(228, 9),
(228, 10),
(228, 12),
(229, 1),
(229, 4),
(229, 5),
(229, 6),
(229, 8),
(229, 9),
(229, 10),
(229, 12),
(230, 1),
(230, 4),
(230, 5),
(230, 6),
(230, 8),
(230, 9),
(230, 10),
(230, 12),
(231, 1),
(231, 6),
(231, 9),
(231, 10),
(231, 12),
(232, 1),
(232, 4),
(232, 5),
(232, 6),
(232, 8),
(232, 9),
(232, 10),
(232, 12),
(233, 1),
(233, 4),
(233, 5),
(233, 6),
(233, 8),
(233, 9),
(233, 10),
(233, 12),
(234, 1),
(234, 4),
(234, 5),
(234, 6),
(234, 8),
(234, 9),
(234, 10),
(234, 12),
(235, 1),
(235, 5),
(235, 6),
(235, 9),
(235, 10),
(236, 1),
(236, 5),
(236, 6),
(236, 9),
(236, 10),
(237, 1),
(237, 6),
(237, 9),
(237, 10),
(238, 1),
(238, 4),
(238, 5),
(238, 6),
(238, 8),
(238, 9),
(238, 10),
(238, 12),
(239, 1),
(239, 4),
(239, 5),
(239, 6),
(239, 8),
(239, 9),
(239, 10),
(239, 12),
(240, 1),
(240, 5),
(240, 6),
(240, 8),
(240, 9),
(240, 10),
(240, 12),
(241, 1),
(241, 5),
(241, 6),
(241, 8),
(241, 9),
(241, 10),
(241, 12),
(242, 1),
(242, 6),
(242, 9),
(242, 10),
(242, 12),
(243, 1),
(243, 4),
(243, 5),
(243, 6),
(243, 8),
(243, 9),
(243, 10),
(243, 12),
(244, 1),
(244, 4),
(244, 5),
(244, 6),
(244, 8),
(244, 9),
(244, 10),
(244, 12),
(245, 1),
(245, 5),
(245, 6),
(245, 8),
(245, 10),
(245, 12),
(246, 1),
(246, 5),
(246, 6),
(246, 8),
(246, 10),
(246, 12),
(247, 1),
(247, 6),
(247, 10),
(247, 12),
(248, 1),
(248, 5),
(248, 6),
(248, 8),
(248, 10),
(249, 1),
(249, 5),
(249, 6),
(249, 8),
(249, 10),
(250, 1),
(250, 5),
(250, 6),
(250, 10),
(251, 1),
(251, 5),
(251, 6),
(251, 10),
(252, 1),
(252, 6),
(252, 10),
(253, 1),
(253, 5),
(253, 6),
(253, 8),
(253, 10),
(254, 1),
(254, 5),
(254, 6),
(254, 8),
(254, 10),
(255, 1),
(255, 5),
(255, 6),
(255, 10),
(256, 1),
(256, 5),
(256, 6),
(256, 10),
(257, 1),
(257, 6),
(257, 10),
(258, 1),
(258, 5),
(258, 6),
(258, 7),
(258, 8),
(258, 10),
(259, 1),
(259, 5),
(259, 6),
(259, 7),
(259, 8),
(259, 10),
(260, 1),
(260, 5),
(260, 6),
(260, 8),
(260, 10),
(261, 1),
(261, 5),
(261, 6),
(261, 8),
(261, 10),
(262, 1),
(262, 6),
(262, 10),
(263, 1),
(263, 5),
(263, 6),
(263, 7),
(263, 8),
(263, 10),
(264, 1),
(264, 5),
(264, 6),
(264, 8),
(264, 10),
(265, 1),
(265, 6),
(265, 10),
(266, 1),
(266, 5),
(266, 6),
(266, 7),
(266, 10),
(266, 12),
(267, 1),
(267, 5),
(267, 6),
(267, 7),
(267, 10),
(267, 12),
(268, 1),
(268, 6),
(268, 7),
(268, 10),
(268, 12),
(269, 1),
(269, 10),
(269, 12),
(270, 1),
(270, 10),
(270, 12),
(271, 1),
(271, 10),
(271, 12),
(272, 1),
(272, 10),
(272, 12),
(273, 1),
(273, 10),
(273, 12),
(276, 1),
(276, 10),
(277, 1),
(277, 10),
(282, 1),
(282, 10),
(283, 1),
(283, 10),
(284, 1),
(284, 10),
(285, 1),
(285, 10),
(286, 1),
(286, 10),
(287, 1),
(287, 10),
(288, 1),
(288, 10),
(289, 1),
(289, 10),
(290, 1),
(290, 10),
(291, 1),
(291, 6),
(291, 10),
(292, 1),
(292, 6),
(292, 10),
(293, 1),
(293, 6),
(293, 10),
(294, 1),
(294, 6),
(294, 10),
(295, 1),
(295, 5),
(295, 10),
(296, 1),
(296, 6),
(296, 10),
(297, 1),
(297, 6),
(297, 10),
(298, 1),
(298, 6),
(298, 10),
(299, 1),
(299, 6),
(299, 10),
(300, 1),
(300, 6),
(300, 10),
(301, 1),
(301, 6),
(301, 10),
(302, 1),
(302, 6),
(302, 10),
(303, 1),
(303, 6),
(303, 10),
(304, 1),
(304, 6),
(304, 10),
(305, 1),
(305, 6),
(305, 10),
(306, 1),
(306, 6),
(306, 10),
(307, 1),
(307, 6),
(307, 10),
(308, 1),
(308, 6),
(308, 10),
(309, 1),
(309, 6),
(309, 10),
(310, 1),
(310, 6),
(310, 8),
(310, 10),
(311, 10),
(311, 11),
(312, 10),
(312, 11),
(313, 10),
(313, 11),
(314, 10),
(314, 11),
(315, 10),
(315, 11),
(316, 10),
(316, 11),
(317, 10),
(317, 11),
(318, 10),
(318, 11),
(319, 10),
(319, 11),
(320, 10),
(320, 11),
(321, 10),
(321, 11),
(322, 10),
(322, 11),
(323, 1),
(323, 10),
(323, 12),
(324, 1),
(324, 10),
(324, 12),
(325, 1),
(325, 10),
(325, 12),
(326, 1),
(326, 10),
(326, 12),
(327, 1),
(327, 10),
(327, 12),
(328, 1),
(328, 10),
(329, 1),
(329, 10),
(330, 10),
(330, 12),
(331, 10),
(331, 12),
(332, 10),
(332, 12),
(333, 1),
(333, 10),
(334, 1),
(334, 5),
(334, 8),
(334, 10),
(334, 12),
(335, 1),
(335, 5),
(335, 8),
(335, 10),
(335, 12),
(336, 1),
(336, 5),
(336, 8),
(336, 10),
(336, 12),
(337, 1),
(337, 5),
(337, 8),
(337, 10),
(337, 12),
(338, 1),
(338, 5),
(338, 8),
(338, 10),
(338, 12),
(339, 1),
(339, 5),
(339, 8),
(339, 10),
(339, 12),
(340, 1),
(340, 5),
(340, 8),
(340, 10),
(341, 1),
(341, 5),
(341, 8),
(341, 10),
(342, 1),
(342, 5),
(342, 8),
(342, 10),
(343, 1),
(343, 5),
(343, 8),
(343, 10),
(344, 1),
(344, 5),
(344, 8),
(344, 10),
(344, 12),
(345, 1),
(345, 5),
(345, 8),
(345, 10),
(345, 12),
(346, 1),
(346, 5),
(346, 8),
(346, 10),
(346, 12),
(347, 1),
(347, 10),
(348, 1),
(348, 5),
(348, 8),
(348, 10),
(348, 12),
(349, 1),
(349, 5),
(349, 8),
(349, 10),
(349, 12),
(350, 1),
(350, 5),
(350, 8),
(350, 10),
(350, 12),
(351, 1),
(351, 5),
(351, 8),
(351, 10),
(351, 12),
(352, 1),
(352, 10),
(353, 1),
(353, 5),
(353, 8),
(353, 10),
(353, 12),
(354, 1),
(354, 5),
(354, 8),
(354, 10),
(354, 12),
(355, 1),
(355, 5),
(355, 8),
(355, 10),
(355, 12),
(356, 1),
(356, 5),
(356, 8),
(356, 10),
(356, 12),
(357, 1),
(357, 10),
(358, 1),
(358, 5),
(358, 8),
(358, 10),
(358, 12),
(359, 1),
(359, 5),
(359, 8),
(359, 10),
(359, 12),
(360, 1),
(360, 5),
(360, 8),
(360, 10),
(360, 12),
(361, 1),
(361, 5),
(361, 8),
(361, 10),
(361, 12),
(362, 1),
(362, 10),
(363, 1),
(363, 5),
(363, 8),
(363, 10),
(364, 1),
(364, 5),
(364, 8),
(364, 10),
(365, 1),
(365, 5),
(365, 8),
(365, 10),
(366, 1),
(366, 5),
(366, 8),
(366, 10),
(367, 1),
(367, 5),
(367, 8),
(367, 10),
(368, 1),
(368, 5),
(368, 8),
(368, 10),
(369, 1),
(369, 5),
(369, 8),
(369, 10),
(370, 1),
(370, 5),
(370, 8),
(370, 10),
(371, 1),
(371, 5),
(371, 8),
(371, 10),
(371, 12),
(372, 1),
(372, 5),
(372, 8),
(372, 10),
(372, 12),
(373, 1),
(373, 5),
(373, 8),
(373, 10),
(373, 12),
(374, 1),
(374, 5),
(374, 8),
(374, 10),
(374, 12),
(375, 1),
(375, 5),
(375, 8),
(375, 10),
(375, 12),
(376, 1),
(376, 5),
(376, 8),
(376, 10),
(376, 12),
(377, 1),
(377, 5),
(377, 8),
(377, 10),
(377, 12),
(378, 1),
(378, 5),
(378, 8),
(378, 10),
(378, 12),
(379, 1),
(379, 8),
(379, 10),
(379, 12),
(380, 1),
(380, 8),
(380, 10),
(380, 12),
(381, 1),
(381, 10),
(382, 10),
(383, 1),
(383, 8),
(383, 10),
(383, 12),
(384, 1),
(384, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `sales_type` varchar(255) NOT NULL,
  `total_amount` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `total_paid` decimal(16,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_lists`
--

CREATE TABLE `sales_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `returned_qty` decimal(16,2) NOT NULL DEFAULT 0.00,
  `returned_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(16,2) NOT NULL,
  `collection` decimal(16,2) NOT NULL DEFAULT 0.00,
  `collection_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_return` tinyint(4) NOT NULL DEFAULT 0,
  `delivery_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_returns`
--

CREATE TABLE `sales_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `return_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `approve` tinyint(4) NOT NULL DEFAULT 0,
  `approve_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reject` tinyint(4) NOT NULL DEFAULT 0,
  `reject_by` bigint(20) UNSIGNED DEFAULT NULL,
  `accounts_approve` tinyint(4) NOT NULL DEFAULT 0,
  `accounts_approve_by` bigint(20) UNSIGNED DEFAULT NULL,
  `collection_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_lists`
--

CREATE TABLE `sales_return_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `sales_return_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `sales_list_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `damaged_qty` decimal(16,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(16,2) NOT NULL,
  `sales_discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `primary_mobile` varchar(255) DEFAULT NULL,
  `secondary_mobile` varchar(255) DEFAULT NULL,
  `primary_email` varchar(255) DEFAULT NULL,
  `secondary_email` varchar(255) DEFAULT NULL,
  `office_time` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `google_map` text DEFAULT NULL,
  `favicon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `footer_logo` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `facebook_page` varchar(255) DEFAULT NULL,
  `facebook_group` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `banner_one` varchar(255) DEFAULT NULL,
  `banner_one_link` varchar(255) DEFAULT NULL,
  `banner_two` varchar(255) DEFAULT NULL,
  `banner_two_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `primary_mobile`, `secondary_mobile`, `primary_email`, `secondary_email`, `office_time`, `address`, `description`, `meta_title`, `meta_keyword`, `meta_description`, `meta_image`, `google_map`, `favicon`, `logo`, `footer_logo`, `placeholder`, `facebook_page`, `facebook_group`, `youtube`, `twitter`, `linkedin`, `google`, `whatsapp`, `instagram`, `pinterest`, `banner_one`, `banner_one_link`, `banner_two`, `banner_two_link`, `created_at`, `updated_at`) VALUES
(1, 'Bread Pit - Prima Bakery - Baked with Love', '01738113386', '01738113386', 'breadpit.bangladesh@gmail.com', 'sales@primabakery.com', NULL, 'Bread Pit Prima Bakery, 103, Al-Helal Club Road, Mendipur, Demra-1360 Mobile: 01738113386,', '<p>Bread Pit, Prima Bakery, 103, Al-Helal Club Road, Mendipur, Demra-1360 Mobile: 01738113386, breadpit.bangladesh@gmail.com</p>', NULL, NULL, 'Bread Pit, Prima Bakery, 103, Al-Helal Club Road, Mendipur, Demra-1360 Mobile: 01738113386, breadpit.bangladesh@gmail.com', 'media/default/2026-11-08-Yv2OXgAL7KuZ5ghC6SsJhbA0LMTMkv19Avr1rdF9.webp', NULL, 'media/default/2026-11-08-HN2ojfOl3tPcpLy6ic1XWGtsQDjhB4BWqOmgMjAv.webp', 'media/default/2026-11-08-rjctVbgVP2EBMgOwxRMSrpaeasoPBGgQAyuc3ula.webp', 'media/default/2026-11-08-oeVDjIEX7ILGmnTLI5FR03Twkz4t2fX0pgPqPDNj.webp', 'media/default/2026-11-08-7TdlThParLbtQX77dKRxGwROiMShcOtaWkoXQ8dc.webp', 'https://www.facebook.com/BreadPitBangladesh', NULL, NULL, 'www.twitter.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-08 16:05:10', '2026-11-08 06:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(255) NOT NULL DEFAULT 'home',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `upozila_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `user_id`, `address_type`, `name`, `email`, `phone`, `street`, `address`, `division_id`, `district_id`, `upozila_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'home', 'Sohag Hossain', NULL, '01737910932', '22, Malibagh, Dhaka', '22, Malibagh, Dhaka, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2024-03-09 05:18:23', '2024-03-09 05:18:23'),
(2, 118, 'home', 'Saba Haris', 'saba.habib.01@gmail.com', '01977293693', 'House 9B, Appartent A2\r\nROAD 71, GULSHAN 2', 'House 9B, Appartent A2\r\nROAD 71, GULSHAN 2, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2024-05-08 05:54:17', '2024-05-08 05:54:17'),
(3, 130, 'home', 'Eleanora Khan Vechtomova', 'eleanora_khan@yahoo.com', '01770347909', '399/1A east nakhalpara, tejgaon\r\n(Metropolitan medical centre', '399/1A east nakhalpara, tejgaon\r\n(Metropolitan medical centre, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2024-09-17 02:46:48', '2024-09-17 02:46:48'),
(4, 136, 'home', 'Shayla parveen', 'shilpi2102@yahoo.com', '01619315531', 'Flat no. A7\r\nHouse no.312/C\r\nRoad no.6, Block-I\r\nBashundhara R/A\r\nDhaka', 'Flat no. A7\r\nHouse no.312/C\r\nRoad no.6, Block-I\r\nBashundhara R/A\r\nDhaka, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2024-11-21 08:39:42', '2024-11-21 08:39:42'),
(5, 139, 'home', 'Mohammed Azmayeen', 'ayazmohammed541@gmail.com', '01690265646', '98, Lake Circus, Kalabagan, Dhaka', '98, Lake Circus, Kalabagan, Dhaka, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-03-01 10:59:00', '2025-03-01 10:59:00'),
(6, 140, 'home', 'Fahmina Arshad Lisa', NULL, '01713037417', '5/1/D/1, Ansar camp road, Mirpur 1, Dhaka', '5/1/D/1, Ansar camp road, Mirpur 1, Dhaka, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-05-05 16:34:19', '2025-05-05 16:34:19'),
(7, 141, 'home', 'Mark rayan', 'markrayan04@gmail.com', '01871057199', '4/d,Rayan House, East rajabazar , framgate, dhaka-1215', '4/d,Rayan House, East rajabazar , framgate, dhaka-1215, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-05-16 22:15:07', '2025-05-16 22:15:07'),
(8, 144, 'home', 'Mohammad Ashikur Rahman Zahiri', 'ashikur199615@gmail.com', '8801615990994', 'House 34 Road 10 Sector 14 Uttara Dhaka 1230', 'House 34 Road 10 Sector 14 Uttara Dhaka 1230, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-06-13 14:18:45', '2025-06-13 14:18:45'),
(9, 143, 'home', 'Mohammad Ashikur Rahman Zahiri', NULL, '01615990994', 'House 34 Road 10 Sector 14 Uttara,Dhaka 1230', 'House 34 Road 10 Sector 14 Uttara,Dhaka 1230, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-06-18 18:15:24', '2025-06-18 18:15:24'),
(10, 146, 'home', 'Faiza IBRAHIM', 'faiza.aymii@gmail.com', '1701210689', 'House 26, park road, baridhara, apt 2', 'House 26, park road, baridhara, apt 2, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-06-29 18:14:48', '2025-06-29 18:14:48'),
(11, 147, 'home', 'edwrfdsv', NULL, '01751385652', 'xdsxsx', 'xdsxsx, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-08-31 06:25:27', '2025-08-31 06:25:27'),
(12, 152, 'home', 'Ahnaf Raisa', 'ahnafraisaarthi@gmail.com', '01912663811', '229/1 wasa road,west shewrapara,mirpur,dhaka1216', '229/1 wasa road,west shewrapara,mirpur,dhaka1216, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-10-01 10:42:59', '2025-10-01 10:42:59'),
(13, 153, 'home', 'Nadem', NULL, '01865965222', 'House 14/1, Rd Lake Circus, Kolabagan, Dhaka', 'House 14/1, Rd Lake Circus, Kolabagan, Dhaka, Dhaka City Corporation Area, Dhaka, Dhaka', 13, 45, 372, '2025-10-09 11:25:52', '2025-10-09 11:25:52'),
(14, 160, 'home', 'Mr. Atik', NULL, '01964331828', 'Hatimara, Konabari, Gazipur,Ref# A discount Tk. 80 has been given at the request of Mr. Assad & Jhony Vai.', 'Hatimara, Konabari, Gazipur,Ref# A discount Tk. 80 has been given at the request of Mr. Assad & Jhony Vai., Zanjira , Shariatpur, Dhaka', 13, 59, 470, '2026-05-25 14:14:54', '2026-05-25 14:14:54'),
(15, 162, 'home', 'Tariqul', 'tariquls.world@gmail.com', '01684235644', 'Pirojpur sador', 'Pirojpur sador, Pirojpur Sadar , Pirojpur, Barisal', 19, 33, 261, '2026-06-14 08:45:22', '2026-06-14 08:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `showcase_items`
--

CREATE TABLE `showcase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `serial` bigint(20) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `showcase_items`
--

INSERT INTO `showcase_items` (`id`, `title`, `thumbnail`, `short_description`, `slug`, `serial`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bread', 'media/showcase_items/2023-12-27-DvIvAVBrK5qeGWuFB4FUdXbYqWMNvmPiinqCpMmd.webp', '<p>We have the freshest foods with the best quality from the food industry segment.<br></p>', 'bread', 1, NULL, 1, '2023-10-03 16:00:30', '2024-01-02 02:26:54'),
(8, 'Mayonnaise', 'media/showcase_items/2024-01-02-Wblw935pXH0gghVgl4tXq80QqekH2xhXunHKxqzQ.webp', '<p><span style=\"background-color: var(--bs-white); text-align: var(--bs-body-text-align);\">Ali Fine Foods is a sauce and condiment</span></p><p>factory specializing in mayonnaise and</p><p>tomato ketchup production in Dhaka,</p><p>Bangladesh. It supplies to restaurants</p><p>and supermarkets around the country,</p><p>under the brand name “MASTER”.</p>', 'mayonnaise', 1, NULL, 1, '2024-01-02 02:29:36', '2024-11-23 07:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `show_btn` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `heading`, `title`, `image`, `show_btn`, `status`, `created_at`, `updated_at`) VALUES
(4, NULL, NULL, 'media/slider/2023-12-31-rzuQzsIQu8OqsHcBuDQao7h2mmvafaD6AkvQeAED.webp', 1, 0, '2023-12-30 18:33:26', '2024-01-02 02:12:05'),
(5, NULL, NULL, 'media/slider/2023-12-31-huo5MK2weaIeNGwi23NUjdiQu5cnSctauOq9DBMv.webp', 1, 0, '2023-12-31 12:03:38', '2024-01-02 02:10:53'),
(6, NULL, NULL, 'media/slider/2024-01-02-j3aPBtWmnPsNHAd8sfL9OqGYXiZyLavQ0ZIlf9RL.webp', 1, 0, '2024-01-02 02:22:55', '2024-01-02 02:22:55'),
(11, NULL, NULL, 'media/slider/2024-11-24-0xdYWY0fQNyBWUbfHeRVU31na96gYtPKbIcJJ8ty.webp', 1, 1, '2024-11-24 08:40:04', '2024-11-24 09:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `social_works`
--

CREATE TABLE `social_works` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` text NOT NULL,
  `serial` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_food_items`
--

CREATE TABLE `special_food_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `serial` bigint(20) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `national_id` varchar(255) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `ac_no` varchar(255) DEFAULT NULL,
  `ac_branch` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `company_id`, `branch_id`, `code`, `name`, `short_name`, `designation`, `phone`, `address`, `email`, `national_id`, `joining_date`, `ac_no`, `ac_branch`, `type`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(42, 1, 1, '1008', 'Mr. Delower Hussain', 'Mr. Delower', 'Sr. TSO', '01715622915', 'Mirpur Zone', NULL, NULL, '2023-12-02', NULL, NULL, 'sales', 1, 2, 2, NULL, NULL, '2023-12-21 07:29:21', '2026-11-08 07:23:36'),
(43, 1, 1, '1001', 'Mr.Atikur rahman', 'Atikur', 'Factory Incharge', '01511156504', NULL, 'atiqurpc@gmail.com', NULL, '2023-12-24', NULL, NULL, 'general', 1, 2, 2, 1, '2026-11-08 07:23:18', '2023-12-24 04:30:44', '2026-11-08 07:23:18'),
(44, 1, 1, '1002', 'Mr.Shoaib Azmol', 'Shoaib', 'BDM', '01511156504', NULL, 'shoaibazmoliiuc@gmail.com', NULL, '2023-12-24', NULL, NULL, 'general', 1, 2, 67, 1, '2026-11-08 07:23:23', '2023-12-24 04:31:42', '2026-11-08 07:23:23'),
(45, 1, 1, '1004', 'Mr.Sajib Roy', 'Sajib', 'Asst. Oparator', '01744888532', NULL, 'sajibinfo32@gmail.com', NULL, '2023-12-24', NULL, NULL, 'general', 1, 2, NULL, 1, '2026-11-08 07:23:28', '2023-12-24 04:32:45', '2026-11-08 07:23:28'),
(46, 1, 1, '1005', 'Mr.Arindom Chockroborty', 'Arindom', 'Asst. Oparator', '01670720334', NULL, 'arindom0167@gmail.com', NULL, '2023-12-24', NULL, NULL, 'general', 1, 2, NULL, NULL, NULL, '2023-12-24 04:35:03', '2024-07-04 06:01:15'),
(47, 1, 1, '1006', 'Md.Sohag Hossain', 'Sohag', 'Store Officer', '01737910932', NULL, 'dnjsohaghossain@gmail.com', NULL, '2023-12-24', NULL, NULL, 'sales', 1, 2, 2, NULL, NULL, '2023-12-24 04:36:10', '2024-07-04 06:33:59'),
(48, 1, 1, '1007', 'Mst.Parul Begum', 'Parul', 'Cleaner', '01867331718', NULL, NULL, NULL, '2023-12-24', NULL, NULL, 'general', 0, 2, 2, 1, '2026-11-08 07:23:57', '2023-12-24 04:56:01', '2026-11-08 07:23:57'),
(49, 1, 1, '1009', 'Md.Al-Amin', 'Al-Amin', 'A/C executive', '01717882483', NULL, 'aminshoron@gmail.com', NULL, '2023-12-24', NULL, NULL, 'general', 0, 2, NULL, 1, '2026-11-08 07:23:51', '2023-12-24 04:57:24', '2026-11-08 07:23:51'),
(50, 1, 1, '1010', 'Mr.Md.Ibrahim', 'Ibrahim', 'TSO', '01326560245', NULL, 'ibrahimhawlader3441@gmail.com', NULL, '2023-12-24', NULL, NULL, 'sales', 0, 2, 2, 1, '2026-11-08 07:23:44', '2023-12-24 04:58:43', '2026-11-08 07:23:44'),
(51, 1, 1, '1012', 'Nahid Hasan', 'Nahid Hasan', 'General Manager', '01738113386', NULL, 'nahid.cse.bu@gmail.com', NULL, '2023-01-01', NULL, NULL, 'general', 1, 2, 1, NULL, NULL, '2024-02-03 11:04:44', '2026-11-08 07:24:49'),
(52, 1, 1, '10013', 'Office Sale', 'Office Sale', NULL, '017', NULL, NULL, NULL, '2024-02-03', NULL, NULL, 'sales', 1, 2, 1, NULL, NULL, '2024-02-03 11:09:05', '2026-11-08 07:25:20'),
(53, 1, 1, '1017', 'Muajjem Hossain', 'Muajjem', 'Executive, Sales & Marketing', '01677415471', '145/1,south madartek, basabo, shabujbagh, Dhaka-1214', 'kowshik92hossain@gmail.com', NULL, '2024-07-01', NULL, NULL, 'sales', 1, 2, NULL, NULL, NULL, '2024-07-04 06:01:06', '2024-07-04 06:01:06'),
(54, 1, 1, '1033', 'Alamgir Hossain', 'Alamgir', 'Accounts', '+880 1723-334802', 'Frimgate, Dhaka', NULL, '123', '2024-10-15', NULL, 'Dhaka', 'general', 1, 2, 2, NULL, NULL, '2024-10-15 10:30:57', '2024-10-15 10:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `static_site_items`
--

CREATE TABLE `static_site_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `banner_title` varchar(255) NOT NULL,
  `testimonial_title` varchar(255) NOT NULL,
  `details_video_url` varchar(255) DEFAULT NULL,
  `products_title` varchar(255) NOT NULL,
  `header_bg_image` varchar(255) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `welcome_image` varchar(255) NOT NULL,
  `testimonial_image` varchar(255) NOT NULL,
  `x_separator_image` varchar(255) NOT NULL,
  `y_separator_image` varchar(255) NOT NULL,
  `shop_button_link` varchar(255) DEFAULT NULL,
  `contact_button_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `static_site_items`
--

INSERT INTO `static_site_items` (`id`, `title`, `short_description`, `banner_title`, `testimonial_title`, `details_video_url`, `products_title`, `header_bg_image`, `banner_image`, `welcome_image`, `testimonial_image`, `x_separator_image`, `y_separator_image`, `shop_button_link`, `contact_button_link`, `created_at`, `updated_at`) VALUES
(1, 'WELCOME TO ALI FINE FOODS', 'You are in the right place where you will find what you need for your restaurant at the best prices. The freshest products with the highest quality and excellent service. Explore our product collection and discover for yourself.', 'SHOP WITH US, RESTOCK YOUR INVENTORY QUICK & EASY.', 'ALWAYS, CLOSE TO YOU.', NULL, 'OUR PRODUCTS', 'media/site-items/2023-10-03-9y5Mr7QzwgDgS124p2bDNBJseSXgBVF1PLIHB9El.webp', 'media/site-items/2023-10-03-Ks3KztP2FkaALesdqsMBEf2YhsUoMmub42ehW07T.webp', 'media/site-items/2023-10-03-V43yN1ANy0ADg3S4NxQgZ75SNjxFxTiuaBhmHtNe.webp', 'media/site-items/2023-12-31-ip3mB1HQq6oHc8HPqxkMSeS5fNeeldibBPTPiV3M.webp', 'media/site-items/2023-10-03-8OfkG7MbLfPEphOtkQhn94iNtXQABRDrYLYiC13B.webp', 'media/site-items/2023-10-03-UqkuKHIPv4Q4l5ILV0Wc2kVRzpx8oPwRwYvJ1cF6.webp', 'http://alifinefoods.com/collections', 'http://alifinefoods.com/contact', '2023-10-03 10:59:56', '2023-12-31 11:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `company_id`, `branch_id`, `code`, `type`, `name`, `address`, `remarks`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'BES-2', 'Product Stock', 'Mail Dry Store', 'Dhaka', 'Dry Store', 1, 1, 2, NULL, NULL, '2023-10-24 09:26:05', '2023-12-21 06:01:36'),
(6, 1, 2, 'BFST', 'Product Stock', 'Store and Operational Office Store', 'Dhaka', NULL, 1, 2, 2, NULL, NULL, '2023-11-07 07:50:49', '2023-12-21 06:01:53'),
(8, 1, 1, 'DST', 'Product Stock', 'Bread Pit', 'Tejgaon', 'Bakery Store', 1, 67, NULL, NULL, NULL, '2023-12-30 05:57:43', '2023-12-30 05:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'smfatehullah@gmail.com', NULL, NULL, '2024-03-21 15:54:20', '2024-03-21 15:54:20'),
(2, 'NtRD_generic_b18a5b28_alifinefoods.com@serviseantilogin.com', NULL, NULL, '2024-08-04 00:33:30', '2024-08-04 00:33:30'),
(3, 'bmWX_generic_b18a5b28_alifinefoods.com@serviseantilogin.com', NULL, NULL, '2024-08-05 16:04:13', '2024-08-05 16:04:13'),
(4, 'BlQY_generic_b18a5b28_alifinefoods.com@serviseantilogin.com', NULL, NULL, '2024-08-06 06:11:21', '2024-08-06 06:11:21'),
(5, 'ljmisjbjuj@solid-hamster.skin', NULL, NULL, '2024-08-20 23:11:38', '2024-08-20 23:11:38'),
(6, 'ljmisjbjue@solid-hamster.skin', NULL, NULL, '2024-08-20 23:11:43', '2024-08-20 23:11:43'),
(7, 'ljmisjbjur@solid-hamster.skin', NULL, NULL, '2024-08-20 23:11:46', '2024-08-20 23:11:46'),
(8, 'ljmisjbjui@solid-hamster.skin', NULL, NULL, '2024-08-20 23:11:49', '2024-08-20 23:11:49'),
(9, 'ljmisjbjul@solid-hamster.skin', NULL, NULL, '2024-08-20 23:11:57', '2024-08-20 23:11:57'),
(10, 'ljmisjbjuzj@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:00', '2024-08-20 23:12:00'),
(11, 'ljmisjbjuze@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:10', '2024-08-20 23:12:10'),
(12, 'ljmisjbjuzr@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:13', '2024-08-20 23:12:13'),
(13, 'ljmisjbjuzi@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:20', '2024-08-20 23:12:20'),
(14, 'ljmisjbjuzl@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:23', '2024-08-20 23:12:23'),
(15, 'ljmisjbjuej@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:31', '2024-08-20 23:12:31'),
(16, 'ljmisjbjuee@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:33', '2024-08-20 23:12:33'),
(17, 'ljmisjbjuer@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:38', '2024-08-20 23:12:38'),
(18, 'ljmisjbjuei@solid-hamster.skin', NULL, NULL, '2024-08-20 23:12:41', '2024-08-20 23:12:41'),
(19, '11dk_generic_b18a5b28_alifinefoods.com@serviseantilogin.com', NULL, NULL, '2024-10-13 02:04:25', '2024-10-13 02:04:25'),
(20, 'anskombcollier41@gmail.com', NULL, NULL, '2024-10-19 07:23:55', '2024-10-19 07:23:55'),
(21, 'mazrzemsmuj@dont-reply.me', NULL, NULL, '2024-10-21 08:21:12', '2024-10-21 08:21:12'),
(22, 'zwongtw@gmail.com', NULL, NULL, '2024-10-23 10:53:48', '2024-10-23 10:53:48'),
(23, 'tvaughank1999@gmail.com', NULL, NULL, '2024-11-06 16:02:26', '2024-11-06 16:02:26'),
(24, 'anfaxayjqa6szsj2@yahoo.com', NULL, NULL, '2024-11-08 07:01:31', '2024-11-08 07:01:31'),
(25, 'vanessary6016@gmail.com', NULL, NULL, '2024-11-09 23:09:52', '2024-11-09 23:09:52'),
(26, 'baratspckard@yahoo.com', NULL, NULL, '2024-11-10 17:14:08', '2024-11-10 17:14:08'),
(27, 'ramjfsuv6w@yahoo.com', NULL, NULL, '2024-11-11 10:21:39', '2024-11-11 10:21:39'),
(28, 'blairdyg587@gmail.com', NULL, NULL, '2024-11-13 04:00:29', '2024-11-13 04:00:29'),
(29, 'wlvideuqqd@yahoo.com', NULL, NULL, '2024-11-14 01:41:25', '2024-11-14 01:41:25'),
(30, 'dizzy_taz15@hotmail.com', NULL, NULL, '2024-11-14 22:51:24', '2024-11-14 22:51:24'),
(31, 'ooxeiav9xg755bq@yahoo.com', NULL, NULL, '2024-11-15 20:09:34', '2024-11-15 20:09:34'),
(32, 'baxterambroyzbi2000@gmail.com', NULL, NULL, '2024-11-17 23:49:18', '2024-11-17 23:49:18'),
(33, 'isolacaraibica@yahoo.com', NULL, NULL, '2024-11-19 09:51:41', '2024-11-19 09:51:41'),
(34, 'ggromiewbjk@yahoo.com', NULL, NULL, '2024-11-24 04:35:18', '2024-11-24 04:35:18'),
(35, 'hcuxvonblkntd@yahoo.com', NULL, NULL, '2024-11-26 22:17:53', '2024-11-26 22:17:53'),
(36, 'igayct55@gmail.com', NULL, NULL, '2024-12-01 02:25:05', '2024-12-01 02:25:05'),
(37, 'kpqco4ldnlqljej@yahoo.com', NULL, NULL, '2024-12-01 20:27:04', '2024-12-01 20:27:04'),
(38, 'kendmayhp@gmail.com', NULL, NULL, '2024-12-02 12:09:36', '2024-12-02 12:09:36'),
(39, 'xbmlxfskya@yahoo.com', NULL, NULL, '2024-12-04 00:55:12', '2024-12-04 00:55:12'),
(40, 'lllbnwidgqeerdyi@yahoo.com', NULL, NULL, '2024-12-04 15:52:17', '2024-12-04 15:52:17'),
(41, 'avellisevrets@yahoo.com', NULL, NULL, '2024-12-05 10:30:03', '2024-12-05 10:30:03'),
(42, 'gargamahorr@yahoo.com', NULL, NULL, '2024-12-06 06:45:22', '2024-12-06 06:45:22'),
(43, 'qdenejfxvxsbibclu@yahoo.com', NULL, NULL, '2024-12-08 12:54:04', '2024-12-08 12:54:04'),
(44, 'stefanieargote@gmail.com', NULL, NULL, '2024-12-09 10:29:55', '2024-12-09 10:29:55'),
(45, 'angeldunlapdy76@gmail.com', NULL, NULL, '2024-12-10 08:08:29', '2024-12-10 08:08:29'),
(46, 'b6ylcpecxu3v3@yahoo.com', NULL, NULL, '2024-12-11 11:06:05', '2024-12-11 11:06:05'),
(47, 'mendelalbano@gmail.com', NULL, NULL, '2024-12-13 19:42:34', '2024-12-13 19:42:34'),
(48, 'g8xnmqawrrukkkyx@yahoo.com', NULL, NULL, '2024-12-16 09:50:49', '2024-12-16 09:50:49'),
(49, 'gamugabew80@gmail.com', NULL, NULL, '2024-12-17 21:44:14', '2024-12-17 21:44:14'),
(50, 'grasharits@yahoo.com', NULL, NULL, '2024-12-19 22:09:54', '2024-12-19 22:09:54'),
(51, 'zuvineru596@gmail.com', NULL, NULL, '2024-12-22 10:39:23', '2024-12-22 10:39:23'),
(52, 'xnoociicymsu@yahoo.com', NULL, NULL, '2024-12-26 22:08:18', '2024-12-26 22:08:18'),
(53, 'rulvvcns0uips@yahoo.com', NULL, NULL, '2024-12-27 22:06:33', '2024-12-27 22:06:33'),
(54, 'psvetuamxoikhsfoy@yahoo.com', NULL, NULL, '2024-12-29 15:29:29', '2024-12-29 15:29:29'),
(55, 'ahuvupoz963@gmail.com', NULL, NULL, '2025-01-01 03:59:57', '2025-01-01 03:59:57'),
(56, 'macottipatalinghug@yahoo.com', NULL, NULL, '2025-01-03 12:17:53', '2025-01-03 12:17:53'),
(57, 'rockmannnaperstk@yahoo.com', NULL, NULL, '2025-01-05 12:58:49', '2025-01-05 12:58:49'),
(58, 'ihlsrpkcylyrcfraa@yahoo.com', NULL, NULL, '2025-01-06 19:52:52', '2025-01-06 19:52:52'),
(59, 'op36kgnmh3ny@yahoo.com', NULL, NULL, '2025-01-07 21:53:19', '2025-01-07 21:53:19'),
(60, 'ojugomulan160@gmail.com', NULL, NULL, '2025-01-11 00:44:39', '2025-01-11 00:44:39'),
(61, 'pearsoneleinaky8@gmail.com', NULL, NULL, '2025-01-14 10:09:05', '2025-01-14 10:09:05'),
(62, 'vortexuecho@gmail.com', NULL, NULL, '2025-01-16 04:04:09', '2025-01-16 04:04:09'),
(63, 'gossamerae43nexus14oy@gmail.com', NULL, NULL, '2025-01-17 08:28:32', '2025-01-17 08:28:32'),
(64, 'ebikidayolo42@gmail.com', NULL, NULL, '2025-01-18 11:56:56', '2025-01-18 11:56:56'),
(65, 'drafbyhqbra@yahoo.com', NULL, NULL, '2025-01-20 06:14:17', '2025-01-20 06:14:17'),
(66, 'qxwlmvvqlcwvewcti@yahoo.com', NULL, NULL, '2025-01-21 09:09:05', '2025-01-21 09:09:05'),
(67, 'James5Archibald7046@gmail.com', NULL, NULL, '2025-01-24 13:48:58', '2025-01-24 13:48:58'),
(68, 'George2Francis6592@gmail.com', NULL, NULL, '2025-01-26 05:51:10', '2025-01-26 05:51:10'),
(69, 'Jana3Fletcher8136@gmail.com', NULL, NULL, '2025-01-28 01:49:20', '2025-01-28 01:49:20'),
(70, 'gorbounovaghadei@yahoo.com', NULL, NULL, '2025-01-30 10:10:21', '2025-01-30 10:10:21'),
(71, 'abecaveyo69@gmail.com', NULL, NULL, '2025-02-01 20:47:23', '2025-02-01 20:47:23'),
(72, 'ufixocebil051@gmail.com', NULL, NULL, '2025-02-02 16:25:37', '2025-02-02 16:25:37'),
(73, 'jubileeioverge52@gmail.com', NULL, NULL, '2025-02-04 19:28:20', '2025-02-04 19:28:20'),
(74, 'reverieai4mirage@gmail.com', NULL, NULL, '2025-02-05 17:30:36', '2025-02-05 17:30:36'),
(75, 'whisperai98talisman78ue@gmail.com', NULL, NULL, '2025-02-09 12:10:58', '2025-02-09 12:10:58'),
(76, 'horizoney32talismanoi@gmail.com', NULL, NULL, '2025-02-11 04:52:31', '2025-02-11 04:52:31'),
(77, 'azexofukif519@gmail.com', NULL, NULL, '2025-02-13 13:38:57', '2025-02-13 13:38:57'),
(78, 'cmidmm85@gmail.com', NULL, NULL, '2025-02-15 12:33:03', '2025-02-15 12:33:03'),
(79, 'velasquezrori73@gmail.com', NULL, NULL, '2025-02-16 20:54:36', '2025-02-16 20:54:36'),
(80, 'daimondju8@gmail.com', NULL, NULL, '2025-02-17 15:34:20', '2025-02-17 15:34:20'),
(81, 'selleklivlezy1990@gmail.com', NULL, NULL, '2025-02-19 04:47:08', '2025-02-19 04:47:08'),
(82, 'ouigossameroi81oracle32ae@gmail.com', NULL, NULL, '2025-02-25 02:35:50', '2025-02-25 02:35:50'),
(83, 'utolewo891@gmail.com', NULL, NULL, '2025-02-26 04:25:42', '2025-02-26 04:25:42'),
(84, 'drorzut@yahoo.com', NULL, NULL, '2025-02-27 01:57:51', '2025-02-27 01:57:51'),
(85, 'kaetisilvacv42@gmail.com', NULL, NULL, '2025-02-28 00:49:25', '2025-02-28 00:49:25'),
(86, 'aqtxtsdeokeeho@yahoo.com', NULL, NULL, '2025-02-28 20:02:19', '2025-02-28 20:02:19'),
(87, 'hansenbernardw37@gmail.com', NULL, NULL, '2025-03-02 06:40:15', '2025-03-02 06:40:15'),
(88, 'huffcha6@gmail.com', NULL, NULL, '2025-03-02 23:38:39', '2025-03-02 23:38:39'),
(89, 'qslnwvnl@do-not-respond.me', NULL, NULL, '2025-03-03 08:40:09', '2025-03-03 08:40:09'),
(90, 'gbjgldxf@do-not-respond.me', NULL, NULL, '2025-03-03 08:40:09', '2025-03-03 08:40:09'),
(91, 'wxpzmrnu@do-not-respond.me', NULL, NULL, '2025-03-03 08:40:10', '2025-03-03 08:40:10'),
(92, 'vankuuebtp@yahoo.com', NULL, NULL, '2025-03-03 23:35:07', '2025-03-03 23:35:07'),
(93, 'menechtieton@yahoo.com', NULL, NULL, '2025-03-04 21:21:51', '2025-03-04 21:21:51'),
(94, 'oneidacurtisth25@gmail.com', NULL, NULL, '2025-03-06 03:19:16', '2025-03-06 03:19:16'),
(95, 'morgenvillegasth80@gmail.com', NULL, NULL, '2025-03-07 07:25:23', '2025-03-07 07:25:23'),
(96, 'rdexcmbwqlchpu@yahoo.com', NULL, NULL, '2025-03-08 06:15:09', '2025-03-08 06:15:09'),
(97, 'lavpateluj46@gmail.com', NULL, NULL, '2025-03-09 01:53:06', '2025-03-09 01:53:06'),
(98, 'kaelewilkin8@gmail.com', NULL, NULL, '2025-03-10 04:59:28', '2025-03-10 04:59:28'),
(99, 'kerifigu40@gmail.com', NULL, NULL, '2025-03-12 10:12:36', '2025-03-12 10:12:36'),
(100, 'brinnamaynard7@gmail.com', NULL, NULL, '2025-03-13 17:15:31', '2025-03-13 17:15:31'),
(101, 'linyslangf46@gmail.com', NULL, NULL, '2025-03-14 16:04:36', '2025-03-14 16:04:36'),
(102, 'brenkorepi42@gmail.com', NULL, NULL, '2025-03-15 12:43:49', '2025-03-15 12:43:49'),
(103, 'nutherrrw1989@gmail.com', NULL, NULL, '2025-03-17 02:14:47', '2025-03-17 02:14:47'),
(104, 'ellifarmerh6@gmail.com', NULL, NULL, '2025-03-20 15:55:43', '2025-03-20 15:55:43'),
(105, 'bykerestesl@gmail.com', NULL, NULL, '2025-03-27 11:09:46', '2025-03-27 11:09:46'),
(106, 'tempestbranchlk51@gmail.com', NULL, NULL, '2025-03-30 04:09:23', '2025-03-30 04:09:23'),
(107, 'taylor.rachel405944@yahoo.com', NULL, NULL, '2025-03-30 22:01:19', '2025-03-30 22:01:19'),
(108, 'fritzmerdi@gmail.com', NULL, NULL, '2025-04-01 06:07:18', '2025-04-01 06:07:18'),
(109, 'amalidanielh65@gmail.com', NULL, NULL, '2025-04-01 14:25:23', '2025-04-01 14:25:23'),
(110, 'elllogan1981@gmail.com', NULL, NULL, '2025-04-02 13:01:36', '2025-04-02 13:01:36'),
(111, 'bisshg50@gmail.com', NULL, NULL, '2025-04-02 23:05:44', '2025-04-02 23:05:44'),
(112, 'adriaundwu@gmail.com', NULL, NULL, '2025-04-03 05:56:36', '2025-04-03 05:56:36'),
(113, 'litandje1985@gmail.com', NULL, NULL, '2025-04-04 21:36:59', '2025-04-04 21:36:59'),
(114, 'fwyattn@gmail.com', NULL, NULL, '2025-04-08 20:05:39', '2025-04-08 20:05:39'),
(115, 'djaredscr@gmail.com', NULL, NULL, '2025-04-09 11:50:14', '2025-04-09 11:50:14'),
(116, 'basque_josh844191@yahoo.com', NULL, NULL, '2025-04-11 10:46:13', '2025-04-11 10:46:13'),
(117, 'penadjerikoi5@gmail.com', NULL, NULL, '2025-04-12 20:24:55', '2025-04-12 20:24:55'),
(118, 'ytuckeroj33@gmail.com', NULL, NULL, '2025-04-14 21:24:00', '2025-04-14 21:24:00'),
(119, 'nbrittonz50@gmail.com', NULL, NULL, '2025-04-17 02:53:49', '2025-04-17 02:53:49'),
(120, 'lumsingnalo1981@yahoo.com', NULL, NULL, '2025-04-18 03:55:08', '2025-04-18 03:55:08'),
(121, 'fhannawi1983@gmail.com', NULL, NULL, '2025-04-18 10:02:22', '2025-04-18 10:02:22'),
(122, 'skinnerdjessif7@gmail.com', NULL, NULL, '2025-04-18 22:21:37', '2025-04-18 22:21:37'),
(123, 'grahareddj@gmail.com', NULL, NULL, '2025-04-19 01:48:04', '2025-04-19 01:48:04'),
(124, 'ilgradacde1976@yahoo.com', NULL, NULL, '2025-04-20 13:44:09', '2025-04-20 13:44:09'),
(125, 'cordovanails52@gmail.com', NULL, NULL, '2025-04-20 19:37:57', '2025-04-20 19:37:57'),
(126, 'ellamcclure28@gmail.com', NULL, NULL, '2025-04-20 20:36:56', '2025-04-20 20:36:56'),
(127, 'mrandolfa@gmail.com', NULL, NULL, '2025-04-21 18:34:30', '2025-04-21 18:34:30'),
(128, 'tylerkimberlayak@gmail.com', NULL, NULL, '2025-04-23 15:35:24', '2025-04-23 15:35:24'),
(129, 'benderronolda8@gmail.com', NULL, NULL, '2025-04-24 08:34:12', '2025-04-24 08:34:12'),
(130, 'billtravislp53@gmail.com', NULL, NULL, '2025-04-26 13:08:40', '2025-04-26 13:08:40'),
(131, 'shevonbsv18@gmail.com', NULL, NULL, '2025-04-29 15:42:11', '2025-04-29 15:42:11'),
(132, 'zmartinezf39@gmail.com', NULL, NULL, '2025-05-03 01:51:53', '2025-05-03 01:51:53'),
(133, 'dfosterch69@gmail.com', NULL, NULL, '2025-05-04 03:18:27', '2025-05-04 03:18:27'),
(134, 'bderril89@gmail.com', NULL, NULL, '2025-05-04 07:05:59', '2025-05-04 07:05:59'),
(135, 'dduffyg28@gmail.com', NULL, NULL, '2025-05-13 22:20:04', '2025-05-13 22:20:04'),
(136, 'poolekarolhv36@gmail.com', NULL, NULL, '2025-05-16 00:14:41', '2025-05-16 00:14:41'),
(137, 'sdaviesk1984@gmail.com', NULL, NULL, '2025-05-16 19:50:56', '2025-05-16 19:50:56'),
(138, 'lauragandara161529@yahoo.com', NULL, NULL, '2025-05-17 03:47:19', '2025-05-17 03:47:19'),
(139, 'nymankulwinder502785@yahoo.com', NULL, NULL, '2025-05-17 10:51:53', '2025-05-17 10:51:53'),
(140, 'kerrigillespie73@gmail.com', NULL, NULL, '2025-05-26 18:13:36', '2025-05-26 18:13:36'),
(141, 'mitchelljessica17128@yahoo.com', NULL, NULL, '2025-05-29 15:31:59', '2025-05-29 15:31:59'),
(142, 'meirdingradf1986@gmail.com', NULL, NULL, '2025-05-30 21:10:09', '2025-05-30 21:10:09'),
(143, 'jaysonzimiga306930@yahoo.com', NULL, NULL, '2025-06-01 09:41:00', '2025-06-01 09:41:00'),
(144, 'silvestrgev@gmail.com', NULL, NULL, '2025-06-04 00:27:12', '2025-06-04 00:27:12'),
(145, 'abdulkader4141333@gmail.com', NULL, NULL, '2026-01-03 11:08:07', '2026-01-03 11:08:07'),
(146, 'hejir.er.o.g.e.68@gmail.com', NULL, NULL, '2026-05-09 13:32:07', '2026-05-09 13:32:07'),
(147, 'zkgofuwt@immenseignite.info', NULL, NULL, '2026-05-16 13:16:49', '2026-05-16 13:16:49'),
(148, 'zhqjrhpw@immenseignite.info', NULL, NULL, '2026-05-16 13:16:51', '2026-05-16 13:16:51'),
(149, 'b.e.c.ul.a.n.i.f.i.ne68@gmail.com', NULL, NULL, '2026-05-18 05:18:22', '2026-05-18 05:18:22'),
(150, 't.ay.linsv.3@gmail.com', NULL, NULL, '2026-07-17 05:57:41', '2026-07-17 05:57:41'),
(151, 'madamtaisia@mail.ru', NULL, NULL, '2026-09-10 10:27:52', '2026-09-10 10:27:52'),
(152, 'g.im.iyum.e.3.5.0@gmail.com', NULL, NULL, '2026-11-07 02:20:43', '2026-11-07 02:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `territories`
--

CREATE TABLE `territories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `incharge_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `territories`
--

INSERT INTO `territories` (`id`, `company_id`, `area_id`, `code`, `name`, `incharge_name`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(48, 1, 16, 'D-11', 'Mirpur', 'Md. Deluar Hussain', NULL, NULL, NULL, 1, 2, 2, NULL, NULL, '2023-12-24 05:02:42', '2023-12-24 05:12:58'),
(49, 1, 16, 'D-12', 'Uttara', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, '2023-12-24 05:03:16', '2023-12-24 05:14:06'),
(50, 1, 15, 'D-13', 'Khilgaon', 'Md. Ibrahim', NULL, NULL, NULL, 1, 2, 2, NULL, NULL, '2023-12-24 05:04:01', '2023-12-24 05:13:11'),
(51, 1, 16, 'D-14', 'Gulshan', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, '2023-12-24 05:05:27', '2023-12-24 05:13:23'),
(52, 1, 15, 'D-15', 'Dhanmondi', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, '2023-12-24 05:05:52', '2023-12-24 05:13:36'),
(53, 1, 15, 'D-16', 'Mohammadpur', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, '2023-12-24 05:06:42', '2023-12-24 05:12:22'),
(54, 1, 16, 'D-17', 'Vatara', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2023-12-24 05:11:52', '2023-12-24 05:11:52'),
(55, 1, 15, 'D-18', 'Old Dhaka', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2023-12-24 05:12:11', '2023-12-24 05:12:11'),
(56, 1, 16, '1208', 'Tejgaon', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2024-02-03 11:49:32', '2024-02-03 11:49:32'),
(57, 1, 17, 'BD', 'Bangladesh', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '2024-02-11 12:24:25', '2024-02-11 12:24:25'),
(58, 1, 16, 'KB', 'Kawran Bazar', NULL, NULL, NULL, 'Kawran Bazar, Dhaka', 1, 2, NULL, NULL, NULL, '2024-02-13 05:26:43', '2024-02-13 05:26:43'),
(59, 1, 18, 'DHKCITY', 'Dhaka City', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, '2024-02-29 04:51:14', '2024-02-29 05:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` text NOT NULL,
  `short_description` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `serial` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `title`, `thumbnail`, `short_description`, `slug`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 'QUALITY', 'media/testimonials/2023-10-04-Ku233uiWdHkItYEOM4K8wJinlnskfpbvwWxv0j5h.webp', '<p><span style=\"color: rgb(51, 65, 85); font-family: Figtree, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: medium;\">We deliver the best. All our clients have the security and confidence that we deliver high-quality fresh products.</span><br></p>', 'quality', 1, 1, '2023-10-04 02:35:30', '2023-10-04 02:35:30'),
(2, 'ETHIC', 'media/testimonials/2023-10-04-WbHWwdQfvA57P6kGBP9LigHOKSRYaOg1eFDksdjw.webp', '<p><span style=\"color: rgb(51, 65, 85); font-family: Figtree, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: medium;\">We deliver the best. All our clients have the security and confidence that we deliver high-quality fresh products.</span><br></p>', 'ethic', 2, 1, '2023-10-04 02:37:06', '2023-10-04 02:37:06'),
(3, 'TRUST', 'media/testimonials/2023-10-04-ypygqZgp2UAWAlBfhNDJVHBlIEPcw3mrZCEfO3RD.webp', '<p><span style=\"color: rgb(51, 65, 85); font-family: Figtree, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: medium;\">We deliver the best. All our clients have the security and confidence that we deliver high-quality fresh products.</span><br></p>', 'trust', 3, 1, '2023-10-04 02:38:08', '2023-10-04 02:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `transfer_no` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `host_id` bigint(20) UNSIGNED NOT NULL,
  `destination_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `approve` tinyint(4) NOT NULL DEFAULT 0,
  `approve_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reject` tinyint(4) NOT NULL DEFAULT 0,
  `reject_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_products`
--

CREATE TABLE `transfer_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `is_back` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `area_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `branch_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `store_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_staff` tinyint(4) NOT NULL DEFAULT 0,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp` int(10) DEFAULT NULL,
  `otp_expire` datetime NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `company_id`, `name`, `user_name`, `email`, `phone`, `address`, `image`, `cover_image`, `area_id`, `branch_id`, `store_id`, `status`, `is_staff`, `staff_id`, `email_verified_at`, `otp`, `otp_expire`, `password`, `remember_token`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Admin', 'admin', 'admin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$u4DYPnT9DrDMicRbTOBvU.7yaUhEal3jXqSZjpLrZnt.uHc4k/5yO', NULL, NULL, 1, NULL, NULL, '2023-10-24 06:03:09', '2023-11-09 04:12:25'),
(2, 1, 1, 'Ali Fine Foods', 'alifinefoods', 'info@alifinefoods.com', '01738113386', NULL, 'backend/images/avatar/profile-sczbWzfVl8xylDElQ7H7JbXPaLgZPkcnmjtWLb3t.jpg', 'backend/images/avatar/cover-8Fy3Od1SBJEHBsqfPm3l2udr1qXxB0FVuFEif03W.jpg', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$UN31d.exLF6V1sLMl3net.FjY5bC91xdLeIJrM9nzw9G23jCsJmui', NULL, 1, 1, NULL, NULL, '2023-09-23 06:52:33', '2026-09-17 08:51:02'),
(3, 1, 1, 'test1', 'test', 'test@bon.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2a$12$pPxM87ranp23g5loi2ZGcOcof2tHXa/3X9ksfyAceDBDdPNJypmJ.', NULL, 2, NULL, 1, '2023-11-02 08:10:19', '2023-10-31 07:00:41', '2023-11-02 08:10:19'),
(4, 0, NULL, 'Mamunur Rashid', NULL, 'admin@technoparkbd.com', '01557316189', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$D.k4kNIbMnU6y4zKY314Quc5yQX8uP3hFwRxua84nT7oLhWJdCdtW', NULL, NULL, NULL, NULL, NULL, '2023-11-02 08:32:43', '2023-11-02 08:32:43'),
(5, 0, NULL, 'Hossain Sohan', NULL, 'sohan@bontoncompany.com', '01618003727', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$merFdyE4ejwdfgINyt0ui.0LPZ8Qeu4QTOSlmzXVOoHXU7Y/xQNMm', NULL, NULL, NULL, NULL, NULL, '2023-11-02 09:01:13', '2023-11-02 09:01:13'),
(6, 1, 1, 'Head Office Store User', 'headoffice', 'headoffice@gmail.com', '01997316188', NULL, NULL, NULL, '[\"10\",\"1\"]', '[\"1\"]', '[\"2\"]', 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$uYee0dD4U5NBCX.zhrEvsuAwe3gWw7Ebfz8FfzFhshc7YETPUcvFm', NULL, 1, 1, 1, '2023-12-21 05:19:04', '2023-11-02 09:59:16', '2023-12-21 05:19:04'),
(7, 1, 1, 'Asraf', 'Asraf', NULL, NULL, NULL, NULL, NULL, '[\"7\"]', '[\"1\"]', '[\"2\"]', 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$ejyc2y6RYMGpHiCLCGKHG.P7jWbIrik9wJa2XMrprNmo7ry/jFw9O', NULL, 1, 1, 1, '2023-12-21 05:19:04', '2023-11-02 10:14:35', '2023-12-21 05:19:04'),
(8, 1, 1, 'Fahmida Akter', 'Fahmida', 'cm1@bontoncompany.com', '01618003702', NULL, NULL, NULL, '[\"10\"]', '[\"1\"]', '[\"2\"]', 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$V9YpM0tX6VKtnBWTyYH2g.AzmlBZk0nhMJnZze/Uucok2aNE.ZVH.', NULL, 2, 1, 1, '2023-12-21 05:19:04', '2023-11-07 04:19:10', '2023-12-21 05:19:04'),
(9, 1, 1, 'Fatematuz Johara Mouna', 'Muna', 'cm2@bontoncompany.com', '01618003703', NULL, NULL, NULL, '[\"6\"]', '[\"2\"]', '[\"6\"]', 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$zbnzd36kGsCwXA.55oeL9u3BqPT154w/aHFlYHw4bfPyAlfwqMQdy', NULL, 2, 1, 1, '2023-12-21 05:19:04', '2023-11-07 04:27:08', '2023-12-21 05:19:04'),
(10, 1, 1, 'Sifat Anika', 'Anika', NULL, '01618003705', NULL, NULL, NULL, '[\"8\"]', '[\"2\"]', '[\"6\"]', 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$yzqNw3a041n6CotfIYFcYeEK3wATaFOquQycNnLlDHIhgtNHZAU/i', NULL, 2, 1, 1, '2023-12-21 05:19:04', '2023-11-07 04:28:28', '2023-12-21 05:19:04'),
(11, 1, 1, 'Muhammad Sharif Uddin Bhuiyan', 'Sharif', 'sharif@bontoncompany.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$xQLMYrMMd958kSUT79k6SemKhnP0wR2186CnMF8/.32nYGJ5c7ieW', NULL, 2, NULL, 1, '2023-12-21 05:19:04', '2023-11-07 04:32:45', '2023-12-21 05:19:04'),
(12, 1, 1, 'Hasibur Rahman', 'Hasib', 'hasib.bel@bontoncompany.com', '01618003718', NULL, NULL, NULL, NULL, '[\"2\"]', '[\"6\"]', 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$7BNOFz9R03ZPvKi1m/1zpumFU4y8jCzrTAVgZASkUE7KrxEgJGrjO', NULL, 2, 1, 1, '2023-12-21 05:19:04', '2023-11-07 04:34:02', '2023-12-21 05:19:04'),
(13, 1, 1, 'Shamim Ahamed', 'Shamim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$3cJOkH8S5vVSbVZwrOLEKew61KT0cN87yG2.aCeMxGfnH/WS4tlR.', NULL, 2, NULL, 1, '2023-12-21 05:19:04', '2023-11-07 07:45:26', '2023-12-21 05:19:04'),
(14, 1, 1, 'Md. Rafiqul Islam', 'Rafique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$0ro10sk0vJvuZRpSj3pxwuxLU4jeS/ZQZFa8NPWfuhyFftnAZuFy.', NULL, 2, NULL, 1, '2023-12-21 05:19:04', '2023-11-07 07:46:38', '2023-12-21 05:19:04'),
(15, 1, 1, 'Hossain Mohammad Sohan', 'Sohan', NULL, NULL, NULL, NULL, NULL, '[\"4\",\"7\"]', '[\"1\",\"2\"]', '[\"5\"]', 1, 1, 12, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$TiQ7/8HFZ/UJcsUG4veIWul8zxEZMnl3VhsrxtUNJHQ/zNDY3nEqe', NULL, 2, 1, 1, '2023-12-21 05:19:04', '2023-11-07 07:47:26', '2023-12-21 05:19:04'),
(16, 0, NULL, ',,mmmmmm', NULL, 'shamimshofi@gmail.com', '01916304877', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$i2aJz17cRizsI8wzsMuY5.zqBmSSrSneCsRGooXIiDqY1IngZ4kzS', NULL, NULL, NULL, NULL, NULL, '2023-11-07 08:59:24', '2023-11-07 08:59:24'),
(17, 0, NULL, 'Mosharraf Hossain', NULL, 'dd@gsd', '01883240722', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$6slkiqk6gBsj3TxBaESkueGF6RisY6kM2xl19rUnynxS5QnWUHZQ6', NULL, NULL, NULL, NULL, NULL, '2023-11-07 09:00:10', '2023-11-07 09:00:10'),
(18, 0, NULL, 'Rafiqul Islam', NULL, 'rafique@bontoncompany.com', '01716365172', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$ndKggkAdAzRHxD2.6L6yneSQ.zZKbfBSXazEO4dFFCkEk0a/4zNwm', NULL, NULL, NULL, NULL, NULL, '2023-11-07 09:41:46', '2023-11-07 09:41:46'),
(20, 0, NULL, 'Mamunur Rashid', NULL, 'alfattah@gmail.com', '01552344239', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$McMegmFIf0.M83qUN94ozeTWbdsWF3WuOIQ2sHwh781dJEmlZqbWW', NULL, NULL, NULL, NULL, NULL, '2023-11-12 08:12:26', '2023-11-12 08:12:26'),
(21, 0, NULL, 'TqSFiXsnjhKru', NULL, 'KemIil.qqqqbtw@monochord.xyz', '1', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$4tlH8eIQLlbUdxv92dePD.i8xaOKnXLFeO3X6Pw5Y76kD72ofxI4e', NULL, NULL, NULL, NULL, NULL, '2023-11-20 06:26:30', '2023-11-20 06:26:30'),
(25, 2, 1, 'Test Client', '102054362', 'admin@newmail.com', '01997316180', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$mHStJ.rLRL2RcDXCTPhh5usckijoX0A5O0XOU8ys0pamAMHeTpPtu', NULL, 1, NULL, 2, '2023-11-25 10:22:09', '2023-11-22 17:37:20', '2023-11-25 10:22:09'),
(27, 2, 1, 'Mosharraf Hossain', '01997316177', NULL, '01997316177', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$5d5A6J6AKnoKo.24/2SHze/niV.djKrT02FVUicnvi9niRc0xJah6', NULL, 2, NULL, 2, '2023-11-23 09:21:19', '2023-11-23 09:21:08', '2023-11-23 09:21:19'),
(28, 2, 1, 'Fattah', '01716918884', NULL, '01716918884', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-11-24 11:04:22', '$2y$10$nc2jjZz/CTW9es4xNZBLwuEJmf4m4b2zT674T2lbTMFcNjF6ACBrq', NULL, 2, NULL, 2, '2023-11-23 10:31:39', '2023-11-23 09:28:00', '2023-11-23 10:31:39'),
(34, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3641, '2024-07-04 12:19:43', NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-24 14:37:50', '2024-07-04 06:14:43'),
(35, 0, NULL, 'Masuma Bagum', NULL, NULL, '01914470447', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 2897, '2023-11-24 22:32:18', '$2y$10$9dkTBfAtlNHKhsPnP51eLulraI74ml.Xcr9IjD.umMBD3FZyPzOTy', NULL, NULL, NULL, NULL, NULL, '2023-11-24 16:24:08', '2023-11-24 16:27:18'),
(36, 0, NULL, 'Mosharraf Hossain', NULL, NULL, '01997316189', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 9718, '2023-11-24 22:35:53', '$2y$10$MgcV1a2SIqrve741w6MAjOhIRzmNZnMFmQ6aFGXjmYHwyQH3H4W3u', NULL, NULL, NULL, NULL, NULL, '2023-11-24 16:30:02', '2023-11-24 16:30:53'),
(37, 0, NULL, 'feroj Ahmed', NULL, NULL, '01618003712', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1162, '2023-11-25 14:18:42', '$2y$10$MzcrqtowvaIM5GlmcdOibuVFm5nqE.wQxi6VvnJ9eQx19QpF.ZlJC', NULL, NULL, NULL, NULL, NULL, '2023-11-25 08:13:17', '2023-11-25 08:13:42'),
(38, 0, NULL, 'Shamim Ahamed', NULL, NULL, '01884000777', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3267, '2023-11-25 15:29:53', '$2y$10$eBfANFdz/Upo0Dpp0yktpeMi5V9l4Ipht3gemXJjdF9ORm2yj5/By', NULL, NULL, NULL, NULL, NULL, '2023-11-25 09:18:30', '2023-11-25 09:24:53'),
(40, 2, 1, 'Yeallow', '01998754399', NULL, '01998754399', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-12-07 15:39:45', '$2y$10$fqqb5w.vWPPZaemmqbItM.6zAWHeZsTGbLU.AQz2WGjWWRWbmOJTu', NULL, 2, NULL, 1, '2023-12-21 05:13:29', '2023-12-07 09:39:45', '2023-12-21 05:13:29'),
(67, 1, 1, 'Shoaib Azmol', 'Shoaib', 'shoaibazmoliiuc@gmail.com', '01749885503', NULL, 'backend/images/avatar/profile-UinZ3716SMMr8C8LloWlvCRU9u2moLWyi22jeFUv.jpg', 'backend/images/avatar/cover-Kd8dkNKwRTy0KfafFXAvHGlXy63934FtUBmTqlie.png', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-30 11:38:05', '$2y$10$WQvohZOQ6H7Vp9BGt98ePun/l6weG4Tn6FODyoVUhWlnxQm5tLhK6', NULL, 2, 2, NULL, NULL, '2023-12-30 05:38:05', '2024-07-11 10:36:24'),
(68, 1, 1, 'Md. Al Amin', 'Alamin', NULL, '01717882483', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-30 11:47:30', '$2y$10$tGzwbUHQ.Ip9JPU0uubDCOYUqY4mQOwjkIrKcTsJEalno7klhtiNq', NULL, 67, NULL, NULL, NULL, '2023-12-30 05:47:30', '2024-07-11 10:36:39'),
(73, 0, NULL, 'Nahid Hasan', NULL, 'nahid.cse.bu@gmail.com', '01738113386', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 6215, '2024-01-02 01:14:59', '$2y$10$PV01Nq/soizryEZuff9yMeVb4uEuKi2Ud.LWzph7BKbNAJLVfjC.y', NULL, NULL, NULL, NULL, NULL, '2024-01-01 19:06:56', '2024-01-01 19:09:59'),
(74, 0, NULL, NULL, NULL, NULL, '01717882483', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 9546, '2024-01-15 12:25:25', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-15 06:20:25', '2024-01-15 06:20:25'),
(75, 1, 1, 'System Admin', 'sys_admin', 'systemadmin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-03 14:43:57', '$2y$10$GynxleifKPJIgaFqZnjaYOQ25CtftU1Hi910W6u6.S5V6YKJ1a8h2', NULL, 1, 1, NULL, NULL, '2024-02-03 08:43:57', '2024-02-03 10:44:57'),
(76, 2, 1, 'Bonton Foods Limited', '01618 003740', NULL, '017', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-03 17:06:50', '$2y$10$C2Aukgin0ZllKZxPnAlxC.Unlr21C/MwYtbni6mtl7cW/hsqpoK76', NULL, 2, NULL, NULL, NULL, '2024-02-03 11:06:50', '2024-07-16 11:00:06'),
(77, 2, 1, 'Cash Sales', '01700', NULL, '01700', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-03 17:50:46', '$2y$10$EyNDP6g1mHow9ZHGn.Oj2exUu3UKbAaOXF2Ji73/MRoZmDLHEK86m', NULL, 2, NULL, NULL, NULL, '2024-02-03 11:50:46', '2024-02-03 11:50:46'),
(78, 2, 1, 'Dhali Super Shop - Gulshan', '01711', NULL, '01711', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-03 18:11:33', '$2y$10$ThFMqHHT5.dUHSmKIrElOOLv./L8hLZ5Fh/.MaII8DunQuIla4B3e', NULL, 2, NULL, NULL, NULL, '2024-02-03 12:11:33', '2024-02-03 12:11:33'),
(79, 2, 1, 'Pick & Pay - Bashundhara', '01728398313', NULL, '01723', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-03 18:12:28', '$2y$10$RlHvKdJ3ensByTtlp0GzNONskyj.nSW49ClQ0DNiJ5mozWoau4WKi', NULL, 2, NULL, NULL, NULL, '2024-02-03 12:12:28', '2024-02-15 05:31:35'),
(80, 2, 1, 'Atikur Rahman', '01305845147', NULL, '01305845147', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-04 17:32:39', '$2y$10$7Gzz9bxG0hMfG5HEuhvpKe7b5cwK4FP5YXJy3j7jq7tJ0mEoHzE6S', NULL, 2, NULL, NULL, NULL, '2024-02-04 11:32:39', '2024-02-04 11:32:39'),
(81, 1, 1, 'Shahmat Ali', 'Shahmat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-05 15:26:10', '$2y$10$x8zZCOPaeOwuvQmca7LnM.kQv6kJcg8fs14rmkbj9Cb2DGWRmIn3i', NULL, 2, NULL, NULL, NULL, '2024-02-05 09:26:10', '2024-02-05 09:26:10'),
(82, 2, 1, 'Apon Family Mart - Bashundhara', '01711446959', 'jahidulrony@hotmail.com', '01711446959', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-07 10:56:16', '$2y$10$OU7lLaytdF3Seo3JsWPMQucQzMDVOJFtUAPZeme..HrHfhHm6XX3W', NULL, 2, NULL, NULL, NULL, '2024-02-07 04:56:16', '2024-02-07 04:56:16'),
(83, 2, 1, 'Dedar Super Shop', '01316051644', NULL, '01316051644', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-08 15:23:11', '$2y$10$/GNzRWD7255ldMXSYWSDce25RpMxow.kRhCW/UYm.huN84sNH47dO', NULL, 68, NULL, NULL, NULL, '2024-02-08 09:23:11', '2024-02-08 09:23:11'),
(85, 2, 1, 'FOC (Free of Cost) - Office', '01844000103', NULL, '01844000103', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-11 11:51:48', '$2y$10$/dMg5tZb7addSos.yO6AEODC5ZaXK2yIfyCG.C88P1tMWlwiDt6Vi', NULL, 2, NULL, NULL, NULL, '2024-02-11 05:51:48', '2024-02-13 05:38:35'),
(92, 2, 1, 'Mejan General Store- Kawran bazar', '01726887481', NULL, '01726887481', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-13 12:06:44', '$2y$10$gNHqFNmm9qZHOvOFiThEj.eVeM7QOWXdc6N9rgWwkJFweHCbNqZV.', NULL, 2, NULL, NULL, NULL, '2024-02-13 06:06:44', '2024-02-13 06:06:44'),
(93, 2, 1, 'Khan Enterprise - Kawran', '01911722350', NULL, '01911722350', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-13 13:28:54', '$2y$10$1sMhMNJjD1zdtubvvd963./U1j9/blv9Xb3yzC9QuROfNtA7QS57K', NULL, 2, NULL, NULL, NULL, '2024-02-13 07:28:54', '2024-02-13 07:28:54'),
(94, 2, 1, 'Altaf General Store- Kawran', '01311467970', NULL, '01311467970', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-13 13:41:43', '$2y$10$JfURbJOZQfvgF.Yw1C6zOeUiuKg4gymfbItDxYEhn9zOpBao80Q9O', NULL, 2, NULL, NULL, NULL, '2024-02-13 07:41:43', '2024-02-13 07:41:43'),
(95, 2, 1, 'Sonargaon General Store- Kawran Bazar', '01714323952', NULL, '01714323952', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-13 13:43:40', '$2y$10$I2YLUAxkn9BpWAiY5FGXceryTZIUyq9flsITj6qdB.xfI.Aq9kasu', NULL, 2, NULL, NULL, NULL, '2024-02-13 07:43:40', '2024-02-13 07:43:40'),
(96, 2, 1, 'Palash Enterprise- kawran bazar', '01673886595', NULL, '01673886595', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-13 13:44:50', '$2y$10$8bbCUQDPGOmOKOJPVwD8oOj3UPept8Q1GhGfWXsLflg666vN9UkP6', NULL, 2, NULL, NULL, NULL, '2024-02-13 07:44:50', '2024-02-13 07:44:50'),
(97, 2, 1, 'Sariotpur Enterprise-Gulshan-1', '01755712559', NULL, '01755712559', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-15 11:35:03', '$2y$10$v3tzMF13XxocnPkpkXHEk.1stBLV6V3vjqHC7bJLj2mxBqQaBIZNi', NULL, 2, NULL, NULL, NULL, '2024-02-15 05:35:03', '2024-02-15 05:35:03'),
(98, 2, 1, 'M.R Corporation - Gulshan-1', '01818588499', NULL, '01818588499', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-15 11:37:34', '$2y$10$NzSJyWfvRhMJnbyLW2NwOudpqrnuyA5fEMzSxs.jYs3Twbt5ynt0S', NULL, 2, NULL, NULL, NULL, '2024-02-15 05:37:34', '2024-02-15 05:37:34'),
(99, 2, 1, 'Labeeb Corporation - Gulshan-1', '01715885452', NULL, '01715885452', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-15 11:40:24', '$2y$10$IiF4ealznDrwBmUzIk4wIe5QrXfEGUUPg5Xo9df1.Lmx881gxYOWu', NULL, 2, NULL, NULL, NULL, '2024-02-15 05:40:24', '2024-02-15 05:40:24'),
(100, 2, 1, 'Brothers General Store- Gulshan-1', '01718075099', NULL, '01718075099', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-15 11:44:33', '$2y$10$q0qE/8kP6SiN98bsHCk9e.sFkjRusm.Gqm.67YRIpjmKbfSGs5Xm2', NULL, 2, NULL, NULL, NULL, '2024-02-15 05:44:33', '2024-02-15 05:44:33'),
(101, 2, 1, 'R.S.K Traders - Gulshan', '01926724482', NULL, '01926724482', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-15 11:50:33', '$2y$10$ICIyEAR1UTAFKZEs5bX5oe9v/BVMzQPjfV06/mh2Sd6zXirpscKZW', NULL, 2, NULL, NULL, NULL, '2024-02-15 05:50:33', '2024-02-15 05:50:33'),
(102, 2, 1, 'Food Shop Enterprise- Mirpur-02', '01712595692', NULL, '01939395724', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-15 12:39:01', '$2y$10$0bOho2ZRGIR.6CZcJ5V1yu1EyLlCbiMkBY.6dV8eSC2F5rhhJF5uO', NULL, 2, NULL, NULL, NULL, '2024-02-15 06:39:01', '2024-06-23 10:04:05'),
(103, 0, NULL, NULL, NULL, NULL, '01749885503', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1177, '2024-07-15 16:36:59', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-15 08:13:24', '2024-07-15 10:31:59'),
(104, 0, NULL, NULL, NULL, NULL, '01749885503', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1602, '2024-02-15 14:18:26', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-15 08:13:26', '2024-02-15 08:13:26'),
(105, 2, 1, 'Gemini Shopping Center', '01730609977', NULL, '01730609977', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-18 12:17:48', '$2y$10$Qz9S2.GbvuBGRfLADI3Oq.SrxwTTjWt1PPujg8rMnKSau23r3FDL.', NULL, 68, NULL, NULL, NULL, '2024-02-18 06:17:48', '2024-02-18 06:17:48'),
(106, 2, 1, 'Salafi traders-Kachukhet', '01911797573', NULL, '01911797573', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-20 11:28:26', '$2y$10$K1QTSnW5mVfjfduaGj6qOOZVxhhbohqVsgML4r4EKcfqIeX6se7Lq', NULL, 68, NULL, NULL, NULL, '2024-02-20 05:28:26', '2024-02-20 05:28:26'),
(107, 2, 1, 'Jahan Enterprise-Kachukhet', '01726993902', NULL, '01726993902', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-20 11:30:01', '$2y$10$9CNRvkEWcFH7uXyjNTHZGuV/7Fd/yCmof3IP/0zPHypXmtqE11Lhm', NULL, 68, NULL, NULL, NULL, '2024-02-20 05:30:01', '2024-02-20 05:30:01'),
(108, 2, 1, 'Ayesha Enterprise-Kachukhet', '01617776012', NULL, '01617776012', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-20 11:35:05', '$2y$10$mWXIi0od6NhUwvyPa0NVD.I/PK4sIEXMNFNiAHYLiP7FJmwXkcbgu', NULL, 68, NULL, NULL, NULL, '2024-02-20 05:35:05', '2024-02-20 05:35:05'),
(109, 2, 1, 'Sikder Enterprise-Kachukhet', '01706333315', NULL, '01706333315', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-20 11:39:24', '$2y$10$S7QR4y5rVa/WQc4PnO2JT.oP6EUxf5Irh9t.jZ6wlb4.DHXOs/PgO', NULL, 68, NULL, NULL, NULL, '2024-02-20 05:39:24', '2024-02-20 05:39:24'),
(110, 2, 1, 'Farzana Enterprise-Kachukhet', '01720963091', NULL, '01720963091', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-20 16:17:36', '$2y$10$nK8SbHuPC8ZykQgAUR/aZOXV61XScakksd01igsbfVuHi3fpMIGWi', NULL, 68, NULL, NULL, NULL, '2024-02-20 10:17:36', '2024-02-20 10:17:36'),
(111, 2, 1, 'Panda Mart', '01601540567', NULL, '01601540567', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-25 11:15:22', '$2y$10$G.yFRyJg9fa5S1R1.0X5GeNW9rf2j6wDOTFU8ytzdoaSHGm507/Z.', NULL, 2, NULL, NULL, NULL, '2024-02-25 05:15:22', '2024-02-25 05:15:22'),
(112, 2, 1, 'Meena Bazar', '01841700923', NULL, '01841700923', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-02-29 10:52:42', '$2y$10$BeM10gIqkUmgESqaK.x6f.gRyhwjkdhg47MBUiI32HsabHzCmJZ4C', NULL, 2, NULL, NULL, NULL, '2024-02-29 04:52:42', '2024-02-29 04:52:42'),
(113, 1, 1, 'Nahid Hasan', 'Nahid Hasan', 'nahid.hasan.opu.bd@gmail.com', '01844147255', NULL, NULL, NULL, NULL, '[\"1\"]', NULL, 1, 1, NULL, NULL, NULL, '2024-02-29 11:57:56', '$2y$10$4AokmrqP9vgi.1sM0ZgGpOAtX24sJzTAbYc77aDaKHUtpwIXytY1e', NULL, 2, 2, NULL, NULL, '2024-02-29 05:57:56', '2026-09-17 09:01:42'),
(114, 2, 1, 'S A Enterprise,Kawran bazar', '01872720639', NULL, '01872720639', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-03-16 13:10:14', '$2y$10$7rW.IJhCLLC5EYxeD3uWGOc20h/AIFj1RqmZIcMwbJMW3Dzjcide6', NULL, 68, NULL, NULL, NULL, '2024-03-16 07:10:14', '2024-03-16 07:10:14'),
(115, 2, 1, 'Noakhali general Store', '01684732601', NULL, '01684732601', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-03-16 15:20:09', '$2y$10$kqT/812Kd4q5xu.l4uGrL.jkkJ12YAbvJw1tHk1EDQpN/Y9Hjhl7S', NULL, 68, NULL, NULL, NULL, '2024-03-16 09:20:09', '2024-03-16 09:20:09'),
(116, 2, 1, 'Lavender Convenience Store Ltd.', '01791888889', NULL, '01791888889', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-04-08 13:11:28', '$2y$10$ImPWDzhmhzh6jPEn5QyJ.umcbEFWWVcukjFmvtmQsltYOd/XMNlGy', NULL, 68, NULL, NULL, NULL, '2024-04-08 07:11:28', '2024-04-08 07:11:28'),
(117, 2, 1, 'Davour Limited', '01713029996', NULL, '01', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-04-21 16:46:43', '$2y$10$JyzrSDdm8J3D9xgikCVrAOFEyMr4a8YLA9DMz4C6nEuNnXgRd8Hw6', NULL, 68, NULL, NULL, NULL, '2024-04-21 10:46:43', '2025-04-10 06:33:28'),
(118, 0, NULL, 'Saba Haris', NULL, 'saba.habib.01@gmail.com', '01977293693', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-05-08 11:54:17', '$2y$10$g0IJ84zbHripknhd9EIoSu9tmzfLhDtmJcu/JbJNiI3vRwrMGQ1l.', NULL, NULL, NULL, NULL, NULL, '2024-05-08 05:54:17', '2024-05-08 05:54:17'),
(119, 2, 1, 'Agora Limited', '01925117638', NULL, '01925117638', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-05-15 16:41:27', '$2y$10$Ru0kqjCU0hy34MDnjzxlcexmqARMzZkx58dHap5JrOEipQ0yswmQC', NULL, 2, NULL, NULL, NULL, '2024-05-15 10:41:27', '2024-05-15 10:41:27'),
(120, 1, 1, 'Tanvir', 'Tanvir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '2024-06-23 12:41:49', '$2y$10$quT76fqu4kLIU5pQwAedVO/G5bQazg3/VaW2K6I7q41lIGbOveFn.', NULL, 75, NULL, NULL, NULL, '2024-06-23 06:41:49', '2024-09-01 07:22:18'),
(121, 2, 1, 'Taj General Store- Gulshan DCC Market', '01760650650, 01962797611', NULL, '01760650650, 01962797611', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-03 10:59:18', '$2y$10$E5XM0J95xuueKgX6Mjno9uXsw3Di0KkmeG00pa7pR94OHJeHzVcbC', NULL, 2, NULL, NULL, NULL, '2024-07-03 04:59:18', '2024-07-03 04:59:18'),
(122, 2, 1, 'Bhai Bhai General Store- Gulshan DCC', '01950-453393', NULL, '01950-453393', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-03 11:01:59', '$2y$10$o0gOpcxp4bI4pNhhyt7R4OKs1MN9GIfoJuhMH11TTefIl2JbGOdkC', NULL, 2, NULL, NULL, NULL, '2024-07-03 05:01:59', '2024-07-03 05:01:59'),
(123, 2, 1, 'Mayer Doya Baniati Store- Gulshan DCC', '01731-398419, 01941-118688', NULL, '01731-398419, 01941-118688', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-03 11:04:56', '$2y$10$2E6UiaWvIwU7Fwzi3X2cc.yIGaiZV/9BfQjyUS47lhBSMh1NZN4EK', NULL, 2, NULL, NULL, NULL, '2024-07-03 05:04:56', '2024-07-03 05:04:56'),
(124, 2, 1, 'Jerin Enterprise - DCC Market', '01814-148996, 01306-682873', NULL, '01814-148996, 01306-682873', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-04 12:43:17', '$2y$10$sCcNYLZGuaJm7VhSWMVLCeCb.c/Av5sdHE15x0wAoXAoa3E33JPF6', NULL, 2, NULL, NULL, NULL, '2024-07-04 06:43:17', '2024-07-04 06:43:17'),
(125, 2, 1, 'Izaan N Zayan Trade International- DCC Market', '01611-103790, 01841-103790, 01511-103790', NULL, '01611-103790, 01841-103790, 01511-103790', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-04 12:50:03', '$2y$10$ZKH0sUw.FDMntay0xB5N8e734ZTG6Hrd6DOX7zx22JVFveEtsyP6W', NULL, 2, NULL, NULL, NULL, '2024-07-04 06:50:03', '2024-07-04 06:50:03'),
(126, 2, 1, 'Jannath General Store - DCC Market', '01758-978070, 01840-732624', NULL, '01758-978070, 01840-732624', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-04 12:57:14', '$2y$10$LRM3LF9zSv4.KFY.UlAtiOAwStuSMYo7V5Rvsb3Fnhm82.PAuVwHq', NULL, 2, NULL, NULL, NULL, '2024-07-04 06:57:14', '2024-07-04 06:57:14'),
(127, 2, 1, 'Upohar General Store- DCC Market', '01865-080806', NULL, '01865-080806', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-07 11:17:15', '$2y$10$HPqUGTsA1rlP2onv6Ovko.cEIPsfuUa5r4PnO2ehoAdNurQlm6lle', NULL, 2, NULL, NULL, NULL, '2024-07-07 05:17:15', '2024-07-07 05:17:15'),
(128, 2, 1, 'Nihan Trade Corporation-DCC Market', '01644466314', 'nihantradecorporation.bd@gmail.com', '01644466314', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-07 12:11:59', '$2y$10$tWkz8YpjJOelXrK5Va9WXuV7XJ2F9BDMVhacQXz2V6gq.p0G5eh4y', NULL, 2, NULL, NULL, NULL, '2024-07-07 06:11:59', '2024-07-07 06:11:59'),
(129, 2, 1, 'A.R Traders - DCC Market', '01685956653', NULL, '01957-030650, 01875-030650', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-07-07 12:21:49', '$2y$10$.poVz8MihlaXbswIhXuB9OqpYxEVBOSO8s/lGvlCGXkSnZDXgmvOa', NULL, 2, NULL, NULL, NULL, '2024-07-07 06:21:49', '2026-11-08 06:58:41'),
(130, 0, NULL, 'Eleanora Khan Vechtomova', NULL, 'eleanora_khan@yahoo.com', '01770347909', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-09-17 08:46:48', '$2y$10$wo2KBEelVA3Htj9dsuRWOuNVpFcflA9WDwOCTICysqEkMGskIfy/m', NULL, NULL, NULL, NULL, NULL, '2024-09-17 02:46:48', '2024-09-17 02:46:48'),
(131, 2, 1, 'MM Burger - Khilgaon', '017567', NULL, '017567', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-09-21 19:06:35', '$2y$10$yO50DkK3.mI/ynbz6pFQdOEkCZZ9cIioSVGWqA3nJ5CdyFEHmkIAS', NULL, 2, NULL, NULL, NULL, '2024-09-21 13:06:35', '2024-09-21 13:06:35'),
(133, 1, 1, 'Alamgir Ashik', '1033', 'abc@gmail.com', '01723334802', '171 Tejgaon industrial Area, Dhaka-1208', 'backend/images/avatar/profile-RJH7Syfdd9sHPB0oC5CLdUSS7Jq8q8iXy1MJgxDp.jpg', 'backend/images/avatar/cover-f7J5DL9EpModEShAJhik5STbOqazslQNdCTSXLVR.png', NULL, '[\"1\",\"2\"]', NULL, 0, 0, NULL, NULL, NULL, '2024-10-15 16:26:59', '$2y$10$ZTDJlfgybUCu6kecR0Le8u5.GhLPgbwudN5cEJa4kcdurTVuTCJT.', NULL, 2, 1, 1, '2026-11-08 07:04:12', '2024-10-15 10:26:59', '2026-11-08 07:04:12'),
(134, 2, 1, 'RFL', '01558182602', NULL, '01558182602', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-10-27 12:50:19', '$2y$10$71f1WwNVZQClp0Q8wSUqI.yKps7cpPAHosevzAZowDDsJai5/T/gO', NULL, 133, NULL, NULL, NULL, '2024-10-27 06:50:19', '2024-10-27 06:50:19'),
(135, 2, 1, 'Mon Cheri - Badda', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-11-19 12:32:51', '$2y$10$YRA8.gueiWK1Lc5HuujSCO3bBXrwZb.xNfdaMIbCUl4o6UafamYAi', NULL, 2, NULL, NULL, NULL, '2024-11-19 06:32:51', '2024-11-19 06:32:51'),
(136, 0, NULL, 'Shayla parveen', NULL, 'shilpi2102@yahoo.com', '01619315531', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2024-11-21 14:39:42', '$2y$10$PjPFmLdRf1Rj0kVLNLQ3jOEU5r5IjccPsd43JfSp0f2c27acRao/2', NULL, NULL, NULL, NULL, NULL, '2024-11-21 08:39:42', '2024-11-21 08:39:42'),
(137, 0, NULL, NULL, NULL, NULL, '01751644951', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 7821, '2024-12-04 21:04:16', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 14:52:50', '2024-12-04 14:59:16'),
(138, 1, 1, 'Sohag', 'sohag', NULL, '01737910932', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 47, NULL, NULL, '2025-03-01 12:10:59', '$2y$10$s0CKtewbMSiY8VI3zaHz2uiC2Rz3VaPYFggq5n65RsbRQMh2hhe/C', NULL, 2, NULL, NULL, NULL, '2025-03-01 06:10:59', '2025-03-01 06:10:59'),
(139, 0, NULL, 'Mohammed Azmayeen', NULL, 'ayazmohammed541@gmail.com', '01690265646', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-03-01 16:59:00', '$2y$10$Vi.tbG7KXwq7Wlvau0RxFu4eQx.D/qHK6IRx1HCVXqpaWZkJ1Bmbu', NULL, NULL, NULL, NULL, NULL, '2025-03-01 10:59:00', '2025-03-01 10:59:00'),
(140, 0, NULL, 'Fahmina Arshad Lisa', NULL, NULL, '01713037417', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-05-05 22:34:19', '$2y$10$qTaiOvnxtPjloJRCkVwgSOF.kQcjxwCszivU9E6i0tSYpxnS6n49W', NULL, NULL, NULL, NULL, NULL, '2025-05-05 16:34:19', '2025-05-05 16:34:19'),
(141, 0, NULL, 'Mark rayan', NULL, 'markrayan04@gmail.com', '01871057199', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3295, '2025-05-18 11:37:43', '$2y$10$risqxkVG7Tt18zsp/LO3Beb5fbUMyOXmgPoVWAisJORzqA3lX2TTO', NULL, NULL, NULL, NULL, NULL, '2025-05-16 22:15:07', '2025-05-18 05:32:43'),
(142, 2, 1, 'Masud Hossain', '01772329442', NULL, '01772329442', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-05-29 12:33:39', '$2y$10$I2qukrrvba4h1dH/zIKw8ebBH0hi7hYPYENMdv2Eh2S10zOmSrpQa', NULL, 2, NULL, NULL, NULL, '2025-05-29 06:33:39', '2025-05-29 06:33:39'),
(143, 0, NULL, NULL, NULL, NULL, '01615990994', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 5073, '2025-06-13 20:22:27', NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-13 14:16:49', '2025-06-13 14:17:27'),
(144, 0, NULL, 'Mohammad Ashikur Rahman Zahiri', NULL, 'ashikur199615@gmail.com', '01615990994', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-06-13 20:18:45', '$2y$10$CPT2ATgE.R1NF9F8AnXN0.ME7CXj1IJ6tkCGJDn0ztOvxxDTIxsrS', NULL, NULL, NULL, NULL, NULL, '2025-06-13 14:18:45', '2025-06-13 14:18:45'),
(145, 2, 1, 'Jahangir store', '01733732082', NULL, '01733732082', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-06-21 12:40:56', '$2y$10$LsN09wsROHLX7kdGuL4Q6eWmI4/pQraaBH2ca8PaNZIHwMizUNfbq', NULL, 2, NULL, NULL, NULL, '2025-06-21 06:40:56', '2025-06-21 06:40:56'),
(146, 0, NULL, 'Faiza IBRAHIM', NULL, 'faiza.aymii@gmail.com', '1701210689', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-06-30 00:14:48', '$2y$10$W2t.ftwaJDJ5B9zyGs7uBOZ4lQNoRdbkOjFv0q9No1i8Wlp77kfSC', NULL, NULL, NULL, NULL, NULL, '2025-06-29 18:14:48', '2025-06-29 18:14:48'),
(147, 0, NULL, 'edwrfdsv', NULL, NULL, '01751385652', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-08-31 12:25:27', '$2y$10$od5kiVCd7GKq8H6WDFj8d.J4RMcDijk2mwo76OtBJqYVbTTn8Dpq2', NULL, NULL, NULL, NULL, NULL, '2025-08-31 06:25:27', '2025-08-31 06:25:27'),
(148, 2, 1, 'Gweebarra Bakery Ind. Limited (Copper\'s Bakery)', '01729-076911', NULL, '01729-076911', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-09-01 16:07:43', '$2y$10$5GpSKAdWKecBtleZgd4PFe2EH6UcKCFBZV9cMMQaTn3Y.q38bPdru', NULL, 2, NULL, NULL, NULL, '2025-09-01 10:07:43', '2025-09-01 10:07:43'),
(149, 0, NULL, NULL, NULL, NULL, '01984546446', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 8444, '2025-09-05 14:49:31', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-05 08:44:07', '2025-09-05 08:44:31'),
(150, 0, NULL, NULL, NULL, NULL, '01730019213', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3373, '2025-09-06 20:06:53', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-06 14:01:12', '2025-09-06 14:01:53'),
(151, 2, 1, 'KUDOS', '01650-146568', NULL, '01973629502', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-09-10 11:27:06', '$2y$10$xb/r4umSTfA0Nk12hHt4SuIslXFoAibm9fAVEfMPWK4T4g029msiC', NULL, 2, NULL, NULL, NULL, '2025-09-10 05:27:06', '2026-05-26 07:13:07'),
(152, 0, NULL, 'Ahnaf Raisa', NULL, 'ahnafraisaarthi@gmail.com', '01912663811', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-10-01 16:42:59', '$2y$10$lflmuIZjuZIeADnPQxHYIeZ13soknNOYokmh.f8ClJgfsEZ7GEzB.', NULL, NULL, NULL, NULL, NULL, '2025-10-01 10:42:59', '2025-10-01 10:42:59'),
(153, 0, NULL, 'Nadem', NULL, NULL, '01865965222', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-10-09 17:25:52', '$2y$10$Afn3exLLxWHf6D4HcCfi4uPbdLKqmYqLqvYo1/npIdp3YObJMtwme', NULL, NULL, NULL, NULL, NULL, '2025-10-09 11:25:52', '2025-10-09 11:25:52'),
(154, 0, NULL, NULL, NULL, NULL, '+447862136924', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3967, '2025-10-23 11:07:28', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-23 05:02:28', '2025-10-23 05:02:28'),
(155, 2, 1, 'Biscuit and Bistro', '+8801632489500', NULL, '+8801632489500', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-11-03 10:19:18', '$2y$10$kBUqGKL2u07tdP0Hf4gJwOsuyTi/CvWehe6kNF7acGE7oqa3vuiVa', NULL, 2, NULL, NULL, NULL, '2025-11-03 04:19:18', '2025-11-03 04:19:18'),
(156, 2, 1, 'Kings Confectionary', '+880 1755-662973', NULL, '+880 1755-662973', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2025-11-12 12:21:17', '$2y$10$9D6o381qDpMSAuS237PwIOgaMJ85tBJ704JfNL3cf0KGiDmvifPQu', NULL, 2, NULL, NULL, NULL, '2025-11-12 06:21:17', '2025-11-12 06:21:17'),
(157, 2, 1, 'Omair', '01963452882', 'ahmed.deen26@gmail.com', '01963452882', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-01-04 16:02:56', '$2y$10$.t2FAmx7Cc1UhMk6d.AKYOfDe4gqtTGm2NuWFDZsWrwexRTcgwhvO', NULL, 2, NULL, NULL, NULL, '2026-01-04 10:02:56', '2026-01-04 10:02:56'),
(158, 0, NULL, NULL, NULL, NULL, '01842770031', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 7276, '2026-01-27 13:14:17', NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-27 07:08:30', '2026-01-27 07:09:17'),
(159, 0, NULL, NULL, NULL, NULL, '01708515200', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 7707, '2026-05-17 16:36:39', NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-17 10:31:30', '2026-05-17 10:31:39'),
(160, 0, NULL, 'Mr. Atik', NULL, NULL, '01964331828', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-05-25 20:14:54', '$2y$10$eEUHBfUjh0ZHpVhRuTQjJOY5Wzv6KdF1Q27IXyk5ZU/xMaJ0bkVc.', NULL, NULL, NULL, NULL, NULL, '2026-05-25 14:14:54', '2026-05-25 14:14:54'),
(161, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 7697, '2026-05-30 00:05:57', NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-29 18:00:57', '2026-05-29 18:00:57'),
(162, 0, NULL, 'Tariqul', NULL, 'tariquls.world@gmail.com', '01684235644', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-06-14 14:45:22', '$2y$10$/fjKrsgekYhx5x.IcbFZW.ws/HHSk9hxfhVtwbMktrVCJr2/Bonzu', NULL, NULL, NULL, NULL, NULL, '2026-06-14 08:45:22', '2026-06-14 08:45:22'),
(163, 2, 1, 'Green Lab', '01787436484', NULL, '01787436484', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-08-23 10:35:52', '$2y$10$xAIcjFvV8tJvTSTBxXNi/e4HI4OP0SVO3YG0inyG7vxRskpqEYISu', NULL, 2, NULL, NULL, NULL, '2026-08-23 04:35:52', '2026-08-23 04:35:52'),
(164, 2, 1, 'Kyoto - Mirpur 12', '01779579928', NULL, '01779579928', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-08-28 08:57:50', '$2y$10$Qx24mOifZFpGkx9EKTubkeAwjMkzypF6aJp5OGzFbQrRgP6jLSxEm', NULL, 2, NULL, 2, '2026-08-28 03:04:26', '2026-08-28 02:57:50', '2026-08-28 03:04:26'),
(165, 1, 1, 'Ovi', 'ovi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-09-05 14:15:19', '$2y$10$XU4rh2J837ZuGZjJ9xvIvOAsDuYPgAOnrGBq4B0.fCMHMgoYSz5Wq', NULL, 1, 2, 1, '2026-11-08 07:04:04', '2026-09-05 08:15:19', '2026-11-08 07:04:04'),
(166, 2, 1, 'Enamul Huq - GM, Bonton Foods Ltd.', '01618003700', NULL, '01618003700', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-09-21 13:14:11', '$2y$10$D7Om8/71wi3hLOSAb7XpVu/e7X1yaI.nGdVeOf9TAw31G5/t1y1GK', NULL, 2, NULL, NULL, NULL, '2026-09-21 07:14:11', '2026-09-21 07:14:11'),
(167, 2, 1, 'Mollika Snacks - Gulshan', '01623756790', NULL, '01623756790', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-10-08 13:09:05', '$2y$10$2bAExEuDPkbRN4G2EXYht.mxb4yME7mHkW1yCtXFjDDoMfkrYmDB6', NULL, 2, NULL, NULL, NULL, '2026-10-08 07:09:05', '2026-10-08 07:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `registration_no` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `coa_setup_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `company_id`, `coa_setup_id`, `code`, `name`, `contact_person`, `email`, `phone`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 207, 'PB', 'Prima Bakery', 'Manager', 'primabakery.bangladesh@gmail.com', '01738113386', '103, Al-Helal Club Road, Mendipur, Demra, Dhaka-1360', 1, 1, 1, 1, NULL, '2023-09-25 05:24:30', '2026-11-08 07:30:00'),
(3, 1, NULL, 'AFF', 'Ali Fine Foods', 'Manager', 'info@alifinefoods.com', '01844000103', '171, I/A, Tejgaon, Dhaka-1208', 1, 2, 2, 1, '2026-11-08 07:28:23', '2023-12-02 08:21:07', '2026-11-08 07:28:23'),
(4, 1, 81, '20104', 'RFL Plastic Ltd', NULL, NULL, NULL, NULL, 1, 133, NULL, 2, '2024-12-04 09:48:29', '2024-10-27 06:53:51', '2024-12-04 09:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_payments`
--

CREATE TABLE `vendor_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `lifting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_no` varchar(255) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `approved` tinyint(4) NOT NULL DEFAULT 0,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_payments`
--

INSERT INTO `vendor_payments` (`id`, `company_id`, `vendor_id`, `lifting_id`, `payment_no`, `payment_date`, `payment_type`, `type`, `amount`, `remarks`, `approved`, `approved_by`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'STP2611000001', '2026-11-08', 'cash', 'payment', 126.65, 'Cash Purchase', 0, NULL, 1, NULL, NULL, NULL, '2026-11-08 07:45:03', '2026-11-08 07:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_payment_data`
--

CREATE TABLE `vendor_payment_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_payment_id` bigint(20) UNSIGNED NOT NULL,
  `lifting_id` bigint(20) UNSIGNED NOT NULL,
  `paid` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_payment_data`
--

INSERT INTO `vendor_payment_data` (`id`, `vendor_payment_id`, `lifting_id`, `paid`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 126.65, '2026-11-08 07:45:03', '2026-11-08 07:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `view_client_returns`
--

CREATE TABLE `view_client_returns` (
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_category_name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_client_sales`
--

CREATE TABLE `view_client_sales` (
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_category_name` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_phone` varchar(255) DEFAULT NULL,
  `client_code` bigint(20) DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `territory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `territory_name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `amount` decimal(40,2) DEFAULT NULL,
  `total_paid` decimal(16,2) DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_collectionable_sales`
--

CREATE TABLE `view_collectionable_sales` (
  `id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `total_amount` decimal(16,2) DEFAULT NULL,
  `total_paid` decimal(16,2) DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `returned_amount` decimal(38,2) DEFAULT NULL,
  `collectionable_amount` decimal(41,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_collection_history`
--

CREATE TABLE `view_collection_history` (
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `collection_type` varchar(255) DEFAULT NULL,
  `payment_no` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_category_name` varchar(255) DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `territory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `territory_name` varchar(255) DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_liftings`
--

CREATE TABLE `view_liftings` (
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `sale_price` decimal(16,2) DEFAULT NULL,
  `qty` decimal(16,2) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_lifting_and_returns`
--

CREATE TABLE `view_lifting_and_returns` (
  `id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lifting_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` decimal(38,2) DEFAULT NULL,
  `discount` decimal(38,2) DEFAULT NULL,
  `payable_amount` decimal(39,2) DEFAULT NULL,
  `return_amount` decimal(48,2) DEFAULT NULL,
  `total_paid` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_lifting_returns`
--

CREATE TABLE `view_lifting_returns` (
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty` decimal(16,2) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_online_sales`
--

CREATE TABLE `view_online_sales` (
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `qty` decimal(16,2) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_product_returns`
--

CREATE TABLE `view_product_returns` (
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `qty` decimal(16,2) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_product_sales`
--

CREATE TABLE `view_product_sales` (
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `qty` decimal(16,2) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_sales`
--

CREATE TABLE `view_sales` (
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty` decimal(16,2) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_sales_history`
--

CREATE TABLE `view_sales_history` (
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sales_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ctn_size` float DEFAULT NULL,
  `product_vendor_name` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `rate` decimal(16,2) DEFAULT NULL,
  `qty` decimal(16,2) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_category_name` varchar(255) DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `territory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `territory_name` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_sales_returns`
--

CREATE TABLE `view_sales_returns` (
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `qty` decimal(17,2) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_transfers`
--

CREATE TABLE `view_transfers` (
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty` decimal(16,2) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `host_id` bigint(20) UNSIGNED DEFAULT NULL,
  `destination_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view_trial_balance`
--

CREATE TABLE `view_trial_balance` (
  `voucher_type` varchar(20) DEFAULT NULL,
  `voucher_no` varchar(255) DEFAULT NULL,
  `voucher_date` date DEFAULT NULL,
  `coa_setup_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coa_head_code` bigint(20) DEFAULT NULL,
  `debit_amount` decimal(16,2) DEFAULT NULL,
  `credit_amount` decimal(16,2) DEFAULT NULL,
  `transaction` tinyint(4) DEFAULT NULL,
  `general` tinyint(4) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `head_type` varchar(255) DEFAULT NULL,
  `head_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `access_logs`
--
ALTER TABLE `access_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_transaction_auto_id_foreign` (`account_transaction_auto_id`);

--
-- Indexes for table `account_transaction_autos`
--
ALTER TABLE `account_transaction_autos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_collections`
--
ALTER TABLE `bulk_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_collection_lists`
--
ALTER TABLE `bulk_collection_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bulk_collection_lists_bulk_collection_id_foreign` (`bulk_collection_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_vendors`
--
ALTER TABLE `category_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chain_clients`
--
ALTER TABLE `chain_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_categories`
--
ALTER TABLE `client_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_messages`
--
ALTER TABLE `client_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_prices`
--
ALTER TABLE `client_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_prices_client_id_foreign` (`client_id`),
  ADD KEY `client_prices_product_id_foreign` (`product_id`);

--
-- Indexes for table `coa_setups`
--
ALTER TABLE `coa_setups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collection_data`
--
ALTER TABLE `collection_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection_data_collection_id_foreign` (`collection_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deliveries_serial_no_unique` (`serial_no`);

--
-- Indexes for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_lists`
--
ALTER TABLE `delivery_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_lists_delivery_id_foreign` (`delivery_id`);

--
-- Indexes for table `details_cards`
--
ALTER TABLE `details_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_members_group_id_foreign` (`group_id`);

--
-- Indexes for table `group_sales_targets`
--
ALTER TABLE `group_sales_targets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_sales_targets_group_id_foreign` (`group_id`);

--
-- Indexes for table `group_sales_target_categories`
--
ALTER TABLE `group_sales_target_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_sales_target_categories_group_sales_target_id_foreign` (`group_sales_target_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `liftings`
--
ALTER TABLE `liftings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `liftings_company_id_foreign` (`company_id`);

--
-- Indexes for table `lifting_documents`
--
ALTER TABLE `lifting_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lifting_documents_lifting_id_foreign` (`lifting_id`);

--
-- Indexes for table `lifting_products`
--
ALTER TABLE `lifting_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lifting_products_lifting_id_foreign` (`lifting_id`);

--
-- Indexes for table `lifting_returns`
--
ALTER TABLE `lifting_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lifting_return_lists`
--
ALTER TABLE `lifting_return_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lifting_return_lists_lifting_return_id_foreign` (`lifting_return_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `online_deliveries`
--
ALTER TABLE `online_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `online_deliveries_serial_no_unique` (`serial_no`);

--
-- Indexes for table `online_delivery_lists`
--
ALTER TABLE `online_delivery_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_delivery_lists_online_delivery_id_foreign` (`online_delivery_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_name_unique` (`name`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_prices_product_id_foreign` (`product_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_lists`
--
ALTER TABLE `sales_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_lists_sales_id_foreign` (`sales_id`);

--
-- Indexes for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_lists`
--
ALTER TABLE `sales_return_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_return_lists_sales_return_id_foreign` (`sales_return_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `showcase_items`
--
ALTER TABLE `showcase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_works`
--
ALTER TABLE `social_works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_food_items`
--
ALTER TABLE `special_food_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `static_site_items`
--
ALTER TABLE `static_site_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_email_unique` (`email`);

--
-- Indexes for table `territories`
--
ALTER TABLE `territories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_transfer_no_unique` (`transfer_no`);

--
-- Indexes for table `transfer_products`
--
ALTER TABLE `transfer_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_products_transfer_id_foreign` (`transfer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicles_company_id_foreign` (`company_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_payments`
--
ALTER TABLE `vendor_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_payment_data`
--
ALTER TABLE `vendor_payment_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_payment_data_vendor_payment_id_foreign` (`vendor_payment_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `access_logs`
--
ALTER TABLE `access_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transaction_autos`
--
ALTER TABLE `account_transaction_autos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bulk_collections`
--
ALTER TABLE `bulk_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bulk_collection_lists`
--
ALTER TABLE `bulk_collection_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `category_vendors`
--
ALTER TABLE `category_vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `chain_clients`
--
ALTER TABLE `chain_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3083;

--
-- AUTO_INCREMENT for table `client_categories`
--
ALTER TABLE `client_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client_messages`
--
ALTER TABLE `client_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `client_prices`
--
ALTER TABLE `client_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=895;

--
-- AUTO_INCREMENT for table `coa_setups`
--
ALTER TABLE `coa_setups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection_data`
--
ALTER TABLE `collection_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_lists`
--
ALTER TABLE `delivery_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `details_cards`
--
ALTER TABLE `details_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `group_sales_targets`
--
ALTER TABLE `group_sales_targets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `group_sales_target_categories`
--
ALTER TABLE `group_sales_target_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `liftings`
--
ALTER TABLE `liftings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lifting_documents`
--
ALTER TABLE `lifting_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lifting_products`
--
ALTER TABLE `lifting_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lifting_returns`
--
ALTER TABLE `lifting_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lifting_return_lists`
--
ALTER TABLE `lifting_return_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `online_deliveries`
--
ALTER TABLE `online_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `online_delivery_lists`
--
ALTER TABLE `online_delivery_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_lists`
--
ALTER TABLE `sales_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_returns`
--
ALTER TABLE `sales_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_return_lists`
--
ALTER TABLE `sales_return_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `showcase_items`
--
ALTER TABLE `showcase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `social_works`
--
ALTER TABLE `social_works`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `special_food_items`
--
ALTER TABLE `special_food_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `static_site_items`
--
ALTER TABLE `static_site_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `territories`
--
ALTER TABLE `territories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_products`
--
ALTER TABLE `transfer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor_payments`
--
ALTER TABLE `vendor_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_payment_data`
--
ALTER TABLE `vendor_payment_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
