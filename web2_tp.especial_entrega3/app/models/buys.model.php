<?php
    require_once 'app/models/model.autodeploy.php';
class buysModel extends Model {
    //GET
    function getCustomers() {
        $query = $this->db->prepare('SELECT * FROM clientes');
        $query->execute();

        // $tasks es un arreglo de tareas
        $customers = $query->fetchAll(PDO::FETCH_OBJ);

        return $customers;
    }

    function customersById($id){
        $query = $this->db->prepare('SELECT `id` FROM clientes WHERE id = ?');
        $query->execute([$id]);

        $query->fetch(PDO::FETCH_OBJ);
        return $query;
    }

    //GET
    function getDetalle($id){
        $query = $this->db->prepare('SELECT * FROM `compras` WHERE id_usuario = ?');
        $query->execute([$id]);

        $description = $query->fetch(PDO::FETCH_OBJ);
        
        return $description; 
    }

    //POST
    function insertClient($id,$nombre, $direccion){
        $query = $this->db->prepare('INSERT INTO clientes (id,Nombre, Dirección) VALUES(?,?,?)');
        $query->execute([$id, $nombre, $direccion]);

        return $this->db->lastInsertId();
    }

    //DELETE
    function deleteClient($id) {
        $query = $this->db->prepare('DELETE FROM clientes WHERE id = ?');
        $query->execute([$id]);
    }

    //PUT
    function updateData($id_usuario, $destino, $detalle, $total){
        $query = $this->db->prepare('UPDATE `compras` SET `id_usuario`= ?,`Destino`= ?,`Detalle`= ?,`Total`= ?');
        $query->execute([$id_usuario,$destino,$detalle,$total]);

        return $query->rowCount();
    }
}