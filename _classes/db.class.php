<?php
require_once __DIR__.'/../vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createUnsafeImmutable(__DIR__.'/../');
$dotenv->safeLoad();

class DB {
  private $host = '';
  private $dbname = '';
  private $username = '';
  private $password = '';
  
  private $connection;
  
  public function __construct() {
    $this->host = getenv('MYSQL_HOST');
    $this->dbname = getenv('DB_NAME');
    $this->username = getenv('MYSQL_USER');
    $this->password = getenv('MYSQL_PASS');

      try {
          $this->connection = new PDO("mysql:host=$this->host;dbname=$this->dbname", $this->username, $this->password);
          $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
          $this->connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
      } catch(PDOException $e) {
          echo 'Erro na conexão com o banco de dados: ' . $e->getMessage();
      }
  }
    
  public function getConnection() {
      return $this->connection;
  }

  public function sql($query, $params = []) {
    try {
        $statement = $this->connection->prepare($query);
        $statement->execute($params);
        
        if (stripos($query, 'SELECT') === 0) {
            return $statement->fetchAll(PDO::FETCH_ASSOC);
        } else {
            return $statement;
        }
    } catch(PDOException $e) {
        echo 'Erro na execução da consulta: ' . $e->getMessage();
    }
  }

  public function closeConnection() {
        $this->connection = null;
    }
}