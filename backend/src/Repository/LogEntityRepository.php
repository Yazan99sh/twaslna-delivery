<?php

namespace App\Repository;

use App\Entity\LogEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method LogEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method LogEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method LogEntity[]    findAll()
 * @method LogEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LogEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, LogEntity::class);
    }

    public function getRecordByOrderId($orderId)
    {
        return $this->createQueryBuilder('RecordEntity')
            ->select('RecordEntity.id, RecordEntity.orderID, RecordEntity.state, RecordEntity.startTime')
            
            ->andWhere("RecordEntity.orderID =:orderId")
            ->setParameter('orderId', $orderId)
            ->setMaxResults(1)
            ->addOrderBy('RecordEntity.id','DESC')
            ->groupBy('RecordEntity.id')
            ->getQuery()
            ->getResult();
    }

    public function getRecordsByOrderId($orderId)
    {
        return $this->createQueryBuilder('RecordEntity')
            ->select('RecordEntity.id, RecordEntity.orderID, RecordEntity.state, RecordEntity.date')
            
            ->andWhere("RecordEntity.orderID =:orderId")
            ->setParameter('orderId', $orderId)
            ->getQuery()
            ->getResult();
    }
    
    public function getFirstDate($orderId)
    {
        return $this->createQueryBuilder('RecordEntity')
            ->select('RecordEntity.id, RecordEntity.state, RecordEntity.date')
            
            ->andWhere("RecordEntity.orderID =:orderId")
            ->setParameter('orderId', $orderId)
            ->setMaxResults(1)
            ->addOrderBy('RecordEntity.id','ASC')
            ->getQuery()
            ->getResult();
    }

    public function getLastDate($orderId)
    {
        return $this->createQueryBuilder('RecordEntity')
            ->select('RecordEntity.id, RecordEntity.state, RecordEntity.date')
            
            ->andWhere("RecordEntity.orderID =:orderId")
            ->setParameter('orderId', $orderId)
            ->setMaxResults(1)
            ->addOrderBy('RecordEntity.id','DESC')
            ->getQuery()
            ->getResult();
    }
}
