<?php

namespace App\Service;
use DateTime;

class DateFactoryService
{
    public function returnLastMonthDate():array
    {
        $dateNow =new DateTime("now");
        $year = $dateNow->format("Y");
        $month = $dateNow->format("m");
        $fromDate =new \DateTime($year . '-' . $month . '-01'); 
        $toDate = new \DateTime($fromDate->format('Y-m-d') . ' -1 month');
     //    if you want get  this month must change (-1 month) to (+1 month) in back line
     //    return [$fromDate,  $toDate];
 
     //    if you want get  last month must change (+1 month) to (-1 month) in back line
        return [$toDate,  $fromDate];
     }

     public function returnRequiredDate($year, $month):array
    {
        $fromDate =new \DateTime($year . '-' . $month . '-01'); 
        $toDate = new \DateTime($fromDate->format('Y-m-d h:i:s') . ' +1 month');
        // if you want get top captains in this month must change (-1 month) to (+1 month) in back line
       return [$fromDate,  $toDate];

        // if you want get top captains in last month must change (+1 month) to (-1 month) in back line
    //    return [$toDate,  $fromDate];
    
     }

     public  function subtractTwoDates($firstDate, $lastDate) {
        
        $difference = $firstDate->diff($lastDate);
      
         return $this->format_interval($difference);
  }

   function format_interval($interval) {
      $result = "";
      if ($interval->y) { $result .= $interval->format("%y years "); }
      if ($interval->m) { $result .= $interval->format("%m months "); }
      if ($interval->d) { $result .= $interval->format("%d days "); }
      if ($interval->h) { $result .= $interval->format("%h hours "); }
      if ($interval->i) { $result .= $interval->format("%i minutes "); }
      if ($interval->s) { $result .= $interval->format("%s seconds "); }

      return $result;
   }

   public  function returnNextPaymentDate($date):string {
      
      $d =$date->format('y-m-d');
      $dateAfterMonth = date_modify(new DateTime($d),'+ 1month');
      $now = new DateTime('now');
      $difference =  $now->diff($dateAfterMonth);
      
      if($now < $dateAfterMonth) {
          return $this->format_interval($difference);
      }
      if($now >= $dateAfterMonth) {
          return "it is time for payment";
      }
     }
}

