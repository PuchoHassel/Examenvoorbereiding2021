<?php  

class database{
   
    private $host;
    private $dbh;
    private $user;
    private $pass;
    private $db;
 
    function _construct($host){
         $this->host = 'localhost';
         $this->user = 'root';
         $this->pass = '';
         $this->db ='Flowerpower';
 
         try {
             $dsn = "mysql:host=$this->;dbname=$this->db";
             $this->dbh = new PDO($dsn, $this->user, $this->pass);
 
         } catch (PDOexeception $e){
             #die & exit same
             die("unable to connect: " . $e->getMessage());
         }
    }
}
?>