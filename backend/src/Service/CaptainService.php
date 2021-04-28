<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\CaptainProfileEntity;
use App\Request\CaptainProfileCreateRequest;
use App\Request\CaptainVacationCreateRequest;
use App\Request\CaptainProfileUpdateRequest;
use App\Request\CaptainProfileUpdateByAdminRequest;
use App\Response\CaptainProfileCreateResponse;
use App\Response\AllUsersResponse;
use App\Response\CaptainTotalBounceResponse;
use App\Service\CaptainPaymentService;
use App\Service\RoomIdHelperService;
use App\Service\AcceptedOrderService;
use App\Service\AcceptedOrderFilterService;
use App\Service\RatingService;
use App\Manager\UserManager;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;


class CaptainService
{
    private $autoMapping;
    private $userManager;
    private $acceptedOrderService;
    private $ratingService;
    private $params;
    private $captainPaymentService;
    private $roomIdHelperService;
    private $acceptedOrderFilterService;

    public function __construct(AutoMapping $autoMapping, ParameterBagInterface $params, CaptainPaymentService $captainPaymentService,  RoomIdHelperService $roomIdHelperService, UserManager $userManager, AcceptedOrderService $acceptedOrderService, RatingService $ratingService, AcceptedOrderFilterService $acceptedOrderFilterService)
    {
        $this->autoMapping = $autoMapping;
        $this->captainPaymentService = $captainPaymentService;
        $this->roomIdHelperService = $roomIdHelperService;
        $this->userManager = $userManager;
        $this->acceptedOrderService = $acceptedOrderService;
        $this->ratingService = $ratingService;
        $this->acceptedOrderFilterService = $acceptedOrderFilterService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function createCaptainProfile(CaptainProfileCreateRequest $request)
    { 
        $uuid = $this->roomIdHelperService->roomIdGenerate();
        $captainProfile = $this->userManager->createCaptainProfile($request, $uuid);
        
        if ($captainProfile instanceof CaptainProfileEntity) {
           
            return $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $captainProfile);
        }
        if ($captainProfile == true) {
            return $this->getCaptainProfileByCaptainID($request->getCaptainID());
        }
    }

    public function UpdateCaptainProfile(CaptainProfileUpdateRequest $request)
    {
        $item = $this->userManager->UpdateCaptainProfile($request);
        
        return $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $item);
    }

    public function updateCaptainProfileByAdmin(CaptainProfileUpdateByAdminRequest $request)
    {
        $item = $this->userManager->updateCaptainProfileByAdmin($request);

        return $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $item);
    }

    public function updateCaptainStateByAdmin(CaptainVacationCreateRequest $request)
    {
        return $this->userManager->updateCaptainStateByAdmin($request);

    }

    public function getCaptainProfileByCaptainID($captainID)
    {
        $response=[];

        $item = $this->userManager->getCaptainsInVacation($captainID);

        $bounce = $this->totalBounceCaptain($item['id'], 'captain', $captainID);

        $countOrdersDeliverd = $this->acceptedOrderService->countAcceptedOrder($captainID);

        $item['imageURL'] = $item['image'];
        $item['image'] = $this->params.$item['image'];
        $item['drivingLicenceURL'] = $item['drivingLicence'];
        $item['drivingLicence'] = $this->params.$item['drivingLicence'];
        $item['baseURL'] = $this->params;
        $item['rating'] = $this->ratingService->getRatingByCaptainID($captainID);

        $response = $this->autoMapping->map('array', CaptainProfileCreateResponse::class, $item);

        $response->bounce = $bounce;
        $response->countOrdersDeliverd = $countOrdersDeliverd;

        return $response;
    }

    public function getCaptainProfileByID($captainProfileId)
    {
        $response=[];
        $totalBounce=[];
        $countOrdersDeliverd=[];
        $item = $this->userManager->getCaptainProfileByID($captainProfileId);
        if($item) {
            $totalBounce = $this->totalBounceCaptain($item['id'],'admin');
            $item['imageURL'] = $item['image'];
            $item['image'] = $this->params.$item['image'];
            $item['drivingLicenceURL'] = $item['drivingLicence'];
            $item['drivingLicence'] = $this->params.$item['drivingLicence'];
            $item['baseURL'] = $this->params;
            $countOrdersDeliverd = $this->acceptedOrderService->countAcceptedOrder($item['captainID']);

            $item['rating'] = $this->ratingService->getRatingByCaptainID($item['captainID']);
        }
        $response =  $this->autoMapping->map('array', CaptainProfileCreateResponse::class, $item);
        if($item) {
            $response->totalBounce = $totalBounce;
            $response->countOrdersDeliverd = $countOrdersDeliverd;
        }
        return $response;
    }

    public function getCaptainsInactive()
    {
        $response = [];
        $items = $this->userManager->getCaptainsInactive();
        foreach( $items as  $item ) {
            $item['imageURL'] = $item['image'];
            $item['image'] = $this->params.$item['image'];
            $item['drivingLicenceURL'] = $item['drivingLicence'];
            $item['drivingLicence'] = $this->params.$item['drivingLicence'];
            $item['baseURL'] = $this->params;
            $response[]  = $this->autoMapping->map('array', CaptainProfileEntity::class, $item);
            }
     return $response;
    }
    
    public function captainIsActive($captainID)
    {
        $item = $this->userManager->captainIsActive($captainID);
        if ($item) {
          return  $item[0]['status'];
        }

        return $item ;
     }

     public function dashboardCaptains()
     {
         $response = [];

         $response[] = $this->userManager->countpendingCaptains();
         $response[] = $this->userManager->countOngoingCaptains();
         $response[] = $this->userManager->countDayOfCaptains();

         $top5Captains = $this->acceptedOrderFilterService->getTop5Captains();
      
         foreach ($top5Captains as $item) {
           
            $item['imageURL'] = $item['image'];
            $item['image'] = $this->params.$item['image'];
            $item['baseURL'] = $this->params;   

            $response[]  = $this->autoMapping->map('array',CaptainProfileCreateResponse::class,  $item);
         }         
         return $response;
     }

     public function getCaptainsInVacation()
     {
         $response = [];

         $dayOfCaptains = $this->userManager->getCaptainsInVacation();
      
         foreach ($dayOfCaptains as $item) {
            $item['imageURL'] = $item['image'];
            $item['image'] = $this->params.$item['image'];
            $item['drivingLicenceURL'] = $item['drivingLicence'];
            $item['drivingLicence'] = $this->params.$item['drivingLicence'];
            $item['baseURL'] = $this->params;

            $response[]  = $this->autoMapping->map('array',CaptainProfileCreateResponse::class,  $item);
         }         
         return $response;
     }
//الأفضل أن تقسم إلى 2 فنكشن
     public function totalBounceCaptain($captainProfileId,  $user='null', $captainId='null')
    {
        $response = [];

        $item = $this->userManager->totalBounceCaptain($captainProfileId);
     
        if ($user == "captain") { 
            $sumAmount = $this->captainPaymentService->getSumAmount($captainId);
            $payments = $this->captainPaymentService->getpayments($captainId);
        }
        if ($user == "admin") { 
            $sumAmount = $this->captainPaymentService->getSumAmount($item[0]['captainID']);
            $payments = $this->captainPaymentService->getpayments($item[0]['captainID']);
        }

        if ($item) {
             $countAcceptedOrder = $this->acceptedOrderService->countAcceptedOrder($item[0]['captainID']);

             $item['bounce'] = $item[0]['bounce'] * $countAcceptedOrder[0]['countOrdersDeliverd'];
             $item['countOrdersDeliverd'] = $countAcceptedOrder[0]['countOrdersDeliverd'];
             $item['sumPayments'] = $sumAmount[0]['sumPayments'];
             $item['NetProfit'] = $item['bounce'] + $item[0]['salary'];
             $item['total'] = $item['sumPayments'] - ($item['bounce'] + $item[0]['salary']);
             $item['payments'] = $payments;
            if ($user == "captain") {
                 $item['total'] = ($item['bounce'] + $item[0]['salary']) - $item['sumPayments'];
            }
             $response = $this->autoMapping->map('array', CaptainTotalBounceResponse::class,  $item);
            
        }
        return $response;
    }

    public function getAllCaptains()
    {
        $response = [];
        $captains = $this->userManager->getAllCaptains();
        foreach ($captains as $captain) {
            $captain['imageURL'] = $captain['image'];
            $captain['image'] = $this->params.$captain['image'];
            $captain['drivingLicenceURL'] = $captain['drivingLicence'];
            $captain['drivingLicence'] = $this->params.$captain['drivingLicence'];
            $captain['baseURL'] = $this->params;

            $response[]  = $this->autoMapping->map('array',CaptainProfileCreateResponse::class,  $captain);
            }       
        return $response;
    }

    public function specialLinkCheck($bool)
    {
        if (!$bool)
        {
            return $this->params;
        }
    }

    public function getCaptainMybalance($captainID)
    {
        $item = $this->userManager->getcaptainprofileByCaptainID($captainID);
        return $this->totalBounceCaptain($item['id'], 'captain', $captainID);
    }

    public function remainingcaptain()
    {
        $response = [];
        $result = [];
        $captains = $this->userManager->getAllCaptains();
         
        foreach ($captains as $captain) {
                
                $item = $this->userManager->getCaptainProfileByID($captain['id']);
       
                 $totalBounce = $this->totalBounceCaptain($item['id'],'admin');
                 $total=(array)$totalBounce;
                 $captain['totalBounce'] = $total;
        
                if ($captain['totalBounce']['total'] < 0 ){
                
                $response[] =  $this->autoMapping->map('array', CaptainProfileCreateResponse::class, $captain);
            }
        } 
        $result['response']=$response;
        return $result;
    }

    public function updateCaptainNewMessageStatus($request, $NewMessageStatus)
    {
        $item = $this->userManager->getcaptainByUuid($request->getRoomID());
   
       $response = $this->userManager->updateCaptainNewMessageStatus($item, $NewMessageStatus);
    
       return  $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $response);
      
    }
}
