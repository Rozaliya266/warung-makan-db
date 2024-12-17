-- Membuat Database
CREATE DATABASE IF NOT EXISTS WarungMakanBakmi;
USE WarungMakanBakmi;

-- Tabel Menu
CREATE TABLE Menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nama_menu VARCHAR(255) NOT NULL,
    harga VARCHAR(50) NOT NULL,
    kategori VARCHAR(50),
    stok INT NOT NULL
);

-- Tabel Pelanggan
CREATE TABLE Pelanggan (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama_pelanggan VARCHAR(255) NOT NULL,
    nomor_telepon VARCHAR(15)
);

-- Tabel Pegawai
CREATE TABLE Pegawai (
    id_pegawai INT PRIMARY KEY AUTO_INCREMENT,
    nama_pegawai VARCHAR(255) NOT NULL,
    nomor_telepon VARCHAR(15),
    id_cabang INT NOT NULL
);

-- Tabel Cabang
CREATE TABLE Cabang (
    id_cabang INT PRIMARY KEY AUTO_INCREMENT,
    nama_cabang VARCHAR(255) NOT NULL,
    alamat_cabang VARCHAR(255) NOT NULL,
    nomor_telepon VARCHAR(15)
);

-- Tabel Supplier
CREATE TABLE Supplier (
    id_supplier INT PRIMARY KEY AUTO_INCREMENT,
    nama_supplier VARCHAR(255) NOT NULL,
    nomor_telepon VARCHAR(15)
);

-- Tabel Bahan Baku
CREATE TABLE Bahan_Baku (
    id_bahan_baku INT PRIMARY KEY AUTO_INCREMENT,
    tanggal_kadaluarsa TIME NOT NULL,
    nama_bahan_baku VARCHAR(255) NOT NULL,
    id_suplier INT NOT NULL,
    id_cabang INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_suplier) REFERENCES Supplier(id_supplier),
    FOREIGN KEY (id_cabang) REFERENCES Cabang(id_cabang)
);

-- Tabel Transaksi
CREATE TABLE Transaksi (
    id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT NOT NULL,
    id_pegawai INT NOT NULL,
    id_cabang INT NOT NULL,
    total_harga INT NOT NULL,
    metode_pembayaran VARCHAR(50),
    waktu_transaksi TIME NOT NULL,
    status_pembayaran BOOLEAN,
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_pegawai) REFERENCES Pegawai(id_pegawai),
    FOREIGN KEY (id_cabang) REFERENCES Cabang(id_cabang)
);

-- Tabel Produk
CREATE TABLE Produk (
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    id_menu INT NOT NULL,
    id_transaksi INT NOT NULL,
    jumlah INT NOT NULL,
    subtotal INT NOT NULL,
    FOREIGN KEY (id_menu) REFERENCES Menu(id_menu),
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi)
);

-- Tabel Memuat (Detail Transaksi)
CREATE TABLE Memuat (
    id_detail_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    jumlah_pesanan INT NOT NULL,
    catatan_pesanan VARCHAR(255),
    id_transaksi INT NOT NULL,
    id_produk INT NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi),
    FOREIGN KEY (id_produk) REFERENCES Produk(id_produk)
);

-- Tabel Pegawai - Tambahkan Foreign Key ke Cabang
ALTER TABLE Pegawai
ADD FOREIGN KEY (id_cabang) REFERENCES Cabang(id_cabang);