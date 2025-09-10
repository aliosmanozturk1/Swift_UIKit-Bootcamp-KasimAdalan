# P10_MVVMKullanimi – MVVM Refactor Advice

Bu notlar `P10_MVVMKullanimi` projesindeki MVVM uygulamasını best practice’lere yaklaştırmak için hazırlanmıştır. Odak: ViewModel, Repository (Service/UseCase), Rx kapsülleme ve ViewController yaşam döngüsü/bellek yönetimi.

## Genel Değerlendirme
- MVVM ayrımı temel olarak mevcut; ancak “Repository” veri erişimi yerine doğrudan iş kuralı (toplama/çarpma) çalıştırıyor. Bu rol isimlendirme ve sorumluluk açısından “Service/UseCase”e daha yakın.
- RxSwift kullanımı var; fakat state/akış kapsüllemesi, DI (dependency injection) ve bellek yönetimi iyileştirilmeli.

## Tespitler ve İyileştirmeler

### ViewModel
- UI’dan gelen `String` girdilerin parse/validasyonu ViewModel’de yapılmalı. Service katmanına typed veri (`Int`) gönderilmeli.
- `BehaviorSubject` doğrudan dışa açılmamalı. ViewModel yalnızca okunur bir akış (`Observable`/`Driver`) publish etmeli.
- `MatematikRepository` örneği ViewModel içinde yaratılıyor; protokol + DI ile enjekte edilmeli (test edilebilirlik, esneklik).

### Repository (Service/UseCase)
- Şu anki sınıf iş kuralı çalıştırıyor; veri kaynaklarına erişim yok. İsimlendirme ve rol “Service/UseCase” olarak netleştirilmeli.
- `BehaviorSubject` public olmamalı. `private` subject + `asObservable()` ile yalnızca okunur akış verilmeli.
- Parametreler UI-odaklı `String` değil domain-odaklı `Int` olmalı.

### ViewController
- `subscribe` için `DisposeBag` kullanılmalı ve `self` `[weak self]` ile yakalanmalı.
- UI güncellemeleri ana thread’de yapılmalı: `observe(on: MainScheduler.instance)` veya RxCocoa `Driver` kullanımı.

### Rx Notları
- UI state için `Subject` yerine `Driver`/`Signal` (RxCocoa) veya en azından `asObservable()` ile kapsülleme tercih edilmeli.
- Hata/validasyon durumları için ayrı bir output (örn. `errorText`) düşünülebilir.

## Önerilen Taslak Kodlar

### Servis Protokolü
```swift
import RxSwift

protocol MatematikServicing {
    var sonuc: Observable<String> { get }
    func toplamaYap(_ a: Int, _ b: Int)
    func carpmaYap(_ a: Int, _ b: Int)
}
```

### Servis Uygulaması (eski Repository)
```swift
import RxSwift

final class MatematikService: MatematikServicing {
    private let sonucSubject = BehaviorSubject<String>(value: "0")
    var sonuc: Observable<String> { sonucSubject.asObservable() }

    func toplamaYap(_ a: Int, _ b: Int) {
        sonucSubject.onNext(String(a + b))
    }

    func carpmaYap(_ a: Int, _ b: Int) {
        sonucSubject.onNext(String(a * b))
    }
}
```

### ViewModel
```swift
import RxSwift

final class AnasayfaViewModel {
    let sonuc: Observable<String>
    private let service: MatematikServicing

    init(service: MatematikServicing) {
        self.service = service
        self.sonuc = service.sonuc
    }

    func toplamaYap(alinanSayi1: String, alinanSayi2: String) {
        guard let a = Int(alinanSayi1), let b = Int(alinanSayi2) else {
            // Gerekirse ayrı bir error akışı publish edin
            return
        }
        service.toplamaYap(a, b)
    }

    func carpmaYap(alinanSayi1: String, alinanSayi2: String) {
        guard let a = Int(alinanSayi1), let b = Int(alinanSayi2) else { return }
        service.carpmaYap(a, b)
    }
}
```

### ViewController
```swift
import UIKit
import RxSwift

final class ViewController: UIViewController {
    @IBOutlet private weak var labelSonuc: UILabel!
    @IBOutlet private weak var textFieldSayi1: UITextField!
    @IBOutlet private weak var textFieldSayi2: UITextField!

    private let bag = DisposeBag()
    private lazy var viewModel = AnasayfaViewModel(service: MatematikService())

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.sonuc
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] sonuc in
                self?.labelSonuc.text = sonuc
            })
            .disposed(by: bag)
    }

    @IBAction private func buttonToplama(_ sender: Any) {
        viewModel.toplamaYap(
            alinanSayi1: textFieldSayi1.text ?? "",
            alinanSayi2: textFieldSayi2.text ?? ""
        )
    }

    @IBAction private func buttonCarpma(_ sender: Any) {
        viewModel.carpmaYap(
            alinanSayi1: textFieldSayi1.text ?? "",
            alinanSayi2: textFieldSayi2.text ?? ""
        )
    }
}
```

### Opsiyonel: RxCocoa Driver ile
```swift
// ViewModel'de: let sonucDriver: Driver<String>
// sonucDriver = service.sonuc.asDriver(onErrorJustReturn: "0")
// VC'de: viewModel.sonucDriver.drive(labelSonuc.rx.text).disposed(by: bag)
```

## Adım Adım Refactor Checklist
- Repository’i `MatematikService` olarak yeniden adlandır ve protokol tanımla.
- Subject’ı `private` yap; `asObservable()` ile yalnızca okunur akış ver.
- ViewModel’e servis bağımlılığını protokol üzerinden enjekte et.
- Parse/validasyon işini ViewModel’e taşı; servise `Int` gönder.
- ViewController’da `DisposeBag`, `[weak self]` ve `observe(on: MainScheduler.instance)` kullan.
- (Opsiyonel) RxCocoa `Driver/Signal` ile UI binding basitleştir.
- (Opsiyonel) Hata/validasyon için ayrı output yayınla ve UI’da göster.

## Neden Parse ViewModel’de?
- Ayrık sorumluluk: UI girdileri ViewModel’in domain’e dönüşmesi gereken inputlarıdır; servis/use-case domain seviyesinde çalışmalıdır.
- Test edilebilirlik: ViewModel, edge case’leri (boş/invalid string) kolay test eder; servis salt iş kuralını test eder.

## Test Edilebilirlik İpuçları
- `MatematikServicing` için sahte (mock/stub) uygulama ile ViewModel testleri yaz.
- Girdi validasyonu (örn. geçersiz string) ve doğru sonuç publish edilmesini test et.
- Servis için toplama/çarpma fonksiyonlarının doğru yayın yaptığını test et.

---
Kısa özet: DI + protokol, subject kapsüllemesi, isimlendirmeyi “Service/UseCase” olarak netleştirme, ViewModel’de input parse/validasyon ve VC’de `DisposeBag` + `[weak self]` + main thread gözlemi bu örneği best practice’e taşır.

