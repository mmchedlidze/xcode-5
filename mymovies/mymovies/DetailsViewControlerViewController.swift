import UIKit

class DetailsViewControlerViewController: UIViewController {
    // MARK - Properties
    private let detailsStack : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 24
        return stackview
    }()
    
    private let imagePoster : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let titleText : UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 24, weight: .semibold)
        title.textColor = UIColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        return title
    }()
    
    var movie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1/255, green: 5/255, blue: 38/255, alpha: 1)
        setupStack()
        stackConstraints()
        configureViews()
    }
    
    // MARK - Set up
    private func setupStack() {
        view.addSubview(detailsStack)
        detailsStack.addArrangedSubview(imagePoster)
        detailsStack.addArrangedSubview(titleText)
    }
    
    private func configureViews() {
        guard let movie else { return }
        titleText.text = movie.name
        imagePoster.image = UIImage(named: movie.imageName)
    }
    
    private func stackConstraints() {
        detailsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 12),
            detailsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePoster.heightAnchor.constraint(equalToConstant: 500),
        ])
    }
}
