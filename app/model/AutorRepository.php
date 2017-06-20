<?php

namespace App\Model;


class AutorRepository extends BaseRepository
{
    public function getAll()
    {
        return $this->db->table('autori')->order('priezvisko');
    }

    public function getForSelect()
    {
        $autori = $this->getAll();
        $autori->select('id');
        $autori->select('CONCAT_WS(?, meno, priezvisko) AS cele_meno', ' ');
        return $autori->fetchPairs('id', 'cele_meno');
    }
}