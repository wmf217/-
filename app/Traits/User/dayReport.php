<?php

namespace App\Traits\User;

trait dayReport
{
    public function dayOrder($day) {
        $rs = $this->trader()->whereDate('created_at',$day)->get();
        return $rs;
    }
    public function dayRest($day) {
        $rs = $this->trader()->hang()->whereDate('created_at',$day)->get();
        return $rs;
    }
    public function dayOrderNum ($day) {
        $rs = $this->dayOrder($day)->count();
        return $rs;
    }
    public function dayOrderHand ($day) {
        $rs = $this->dayOrder($day)->sum('volume');
        return $rs;
    }
    public function dayRestCount ($day) {
        $rs = $this->dayRest($day)->count();
        return $rs;
    }
    public function dayRestHand ($day) {
        $rs = $this->dayRest($day)->sum('volume');
        return $rs;
    }
    public function dayCinget ($day) {
        $rs = $this->cinget()->whereDate('created_at',$day)->sum('amount');
        return $rs;
    }

    public function dayIn ($day) {
        $rs = $this->record()->in()->whereDate('created_at',$day)->sum('amount');
        return $rs;
    }

    public function dayInCharge ($day) {
        $rs = $this->record()->in()->charge()->whereDate('created_at',$day)->sum('amount');
        return $rs;
    }

    public function dayOut ($day) {
        $rs = $this->record()->out()->whereDate('created_at',$day)->sum('amount');
        return $rs;
    }

    public function dayInCount ($day) {
        $rs = $this->record()->in()->whereDate('created_at',$day)->count();
        return $rs;
    }

    public function dayOutCount ($day) {
        $rs = $this->record()->out()->whereDate('created_at',$day)->count();
        return $rs;
    }
}
