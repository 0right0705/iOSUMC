
import UIKit

class ViewController: UIViewController {
    
      private let button: UIButton = { // button 생성
        let button = UIButton()
        button.setTitle("이미지 요청", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
      }()
    
    private let imageView: UIImageView = { // imageView 생성
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()

      override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.button) // button 화면에 표시
        self.view.addSubview(self.imageView) // imageView 화면에 표시
          
        NSLayoutConstraint.activate([ //button 제약 걸기
          self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
          self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
          
        NSLayoutConstraint.activate([ // imageView 제약 걸기
          self.imageView.heightAnchor.constraint(equalToConstant: 120),
          self.imageView.widthAnchor.constraint(equalToConstant: 120),
          self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
          self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
      }

    @objc private func didTapButton() {
      guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }

      // Dispatch async code to a custom queue
      let queue = DispatchQueue(label: "com.example.myQueue")
        Task {
            guard let imageURL = try? await self.requestImageURL(requestURL: url),
              let url = URL(string: imageURL),
              let data = try? Data(contentsOf: url)
          else { return }

        // Dispatch UI update code to the main queue
        DispatchQueue.main.async {[weak self] in
          self?.imageView.image = UIImage(data: data)
        }
      }
    }
    
      func requestImageURL(requestURL: URL) async throws -> String { // 요청 imageViewURL 처리 함수
        print(Thread.isMainThread) // false
        let (data, _) = try await URLSession.shared.data(from: requestURL)
        return try JSONDecoder().decode(MyModel.self, from: data).data.first?.avatar ?? "" // url 해석해서 리턴
      }
}

