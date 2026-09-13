# Memanggil library dplyr untuk mengolah data
library(dplyr)

# Memanggil dataset iris yang sudah tersedia di R
data(iris)

# Menampilkan seluruh data iris
iris

# Menampilkan kolom Sepal.Length
iris$Sepal.Length

# Melihat struktur data iris
str(iris)

# Melihat tipe data dari setiap variabel
sapply(iris, class)

#Menambah variabel turunan dengan
#jika nilai > 3 masuk ke dalam kategori nilai "Besar"
#dan jika nilai < 3 masuk ke dalam kategori nilai "Kecil"
iris <- iris %>%
  mutate(
    turunan = ifelse(Sepal.Width > 3, "Besar", "Kecil")
  )

#alternatif (variabel turunan) dengan fungsi with()
iris$turunan_std <- with(iris, ifelse(Sepal.Width > 3, "Besar", "Kecil"))

head(iris)

#Mengubah nama variabel turunan menjadi sepal
iris <- iris %>%
  rename(sepal = turunan)

#alternatif mengubah nama variabel turunan_std menjadi sepall
names(iris)[names(iris) == "turunan_std"] <- "sepall"

head(iris)

#ambil data dengan sepal bernilai besar dari spesies virginica
vrgnc <- iris %>%
  filter (
    sepal == "Besar", Species == "virginica"
  )
vrgnc

#cek jumlah species dalam data
table(iris$Species)
length(unique(iris$Species))

#pecah data iris menjadi 3 data frame dengan tiap  data frame khusus untuk species tertentu
setosa <- iris[iris$Species == "setosa",]
versicolor <- iris[iris$Species == "versicolor",]
virginica <- iris[iris$Species == "virginica",]

#dari setiap data frame species, urutkan data berdasarkan sepal.width
setosa <- setosa[order(setosa$Sepal.Width),]
versicolor <- versicolor[order(versicolor$Sepal.Width),]
virginica <- virginica[order(virginica$Sepal.Width),]

head(setosa)
head(versicolor)
head(virginica)