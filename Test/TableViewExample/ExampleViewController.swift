//
//  ViewController.swift
//  TableViewExample
//
//  Created by Christopher Hannah on 08/09/2018.
//  Copyright © 2018 Christopher Hannah. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isEditing = true
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    struct Headline {
        
        var id : Int
        var title : String
        var text : String
        var image : String
        
    }
    
    
        var headlines = [
            Headline(id: 1, title: "Lorem Ipsum", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", image: "passenger"),
            Headline(id: 2, title: "Aenean condimentum", text: "Ut eget massa erat. Morbi mauris diam, vulputate at luctus non.", image: "google"),
            Headline(id: 3, title: "In ac ante sapien", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc.", image: "fb"),
        ]
        
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.headlines[sourceIndexPath.row]
        headlines.remove(at: sourceIndexPath.row)
        headlines.insert(movedObject, at: destinationIndexPath.row)
    }
    
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell

        let headline = headlines[indexPath.row]
        cell.titleLabel?.text = headline.title
        cell.descriptionText?.text = headline.text
        cell.fondoImage.image = UIImage(named: headline.image)
        return cell
    }
    

	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    


}

