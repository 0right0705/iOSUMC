import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let header = UIView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: 150))
    header.backgroundColor = .systemOrange
    
    let headerLabel = UILabel(frame: header.bounds)
    
    struct Store {
        let title: String // title은 String 타입
        let imageName : String //imageName은 String 타입
    }
    
    let data: [Store] = [ // data라는 정수 안에 struct 타입의 배열 Store을 넣음. 이때, Store 배열에 밑의 값을 넣음
        Store(title: "AppleStore", imageName: "ApplsStore"),
        Store(title: "BR31", imageName: "BR31")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self // table의 dataSource에 self값을 넣음
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count //data의 수를 리턴
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let store = data[indexPath.row] // data 배열의 0번째 section의 n번째 행을 store에 넣기
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell //ID가 reuseIdentifier인 cell의 textLable의 text에 arr[indexPaht.row]를 넣기
        cell.label.text = store.title // cell label의 텍스트에 store에 있는 타이틀을 넣음
        return cell // cell을 리턴
    }
}
