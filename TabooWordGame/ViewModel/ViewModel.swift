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
            TabooWord(goalWord: "Araba", tabooWords: ["Tekerlek", "Motor", "Yol", "Direksiyon", "Benzin"]),
            TabooWord(goalWord: "Bilgisayar", tabooWords: ["Klavye", "Ekran", "Fare", "Program", "İnternet"]),
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
            TabooWord(goalWord: "Tavşan", tabooWords: ["Kulak", "Havuç", "Sıçramak", "Post", "Koşmak"]),
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
            TabooWord(goalWord: "Kedi", tabooWords: ["Tüy", "Miyav", "Pat", "Kum", "Mama"]),
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
            TabooWord(goalWord: "Karpuz", tabooWords: ["Meyve", "Kırmızı", "Tatlı", "Yaz", "Çekirdek"]),
            TabooWord(goalWord: "Sabun", tabooWords: ["Temizlik", "Köpük", "El", "Duş", "Kokulu"]),
            TabooWord(goalWord: "Sokak", tabooWords: ["Yol", "Ev", "Araç", "Yaya", "Gece"]),
            TabooWord(goalWord: "Tepe", tabooWords: ["Yüksek", "Dağ", "Tırmanmak", "Manzara", "Yeşil"]),
            TabooWord(goalWord: "Uçak", tabooWords: ["Pilot", "Havalimanı", "Kanat", "Uçuş", "Yolcu"]),
            TabooWord(goalWord: "Vazo", tabooWords: ["Çiçek", "Seramik", "Dekorasyon", "Su", "Masa"]),
            TabooWord(goalWord: "Yelkenli", tabooWords: ["Deniz", "Rüzgar", "Yelken", "Tekne", "Yarış"]),
            TabooWord(goalWord: "Yemek", tabooWords: ["Pişirmek", "Tat", "Yemek", "Restoran", "Mutfak"]),
            TabooWord(goalWord: "Yolcu", tabooWords: ["Seyahat", "Uçak", "Otobüs", "Tren", "Bagaj"]),
            TabooWord(goalWord: "Zürafa", tabooWords: ["Hayvan", "Uzun Boyun", "Afrika", "Yemek", "Sarışın"]),
            TabooWord(goalWord: "Zeytin", tabooWords: ["Yeşil", "Siyah", "Ağaç", "Ege", "Yağ"]),
            TabooWord(goalWord: "Yunus", tabooWords: ["Deniz", "Balık", "Mavi", "Şov", "Akvaryum"]),
            TabooWord(goalWord: "Karpuz", tabooWords: ["Yaz", "Tatlı", "Kırmızı", "Çekirdek", "Meyve"]),
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


