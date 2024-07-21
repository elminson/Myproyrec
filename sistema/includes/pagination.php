<?php

class Pagination
{

	public $currentPage;
	public $totalRecords;
	public $recordsPerPage;
	public $totalPages;

	public function __construct($totalRecords, $currentPage = 1, $recordsPerPage = 5)
	{

		$this->totalRecords = $totalRecords;
		$this->currentPage = $currentPage;
		$this->recordsPerPage = $recordsPerPage;
		$this->calculateTotalPages();
	}

	private function calculateTotalPages()
	{

		$this->totalPages = ceil($this->totalRecords / $this->recordsPerPage);
	}

	public function getOffset()
	{

		return ($this->currentPage - 1) * $this->recordsPerPage;
	}

	public function generateLinks($baseURL)
	{

		$links = "";
		if ($this->currentPage > 1) {
			$links .= "<li><a href='{$baseURL}&pagina=1'>|<</a></li>";
			$links .= "<li><a href='{$baseURL}&pagina=" . ($this->currentPage - 1) . "'><<</a></li>";
		}
		for ($i = 1; $i <= $this->totalPages; $i++) {
			if ($i == $this->currentPage) {
				$links .= "<li class='pageSelected'>{$i}</li>";
			} else {
				$links .= "<li><a href='{$baseURL}&pagina={$i}'>{$i}</a></li>";
			}
		}
		if ($this->currentPage < $this->totalPages) {
			$links .= "<li><a href='{$baseURL}&pagina=" . ($this->currentPage + 1) . "'>>></a></li>";
			$links .= "<li><a href='{$baseURL}&pagina={$this->totalPages}'>>|</a></li>";
		}

		return $links;
	}
}
