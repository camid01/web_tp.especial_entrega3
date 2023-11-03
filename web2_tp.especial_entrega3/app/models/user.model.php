<?php
    require_once 'app/models/model.autodeploy.php';
    //require_once 'app/views/api.view.php';
class UserModel extends Model{
    
    public function getByEmail($email) {
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE email = ?');
        
        $query->execute([$email]);

        $user = $query->fetch(PDO::FETCH_OBJ);
        
        if (!$this->db) {
            //$this->view->response('Error en la conexión con la base de datos', 400);
        }

        return $user;
    }

}