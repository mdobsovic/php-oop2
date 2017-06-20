<?php
namespace App\Model;


use Nette\Database\Context;

abstract class BaseRepository
{
    protected $db;

    public function __construct(Context $db)
    {
        $this->db = $db;
    }
}