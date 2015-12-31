import UIKit

class MealTableViewController: UITableViewController {

    // MARK: Properties
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMeals()
    }
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")!
        let meal1  = Meal(name: "Caprese Salad", photo: photo1, rating: 2)!
        
        let photo2 = UIImage(named: "meal2")!
        let meal2  = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 4)!
        
        let photo3 = UIImage(named: "meal3")!
        let meal3  = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 5)!
        
        meals += [meal1, meal2, meal3]
    }
}
