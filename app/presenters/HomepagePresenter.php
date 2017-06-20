<?php

namespace App\Presenters;

use Nette;
use App\Model;


class HomepagePresenter extends BasePresenter
{
    /**
     * @var Model\ClanokRepository
     * @inject
     */
    public $clanokRepository;

	public function renderDefault()
	{

		$this->template->clanky = $this->clanokRepository->getList();
	}

}
