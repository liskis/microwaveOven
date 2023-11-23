import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MicrowaveOven {
    var timer: Timer?
    var count: Int = 0
    
    func chin(count: Int) {
        self.count = count
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countdown),
            userInfo: nil,
            repeats: true
        )
    }

    // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
    @objc func countdown() {
        count -= 1
        print("\(count)")
        if count == 0 {
            print("ちーん")
            // タイマーを止める
            timer?.invalidate()
        }
    }
}

let microwaveOven = MicrowaveOven()
microwaveOven.chin(count: 10)
