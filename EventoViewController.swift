//
//  EventoViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 06/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class EventoViewController: UIViewController {

    var evento : Evento?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descripcionLabel: UILabel!
    @IBOutlet weak var organizaLabel: UILabel!
    @IBOutlet weak var lugarLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var horaLabel: UILabel!
    @IBOutlet weak var contactoLabel: UILabel!
    @IBOutlet weak var imagenEvento: UIImageView!
    
    
    //MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        if let evento = evento {
           
            //Cargar Labels
            /*
            tituloLabel.numberOfLines = 0;
            tituloLabel.lineBreakMode = .byWordWrapping;
            descripcionLabel.numberOfLines = 0;
            descripcionLabel.lineBreakMode = .byWordWrapping;
            organizaLabel.numberOfLines = 0;
            organizaLabel.lineBreakMode = .byWordWrapping;
            lugarLabel.numberOfLines = 0;
            lugarLabel.lineBreakMode = .byWordWrapping;
            fechaLabel.numberOfLines = 0;
            fechaLabel.lineBreakMode = .byWordWrapping;
            horaLabel.numberOfLines = 0;
            horaLabel.lineBreakMode = .byWordWrapping;
            contactoLabel.numberOfLines = 0;
            contactoLabel.lineBreakMode = .byWordWrapping;
            */
            
            //Mostrar texto labels
            tituloLabel.text = evento.titulo;
            descripcionLabel.text = evento.descripcion;
            organizaLabel.text = evento.organiza;
            lugarLabel.text = evento.lugar;
            fechaLabel.text = evento.fecha;
            horaLabel.text = evento.hora;
            contactoLabel.text = evento.contacto;
            
            //Cargar imagen
            let url = URL(string: evento.url)
            if url != nil{
                let session = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                    //Si no es nil
                    if let data = data {
                        let image = UIImage(data: data)
                        //mostrar imagen
                        self.imagenEvento.image = image
                    }
                })//End session
                session.resume()
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
