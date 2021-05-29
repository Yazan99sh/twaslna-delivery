<?php

namespace App\Request;

class OrderCreateRequest
{
    private $ownerID;
    private $source = [];
    private $destination = [];
    private $deliveryDate;
    private $note;
    private $payment;
    private $recipientName;
    private $recipientPhone;
    private $state;
    private $fromBranch;
    private $roomID;
    private $subscribeId;
    private $clientID;
    private $productID;

     /**
     * @param mixed $ownerID
     */
    public function setOwnerID($ownerID): void
    {
        $this->ownerID = $ownerID;
    }

     /**
     * @return mixed
     */
    public function getOwnerID()
    {
        return $this->ownerID;
    }

    public function getState(): ?string
    {
        return $this->state;
    }

    public function setState(?string $state): self
    {
        $this->state = $state;

        return $this;
    }

    public function getRoomID(): ?string
    {
        return $this->roomID;
    }

    public function setRoomID(?string $roomID): self
    {
        $this->roomID = $roomID;

        return $this;
    }
    
    public function getSubscribeId(): ?int
    {
        return $this->subscribeId;
    }

    public function setSubscribeId(?int $subscribeId): self
    {
        $this->subscribeId = $subscribeId;

        return $this;
    }

     /**
     * @param mixed $clientID
     */
    public function setClientID($clientID): void
    {
        $this->clientID = $clientID;
    }

     /**
     * @return mixed
     */
    public function getClientID()
    {
        return $this->clientID;
    }
}
