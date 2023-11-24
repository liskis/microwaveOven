import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MicrowaveOven {
    var timer: Timer?
    var sec: Int = 0

    func chin(sec: Int) {
        print("あっためます。")
        self.sec = sec
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countdown),
            userInfo: nil,
            repeats: true
        )
    }

    @objc func countdown() {
        sec -= 1
        print("\(sec)")
        if sec == 0 {
            print("ちーん")
            timer?.invalidate()
        }
    }
}

let microwaveOven = MicrowaveOven()
microwaveOven.chin(sec: 5)
