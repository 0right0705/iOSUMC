//
//  ViewController.swift
//  Youtube
//
//  Created by 최영우 on 5/10/23.
//

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

      @objc private func didTapButton() { // 버튼을 누르면 화면이 나오는 비동기 처리
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }

        Task { // async 대신 Task 사용
          guard
            let imageURL = try? await self.requestImageURL(requestURL: url),
            let url = URL(string: imageURL),
            let data = try? Data(contentsOf: url) // 여기까지 값이 true면 계속 실행
          else { return } // 아니면 리턴
          print(Thread.isMainThread) // true
          self.imageView.image = UIImage(data: data)
        }
      }
    
      func requestImageURL(requestURL: URL) async throws -> String { // 요청 imageViewURL 처리 함수
        print(Thread.isMainThread) // false
        let (data, _) = try await URLSession.shared.data(from: requestURL)
        return try JSONDecoder().decode(MyModel.self, from: data).data.first?.avatar ?? "" // url 해석해서 리턴
      }
}
