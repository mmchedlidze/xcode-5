import UIKit

class ViewController: UIViewController {
    
    // MARK - Properties
    private let headerStack: UIStackView = {
        let header = UIStackView()
        header.axis = .horizontal
        return header
    }()
    
    private let numbering: UILabel = {
        let numbering = UILabel()
        numbering.text = "#"
        numbering.textColor = UIColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        return numbering
    }()
    
    private let poster: UILabel = {
        let poster = UILabel()
        poster.text = "Poster"
        poster.textColor = UIColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        return poster
    }()
    
    private let movieTitle: UILabel = {
        let title = UILabel()
        title.text = "Title"
        title.textColor = UIColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        return title
    }()
    
    private let add: UIButton = {
        let button = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let symbolImage = UIImage(systemName: "plus.app", withConfiguration: symbolConfiguration)
        button.setImage(symbolImage, for: .normal)
        button.tintColor = UIColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        return button
    }()
    
    private var tableView: UITableView!
    private var movies = Movie.dummyData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1/255, green: 5/255, blue: 38/255, alpha: 1)
        
        setuptableView()
        setupHeader()
        headerConstraints()
        addButton()
        
    }
    
    // MARK - TableView Setup
    
    private func setuptableView() {
        initTableView()
        tableViewConstraints()
        registerTableCell()
        tableView.delegate = self
    }
    
    private func registerTableCell() {
        tableView.register(MoviesTableView.self, forCellReuseIdentifier: "cell") //my custom cell- rasac avawyob calke
    }
    
    private func initTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    //  MARK - Header Set Up
    
    private func setupHeader() {
        view.backgroundColor = UIColor(red: 1/255, green: 5/255, blue: 38/255, alpha: 1)
        view.addSubview(headerStack)
        headerStack.addArrangedSubview(numbering)
        headerStack.addArrangedSubview(poster)
        headerStack.addArrangedSubview(movieTitle)
        headerStack.addArrangedSubview(add)
    }
    
    private func headerConstraints() {
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            headerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            poster.leftAnchor.constraint(equalTo: numbering.rightAnchor, constant: 48),
            movieTitle.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 80),
            add.leftAnchor.constraint(equalTo: movieTitle.rightAnchor, constant: 80)
        ])
    }
    
    private func addButton() {
        add.addAction(UIAction(handler:  { action in self.navigateTodetails()
        }), for: .touchUpInside)
    }
    
    private func navigateTodetails () {
        self.navigationController?.pushViewController(AddNewItemToListViewController(), animated: false) }
    
}


// MARK - TableView Datasource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        let movie = movies[indexPath.row]
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let maincell = cell as? MoviesTableView {
            maincell.configure(with: movie)
        }
        
        return cell
    }
}

// MARK - TableView Delegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsviewcontroller = DetailsViewControlerViewController()
        detailsviewcontroller.movie = movies[indexPath.row]
        navigationController?.pushViewController(detailsviewcontroller, animated: false)
        
    }
    
}
