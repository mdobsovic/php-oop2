<?php

namespace App\Model;


use Nette\Utils\DateTime;
use Nette\Utils\Strings;

class ClanokRepository extends BaseRepository
{
    public function getList()
    {
        /*
        $query = 'SELECT * FROM clanky ORDER BY datum DESC';
        $data = $this->db->query($query);
        return $data->fetchAll();
        */

        return $this->db->table('clanky')->order('datum DESC');
    }

    public function getBySlug($slug)
    {
        return $this->db->table('clanky')->where('slug', $slug)->fetch();
    }

    public function createNew($values)
    {
        $values['slug'] = Strings::webalize($values['nadpis']);
        $values['datum'] = new DateTime();

        return $this->db->table('clanky')->insert($values);
    }

    public function getById($id)
    {
        return $this->db->table('clanky')->where('id', $id);
    }

    public function deleteById($id)
{
    return $this->getById($id)->delete();
}

    public function updateById($id, $data)
    {
        return $this->getById($id)->update($data);
    }
}