-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 28, 2020 at 03:29 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
--
-- Database: `nodeAPI`
--
-- --------------------------------------------------------
--
-- Table structure for table `akses_token`
--
CREATE TABLE `akses_token` (
    `id_akses_token` int(11) NOT NULL,
    `id_user` int(11) NOT NULL,
    `acces_token` text NOT NULL,
    `ip_address` int(20) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- --------------------------------------------------------
--
-- Table structure for table `krs`
--
CREATE TABLE `krs` (
    `id_krs` int(11) NOT NULL,
    `tanggal_krs` date NOT NULL,
    `id_mahasiswa` int(11) NOT NULL,
    `id_matakuliah` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
-- Dumping data for table `krs`
--
INSERT INTO `krs` (
        `id_krs`,
        `tanggal_krs`,
        `id_mahasiswa`,
        `id_matakuliah`
    )
VALUES (1, '2020-09-27', 18, 1),
    (2, '2020-09-26', 20, 4),
    (3, '2020-09-26', 21, 3),
    (4, '2020-09-14', 19, 2);
-- --------------------------------------------------------
--
-- Table structure for table `mahasiswa`
--
CREATE TABLE `mahasiswa` (
    `id_mahasiswa` int(11) NOT NULL,
    `nim` int(11) DEFAULT NULL,
    `nama` varchar(50) DEFAULT NULL,
    `jurusan` varchar(50) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
-- Dumping data for table `mahasiswa`
--
INSERT INTO `mahasiswa` (`id_mahasiswa`, `nim`, `nama`, `jurusan`)
VALUES (18, 1931710069, 'Ali', 'TI'),
    (19, 1931710061, 'Ryan', 'AN'),
    (20, 1931710060, 'Azmi', 'Electro'),
    (21, 1931710054, 'Ichi', 'JTD');
-- --------------------------------------------------------
--
-- Table structure for table `matakuliah`
--
CREATE TABLE `matakuliah` (
    `id_matakuliah` int(11) NOT NULL,
    `matakuliah` varchar(50) DEFAULT NULL,
    `sks` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
-- Dumping data for table `matakuliah`
--
INSERT INTO `matakuliah` (`id_matakuliah`, `matakuliah`, `sks`)
VALUES (1, 'Basis Data', 3),
    (2, 'Web lanjut', 5),
    (3, 'Sistem Informasi', 7),
    (4, 'Dasar Pemrograman', 5);
-- --------------------------------------------------------
--
-- Table structure for table `user`
--
CREATE TABLE `user` (
    `id` int(11) NOT NULL,
    `username` varchar(50) NOT NULL,
    `email` varchar(50) NOT NULL,
    `password` varchar(200) NOT NULL,
    `role` int(11) NOT NULL,
    `tanggal_daftar` date NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
-- Dumping data for table `user`
--
INSERT INTO `user` (
        `id`,
        `username`,
        `email`,
        `password`,
        `role`,
        `tanggal_daftar`
    )
VALUES (
        1,
        'ali',
        'ali@gmail.com',
        '123',
        2,
        '2020-09-28'
    );
--
-- Indexes for dumped tables
--
--
-- Indexes for table `akses_token`
--
ALTER TABLE `akses_token`
ADD PRIMARY KEY (`id_akses_token`),
    ADD KEY `id_user` (`id_user`);
--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
ADD PRIMARY KEY (`id_krs`),
    ADD KEY `id_mahasiswa` (`id_mahasiswa`),
    ADD KEY `id_matakuliah` (`id_matakuliah`);
--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
ADD PRIMARY KEY (`id_mahasiswa`);
--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
ADD PRIMARY KEY (`id_matakuliah`);
--
-- Indexes for table `user`
--
ALTER TABLE `user`
ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `akses_token`
--
ALTER TABLE `akses_token`
MODIFY `id_akses_token` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
MODIFY `id_krs` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5;
--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 22;
--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
MODIFY `id_matakuliah` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;
--
-- Constraints for dumped tables
--
--
-- Constraints for table `akses_token`
--
ALTER TABLE `akses_token`
ADD CONSTRAINT `akses_token_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliah` (`id_matakuliah`) ON DELETE CASCADE ON UPDATE CASCADE;