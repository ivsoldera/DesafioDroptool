<?php
require_once __DIR__.'/_classes/db.class.php';
$db = new DB();

function classificaItens($nome, $qtdMinimaVendas, $qtdMinimaDenuncias){
    global $db;

    // Registros com status diferentes de 10 -> Analisado
    $query = "SELECT * FROM itens WHERE status != 10";

    // Pega outras condições de análise
    $params = array();
    if ($nome) {
        $query .= " AND nome LIKE :nome";
        $params[':nome'] = '%' . $nome . '%';
    }

    if ($qtdMinimaVendas) {
        $query .= " AND qtdVendas >= :qtdMinimaVendas";
        $params[':qtdMinimaVendas'] = $qtdMinimaVendas;
    }

    if ($qtdMinimaDenuncias) {
        $query .= " AND numDenuncias >= :qtdMinimaDenuncias";
        $params[':qtdMinimaDenuncias'] = $qtdMinimaDenuncias;
    }

    $results = $db->sql($query, $params);
    var_dump($results);


    foreach ($results as $row) {
        // Atualizar o status do item para 'Suspeito' -> 90
        $db->sql("UPDATE itens SET status = 90 WHERE id = :item_id", [':item_id' => $row['id']]);

        // Verificar se o item já está na tabela de itens suspeitos
        $itemSuspeito = $db->sql("SELECT * FROM itens_suspeitos WHERE item_id = :item_id", [':item_id' => $row['id']]);

        // Se não estiver na tabela, inserir o item suspeito
        if (empty($itemSuspeito)) {
            $dataSuspeito = date('Y-m-d H:i:s');
            $db->sql("INSERT INTO itens_suspeitos (nome, item_id, data_suspeito) VALUES (:nome, :item_id, :data_suspeito)", [
                ':nome' => $row['nome'],
                ':item_id' => $row['id'],
                ':data_suspeito' => $dataSuspeito
            ]);
        }
    }    
}

// Chama a função com os paramentros de classificação
classificaItens("Relógi", 0, 0);

//Mostra para o usuário os itens que não são suspeitos
$ret = $db->sql("SELECT * FROM itens WHERE status != 90");
foreach($ret as $row){
    echo $row['nome'] . '<br>';
}

//Fecha a conexão com o banco
$db->closeConnection();