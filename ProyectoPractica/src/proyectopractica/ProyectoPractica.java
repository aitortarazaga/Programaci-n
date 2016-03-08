
package proyectopractica;

import Modelo.*;
import Vista.*;

public class ProyectoPractica {

    public static LogCentro lg;
    public static DatosTrabajador dt;
    
    public static void main(String[] args) {
        lg=new LogCentro();
        dt=new DatosTrabajador();
        lg.setVisible(true);
    }
    
    public static void ventanaTrabajador(){
        lg.dispose();
        dt.setVisible(true);
    }
    
}
