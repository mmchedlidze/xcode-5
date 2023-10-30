import UIKit
class MoviesTableView: UITableViewCell {
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1/255, green: 5/255, blue: 38/255, alpha: 1)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1/255, green: 5/255, blue: 38/255, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    private let moviePoster: UIImageView = {
        let poster = UIImageView()
        poster.contentMode = .scaleAspectFit
        poster.translatesAutoresizingMaskIntoConstraints = false
        return poster
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        numberLabel.text = nil
        moviePoster.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(numberLabel)
        mainStackView.addArrangedSubview(moviePoster)
        mainStackView.addArrangedSubview(nameLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            moviePoster.widthAnchor.constraint(equalToConstant: 150),
            moviePoster.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configure(with model: Movie) {
        numberLabel.text = model.number
        nameLabel.text = model.name
        moviePoster.image = UIImage(named: model.imageName)
    }
}
