<?php

namespace App\Forms;

use Nette;
use Nette\Application\UI\Form;


class FormFactory
{
	use Nette\SmartObject;

	/**
	 * @return Form
	 */
	public function create()
	{
		$form = new Form;
		// sem by prislo nastavenie renderera
        // nastavenie prekladaca
        // atd.
		return $form;
	}

}
