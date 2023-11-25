import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MicrowaveOven {
    
    enum Power {
        case w100
        case w200
        case w500
    }
    
    var maxTimeW100: Int = 1200
    var maxTimeW200: Int = 900
    var maxTimeW500: Int = 600
    
    var timer: Timer?
    var setTime: Int = 0

    func start(power: Power, setTime: Int) -> Bool {
        self.setTime = setTime
        switch power {
        case .w100:
            if self.setTime > maxTimeW100{
                print("温め時間は\(maxTimeW100)秒以下でお願いします。")
                return false
            }
        case .w200:
            if self.setTime > maxTimeW200{
                print("温め時間は\(maxTimeW100)秒以下でお願いします。")
                return false
            }
        case .w500:
            if self.setTime > maxTimeW500{
                print("温め時間は\(maxTimeW500)秒以下でお願いします。")
                return false
            }
        }
        print("あっためます。")
        startTimer()
        return true
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countdown),
            userInfo: nil,
            repeats: true
        )
    }

    @objc func countdown() {
        setTime -= 1
        print("\(setTime)")
        if setTime == 0 {
            print("上手にできました！")
            timer?.invalidate()
        }
    }
}

let microwaveOven = MicrowaveOven()
let warmStart = microwaveOven.start(power: .w100, setTime: 1201)
print(warmStart)
