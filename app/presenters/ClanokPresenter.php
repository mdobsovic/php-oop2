<?php

namespace App\Presenters;


use App\Forms\FormFactory;
use App\Model\AutorRepository;
use App\Model\ClanokRepository;
use Nette\Application\UI\Form;
use Nette\Utils\DateTime;
use Nette\Utils\Strings;

class ClanokPresenter extends BasePresenter
{

    private $formFactory;
    /** @var  AutorRepository @inject */
    public $autorRepository;
    /** @var  ClanokRepository @inject */
    public $clanokRepository;

    public function __construct(FormFactory $formFactory)
    {
        parent::__construct();
        $this->formFactory = $formFactory;
    }

    public function createComponentPridatForm()
    {
        $autori = $this->autorRepository->getForSelect();
        $form = $this->formFactory->create();

        $form->addText('nadpis', 'Nadpis článku', 30)
            ->setRequired('Musis vyplnit nadpis!');
        $form->addTextArea('perex', 'Perex', 30, 8);
        $form->addTextArea('obsah', 'Obsah článku', 60, 15);
        $form->addSelect('autor', 'Autor článku', $autori);

        if (!empty($this->getParameter('id'))) {
            $clanok = $this->clanokRepository->getById($this->getParameter('id'))->fetch();
            $form->setDefaults($clanok);
            $form->addSubmit('submit', 'Upraviť článok');
        } else {
            $form->addSubmit('submit', 'Pridať článok');
        }

        $form->onSuccess[] = [$this, 'pridatFormSuccess'];

        return $form;
    }

    public function pridatFormSuccess(Form $form)
    {
        $values = $form->getValues(true);
        if (!empty($this->getParameter('id'))){
            $id = $this->getParameter('id');
            $this->clanokRepository->updateById($id, $values);
            $this->flashMessage('Článok bol upravený.');
        } else {
            $novyClanok = $this->clanokRepository->createNew($values);
            $this->flashMessage('Článok č. ' . $novyClanok->id . ' bol vytvorený.');
        }
        $this->redirect('Homepage:default');
    }

    public function renderDetail($slug)
    {
        $this->template->clanok = $this->clanokRepository->getBySlug($slug);
    }

    public function renderPridat()
    {
        $this->setView('clanok-formular');
    }
    public function renderUpravit($id) {
        $this->setView('clanok-formular');
    }

    public function actionZmazat($id)
    {
        $this->clanokRepository->deleteById($id);
        $this->flashMessage('Clanok ' . $id . ' bol zmazany');
        $this->redirect('Homepage:default');
    }
}