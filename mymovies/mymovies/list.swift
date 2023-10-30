
import UIKit

class Movie {
    let number: String
    let name: String
    let imageName: String
    
    init(number: String, name: String, imageName: String) {
        self.number = number
        self.name = name
        self.imageName = imageName
    }
    
    static var dummyData = [
        Movie(number: "1", name: "Shawshank Redemption", imageName: "shawshank"),
        Movie(number: "2", name: "Schindler's List", imageName: "Schindler"),
        Movie(number: "3", name: "Prestige", imageName: "prestige"),
        Movie(number: "4", name: "Pianist", imageName: "pianist"),
        Movie(number: "5", name: "Green Mile", imageName: "greenmile"),
        Movie(number: "6", name: "Fight Club", imageName: "fighClub"),
        Movie(number: "7", name: "12 Angry Man", imageName: "12AngryMan"),
        Movie(number: "8", name: "Inception", imageName: "inception"),
    ]
    
}
