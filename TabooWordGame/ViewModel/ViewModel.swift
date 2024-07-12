//
//  TabooWordsViewModel.swift
//  TabooWordGame
//
//  Created by Batu on 23.04.2024.
//
import Foundation

class TabooWordsViewModel {
    
    var score: Int = 0
    var passAttempts = 3
    
    private let tabooWords: [TabooWord] = [
            TabooWord(goalWord: "Köpek", tabooWords: ["Kedi", "Hav", "Kuyruk", "Oyuncak", "Mama"]),
            TabooWord(goalWord: "Elma", tabooWords: ["Meyve", "Kırmızı", "Yeşil", "Ağaç", "Tatlı"]),
            TabooWord(goalWord: "Deniz", tabooWords: ["Su", "Kum", "Dalga", "Plaj", "Yüzmek"]),
            TabooWord(goalWord: "Kitap", tabooWords: ["Sayfa", "Okumak", "Yazar", "Roman", "Kütüphane"]),
            TabooWord(goalWord: "Kuş", tabooWords: ["Kanat", "Uçmak", "Gaga", "Yuva", "Ötmek"]),
            TabooWord(goalWord: "Çiçek", tabooWords: ["Renk", "Koku", "Yaprak", "Bahçe", "Papatya"]),
            TabooWord(goalWord: "Masa", tabooWords: ["Sandalye", "Yemek", "Mobilya", "Oturmak", "Ahşap"]),
            TabooWord(goalWord: "Telefon", tabooWords: ["Aramak", "Mesaj", "Konuşmak", "Akıllı", "Ekran"]),
            TabooWord(goalWord: "Saat", tabooWords: ["Zaman", "Dakika", "Kronometre", "Kol", "Alarm"]),
            TabooWord(goalWord: "Müzik", tabooWords: ["Şarkı", "Nota", "Enstrüman", "Melodi", "Dinlemek"]),
            TabooWord(goalWord: "Film", tabooWords: ["Sinema", "Oyuncu", "Yönetmen", "Sahne", "Ekran"]),
            TabooWord(goalWord: "Uçak", tabooWords: ["Pilot", "Havalimanı", "Kanat", "Uçuş", "Yolcu"]),
            TabooWord(goalWord: "Ayakkabı", tabooWords: ["Ayak", "Koşmak", "Giyinmek", "Topuk", "Deri"]),
            TabooWord(goalWord: "Bisiklet", tabooWords: ["Pedal", "Tekerlek", "Zil", "Yol", "Kask"]),
            TabooWord(goalWord: "Kahve", tabooWords: ["Bardak", "Kafein", "İçmek", "Sabah", "Tat"]),
            TabooWord(goalWord: "Televizyon", tabooWords: ["Kanal", "Dizi", "Film", "Ekran", "Uzaktan Kumanda"]),
            TabooWord(goalWord: "Çikolata", tabooWords: ["Tatlı", "Kakao", "Yemek", "Şeker", "Bar"]),
            TabooWord(goalWord: "Domates", tabooWords: ["Kırmızı", "Sebze", "Salata", "Sos", "Bahçe"]),
            TabooWord(goalWord: "Köprü", tabooWords: ["Nehir", "Yol", "Trafik", "Geçmek", "Bağlamak"]),
            TabooWord(goalWord: "Oda", tabooWords: ["Duvar", "Kapı", "Mobilya", "Pencere", "Mekan"]),
            TabooWord(goalWord: "Sinema", tabooWords: ["Film", "Ekran", "Oyuncu", "Koltuk", "Yönetmen"]),
            TabooWord(goalWord: "Bisiklet", tabooWords: ["Tekerlek", "Pedal", "Yol", "Kask", "Zil"]),
            TabooWord(goalWord: "Kedi", tabooWords: ["Tüy", "Miyav", "Pat", "Kum", "Mama"]),
            TabooWord(goalWord: "Gözlük", tabooWords: ["Cam", "Görmek", "Burun", "Yüz", "Çerçeve"]),
            TabooWord(goalWord: "Rüzgar", tabooWords: ["Esinti", "Soğuk", "Hava", "Kuvvetli", "Dalga"]),
            TabooWord(goalWord: "Patates", tabooWords: ["Kızartma", "Sebze", "Yemek", "Cips", "Sarı"]),
            TabooWord(goalWord: "Kapı", tabooWords: ["Açmak", "Kapatmak", "Anahtar", "Giriş", "Kol"]),
            TabooWord(goalWord: "Sandalye", tabooWords: ["Oturmak", "Masa", "Ahşap", "Mobilya", "Ayak"]),
            TabooWord(goalWord: "Çay", tabooWords: ["İçmek", "Bardak", "Kupa", "Demlemek", "Sıcak"]),
            TabooWord(goalWord: "Çanta", tabooWords: ["Okul", "Eşya", "Sırt", "Taşımak", "Deri"]),
            TabooWord(goalWord: "Pasta", tabooWords: ["Doğum Günü", "Yemek", "Tatlı", "Krema", "Dilim"]),
            TabooWord(goalWord: "Balık", tabooWords: ["Deniz", "Su", "Yüzmek", "Yemek", "Yunus"]),
            TabooWord(goalWord: "Karpuz", tabooWords: ["Meyve", "Yaz", "Tatlı", "Kırmızı", "Çekirdek"]),
            TabooWord(goalWord: "Aslan", tabooWords: ["Hayvan", "Orman", "Yele", "Kükreme", "Kedi"]),
            TabooWord(goalWord: "Tavuk", tabooWords: ["Yumurta", "Civciv", "Et", "Kanat", "Horoz"]),
            TabooWord(goalWord: "Gitar", tabooWords: ["Müzik", "Çalmak", "Tel", "Enstrüman", "Nota"]),
            TabooWord(goalWord: "Güneş", tabooWords: ["Işık", "Sıcak", "Gökyüzü", "Gündüz", "Yıldız"]),
            TabooWord(goalWord: "Kumanda", tabooWords: ["Televizyon", "Kontrol", "Tuş", "Pil", "Kanal"]),
            TabooWord(goalWord: "Mektup", tabooWords: ["Zarf", "Posta", "Yazmak", "Göndermek", "Adres"]),
            TabooWord(goalWord: "Şapka", tabooWords: ["Kafa", "Giyinmek", "Yaz", "Gölge", "Moda"]),
            TabooWord(goalWord: "Kalem", tabooWords: ["Yazmak", "Kurşun", "Kağıt", "Silgi", "Renk"]),
            TabooWord(goalWord: "Çanta", tabooWords: ["Okul", "Eşya", "Sırt", "Taşımak", "Deri"]),
            TabooWord(goalWord: "Anahtar", tabooWords: ["Kapı", "Açmak", "Kilitlemek", "Metal", "Daire"]),
            TabooWord(goalWord: "Bebek", tabooWords: ["Ağlamak", "Kundak", "Çocuk", "Uyumak", "Süt"]),
            TabooWord(goalWord: "Oyun", tabooWords: ["Eğlence", "Kazanmak", "Kaybetmek", "Kurallar", "Takım"]),
            TabooWord(goalWord: "Kum", tabooWords: ["Plaj", "Sarı", "Çöl", "Deniz", "Kumdan Kale"]),
            TabooWord(goalWord: "Para", tabooWords: ["Banknot", "Madeni", "Cüzdan", "Zengin", "Harcama"]),
            TabooWord(goalWord: "Şemsiye", tabooWords: ["Yağmur", "Açmak", "Kapamak", "Gölge", "Rüzgar"]),
            TabooWord(goalWord: "Havlu", tabooWords: ["Banyo", "Kurulamak", "Yumuşak", "Bez", "Pamuk"]),
            TabooWord(goalWord: "Takım Elbise", tabooWords: ["Ceket", "Pantolon", "Gömlek", "Kravatsız", "Kumaş"]),
            TabooWord(goalWord: "Orman", tabooWords: ["Ağaç", "Yeşil", "Doğa", "Yürüyüş", "Hayvan"]),
            TabooWord(goalWord: "Karpuz", tabooWords: ["Meyve", "Kırmızı", "Yaz", "Tatlı", "Çekirdek"]),
            TabooWord(goalWord: "Bebek", tabooWords: ["Ağlamak", "Kundak", "Çocuk", "Uyumak", "Süt"]),
            TabooWord(goalWord: "Gözlük", tabooWords: ["Cam", "Görmek", "Burun", "Yüz", "Çerçeve"]),
            TabooWord(goalWord: "Martı", tabooWords: ["Deniz", "Kuş", "Uçmak", "Beyaz", "Gaga"]),
            TabooWord(goalWord: "Bardak", tabooWords: ["İçmek", "Su", "Çay", "Kupa", "Cam"]),
            TabooWord(goalWord: "Meyve", tabooWords: ["Elma", "Armut", "Tatlı", "Ağaç", "Yemek"]),
            TabooWord(goalWord: "Kelebek", tabooWords: ["Kanat", "Uçmak", "Renk", "Çiçek", "Tırtıl"]),
            TabooWord(goalWord: "Göz", tabooWords: ["Görmek", "Renk", "Işık", "Kirpik", "Lens"]),
            TabooWord(goalWord: "Televizyon", tabooWords: ["Ekran", "Kanal", "Dizi", "Film", "Kumanda"]),
            TabooWord(goalWord: "Deniz", tabooWords: ["Mavi", "Su", "Yüzmek", "Kum", "Tekne"]),
            TabooWord(goalWord: "Kapı", tabooWords: ["Ev", "Açmak", "Kapatmak", "Anahtar", "Zil"]),
            TabooWord(goalWord: "Rüzgar", tabooWords: ["Esinti", "Soğuk", "Hava", "Kuvvetli", "Dalga"]),
            TabooWord(goalWord: "Elbise", tabooWords: ["Kıyafet", "Giyinmek", "Kadın", "Moda", "Renk"]),
            TabooWord(goalWord: "Çiçek", tabooWords: ["Bahçe", "Renk", "Koku", "Tohum", "Güzel"]),
            TabooWord(goalWord: "Futbol", tabooWords: ["Top", "Saha", "Gol", "Kale", "Maç"]),
            TabooWord(goalWord: "Hastane", tabooWords: ["Doktor", "Hemşire", "Hasta", "Muayene", "Ameliyat"]),
            TabooWord(goalWord: "Tiyatro", tabooWords: ["Oyun", "Sahne", "Aktör", "Seyirci", "Perde"]),
            TabooWord(goalWord: "Kamera", tabooWords: ["Fotoğraf", "Video", "Çekim", "Lens", "Tripod"]),
            TabooWord(goalWord: "Buzdolabı", tabooWords: ["Soğutmak", "Yiyecek", "Buz", "Kapı", "Elektrik"]),
            TabooWord(goalWord: "Çaydanlık", tabooWords: ["Çay", "Su", "Kaynamak", "Demlik", "Kapağı"]),
            TabooWord(goalWord: "Sabun", tabooWords: ["Temizlik", "Köpük", "El", "Duş", "Kokulu"]),
            TabooWord(goalWord: "Sokak", tabooWords: ["Yol", "Ev", "Araç", "Yaya", "Gece"]),
            TabooWord(goalWord: "Tepe", tabooWords: ["Yüksek", "Dağ", "Tırmanmak", "Manzara", "Yeşil"]),
            TabooWord(goalWord: "Vazo", tabooWords: ["Çiçek", "Seramik", "Dekorasyon", "Su", "Masa"]),
            TabooWord(goalWord: "Yelkenli", tabooWords: ["Deniz", "Rüzgar", "Yelken", "Tekne", "Yarış"]),
            TabooWord(goalWord: "Yemek", tabooWords: ["Pişirmek", "Tat", "Yemek", "Restoran", "Mutfak"]),
            TabooWord(goalWord: "Yolcu", tabooWords: ["Seyahat", "Uçak", "Otobüs", "Tren", "Bagaj"]),
            TabooWord(goalWord: "Zürafa", tabooWords: ["Hayvan", "Uzun Boyun", "Afrika", "Yemek", "Sarışın"]),
            TabooWord(goalWord: "Zeytin", tabooWords: ["Yeşil", "Siyah", "Ağaç", "Ege", "Yağ"]),
            TabooWord(goalWord: "Yunus", tabooWords: ["Deniz", "Balık", "Mavi", "Şov", "Akvaryum"]),
            TabooWord(goalWord: "Kahve", tabooWords: ["Bardak", "Kafein", "İçmek", "Sabah", "Tat"]),
            TabooWord(goalWord: "Tavşan", tabooWords: ["Kulak", "Havuç", "Sıçramak", "Post", "Koşmak"]),
            TabooWord(goalWord: "Çanta", tabooWords: ["Okul", "Eşya", "Sırt", "Taşımak", "Deri"]),
            TabooWord(goalWord: "Saat", tabooWords: ["Zaman", "Dakika", "Kronometre", "Kol", "Alarm"]),
            TabooWord(goalWord: "Zaman", tabooWords: ["Saat", "An", "Dakika", "Geçmek", "Hız"]),
            TabooWord(goalWord: "Dakika", tabooWords: ["Saat", "Zaman", "Saniye", "Ölçmek", "Saat"]),
            TabooWord(goalWord: "Kronometre", tabooWords: ["Saat", "Zaman", "Ölçmek", "Yarış", "Spor"]),
            TabooWord(goalWord: "Kol", tabooWords: ["Saat", "Vücut", "El", "Bilek", "Omuz"]),
            TabooWord(goalWord: "Alarm", tabooWords: ["Saat", "Zil", "Uyandırmak", "Gün", "İş"]),
            TabooWord(goalWord: "Pilot", tabooWords: ["Uçak", "Gökyüzü", "Kokpit", "Uçuş", "Hava"]),
            TabooWord(goalWord: "Havalimanı", tabooWords: ["Uçak", "Yolcu", "Terminal", "Uçuş", "Bagaj"]),
            TabooWord(goalWord: "Kanat", tabooWords: ["Uçak", "Kuş", "Uçuş", "Yolcu", "Motor"]),
            TabooWord(goalWord: "Uçuş", tabooWords: ["Uçak", "Hava", "Yolcu", "Seyahat", "Pilot"]),
            TabooWord(goalWord: "Yolcu", tabooWords: ["Uçak", "Tren", "Otobüs", "Seyahat", "Bilet"]),
            TabooWord(goalWord: "Ayak", tabooWords: ["Ayakkabı", "Parmak", "Yürümek", "Spor", "Koku"]),
            TabooWord(goalWord: "Koşmak", tabooWords: ["Spor", "Hızlı", "Yarış", "Egzersiz", "Park"]),
            TabooWord(goalWord: "Giyinmek", tabooWords: ["Kıyafet", "Elbise", "Değişmek", "Moda", "Gardırop"]),
            TabooWord(goalWord: "Topuk", tabooWords: ["Ayakkabı", "Ayak", "Yüksek", "Kadın", "Çizme"]),
            TabooWord(goalWord: "Deri", tabooWords: ["Ayakkabı", "Hayvan", "Cilt", "Giysi", "Mobilya"]),
            TabooWord(goalWord: "Bisiklet", tabooWords: ["Pedal", "Tekerlek", "Zil", "Yol", "Kask"]),
            TabooWord(goalWord: "Pedal", tabooWords: ["Bisiklet", "Ayak", "Hız", "Tekerlek", "Yol"]),
            TabooWord(goalWord: "Tekerlek", tabooWords: ["Bisiklet", "Araba", "Yol", "Pedal", "Lastik"]),
            TabooWord(goalWord: "Zil", tabooWords: ["Bisiklet", "Çan", "Ses", "Alarm", "Çalmak"]),
            TabooWord(goalWord: "Yol", tabooWords: ["Bisiklet", "Trafik", "Yürümek", "Araba", "Seyahat"]),
            TabooWord(goalWord: "Kitap", tabooWords: ["Sayfa", "Okumak", "Yazar", "Roman", "Kütüphane"]),
            TabooWord(goalWord: "Sayfa", tabooWords: ["Kitap", "Kağıt", "Yazı", "Okumak", "Kalem"]),
            TabooWord(goalWord: "Okumak", tabooWords: ["Kitap", "Göz", "Kelime", "Yazı", "Eğitim"]),
            TabooWord(goalWord: "Yazar", tabooWords: ["Kitap", "Roman", "Yazmak", "Edebiyat", "İsim"]),
            TabooWord(goalWord: "Roman", tabooWords: ["Kitap", "Hikaye", "Yazar", "Edebiyat", "Sayfa"]),
            TabooWord(goalWord: "Kütüphane", tabooWords: ["Kitap", "Okumak", "Sessiz", "Raf", "Bilgi"]),
            TabooWord(goalWord: "Kanat", tabooWords: ["Kuş", "Uçmak", "Tüy", "Hava", "Güvercin"]),
            TabooWord(goalWord: "Uçmak", tabooWords: ["Kuş", "Kanat", "Hava", "Yükseklik", "Pilot"]),
            TabooWord(goalWord: "Gaga", tabooWords: ["Kuş", "Yemek", "Sert", "Uçmak", "Ötmek"]),
            TabooWord(goalWord: "Yuva", tabooWords: ["Kuş", "Ev", "İnşa", "Yumurta", "Aile"]),
            TabooWord(goalWord: "Ötmek", tabooWords: ["Kuş", "Ses", "Sabah", "Şarkı", "Kanarya"]),
            TabooWord(goalWord: "Tatlı", tabooWords: ["Şeker", "Yemek", "Pasta", "Tat", "Meyve"]),
            TabooWord(goalWord: "Kakao", tabooWords: ["Çikolata", "Tropik", "Fasulye", "Bitter", "Toz"]),
            TabooWord(goalWord: "Yemek", tabooWords: ["Tat", "Lezzet", "Mutfak", "Besin", "Öğün"]),
            TabooWord(goalWord: "Şeker", tabooWords: ["Tatlı", "Yemek", "Tat", "Tatlandırıcı", "Şurup"]),
            TabooWord(goalWord: "Bar", tabooWords: ["Çikolata", "Şeker", "Atıştırmalık", "Enerji", "Kalori"]),
            TabooWord(goalWord: "Deniz", tabooWords: ["Su", "Kum", "Dalga", "Plaj", "Yüzmek"]),
            TabooWord(goalWord: "Su", tabooWords: ["İçmek", "H2O", "Deniz", "Yağmur", "Hayat"]),
            TabooWord(goalWord: "Kum", tabooWords: ["Plaj", "Çöl", "Deniz", "Sarı", "İnce"]),
            TabooWord(goalWord: "Dalga", tabooWords: ["Deniz", "Su", "Hareket", "Rüzgar", "Sörf"]),
            TabooWord(goalWord: "Plaj", tabooWords: ["Deniz", "Kum", "Güneş", "Tatil", "Mayo"]),
            TabooWord(goalWord: "Yüzmek", tabooWords: ["Su", "Havuz", "Deniz", "Serinlemek", "Spor"]),
            TabooWord(goalWord: "Televizyon", tabooWords: ["Kanal", "Dizi", "Film", "Uzaktan Kumanda", "Ekran"]),
            TabooWord(goalWord: "Kanal", tabooWords: ["Televizyon", "Program", "Yayın", "Haber", "Frekans"]),
            TabooWord(goalWord: "Dizi", tabooWords: ["Televizyon", "Bölüm", "Drama", "Oyuncu", "Senaryo"]),
            TabooWord(goalWord: "Film", tabooWords: ["Sinema", "Oyuncu", "Yönetmen", "Sahne", "Ekran"]),
            TabooWord(goalWord: "Uzaktan Kumanda", tabooWords: ["Televizyon", "Buton", "Kontrol", "Pil", "Cihaz"]),
            TabooWord(goalWord: "Tüy", tabooWords: ["Kedi", "Kuş", "Yumuşak", "Kürk", "Kanat"]),
            TabooWord(goalWord: "Miyav", tabooWords: ["Kedi", "Ses", "Hayvan", "Çağırmak", "Pat"]),
            TabooWord(goalWord: "Pat", tabooWords: ["Kedi", "Pati", "Tırnak", "Dokunmak", "Oynamak"]),
            TabooWord(goalWord: "Kum", tabooWords: ["Kedi", "Tuvalet", "Deniz", "Çöl", "Oyun"]),
            TabooWord(goalWord: "Mama", tabooWords: ["Yemek", "Kedi", "Köpek", "Beslemek", "Hayvan"]),
            TabooWord(goalWord: "Meyve", tabooWords: ["Elma", "Sebze", "Tatlı", "Yiyecek", "Ağaç"]),
            TabooWord(goalWord: "Kırmızı", tabooWords: ["Renk", "Elma", "Kan", "Yangın", "Çilek"]),
            TabooWord(goalWord: "Yeşil", tabooWords: ["Renk", "Elma", "Yaprak", "Ağaç", "Doğa"]),
            TabooWord(goalWord: "Ağaç", tabooWords: ["Orman", "Yaprak", "Meyve", "Odun", "Yeşil"]),
            TabooWord(goalWord: "Tatlı", tabooWords: ["Şeker", "Yemek", "Pasta", "Tat", "Meyve"]),
            TabooWord(goalWord: "Müzik", tabooWords: ["Şarkı", "Nota", "Enstrüman", "Melodi", "Dinlemek"]),
            TabooWord(goalWord: "Şarkı", tabooWords: ["Müzik", "Melodi", "Söylemek", "Nota", "Sanatçı"]),
            TabooWord(goalWord: "Nota", tabooWords: ["Müzik", "Şarkı", "Enstrüman", "Yazmak", "Melodi"]),
            TabooWord(goalWord: "Enstrüman", tabooWords: ["Müzik", "Çalmak", "Gitar", "Piyano", "Ses"]),
            TabooWord(goalWord: "Melodi", tabooWords: ["Müzik", "Şarkı", "Nota", "Ritim", "Dinlemek"]),
            TabooWord(goalWord: "Dinlemek", tabooWords: ["Müzik", "Ses", "Kulak", "Şarkı", "Duyma"]),
            TabooWord(goalWord: "Film", tabooWords: ["Sinema", "Oyuncu", "Yönetmen", "Sahne", "Ekran"]),
            TabooWord(goalWord: "Sinema", tabooWords: ["Film", "Ekran", "Oyuncu", "Koltuk", "Yönetmen"]),
            TabooWord(goalWord: "Oyuncu", tabooWords: ["Film", "Tiyatro", "Rol", "Sahne", "Karakter"]),
            TabooWord(goalWord: "Yönetmen", tabooWords: ["Film", "Sinema", "Sahne", "Çekim", "Senaryo"]),
            TabooWord(goalWord: "Sahne", tabooWords: ["Tiyatro", "Film", "Oyuncu", "Performans", "Gösteri"]),
            TabooWord(goalWord: "Çiçek", tabooWords: ["Renk", "Koku", "Yaprak", "Bahçe", "Papatya"]),
            TabooWord(goalWord: "Renk", tabooWords: ["Boya", "Göz", "Kırmızı", "Mavi", "Palet"]),
            TabooWord(goalWord: "Koku", tabooWords: ["Burun", "Parfüm", "Güzel", "Koklamak", "Çiçek"]),
            TabooWord(goalWord: "Yaprak", tabooWords: ["Ağaç", "Bitki", "Yeşil", "Sonbahar", "Dal"]),
            TabooWord(goalWord: "Bahçe", tabooWords: ["Bitki", "Çiçek", "Ağaç", "Meyve", "Sebze"]),
            TabooWord(goalWord: "Papatya", tabooWords: ["Çiçek", "Beyaz", "Sarı", "Bahçe", "Buket"]),
            TabooWord(goalWord: "Araba", tabooWords: ["Tekerlek", "Motor", "Yol", "Direksiyon", "Benzin"]),
            TabooWord(goalWord: "Tekerlek", tabooWords: ["Araba", "Bisiklet", "Dönmek", "Lastik", "Yol"]),
            TabooWord(goalWord: "Motor", tabooWords: ["Araba", "Güç", "Makine", "Benzin", "Çalıştırmak"]),
            TabooWord(goalWord: "Yol", tabooWords: ["Araç", "Asfalt", "Sürmek", "Seyahat", "Trafik"]),
            TabooWord(goalWord: "Direksiyon", tabooWords: ["Araba", "Sürmek", "Kontrol", "Yol", "Şoför"]),
            TabooWord(goalWord: "Benzin", tabooWords: ["Yakıt", "Araba", "Depo", "İstasyon", "Motor"]),
            TabooWord(goalWord: "Telefon", tabooWords: ["Aramak", "Mesaj", "Konuşmak", "Akıllı", "Ekran"]),
            TabooWord(goalWord: "Aramak", tabooWords: ["Telefon", "Bulmak", "Konuşmak", "Numara", "Çağrı"]),
            TabooWord(goalWord: "Mesaj", tabooWords: ["Telefon", "Yazmak", "Göndermek", "SMS", "İletişim"]),
            TabooWord(goalWord: "Konuşmak", tabooWords: ["Ses", "Sohbet", "Telefon", "Dil", "İletişim"]),
            TabooWord(goalWord: "Akıllı", tabooWords: ["Teknoloji", "Telefon", "Zeki", "İnternet", "Ekran"]),
            TabooWord(goalWord: "Ekran", tabooWords: ["Telefon", "Bilgisayar", "Görüntü", "Televizyon", "Dokunmatik"]),
            TabooWord(goalWord: "Bilgisayar", tabooWords: ["Klavye", "Ekran", "Fare", "Program", "İnternet"]),
            TabooWord(goalWord: "Futbol", tabooWords: ["Top", "Saha", "Gol", "Kale", "Maç"]),
            TabooWord(goalWord: "Top", tabooWords: ["Oyun", "Yuvarlak", "Futbol", "Basketbol", "Voleybol"]),
            TabooWord(goalWord: "Saha", tabooWords: ["Oyun", "Futbol", "Spor", "Çim", "Maç"]),
            TabooWord(goalWord: "Gol", tabooWords: ["Futbol", "Kale", "Maç", "Skor", "Atmak"]),
            TabooWord(goalWord: "Kale", tabooWords: ["Futbol", "Gol", "Kaleci", "Savunma", "Maç"]),
            TabooWord(goalWord: "Maç", tabooWords: ["Futbol", "Takım", "Saha", "Gol", "Hakem"]),
            
        ]
    
    private var availableTabooWords: [TabooWord]
    
    init() {
        self.availableTabooWords = tabooWords.shuffled()
        print("Tüm kelimeler karıştırıldı: \(availableTabooWords.map { $0.goalWord })")
    }
    
    func getRandomTabooWord() -> TabooWord? {
        guard !availableTabooWords.isEmpty else {
            return nil
        }
        
        let selectedWord = availableTabooWords.removeFirst()
        print("Seçilen kelime: \(selectedWord.goalWord)")
        // print("Kalan kelimeler: \(availableTabooWords.map { $0.goalWord })")
        return selectedWord
    }
    
    func selectRandomTabooWordAndIncreaseScore() -> TabooWord? {
        if let randomTabooWord = getRandomTabooWord() {
            increaseScore()
            return randomTabooWord
        } else {
            
            return nil
        }
    }
    
    func increaseScore() {
        score += 1
    }
    
    func resetGame() {
        availableTabooWords = tabooWords.shuffled()
        score = 0
        passAttempts = 3
        //print("Oyun sıfırlandı. Yeni kelimeler: \(availableTabooWords.map { $0.goalWord })")
    }
}


