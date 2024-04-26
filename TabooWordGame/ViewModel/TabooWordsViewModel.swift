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
        TabooWord(goalWord: "Telefon", tabooWords: ["Arama", "Mesaj", "Ekran", "Kamera", "Şarj"]),
        TabooWord(goalWord: "Yazılım", tabooWords: ["Kod", "Program", "Geliştirme", "Uygulama", "Yazılımcı"]),
        TabooWord(goalWord: "Tatil", tabooWords: ["Deniz", "Güneş", "Kum", "Eğlence", "Dinlenme"]),
        TabooWord(goalWord: "Müzik", tabooWords: ["Nota", "Enstrüman", "Ses", "Ritim", "Melodi"]),
        TabooWord(goalWord: "Yazı", tabooWords: ["Karakter", "Cümle", "Kelime", "Paragraf", "Roman"]),
        TabooWord(goalWord: "Havuz", tabooWords: ["Su", "Yüzme", "Küçük", "Derin", "Kenar"]),
        TabooWord(goalWord: "Gitar", tabooWords: ["Tell", "Akustik", "Elektro", "Çalmak", "Ses"]),
        TabooWord(goalWord: "Spor", tabooWords: ["Futbol", "Basketbol", "Voleybol", "Tenis", "Yüzme"]),
        TabooWord(goalWord: "Bisiklet", tabooWords: ["Tekerlek", "Pedal", "Fren", "Yol", "Sürmek"]),
        TabooWord(goalWord: "Pasta", tabooWords: ["Un", "Krem", "Çikolata", "Kurabiye", "Tatl"]),
        TabooWord(goalWord: "Hastane", tabooWords: ["Doktor", "Hemşire", "Hasta", "Muayene", "Ameliyat"]),
        TabooWord(goalWord: "Güneş", tabooWords: ["Yıldız", "Sıcak", "Parlak", "Işık", "Gökyüzü"]),
        TabooWord(goalWord: "Araba", tabooWords: ["Tekerlek", "Yol", "Sürücü", "Motor", "Direksiyon"]),
        TabooWord(goalWord: "Yemek", tabooWords: ["Pişirme", "Tat", "Malzeme", "Mutfak", "Tarif"]),
        TabooWord(goalWord: "Bulut", tabooWords: ["Gökyüzü", "Beyaz", "Bulutlu", "Yüksek", "Rüzgar"]),
        TabooWord(goalWord: "Kuş", tabooWords: ["Kanat", "Yumurta", "Tüy", "Ses", "Yuva"]),
        TabooWord(goalWord: "Kalem", tabooWords: ["Yazmak", "Kauçuk", "Tükenmez", "Kalemtıraş", "Renkli"]),
        TabooWord(goalWord: "Okyanus", tabooWords: ["Deniz", "Mavi", "Su", "Büyük", "Derya"]),
        TabooWord(goalWord: "Ağaç", tabooWords: ["Dal", "Yaprak", "Kök", "Orman", "Odun"]),
        TabooWord(goalWord: "Ev", tabooWords: ["Çatı", "Duvar", "Kapı", "Pencere", "Oda"]),
        TabooWord(goalWord: "Kedi", tabooWords: ["Köpek", "Tüy", "Patı", "Balık", "Yem"]),
        TabooWord(goalWord: "Güller", tabooWords: ["Kırmızı", "Beyaz", "Çiçek", "Bahçe", "Gülümseme"]),
        TabooWord(goalWord: "Balık", tabooWords: ["Su", "Yüzgeç", "Pull", "Tuzlu", "Deniz"]),
        TabooWord(goalWord: "Buz", tabooWords: ["Soğuk", "Su", "Dondurma", "Kalın", "Eritmek"]),
        TabooWord(goalWord: "Kütüphane", tabooWords: ["Kitap", "Okuma", "Sessiz", "Raflar", "Araştırma"]),
        TabooWord(goalWord: "Gözlük", tabooWords: ["Göz", "Cam", "Çerçeve", "Görmek", "Göz doktoru"]),
        TabooWord(goalWord: "Çanta", tabooWords: ["Omuz", "Deri", "Kapak", "Çıt", "Sırt"]),
        TabooWord(goalWord: "Çiçek", tabooWords: ["Bahçe", "Renk", "Koku", "Tohum", "Güzel"]),
        TabooWord(goalWord: "Ayakkabı", tabooWords: ["Topuk", "Bağcık", "Taban", "Numara", "Giymek"]),
        TabooWord(goalWord: "Armut", tabooWords: ["Elma", "Meyve", "Yeşil", "Tatlı", "Küçük"]),
        TabooWord(goalWord: "Kapı", tabooWords: ["Ev", "Ahşap", "Kol", "Kilit", "Zil"]),
    ]
    
    private var previousTabooWordIndex: Int?
    
    var currentTabooWord: TabooWord?
    
    func getRandomTabooWord() -> TabooWord {
        var randomIndex = Int.random(in: 0..<tabooWords.count)
        
        while let previousIndex = previousTabooWordIndex, randomIndex == previousIndex {
            randomIndex = Int.random(in: 0..<tabooWords.count)
        }
        
        previousTabooWordIndex = randomIndex
        
        let randomTabooWord = tabooWords[randomIndex]
        currentTabooWord = randomTabooWord
        return randomTabooWord
    }
    
    func selectRandomTabooWordAndIncreaseScore() -> TabooWord {
        let randomTabooWord = getRandomTabooWord()
        increaseScore()
        return randomTabooWord
    }
    
    func increaseScore() {
        score += 1
    }
}

