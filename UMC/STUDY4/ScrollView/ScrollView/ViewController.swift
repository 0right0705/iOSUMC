import UIKit

class ViewController: UIViewController {
    let scrollView: UIScrollView! = UIScrollView()
    let stackView: UIStackView! = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(scrollView)
        view.backgroundColor = .white
        
        // addSubview를 먼저 해준 다음 constraint를 더해야 함
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])

        scrollView.addSubview(stackView)
        
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        ])
        
        setVerticalStackView()
    }
    
    private func setVerticalStackView() {
        stackView.axis = .vertical
        stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        fillStackView("vertical")
    }
    
    private func fillStackView(_ axis: String) {
        let colorArray = [UIColor.blue, .red, .yellow, .purple, .green, .black, .orange, .gray]
        for color in colorArray {
            let elementView = UIView()
            elementView.backgroundColor = color
            elementView.translatesAutoresizingMaskIntoConstraints = false
            if axis == "horizontal" {
                elementView.widthAnchor.constraint(equalToConstant: 200).isActive = true
            } else {
                elementView.heightAnchor.constraint(equalToConstant: 300).isActive = true
            }
            stackView.addArrangedSubview(elementView)
        }
    }
}
