//
//  DirectorioTableViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 08/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class DirectorioTableViewController: UITableViewController, DependenciaManagerDelegate, UISearchBarDelegate {
    
    let directorioManager = DependenciaManager();
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();
  
    
    //MARK: - Dependencia Manager Delegate
    func directorioCargado() {
        tableView.reloadData();
        activityIndicator.stopAnimating();
    }
    
    //MARK: - Ciclo de vida de la Vista
    
    override func viewDidLoad() {
        super.viewDidLoad();
        searchBarSetUp();
        animacionCargando();
        activityIndicator.startAnimating();
        directorioManager.delegate = self;
        directorioManager.cargarDependencias();
        
    }
    
    
    func searchBarSetUp(){
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70));
        searchBar.showsScopeBar = true;
        self.tableView.tableHeaderView = searchBar;
        searchBar.delegate = self;
    }
    
    //MARK: - Search Bar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            directorioManager.directorio.removeAll();
            directorioManager.cargarDependencias();
            self.tableView.reloadData();
        }else {
            filterTableView(text: searchText);
        }
    }
    
    
    func filterTableView(text: String){
        directorioManager.directorio = directorioManager.directorio.filter { (mod) -> Bool in
            return mod.nombre.lowercased().contains(text.lowercased());
        }
        self.tableView.reloadData();
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directorioManager.directorio.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaDirectorio") as! DirectorioTableViewCell;

        let dependencia = directorioManager.directorio[indexPath.row];
        
        cell.nombreLabel.text = dependencia.nombre;
        cell.telefonoLabel.text = dependencia.telefono;
        cell.direccionLabel.text = dependencia.direccion;
        cell.linkLabel.text = dependencia.pagina; 
        
        return cell;
    }
    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "detallesDependencia" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let directorioViewController = segue.destination as! DirectorioViewController;
                    directorioViewController.dependencia = directorioManager.directorio[indexPath.row];
                }
            }
    }
    
    //MARK: - Funciones Vista
    
    func animacionCargando(){
        activityIndicator.center = self.view.center;
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray;
        view.addSubview(activityIndicator);
    }

}
