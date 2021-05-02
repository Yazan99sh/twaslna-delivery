<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\BranchesEntity;
use App\Manager\BranchesManager;
use App\Request\BranchesCreateRequest;
use App\Response\BranchesResponse;

class BranchesService
{
    private $autoMapping;
    private $branchesManager;

    public function __construct(AutoMapping $autoMapping, BranchesManager $branchesManager)
    {
        $this->autoMapping = $autoMapping;
        $this->branchesManager = $branchesManager;
    }

    public function createBranches(BranchesCreateRequest $request)
    {
        $branche = $this->branchesManager->createBranches($request);

        return $this->autoMapping->map(BranchesEntity::class, BranchesResponse::class, $branche);
    }

    public function updateBranche($request)
    {
        $result = $this->branchesManager->updateBranche($request);

        return $this->autoMapping->map(BranchesEntity::class, BranchesResponse::class, $result);
    }

    public function getBranchesByUserId($userId):array
    {
        $response = [];
        $items = $this->branchesManager->getBranchesByUserId($userId);
        foreach ($items as $item) {
        $response[] =  $this->autoMapping->map('array', BranchesResponse::class, $item);
        }
        return $response;
    }

    public function branchesByUserId($userId)
    {
        return $this->branchesManager->branchesByUserId($userId);
    }

    public function getBrancheById($Id)
    {
        return $this->branchesManager->getBrancheById($Id);
    }
    
    public function updateBranchAvailability($request)
    {
        $result = $this->branchesManager->updateBranchAvailability($request);

        return $this->autoMapping->map(BranchesEntity::class, BranchesResponse::class, $result);
    }
}
