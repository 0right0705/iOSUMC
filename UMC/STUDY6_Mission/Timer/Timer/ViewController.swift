import UIKit


class ViewController: UIViewController {
    
    private var timer: Timer?
    
    private var dateTime : UIDatePicker = {
        let dateTime = UIDatePicker()
        dateTime.translatesAutoresizingMaskIntoConstraints = false
        
        return dateTime
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.setTitle("설정", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitleColor(.orange, for: .highlighted)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let PickerTime : UILabel = {
        var PickerTime = UILabel()
        PickerTime.text = ""
        PickerTime.translatesAutoresizingMaskIntoConstraints = false
        
        return PickerTime
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(dateTime)
        self.view.addSubview(button)
        self.view.addSubview(PickerTime)
        
        NSLayoutConstraint.activate([
            self.dateTime.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.dateTime.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.button.heightAnchor.constraint(equalToConstant: 120),
            self.button.widthAnchor.constraint(equalToConstant: 120),
            self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.PickerTime.heightAnchor.constraint(equalToConstant: 60),
            self.PickerTime.widthAnchor.constraint(equalToConstant: 200),
            self.PickerTime.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.PickerTime.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100)
        ])
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let selectedDate = dateTime.date
        let formattedDate = dateFormatter.string(from: selectedDate)
        
        self.PickerTime.text = formattedDate
        
        if !formattedDate.isEmpty {
            startTimer()
        }
    }
    
    private func startTimer() {
        guard let formattedDate = self.PickerTime.text, !formattedDate.isEmpty else {
            return
        }
        
        // Create a new timer that will fire every second
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.checkAlarmTime()
        }
    }
    
    private func stopTimer() {
        // Invalidate the timer when it's no longer needed
        timer?.invalidate()
        timer = nil
    }
    
    private func checkAlarmTime() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let selectedTime = dateTime.date
        let currentTime = Date()
        
        let selectedTimeString = formatter.string(from: selectedTime)
        let currentTimeString = formatter.string(from: currentTime)
        
        if selectedTimeString == currentTimeString {
            // Stop the timer when the alarm time is reached
            stopTimer()
            
            // Show an alert or play a sound to notify the user
            let alert = UIAlertController(title: "Alarm", message: "Time's up!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

